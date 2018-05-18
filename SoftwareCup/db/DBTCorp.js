var dbHelper = require('./dbHelper');
var conn = dbHelper.getConn();

var sql = "SELECT * from t_corp";
conn.query(sql,function(err,rows,fields){
    if(err){
        console.error(err);
    }
    //rows.forEach(function (value) {
        console.log( "val :" + JSON.stringify(rows));
    //})
});