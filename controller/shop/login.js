let querystring = require('querystring');
let axios = require('axios');

let util = require('../util/common');
let fs = require('fs');
let user = require('./loginSetting');

async function login() {
    let url = 'https://bj.tianyancha.com/cd/login.json';
    let data = {
        autoLogin: true,
        cdpassword: user.psw,
        loginway: "PL",
        mobile: user.name
    }
    let option = {
        method: 'post',
        url,
        headers: {
            'Accept': '*/*',
            'Accept-Encoding': 'gzip, deflate, br',
            'Accept-Language': 'zh-CN,zh;q=0.8',
            'Content-Type': 'application/json; charset=UTF-8',
            'Host': 'bj.tianyancha.com',
            'Origin': 'https://bj.tianyancha.com',
            'Referer': 'https://bj.tianyancha.com/login',
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)' +
                    ' Chrome/60.0.3112.113 Safari/537.36',
            'X-Requested-With': 'XMLHttpRequest'
        },
        data
    };

    return await axios(option).then(res => {
        let cookie = res
            .headers['set-cookie']
            .join(';');
        // let fileName = util.getMainContent() + '/controller/data/cookies.json';
        // fs.writeFileSync(fileName, JSON.stringify({cookie}), 'utf8');
        // 此处应加入cookie中其它字段的处理，因时间关系，该部分暂时不做
        return cookie;
    }).catch(e => {
        console.log(e.message);
    })

}

module.exports = login;