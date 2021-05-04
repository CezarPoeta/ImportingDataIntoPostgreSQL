const dt  = require('./modules/dataFormat');    //Formata Data para gravação no MYSQL
const mysql = require('mysql');                 //Instância do MySQL

const connection = mysql.createConnection({     //Conexão com o Banco sysfinanctrl
    host: 'localhost',
    user: 'cpoeta',
    password: '@58415433P',
    database: 'sysfinanctrl'
})

connection.connect(function(err){              //Valida se Conexão realizada com Sucesso 
    if (err){
        console.error('Erro na conexão ' + err.stack);
        return;
    }
    console.log('Conexão com Sucesso ' + connection.threadId);
});

const parse = require('csv-parse');

const fs = require('fs');

const csvData = [];

today = new Date();

// Importação Dados CONTA PERIODOS           (05)
fs.createReadStream(__dirname + '/src/TBCONTAPERIODOS.csv').pipe(parse({delimiter: ';'})).on('data', function(dataRow) {      
        csvData.push(dataRow);}).on('end', function(){
        var pSql = ""
        var nl = 0
        for (i = 1; i < csvData.length; i++) {
            pSql = `INSERT INTO tbContaPeriodos (nome, ContaID, PeriodoID, vlSldInicial, vlSldFinal, createdAt, updatedAT) VALUES `
            pSql = `${pSql} ('${csvData[i][1].trim()}'`                                                    //nome
            pSql = `${pSql}, (SELECT id FROM tbContas WHERE nome = '${csvData[i][1].trim()}')`            //ContaID
            pSql = `${pSql}, (SELECT id FROM tbPeriodos WHERE nome = '${csvData[i][2].trim()}')`          //PeriodoID
            pSql = `${pSql}, ${csvData[i][3]}`
            pSql = `${pSql}, ${csvData[i][4]}`
            pSql = `${pSql}, '${dt(today)}', '${dt(today)}')` 
            connection.query(pSql, function (err, rows, fields) {
            if (!err) {
                ++nl
                console.log(`Situação ${nl}: Inclusão com Sucesso!`);
            }else {
                console.log(`Situação ${++nl}: ${err}`);
            }
        }) 
    }
});