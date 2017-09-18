let util = require('./common')
let cheerio = require('cheerio')

// 获取行业、省份列表
let mainList = (html,type='bace') => {
    let options = {
        html,
        parentNode: `.${type}_box`+(type == 'bace'?` .${type}`:''),
        children: [
            {
                node: 'a',
                name: 'data',
                formatter(el) {
                    let arrs = [];
                    for(let i=0;i<el.length;i++){
                        let dom = el.eq(i);
                        arrs.push({
                            href:dom.attr('href'),
                            sub:dom.text().replace('•','')
                        })
                    }
                    return arrs
                }
            }
        ]
    }
    let result = util.parseHTML(options);
    let data = [];
    result.forEach(provData=>{
        let item = provData.data;
        for(let i=0;i<item.length;i++){
            let obj = item[i];
            obj.main = item[0].sub;
            data.push(obj);
        }
    })
    return data;
};

let company = html => {

    let options = {
        html,
        parentNode: 'section#searchlist',
        children: [
            {
                node: '.name',
                name: 'company_name'
            }, {
                node: '.label',
                name: 'company_status'
            }, {
                node: '.list-group-item',
                name: 'href',
                formatter(el) {
                    return el.attr('href');
                }
            }, {
                node: '.i-local',
                name: 'address',
                formatter(el) {
                    return el
                        .parent()
                        .text();
                }
            }, {
                node: '.i-user3',
                name: 'attr',
                formatter(el) {
                    let texts = el
                        .parent()
                        .text()
                        .replace(/\n/g, '')
                        .split(' ');
                    let data = [];
                    texts.forEach(item => {
                        if (item != '') {
                            data.push(item);
                        }
                    });
                    return data;
                }
            }
        ]
    }
    return util.parseHTML(options)
};

let companyPage = html => {
    let options = {
        html,
        parentNode: '.pagination',
        children: [
            {
                node: '.end',
                name: 'page'
            }
        ]
    }
    return util.parseHTML(options)
}

function handleTrHtml(el, idx) {
    let tds = el
        .eq(0)
        .find('tr')
        .eq(idx)
        .find('td');

    return [
        tds
            .eq(1)
            .text()
            .replace(/\s/g, ''),
        tds
            .eq(3)
            .text()
            .replace(/\s/g, '')
    ];
}

