/**
 * 本机单IP获取企查查数据并存储
 */

let querystring = require('querystring');
let axios = require('axios');

let util = require('../util/common');
let query = require('../../schema/mysql');

let parser = require('../util/htmlParser');

let settings = require('../util/urlList.js');
let sqlParser = require('../util/sqlParser');
let fs = require('fs');
let cookie = require('../data/cookie');

let CONDITION_LIST = [];

let LAST_INFO = {
    provincesId: 0,
    queryId: 0,
    pageId: 0
}
async function init() {

    // 获取基础信息 await getBaseInfo();
    CONDITION_LIST = await readQuerySetting();

    let provincelist = await getPorvFromDb();

    let lastTask = await getLastTaskProgress();
    if (typeof lastTask != 'undefined') {
        LAST_INFO.provincesId = parseInt(lastTask.province_id) - 1;
    }

    for (let i = 0; typeof lastTask != 'undefined' && i < CONDITION_LIST.length; i++) {
        if (lastTask.query_ids == CONDITION_LIST[i].ids) {
            LAST_INFO.queryId = i;
            i = CONDITION_LIST.length;
        }
    }

    // 读取上次任务取了多少页数据
    if (LAST_INFO.queryId > 0) {
        let sql = `SELECT count(*)/20 num FROM companyindex b where url = '${lastTask.url}'`;
        let data = await query(sql);
        LAST_INFO.pageId = parseInt(data[0].num);
    }

    for (let i = LAST_INFO.provincesId; i < provincelist.length; i++) {
        let noerror = await getCompanyListFromProv(provincelist[i]);
        if (!noerror) {
            i = provincelist.length + 1;
            break;
        }
    }
}

// 获取基础数据
async function getBaseInfo() {

    // step1: 获取省份列表
    await getProvinceIndex();

    // step2: 获取行业信息
    await getIndustryIndex();
}

async function getLastTaskProgress() {
    let sql = 'SELECT * FROM `task_progress` order by id desc limit 1';
    let data = await query(sql);
    return data[0];
}

// 获取查询配置基本信息
async function readQuerySetting() {
    let sql = 'select * from capitalindex where id>1';
    let regCaptial = await query(sql);
    sql = 'select * from companystatus where id <3';
    let companyStatus = await query(sql);
    sql = 'select * from regtimeindex';
    let regTime = await query(sql);
    let orderType = ['ola1', 'ola2'];
    sql = 'select id,ids_code code from industryindex where sub<>main';
    let industryList = await query(sql);

    let data = [];
    industryList.forEach(industry => {
        let item = [];
        let ids = [];
        let level = 0;

        item.push(industry.code);
        ids.push(industry.id);
        level++;
        regCaptial.forEach(captial => {
            item.push(captial.code);
            ids.push(captial.id);
            level++;

            regTime.forEach(time => {
                item.push(time.code);
                ids.push(time.id);
                level++;

                companyStatus.forEach(status => {
                    item.push(status.code);
                    ids.push(status.id);
                    level++;

                    data.push({
                        query: item.join('-') + '-la1',
                        ids: ids.join(',')
                    });
                    item.pop();
                    ids.pop();
                });

                item.pop();
                ids.pop();
            });

            item.pop();
            ids.pop();
        });

        item.pop();
        ids.pop();
    });
    return data;
}

// 获取行业列表
async function getIndustryIndex() {
    let homepage = settings.url.homepage;
    let provinceList = await axios
        .get(homepage)
        .then(res => {
            let html = res.data;
            return parser.mainList(html, 'industry');
        });

    let sql = sqlParser.industryList(provinceList);

    await query(sql);

    // 增加industry编码字段
    sql = "update industryindex set ids_code = substr(href,locate('/oc',href)+1,10)";
    await query(sql);
    console.log('行业列表存储完毕');
    return provinceList;
}

// 抓取省份列表（主列表）
async function getProvinceIndex() {
    let homepage = settings.url.homepage;
    let provinceList = await axios
        .get(homepage)
        .then(res => {
            let html = res.data;
            return parser.mainList(html, 'base');
        });

    let sql = sqlParser.provinceList(provinceList);
    await query(sql);
    console.log('省份列表存储完毕');
    return provinceList;
}

// 获取省份列表（从数据库）
async function getPorvFromDb() {
    let sql = 'SELECT id,href FROM `provinceindex` where id<9 or (id>9 and province<>city)';
    return await query(sql);
}

async function getCompanyListFromProv(province) {
    // 任务开始结点
    let idx = province.id == LAST_INFO.provincesId + 1 ?
        LAST_INFO.queryId :
        0;

    for (; idx < CONDITION_LIST.length; idx++) {

        let item = CONDITION_LIST[idx];
        let url = province.href + '/' + item.query;

        //自动翻页查询
        let curPage,
            i;

        // 从上次结束的位置开始查询
        if (LAST_INFO.provincesId + 1 == province.id && LAST_INFO.queryId == idx) {
            i = LAST_INFO.pageId + 1;
            curPage = i;
        } else {
            i = 1;
            curPage = 1;
        }

        for (; i <= curPage; i++) {
            let company = await getCompanyFromUrl(url, i);
            if (i == 1 || company.page > 0) {
                curPage = company.page;
            }
            if (company.page == -3) {
                console.log('采集停止');
                i = curPage + 1;
                idx = CONDITION_LIST.length + 1;
                return false;
            }

            // 有数据时存储入库
            if (company.page > -1) {
                let sql = sqlParser.companyList(company.data, {
                    province_id: province.id,
                    ids: item.ids
                }, url);

                await query(sql);
            }

            // 存储任务进度 当无数据返回或
            if (company.page < 0 || i == 1) {
                await recordTaskProgress(province.id, item.ids, company.page, url);
            }

            // let sleepTimeLength = (5000 + Math.random() * 1500).toFixed(0);

            // console.log(`idx=${idx},第${i}/${curPage}页数据采集完毕,休息${sleepTimeLength}ms继续\n`);
            // await util.sleep(sleepTimeLength);

            console.log(`idx=${idx},第${i}/${curPage}页数据采集完毕\n`);
        }
        console.log(`第${idx}/${CONDITION_LIST.length}页数据采集完毕`);
    }
}

// 存储任务进度
async function recordTaskProgress(id, query_ids, page, url) {
    let sql = `insert into task_progress(province_id,query_ids,page,url) values(${id},'${query_ids}',${page},'${url}')`;
    await query(sql);
}

async function getCompanyFromUrl(url, page) {
    url = url + '/p' + page;
    let option = {
        method: 'get',
        url,
        headers: {
            'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;' +
                'q=0.8',
            'Accept-Encoding': 'gzip, deflate, br',
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)' +
                ' Chrome/60.0.3112.113 Safari/537.36',
            'Upgrade-Insecure-Requests': 1,
            Cookie: cookie.data
        },
        timeout: 15000
    };

    let html = await axios(option)
        .then(res => res.data)
        .catch(e => {
            console.log('数据抓取失败\n' + url);
            console.log(e.message);
            return '';
        });

    console.log(url);
    if (html.includes('没有找到相关结果')) {
        return { page: -1 };
    }
    if (html.includes('我们只是确认一下你不是机器人')) {
        console.log('触发机器人校验，请浏览中止前的url进行人工校验');
        return {
            page: -3
        }
    } else if (html.includes('你已在其他地点登录')) {
        console.log('你已在其他地点登录');
        return {
            page: -3
        }
    }
    if (html == '') {
        return { page: -2 };
    }
    return parser.companyList(html);
}

module.exports = {
    init
};