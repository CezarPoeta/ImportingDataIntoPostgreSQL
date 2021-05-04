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

// Importação Dados PERIODOS           (04)
fs.createReadStream(__dirname + '/src/TBPERIODOS.csv').pipe(parse({delimiter: ';'})).on('data', function(dataRow) {      
    csvData.push(dataRow);}).on('end', function(){
    var pSql = ""
    var nl = 0
    for (i = 1; i < csvData.length; i++) {
        pSql = `INSERT INTO tbPeriodos (nome, AnoID, MesID, SitPeriodoID, createdAt, updatedAT) VALUES `
        pSql = `${pSql} ('${csvData[i][1].trim()}'`                                                    //nome
        pSql = `${pSql}, (SELECT id FROM tbAnos WHERE nome = '${csvData[i][2].trim()}')`              //AnoID
        pSql = `${pSql}, (SELECT id FROM tbMeses WHERE nome = '${csvData[i][3].trim()}')`             //MesID
        pSql = `${pSql}, (SELECT id FROM tbSitPeriodo WHERE nome = '${csvData[i][4].trim()}')`        //SitPeriodoID
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