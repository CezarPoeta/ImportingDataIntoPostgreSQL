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

// Importação Dados CATEGORIAS            (06)
fs.createReadStream(__dirname + '/src/TBCATEGORIAS.csv').pipe(parse({delimiter: ';'})).on('data', function(dataRow) {      
    csvData.push(dataRow);}).on('end', function(){

    var pSql = ""
    var nl = 0
    for (i = 1; i < csvData.length; i++) {
        pSql = `INSERT INTO tbCategorias ("nome", "BeneficiarioID", "vlMedia", "vlModa", "vlMediana", "diaVenc", "ContaID", "SitLancID", "GrCategoriasID", "TpMovimentoID", "created", "updated") VALUES `
        pSql = `${pSql} ('${csvData[i][1].trim()}'`                                                    //nome
        pSql = `${pSql}, (SELECT id FROM tbBeneficiarios WHERE nome = '${csvData[i][2].trim()}')`     //BeneficiarioID
        pSql = `${pSql}, '${csvData[i][3]}'`                                                    //vlMedia
        pSql = `${pSql}, '${csvData[i][4]}'`                                                    //vlModa
        pSql = `${pSql}, '${csvData[i][5]}'`                                                    //vlMediana
        pSql = `${pSql}, '${csvData[i][6]}'`                                                    //diaVenc
        pSql = `${pSql}, (SELECT id FROM tbContas WHERE nome = '${csvData[i][7].trim()}')`              //ContaID
        pSql = `${pSql}, (SELECT id FROM tbSitLanc WHERE nome = '${csvData[i][8].trim()}')`             //SitLancID
        pSql = `${pSql}, (SELECT id FROM tbGrCategorias WHERE nome = '${csvData[i][9].trim()}')`        //GrCategoriasID
        pSql = `${pSql}, (SELECT id FROM tbTpMovimento WHERE movcon = '${csvData[i][10].trim()}')`        //TpMovimentoID
        pSql = `${pSql}, '${dt(today)}', '${dt(today)}')` 
        client.query(pSql, function (err, rows, fields) {
        if (!err) {
            ++nl
            console.log(`Situação ${nl}: Inclusão com Sucesso!`);
        }else {
            console.log(`Situação ${++nl}: ${err}`);
        }
    })
}
});