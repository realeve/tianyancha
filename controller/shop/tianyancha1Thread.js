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

// 是否需要存储相应Html文件至本地
let SAVE_HTML_FILES = false;

async function init() {
  // 获取基础信息 await getBaseInfo();
  await readQuerySetting();
}

// 获取基础数据
async function getBaseInfo() {

  // step1: 获取省份列表
  await getProvinceIndex();

  // step2: 获取行业信息
  await getIndustryIndex();
}

// 获取查询配置基本信息
async function readQuerySetting() {
  let sql = 'select * from capitalindex';
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
            query: item.join('-')+'-la1',
            ids:ids.join(',')
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
  console.log(data);

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
  let sql = 'SELECT * from (select a.id,a.province,a.href,(case when b.page=0 then 1 when b.p' +
      'age is null then 1 else b.page+1 end) curPage,(case when a.pagenum=0 then 2 else' +
      ' a.pagenum end) totalPage from provinceindex a left JOIN (SELECT province_id,cei' +
      'l(count(*)/10) page FROM `companyIndex` group by province_id) b on a.id = b.prov' +
      'ince_id   ) a where a.totalPage>a.curPage';
  return await query(sql);
}

module.exports = {
  init
};