let companyDetail = html => {

    // 修复默认html标签错误；
    html = html.replace('</tr> <td ', '</tr> <tr> <td ');

    let options = {
        html,
        parentNode: 'body',
        children: [
            {
                node: '.company-top-name',
                name: 'title'
            }, {
                node: '.ma_line2',
                name: 'contactInfo',
                formatter(el) {
                    let texts = el
                        .text()
                        .replace(/\n/g, '')
                        .replace('电话：', '')
                        .trim()
                        .split('邮箱：');
                    return {
                        tel: texts[0].trim(),
                        email: texts[1].trim()
                    };
                }
            }, {
                node: '.ma_line3',
                name: 'contactInfo2',
                formatter(el) {
                    let texts = el
                        .text()
                        .replace(/\s/g, '')
                        .replace('官网：', '')
                        .replace('查看地图附近公司', '')
                        .split('地址：');
                    return {
                        homepage: texts[0].trim(),
                        address: texts[1].trim()
                    }
                }
            }, {
                node: '.company-action .m-t',
                name: 'times',
                formatter(el) {
                    let texts = el
                        .text()
                        .split('更新时间：')[1]
                        .trim();
                    return {
                        updated_at: texts,
                        rec_date: util.getNow()
                    }
                }
            }, {
                node: '.m_changeList',
                name: 'baseInfo',
                formatter(el) {
                    let baseInfo = {};

                    let texts = handleTrHtml(el, 0);
                    baseInfo.usc_sn = texts[0];
                    baseInfo.tax_sn = texts[1];

                    texts = handleTrHtml(el, 1);
                    baseInfo.register_sn = texts[0];
                    baseInfo.org_sn = texts[1];

                    texts = handleTrHtml(el, 2);
                    baseInfo.legeal_name = texts[0]
                        .replace('对外投资与任职', '')
                        .replace('>', '');
                    baseInfo.reg_captial = texts[1];

                    texts = handleTrHtml(el, 3);
                    baseInfo.manage_status = texts[0];
                    baseInfo.register_date = texts[1];

                    texts = handleTrHtml(el, 4);
                    baseInfo.company_type = texts[0];
                    baseInfo.personnel_scale = texts[1];

                    texts = handleTrHtml(el, 5);
                    baseInfo.expired_date = texts[0];
                    baseInfo.register_org = texts[1];

                    texts = handleTrHtml(el, 6);
                    baseInfo.verify_date = texts[0];
                    baseInfo.english_name = texts[1].replace("'", '');

                    texts = handleTrHtml(el, 7);
                    baseInfo.company_area = texts[0];
                    baseInfo.company_industry = texts[1];

                    let col = el
                        .eq(0)
                        .find('tr')
                        .eq(8)
                        .find('td');

                    if (col.eq(0).text().includes('曾用名')) {
                        baseInfo.old_name = col
                            .eq(1)
                            .text()
                            .trim();
                        baseInfo.company_address = el
                            .eq(0)
                            .find('tr')
                            .eq(9)
                            .find('td')
                            .eq(1)
                            .text()
                            .split('查看地图')[0]
                            .trim();

                        baseInfo.business_scope = el
                            .eq(0)
                            .find('tr')
                            .eq(10)
                            .find('td')
                            .eq(1)
                            .text()
                            .trim();
                    } else {
                        baseInfo.old_name = '';
                        baseInfo.company_address = col
                            .eq(1)
                            .text()
                            .split('查看地图')[0]
                            .trim();
                        baseInfo.business_scope = el
                            .eq(0)
                            .find('tr')
                            .eq(9)
                            .find('td')
                            .eq(1)
                            .text()
                            .trim();
                    }
                    return baseInfo;
                }
            }
        ]
    }
    return util.parseHTML(options)
}

let shareHolder = html => {

    // 修复默认html标签错误；
    html = html.replace('</tr> <td ', '</tr> <tr> <td ');

    let options = {
        html,
        parentNode: 'body',
        children: [
            {
                node: '.m_changeList',
                name: 'data',
                formatter(el) {
                    let trs = el
                        .eq(1)
                        .find('tr');
                    let data = [];

                    for (let i = 1; i < trs.length; i++) {
                        let td = trs
                            .eq(i)
                            .find('td');
                        let item = [];
                        for (let j = 0; j < td.length; j++) {
                            item.push(td.eq(j).text().replace('对外投资与任职 >', '').trim());
                        }
                        data.push(item);
                    }
                    return data;
                }
            }
        ]
    }
    return util.parseHTML(options)
}

let managers = html => {

    // 修复默认html标签错误；
    html = html.replace('</tr> <td ', '</tr> <tr> <td ');

    let options = {
        html,
        parentNode: 'body',
        children: [
            {
                node: '.m_changeList',
                name: 'data',
                formatter(el) {
                    let trs = el
                        .eq(2)
                        .find('tr');
                    let data = [];

                    for (let i = 1; i < trs.length; i++) {
                        let td = trs
                            .eq(i)
                            .find('td');
                        let item = [];
                        for (let j = 0; j < td.length; j++) {
                            item.push(td.eq(j).text().replace('对外投资与任职 >', '').trim());
                        }
                        data.push(item);
                    }
                    return data;
                }
            }
        ]
    }
    return util.parseHTML(options)
}

let xiciProxy = html => {
    let options = {
        html,
        parentNode: '#ip_list',
        children: [
            {
                node: 'tr',
                name: 'data',
                formatter(trs) {
                    let data = [];
                    for (let i = 1; i < trs.length; i++) {
                        let td = trs.eq(i).find('td');
                        data.push({
                            host: td
                                .eq(1)
                                .text(),
                            port: td
                                .eq(2)
                                .text(),
                            status: 0
                        });
                    }
                    return data;
                }
            }
        ]
    }
    return util.parseHTML(options)
}

module.exports = {
    mainList,
    company,
    companyPage,
    companyDetail,
    shareHolder,
    managers,
    xiciProxy
}