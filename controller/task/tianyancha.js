let util = require('../util/common');

let read = require('../shop/tianyancha');

let tbproxyCrawler = require('../shop/tianyanchahq');

let localRead = require('../shop/tianyancha1Thread');

async function init() {
    
    // read.init();
    
    localRead.init();
    
    // tbproxyCrawler.init();
}

module.exports = {
    init
};