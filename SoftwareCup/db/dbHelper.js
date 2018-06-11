var mysql = require('mysql');

var conn = mysql.createConnection({
    host: 'localhost',
    // host:'localhost',
    user: 'root',
    // password: 'root',
    password:'gj849405443',
    database: 'softwarecup',
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