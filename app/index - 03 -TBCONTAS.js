const dt  = require('./modules/dataFormat');  //Formata Data para gravação no MYSQL
const pg = require('pg');                     //Instância do MySQL
const parse = require('csv-parse');
const fs = require('fs');
const csvData = [];
today = new Date();

const client = new pg.Client({                //Conexão com o Banco sysfinanctrl
    host: 'localhost',
    database: 'sysfinanctrl',
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

// Importação Dados CONTAS           (03)
fs.createReadStream(__dirname + '/src/TBCONTAS.csv').pipe(parse({delimiter: ';'})).on('data', function(dataRow) {      
    csvData.push(dataRow);}).on('end', function() {
    var pSql = ""
    var nl = 0
    for (i = 1; i < csvData.length; i++) {
        pSql = `INSERT INTO tbContas ("nome", "TipoContaID", "PlanoContasID", "created", "updated") VALUES `
        pSql = `${pSql} ('${csvData[i][1].trim()}'`
        pSql = `${pSql}, (SELECT id from tbTipoConta WHERE nome = '${csvData[i][2].trim()}')`
        pSql = `${pSql}, (SELECT id from tbPlanoContas WHERE nome = '${csvData[i][3].trim()}')`
        pSql = `${pSql}, '${dt(today)}', '${dt(today)}')` 
        client.query(pSql, function (err, rows, fields) {   //Nesta Rotina podemos ver a utilização de Querys utilizando a conexão
            if (!err) {
                ++nl
                console.log(`Situação ${nl}: Inclusão com Sucesso!`);
            }else {
                console.log(`Situação ${++nl}: ${err}`);
            }    
        }) 
    }    
});