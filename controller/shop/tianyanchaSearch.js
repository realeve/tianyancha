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
let login = require('./login');

let cookie = require('../data/cookie');

let CONDITION_LIST = [];

let LAST_INFO = {
    provincesId: 0,
    queryId: 0,
    pageId: 0
}
async function init() {

    await spiderData();
}

async function spiderData() {

    let sql = 'SELECT id,title FROM `company_index` where status = 0 limit 1000';
    let companyList = await query(sql);
    let length = companyList.length;

    for (let i = 0; i < length; i++) {
        console.log(`正在抓取第${i}/${length - 1}条信息`);
        let noerror = await searchCompany(companyList[i]);

        if (!noerror) {
            i = length + 1;
            break;
        }
    }
    console.log('爬虫停止');
}

// 没有数据时记录状态
async function recordDataStatus(id, status) {
    let sql = `update company_index set status = ${status} where id=${id}`;
    await query(sql);
}

async function searchCompany(company) {
    let data = await getDetail(company);
    if (data < 0) {
        return false;
    } else if (data == 0) {
        return true;
    }
    
    let sql = `insert into company_detail_index(province,company_name,href,company_status,leader,reg_date,reg_captial,score,cid) values('${data.province}','${data.company_name}','${data.href}','${data.company_status}','${data.leader}','${data.reg_date}','${data.reg_captial}','${data.score}',${data.cid})`
    await query(sql);
    await recordDataStatus(company.id, 1);
    return true;
}

async function getDetail(company) {

    let url = `https://www.tianyancha.com/search?key=${encodeURIComponent(company.title)}&checkFrom=searchBox`;

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

    if (html == '') {
        return -2;
    }

    if (html.includes('没有找到相关结果')) {
        console.log(`未搜索到 ${company.title} 相关信息`)
        console.log('url:', url);
        await recordDataStatus(company.id, -1);
        return 0;
    }

    if (html.includes('我们只是确认一下你不是机器人')) {
        console.log('触发机器人校验，请浏览中止前的url进行人工校验');
        return -1;
    } else if (html.includes('你已在其他地点登录')) {
        console.log('你已在其他地点登录');
        return -1;
    } else if (html.includes('系统检测到您非人类行为')) {
        console.log('系统检测到您非人类行为,等待1分钟再试。');
        return -1;
    } else if (html.includes('请输入您的手机号码')){
        console.log('触发反爬虫校验，返回空数据');
        return -1;
    }

    return parser.companyDetail(html,company.id);
}

module.exports = {
    init
};