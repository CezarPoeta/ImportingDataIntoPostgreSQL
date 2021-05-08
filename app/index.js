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

