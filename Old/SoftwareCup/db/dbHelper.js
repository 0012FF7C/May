var mysql = require('mysql');

var conn = mysql.createConnection({
    host: 'localhost',
    // host:'localhost',
    user: 'root',
    // password: 'root',
    password:'liyunhao',
    database: 'softwarecup_test',
    port: 3306
    // port:3306
});
conn.connect();

exports.getConn = function(){
    return conn;
};
setInterval(function () {
    conn.query('SELECT 1');
}, 5000);