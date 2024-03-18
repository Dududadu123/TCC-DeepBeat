const bancodedados = require("mysql")
require('dotenv').config()

module.exports = function(){
    return bancodedados.createConnection({
        host: 'localhost',
        user: 'mariazitelli',
        password: 'Dzitelli07_',
        database: 'deepbeat',
        port: process.env.PORTDB
    })
}