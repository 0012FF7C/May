var dbHelper = require('./dbHelper');
var conn = dbHelper.getConn();

exports.queryDB = function (sql,callback) {
     conn.query(sql,function(err,rows,fields){
        if(err){
            console.error(err);
            return err;
        }else{
            // console.log( "rows:" + JSON.stringify(rows));
            callback(rows);
        }

    });

};
