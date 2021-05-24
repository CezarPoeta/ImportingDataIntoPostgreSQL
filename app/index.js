//Não esquecer de Corrigir o database
const client = new pg.Client({                //Conexão com o Banco sysfinanctrl
    host: 'localhost',
    database: 'PersonalFinance',
    user: 'cpoeta',
    password: '@58415433P',
    port: 5432,
})

// Não esquecer de acrescentar o active com dado = True quando o database = 'PersonalFinance'
        pSql = `INSERT INTO tbBeneficiarios (nome, created, updated, active) VALUES `
        pSql = `${pSql} ('${csvData[i][1].trim()}'`
        pSql = `${pSql}, '${dt(today)}', '${dt(today)}', True)`
