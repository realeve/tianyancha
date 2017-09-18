let util = require('./common')
let cheerio = require('cheerio')

// 获取行业、省份列表
let mainList = (html, type = 'bace') => {
    let options = {
        html,
        parentNode: `.${type}_box` + (type == 'bace'
            ? ` .${type}`
            : ''),
        children: [
            {
                node: 'a',
                name: 'data',
                formatter(el) {
                    let arrs = [];
                    for (let i = 0; i < el.length; i++) {
                        let dom = el.eq(i);
                        arrs.push({
                            href: dom.attr('href'),
                            sub: dom
                                .text()
                                .replace('•', '')
                        })
                    }
                    return arrs
                }
            }
        ]
    }
    let result = util.parseHTML(options);
    let data = [];
    result.forEach(provData => {
        let item = provData.data;
        for (let i = 0; i < item.length; i++) {
            let obj = item[i];
            obj.main = item[0].sub;
            data.push(obj);
        }
    })
    return data;
};

let companyList = html => {
    let $ = cheerio.load(html);
    let counts = $('.new-err').text();
    let page = $('.total').text();
    page = page == ''
        ? 1
        : page.match(/(\d+)/)[0];
    let curPage = $('.active')
        .eq(1)
        .text();

    let options = {
        html,
        parentNode: '.search_result_single',
        children: [
            {
                node: 'a',
                name: 'company_name'
            }, {
                node: 'a',
                name: 'href',
                formatter(el) {
                    return el.attr('href');
                }
            }, {
                node: '.statusTypeNor',
                name: 'company_status'
            }, {
                node: 'svg',
                name: 'score',
                formatter(el) {
                    let text = el
                        .eq(0)
                        .text()
                        .replace('评分', '');
                    return text;
                }
            }, {
                node: '.search_row_new span',
                name: 'detail',
                formatter(el) {
                    return {
                        leader: el
                            .eq(0)
                            .text(),
                        reg_captial: el
                            .eq(1)
                            .text(),
                        reg_date: el
                            .eq(2)
                            .text()
                    }
                }
            }
        ]
    }

    let result = util.parseHTML(options);
    let data = result.map(item => {
        return {
            href:item.href,
            company_name: item.company_name,
            company_status: item.company_status,
            score: item.score,
            leader: item.detail.leader,
            reg_captial: item.detail.reg_captial,
            reg_date: item.detail.reg_date
        }
    })
    return {data, page, counts, curPage}
}

module.exports = {
    mainList,
    companyList
}