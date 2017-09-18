let getNow = require('./common').getNow
// 本模块用于一次性插入大量数据时对原始数据的处理 销售记录详情数据

function companyList(companys, provinceId,url) {
    let sql = 'insert into companyIndex(province_id,company_name,href,company_status,leader,reg' +
            '_date,reg_captial,score,status,url) values ';
    let sqlValues = companys.map(item => {
        return `(${provinceId},'${item.company_name}','${item.href}','${item.company_status}','${item.leader}','${item.reg_date}','${item.reg_captial}','${item.score}',0,'${url}')`;
    })
    return sql + sqlValues.join(',');
}

// function companyDetail(detail) {
//     let sql = 'insert into company_detail(title,tel,email,homepage,address,updated_at,rec_date,' +
//             'usc_sn,tax_sn,register_sn,org_sn,legeal_name,reg_captial,manage_status,register_' +
//             'date,company_type,personnel_scale,expired_date,register_org,verify_date,english_' +
//             'name,company_area,company_industry,old_name,company_address,business_scope) valu' +
//             'es';
//     let value = `('${detail.title}','${detail.tel}','${detail.email}','${detail.homepage}','${detail.address}','${detail.updated_at}','${detail.rec_date}','${detail.usc_sn}','${detail.tax_sn}','${detail.register_sn}','${detail.org_sn}','${detail.legeal_name}','${detail.reg_captial}','${detail.manage_status}','${detail.register_date}','${detail.company_type}','${detail.personnel_scale}','${detail.expired_date}','${detail.register_org}','${detail.verify_date}','${detail.english_name.replace(/'/g,'')}','${detail.company_area}','${detail.company_industry}','${detail.old_name}','${detail.company_address}','${detail.business_scope.replace(/'/g,'')}')`;
//     return sql + value;
// }


module.exports = {    
    companyList,
    // companyDetail
}