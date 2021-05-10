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

// Importação Dados FATOS CONTABEIS            (07)
fs.createReadStream(__dirname + '/src/TBFATOSCONTABEIS.csv').pipe(parse({delimiter: ';'})).on('data', function(dataRow) {
    csvData.push(dataRow);}).on('end', function(){
    var pSql = ""
    var nl = 0
    for (i = 1; i < csvData.length; i++) {
        var sDtFato = csvData[i][5];
        var arrsDtFato = sDtFato.split('/');
        var myDtFato = arrsDtFato[2] + '-' + arrsDtFato[1] + '-' + arrsDtFato[0];
            
        var sDtVenc = csvData[i][6];
        var arrsDtVenc = sDtVenc.split('/');
        var myDtVenc = arrsDtVenc[2] + '-' + arrsDtVenc[1] + '-' + arrsDtVenc[0];

        pSql = `INSERT INTO tbFatosContabeis ("PeriodoID", "ContaID", "BeneficiarioID", "CategoriaID", "DtFato", "DtVenc", "vlFato", "Historico", "SitLancID", "created", "updated") VALUES `
        pSql = `${pSql} ((SELECT id FROM tbPeriodos WHERE nome = '${csvData[i][1].trim()}')`           //PeriodoID
        pSql = `${pSql}, (SELECT id FROM tbContas WHERE nome = '${csvData[i][2].trim()}')`             //ContaID
        pSql = `${pSql}, (SELECT id FROM tbBeneficiarios WHERE nome = '${csvData[i][3].trim()}')`      //BeneficiarioID
        pSql = `${pSql}, (SELECT id FROM tbCategorias WHERE nome = '${csvData[i][4].trim()}')`         //CategoriaID
        pSql = `${pSql}, '${myDtFato}'`                                                                 //DtFato 
        pSql = `${pSql}, '${myDtVenc}'`                                                                 //DtVenc 
        pSql = `${pSql}, '${csvData[i][7]}'`                                                            //vlFato
        pSql = `${pSql}, '${csvData[i][8]}'`                                                            //Historico
        pSql = `${pSql}, (SELECT id FROM tbSitLanc WHERE nome = '${csvData[i][9].trim()}')`            //SitLancID
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
console.log('O Fim!')