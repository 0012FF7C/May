var dbHelper = require('./dbHelper');
var conn = dbHelper.getConn();

var sql = "SELECT * from t_corp";
exports.queryDB = function (sql) {
    conn.query(sql,function(err,rows,fields){
        if(err){
            console.error(err);
        }

        console.log( "val :" + JSON.stringify(rows));
        return rows;
    });
};
