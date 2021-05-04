const dt  = require('./modules/dataFormat');  //Formata Data para gravação no MYSQL
const pg = require('pg');                     //Instância do MySQL
const parse = require('csv-parse');
const fs = require('fs');
const csvData = [];
today = new Date();


const client = new pg.Client({                //Conexão com o Banco sysfinanctrl
    host: 'localhost',
    database: 'FinanCtrlSys',
    user: 'cpoeta',
    password: '@58415433P',
    port: 5432,
})


client.connect(function(err){                //Valida se Conexão realizada com Sucesso 
    if (err){
        console.error('Erro na conexão ' + err.stack);
        return;
    }
    console.log('Conexão ao Banco: ' + client.database + ' com o Usuário: ' + client.user + ' Ocorreu com Sucesso');
});


// Importação Dados BENEFICIÁRIOS           (01)
fs.createReadStream(__dirname + '/src/TBBENEFICIARIOS.csv').pipe(parse({delimiter: ';'})).on('data', function(dataRow) {
    csvData.push(dataRow);}).on('end', function() {
    var pSql = ""
    var nl = 0
    for (var i = 1;i < csvData.length;i++) {
        pSql = `INSERT INTO tbBeneficiarios (nome, createdAt, updatedAt) VALUES `
        pSql = `${pSql} ('${csvData[i][1].trim()}'`
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