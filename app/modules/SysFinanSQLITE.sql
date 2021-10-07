DROP TABLE IF EXISTS tbTpMovimento;
CREATE TABLE IF NOT EXISTS tbTpMovimento (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
    movcon VARCHAR (10), 
    movcona VARCHAR (3), 
    movent VARCHAR (10), 
    moventa VARCHAR (3)
);

INSERT INTO tbTpMovimento (movcon, movcona, movent, moventa) VALUES ("Débito","Deb","Entrada", "Ent");
INSERT INTO tbTpMovimento (movcon, movcona, movent, moventa) VALUES ("Crédito","Cre","Saída", "Sai");


DROP TABLE IF EXISTS tbTpConta;
CREATE TABLE IF NOT EXISTS tbTpConta (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
    nome VARCHAR(15)
);

INSERT INTO tbTpConta (nome) VALUES ("Patrimonial");
INSERT INTO tbTpConta (nome) VALUES ("Resultados");
INSERT INTO tbTpConta (nome) VALUES ("Transitória");


DROP TABLE IF EXISTS tbEstConta;
CREATE TABLE IF NOT EXISTS tbEstConta (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
    nome VARCHAR(10)
);

INSERT INTO tbEstConta (nome) VALUES ("Titulo1");
INSERT INTO tbEstConta (nome) VALUES ("Titulo2");
INSERT INTO tbEstConta (nome) VALUES ("Titulo3");
INSERT INTO tbEstConta (nome) VALUES ("Titulo4");
INSERT INTO tbEstConta (nome) VALUES ("Conta");


DROP TABLE IF EXISTS tbSitPeriodo;
CREATE TABLE IF NOT EXISTS tbSitPeriodo (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
    nome VARCHAR(10)
);

INSERT INTO tbSitPeriodo (nome) VALUES ("Iniciado");
INSERT INTO tbSitPeriodo (nome) VALUES ("Aberto");
INSERT INTO tbSitPeriodo (nome) VALUES ("Fechado");


DROP TABLE IF EXISTS tbAnos;
CREATE TABLE IF NOT EXISTS tbAnos (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
    nome VARCHAR(4), 
    abrev VARCHAR(2)
);

INSERT INTO tbAnos (nome, abrev) VALUES ("2016","16");
INSERT INTO tbAnos (nome, abrev) VALUES ("2017","17");
INSERT INTO tbAnos (nome, abrev) VALUES ("2018","18");
INSERT INTO tbAnos (nome, abrev) VALUES ("2019","19");
INSERT INTO tbAnos (nome, abrev) VALUES ("2020","20");
INSERT INTO tbAnos (nome, abrev) VALUES ("2021","21");
INSERT INTO tbAnos (nome, abrev) VALUES ("2022","22");
INSERT INTO tbAnos (nome, abrev) VALUES ("2023","23");


DROP TABLE IF EXISTS tbMeses;
CREATE TABLE IF NOT EXISTS tbMeses (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
    nome VARCHAR(10), 
    abrev VARCHAR(3)
);

INSERT INTO tbMeses (nome, abrev) VALUES ("Janeiro","JAN");
INSERT INTO tbMeses (nome, abrev) VALUES ("Fevereiro","FEV");
INSERT INTO tbMeses (nome, abrev) VALUES ("Março", "MAR");
INSERT INTO tbMeses (nome, abrev) VALUES ("Abril", "ABR");
INSERT INTO tbMeses (nome, abrev) VALUES ("Maio", "MAI");
INSERT INTO tbMeses (nome, abrev) VALUES ("Junho", "JUN");
INSERT INTO tbMeses (nome, abrev) VALUES ("Julho", "JUL");
INSERT INTO tbMeses (nome, abrev) VALUES ("Agosto", "AGO");
INSERT INTO tbMeses (nome, abrev) VALUES ("Setembro", "SET");
INSERT INTO tbMeses (nome, abrev) VALUES ("Outubro", "OUT");
INSERT INTO tbMeses (nome, abrev) VALUES ("Novembro", "NOV");
INSERT INTO tbMeses (nome, abrev) VALUES ("Dezembro", "DEZ");


