const mysql = require('mysql');
const connection = mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'',
    database:'lec_mcc'
})

connection.connect()
module.exports = connection