DROP TABLE IF EXISTS tbTipoConta;
CREATE TABLE IF NOT EXISTS tbTipoConta (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
    nome VARCHAR(16)
);

INSERT INTO tbTipoConta (nome) VALUES ("Equity");
INSERT INTO tbTipoConta (nome) VALUES ("Liability");
INSERT INTO tbTipoConta (nome) VALUES ("Asset");
INSERT INTO tbTipoConta (nome) VALUES ("Investment");
INSERT INTO tbTipoConta (nome) VALUES ("Loan");
INSERT INTO tbTipoConta (nome) VALUES ("Cash");
INSERT INTO tbTipoConta (nome) VALUES ("Credit Card");
INSERT INTO tbTipoConta (nome) VALUES ("Savings");
INSERT INTO tbTipoConta (nome) VALUES ("Checking");
INSERT INTO tbTipoConta (nome) VALUES ("Encerrada");    


DROP TABLE IF EXISTS tbSitLanc;
CREATE TABLE IF NOT EXISTS tbSitLanc (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
    nome VARCHAR(15), 
    abrev VARCHAR(2)
);

INSERT INTO tbSitLanc (nome, abrev) VALUES ("Pendente","PE");
INSERT INTO tbSitLanc (nome, abrev) VALUES ("Pago","PA");
INSERT INTO tbSitLanc (nome, abrev) VALUES ("Em Liberação","AG");
INSERT INTO tbSitLanc (nome, abrev) VALUES ("Liberado","LI");
INSERT INTO tbSitLanc (nome, abrev) VALUES ("Lançada","LA");
INSERT INTO tbSitLanc (nome, abrev) VALUES ("Prevista","PR");
INSERT INTO tbSitLanc (nome, abrev) VALUES ("Gasto Fixo","GF");


DROP TABLE IF EXISTS tbUsuarios;
CREATE TABLE IF NOT EXISTS tbUsuarios (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
    username VARCHAR (30),
    password VARCHAR(60),
    fullname VARCHAR (60), 
    created_at timestamp NOT NULL DEFAULT current_timestamp
);


DROP TABLE IF EXISTS tbGrCategorias;
CREATE TABLE IF NOT EXISTS tbGrCategorias (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
    nome VARCHAR(30),
    createdAt timestamp NOT NULL DEFAULT current_timestamp,
    updatedAT timestamp NOT NULL DEFAULT current_timestamp
);

INSERT INTO tbGrCategorias (nome, createdAt, updatedAt) VALUES ("HABITAÇÃO","2020-04-12 20:53:00","2020-04-12 20:53:00");
INSERT INTO tbGrCategorias (nome, createdAt, updatedAt) VALUES ("PESSOAL","2020-04-12 20:53:00","2020-04-12 20:53:00");
INSERT INTO tbGrCategorias (nome, createdAt, updatedAt) VALUES ("TRANSPORTE","2020-04-12 20:53:00","2020-04-12 20:53:00");
INSERT INTO tbGrCategorias (nome, createdAt, updatedAt) VALUES ("SAÚDE","2020-04-12 20:53:00","2020-04-12 20:53:00");
INSERT INTO tbGrCategorias (nome, createdAt, updatedAt) VALUES ("EDUCAÇÃO","2020-04-12 20:53:00","2020-04-12 20:53:00");
INSERT INTO tbGrCategorias (nome, createdAt, updatedAt) VALUES ("LAZER","2020-04-12 20:53:00","2020-04-12 20:53:00");
INSERT INTO tbGrCategorias (nome, createdAt, updatedAt) VALUES ("DESPESAS (Financeiras)","2020-04-12 20:53:00","2020-04-12 20:53:00");
INSERT INTO tbGrCategorias (nome, createdAt, updatedAt) VALUES ("RECEITAS (Trabalho)","2020-04-12 20:53:00","2020-04-12 20:53:00");
INSERT INTO tbGrCategorias (nome, createdAt, updatedAt) VALUES ("RECEITAS (Financeiras)","2020-04-12 20:53:00","2020-04-12 20:53:00");
INSERT INTO tbGrCategorias (nome, createdAt, updatedAt) VALUES ("RECEITAS (Reembolsos)","2020-04-12 20:53:00","2020-04-12 20:53:00");
INSERT INTO tbGrCategorias (nome, createdAt, updatedAt) VALUES ("DESPESAS (Viagens Trabalho)","2020-04-12 20:53:00","2020-04-12 20:53:00");
INSERT INTO tbGrCategorias (nome, createdAt, updatedAt) VALUES ("DESCONTOS (Salário)","2020-04-12 20:53:00","2020-04-12 20:53:00");
INSERT INTO tbGrCategorias (nome, createdAt, updatedAt) VALUES ("DESPESAS (Gerais)","2020-04-12 20:53:00","2020-04-12 20:53:00");
INSERT INTO tbGrCategorias (nome, createdAt, updatedAt) VALUES ("RECEITAS (Gerais)","2020-04-12 20:53:00","2020-04-12 20:53:00");



DROP TABLE IF EXISTS tbBeneficiarios;
CREATE TABLE IF NOT EXISTS tbBeneficiarios (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
    nome VARCHAR(60),
    createdAt timestamp NOT NULL DEFAULT current_timestamp,
    updatedAT timestamp NOT NULL DEFAULT current_timestamp
);



DROP TABLE IF EXISTS tbClientes;
CREATE TABLE IF NOT EXISTS tbClientes (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
    nome VARCHAR(60),
    createdAt timestamp NOT NULL DEFAULT current_timestamp,
    updatedAT timestamp NOT NULL DEFAULT current_timestamp
);



DROP TABLE IF EXISTS tbPlanoContas;
CREATE TABLE IF NOT EXISTS tbPlanoContas (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
    CdConta VARCHAR(20), 
    nome VARCHAR(60), 
    TpContaID INTEGER NOT NULL, 
    EstContaID INTEGER NOT NULL,
    createdAt DATE NOT NULL,
    updatedAT DATE NOT NULL,
    CONSTRAINT fk_tpcontaplanocontas FOREIGN KEY (TpContaID) REFERENCES tbTpConta(id),
    CONSTRAINT fk_estconta FOREIGN KEY (EstContaID) REFERENCES tbEstConta(id)
);



DROP TABLE IF EXISTS tbContas;
CREATE TABLE IF NOT EXISTS tbContas (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
    nome VARCHAR(60), 
    TipoContaID INTEGER NOT NULL, 
    PlanoContasID INTEGER NOT NULL,
    createdAt DATE NOT NULL,
    updatedAT DATE NOT NULL,
    CONSTRAINT fk_tpconta FOREIGN KEY (TipoContaID) REFERENCES tbTipoConta(id),
    CONSTRAINT fk_planocontas FOREIGN KEY (PlanoContasID) REFERENCES tbPlanoContas(id)
);



DROP TABLE IF EXISTS tbCategorias;
CREATE TABLE IF NOT EXISTS tbCategorias (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
    nome VARCHAR(60), 
    BeneficiarioID INTEGER NOT NULL, 
    vlMedia DECIMAL(10,4), 
    vlModa DECIMAL(10,4), 
    vlMediana DECIMAL(10,4), 
    diaVenc INTEGER (2), 
    ContaID INTEGER NOT NULL, 
    SitLancID INTEGER NOT NULL, 
    GrCategoriasID INTEGER NOT NULL, 
    TpMovimentoID INTEGER NOT NULL,
    createdAt DATE NOT NULL,
    updatedAT DATE NOT NULL,
    CONSTRAINT fk_beneficiario FOREIGN KEY (BeneficiarioID) REFERENCES tbBeneficiarios(id),
    CONSTRAINT fk_Conta FOREIGN KEY (ContaID) REFERENCES tbContas(id),
    CONSTRAINT fk_SitLanc FOREIGN KEY (SitLancID) REFERENCES tbSitLanc(id),
    CONSTRAINT fk_GrCategorias FOREIGN KEY (GrCategoriasID) REFERENCES tbGrCategorias(id),
    CONSTRAINT fk_TpMovimento FOREIGN KEY (TpMovimentoID) REFERENCES tbTpMovimento(id)
);



DROP TABLE IF EXISTS tbPeriodos;
CREATE TABLE IF NOT EXISTS tbPeriodos (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
    nome VARCHAR (60), 
    AnoID INTEGER NOT NULL, 
    MesID INTEGER NOT NULL, 
    SitPeriodoID INTEGER  NOT NULL,
    createdAt DATE NOT NULL,
    updatedAT DATE NOT NULL,
    CONSTRAINT fk_ano FOREIGN KEY (AnoID) REFERENCES tbAnos(id),
    CONSTRAINT fk_mes FOREIGN KEY (MesID) REFERENCES tbMeses(id), 
    CONSTRAINT fk_sitperiodo FOREIGN KEY (SitPeriodoID) REFERENCES tbSitPeriodo(id)
);



DROP TABLE IF EXISTS tbContaPeriodos;
CREATE TABLE IF NOT EXISTS tbContaPeriodos (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
    nome VARCHAR(60), 
    ContaID INTEGER NOT NULL, 
    PeriodoID INTEGER NOT NULL, 
    vlSldInicial DECIMAL(10,4), 
    vlSldFinal DECIMAL(10,4),
    createdAt DATE NOT NULL,
    updatedAT DATE  NOT NULL,
    CONSTRAINT fk_contaperiodo FOREIGN KEY (ContaID) REFERENCES tbContas(id),
    CONSTRAINT fk_periodo FOREIGN KEY (PeriodoID) REFERENCES tbPeriodos(id)
);



DROP TABLE IF EXISTS tbFatosContabeis;
CREATE TABLE IF NOT EXISTS tbFatosContabeis (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
    PeriodoID INTEGER NOT NULL, 
    ContaID INTEGER NOT NULL, 
    BeneficiarioID INTEGER NOT NULL, 
    CategoriaID INTEGER NOT NULL, 
    DtFato DATE NOT NULL, 
    DtVenc DATE NOT NULL, 
    vlFato DECIMAL(10,4), 
    Historico TEXT, 
    SitLancID INTEGER NOT NULL,
    createdAt DATE NOT NULL,
    updatedAT DATE  NOT NULL,
    CONSTRAINT fk_contafato FOREIGN KEY (ContaID) REFERENCES tbContas(id),
    CONSTRAINT fk_periodofato FOREIGN KEY (PeriodoID) REFERENCES tbPeriodos(id),
    CONSTRAINT fk_beneficiarios FOREIGN KEY (BeneficiarioID) REFERENCES tbBeneficiarios(id),
    CONSTRAINT fk_categoria FOREIGN KEY (CategoriaID) REFERENCES tbCategorias(id),
    CONSTRAINT fk_sitlancfato FOREIGN KEY (SitLancID) REFERENCES tbSitLanc(id)
);

DROP TABLE IF EXISTS tbLinks;
CREATE TABLE IF NOT EXISTS tbLinks (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
    title VARCHAR (30),
    url VARCHAR(60),
    description VARCHAR (100),
    user_id INTEGER,
    created_at timestamp NOT NULL DEFAULT current_timestamp,
    created_up timestamp NOT NULL DEFAULT current_timestamp
);