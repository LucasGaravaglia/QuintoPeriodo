DROP DATABASE IF EXISTS ficha_medica;
CREATE DATABASE IF NOT EXISTS ficha_medica;
USE ficha_medica;

CREATE TABLE IF NOT EXISTS TipoLogradouros (
    siglaLogradouro varchar(3) primary key not null,
    nomeTipoLogradouro varchar(255) not null
);

CREATE TABLE IF NOT EXISTS Logradouros (
    idLogradouro int unsigned auto_increment primary key not null,
    siglaLogradouro varchar(3) not null,
    nomeLogradouro varchar(255) not null,
    foreign key (siglaLogradouro) references TipoLogradouros(siglaLogradouro)
);

CREATE TABLE IF NOT EXISTS Ufs (
    siglaUf varchar(3) primary key not null,
    nomeUf varchar(255) not null
);

CREATE TABLE IF NOT EXISTS Cidades (
    idCidade int unsigned auto_increment primary key not null,
    siglaUf varchar(3) not null,
    nomeCidade varchar(255) not null,
    foreign key (siglaUf) references Ufs(siglaUf)
);

CREATE TABLE IF NOT EXISTS Bairros (
    idBairro int unsigned auto_increment primary key not null,
    nomeBairro varchar(255) not null
);

CREATE TABLE IF NOT EXISTS Enderecos (
    idEndereco int unsigned auto_increment primary key not null,
    idLogradouro int unsigned not null,
    idBairro int unsigned not null,
    idCidade int unsigned not null,
    cep varchar(255) not null,
    foreign key (idLogradouro) references Logradouros(idLogradouro),
    foreign key (idBairro) references Bairros(idBairro),
    foreign key (idCidade) references Cidades(idCidade)
);

CREATE TABLE IF NOT EXISTS Pacientes (
    nroPaciente int unsigned auto_increment primary key not null,
    idEndereco int unsigned not null,
    nomePaciente varchar(255) not null,
    dataNascimentoPaciente date not null,
    sobrenomePaciente varchar(255) not null,
    sexoPaciente varchar(1) not null,
    estadoCivilPaciente varchar(255) not null,
    identidadePaciente varchar(12) not null,
    nroCasa int unsigned not null,
    complemento varchar(255) not null,
    foreign key (idEndereco) references Enderecos(idEndereco)
);

CREATE TABLE IF NOT EXISTS Medicos (
    crmMedico varchar(255) primary key not null,
    nomeMedico varchar(255) not null,
    sobrenomeMedico varchar(255) not null
);

CREATE TABLE IF NOT EXISTS Consultas (
    idConsulta int unsigned auto_increment primary key not null,
    nroPaciente int unsigned not null,
    nroConsulta int unsigned not null,
    dataConsulta date not null,
    crmMedico varchar(255) not null,
    diagnosticoConsulta text(10000) not null,
    foreign key (nroPaciente) references Pacientes(nroPaciente),
    foreign key (crmMedico) references Medicos(crmMedico)
);

CREATE TABLE IF NOT EXISTS Exames (
    idExame int unsigned auto_increment primary key not null,
    idConsulta int unsigned not null,
    nroExame int unsigned not null,
    dataExame date not null,
    tipoExame varchar(255) not null,
    foreign key (idConsulta) references Consultas(idConsulta)
);

CREATE TABLE IF NOT EXISTS Emails (
    idEmail int unsigned auto_increment primary key not null,
    nroPaciente int unsigned not null,
    email varchar(255) not null,
    foreign key (nroPaciente)references Pacientes(nroPaciente)
);

CREATE TABLE IF NOT EXISTS DDDs (
    nroDDD varchar(255) primary key not null
);

CREATE TABLE IF NOT EXISTS DDIs (
    nroDDI varchar(255) primary key not null
);

CREATE TABLE IF NOT EXISTS Fones (
    idFone int unsigned auto_increment primary key not null,
    nroPaciente int unsigned not null,
    nroDDD varchar(255) not null,
    nroDDI varchar(255) not null,
    numero varchar(255) not null,
    foreign key (nroPaciente) references Pacientes(nroPaciente),
    foreign key (nroDDD) references DDDs(nroDDD),
    foreign key (nroDDI) references DDIs(nroDDI)
);

CREATE VIEW ListaPacientes AS 
    SELECT 
        Pacientes.nroPaciente,
        Pacientes.idEndereco,
        Pacientes.nomePaciente,
        Pacientes.sobrenomePaciente,
        Pacientes.sexoPaciente,
        Pacientes.estadoCivilPaciente,
        Pacientes.identidadePaciente,
        Pacientes.nroCasa,
        Pacientes.complemento,

        (SELECT GROUP_CONCAT(email) FROM Emails WHERE Emails.nroPaciente=Pacientes.nroPaciente) AS "Emails",

        Fones.nroDDD,
        Fones.nroDDI,
        Fones.numero,

        Enderecos.cep,

        Cidades.nomeCidade,

        Ufs.nomeUf,

        Bairros.nomeBairro,

        Logradouros.siglaLogradouro,
        Logradouros.nomeLogradouro

    FROM Pacientes
        inner join Fones on Fones.nroPaciente = Pacientes.nroPaciente
        inner join Enderecos on Enderecos.idEndereco = Pacientes.idEndereco
        inner join Cidades on Cidades.idCidade = Enderecos.idCidade
        inner join Ufs on Ufs.siglaUf = Cidades.siglaUf
        inner join Bairros on Bairros.idBairro = Enderecos.idBairro
        inner join Logradouros on Logradouros.idLogradouro = Enderecos.idLogradouro;


CREATE VIEW ListaConsultas AS 
    SELECT 
        Consultas.nroPaciente,
        Consultas.nroConsulta,
        Consultas.dataConsulta,
        Consultas.diagnosticoConsulta,
        Consultas.crmMedico,
        Medicos.nomeMedico,
        Medicos.sobrenomeMedico
    FROM 
        Consultas
    INNER JOIN Medicos on Medicos.crmMedico = Consultas.crmMedico;
    
CREATE VIEW ListaExames AS 
    SELECT 
        Consultas.nroPaciente,
        Consultas.nroConsulta,
        Exames.nroExame,
        Exames.dataExame,
        Exames.tipoExame,
        Exames.idConsulta
    FROM 
        Exames
    INNER JOIN Consultas on Consultas.idConsulta = Exames.idConsulta;



INSERT INTO `Ufs` (siglaUf,nomeUf) VALUES("PR","Paraná");
INSERT INTO `Cidades` (siglaUf,nomeCidade) VALUES("PR","Foz do Iguaçu");
INSERT INTO `TipoLogradouros` (siglaLogradouro,nomeTipoLogradouro) VALUES("Av","Avenida");
INSERT INTO `Logradouros` (siglaLogradouro,nomeLogradouro) VALUES("Av","Por do Sol");
INSERT INTO `Bairros` (nomeBairro) VALUES("Jd. São Paulo 2");
INSERT INTO `Enderecos` (idLogradouro,idBairro,idCidade,cep) VALUES(1,1,1,"82843957");
INSERT INTO `Pacientes` (idEndereco,nomePaciente,sobrenomePaciente,dataNascimentoPaciente,sexoPaciente,estadoCivilPaciente,identidadePaciente,nroCasa,complemento) VALUES(1,"Lucas","Garavaglia","2000-02-28","M","solteiro","14558965478",841,"Ao lado da padaria");
INSERT INTO `Emails` (nroPaciente,email) VALUES(1,"lucasgrafimar@gmail.com");
INSERT INTO `Emails` (nroPaciente,email) VALUES(1,"lucas.garavaglia@unioeste.br");
INSERT INTO `DDIs`(nroDDI) VALUES("55");
INSERT INTO `DDDs`(nroDDD) VALUES("45");
INSERT INTO `Fones` (nroPaciente,nroDDD,nroDDI,numero) VALUES(1,"45","55","999087584");
INSERT INTO `Medicos`(crmMedico,nomeMedico,sobrenomeMedico) VALUES("516516416","Graciele","Rodrigues");
INSERT INTO `Consultas`(nroPaciente,nroConsulta,crmMedico,diagnosticoConsulta,dataConsulta)VALUES(1,1,"516516416","Leve dor de cabeça e febre alta.","2020-05-28");
INSERT INTO `Exames`(idConsulta,nroExame,dataExame,tipoExame)VALUES(1,1,'2020-06-03',"Hemograma"),(1,2,'2020-06-03',"Glicemia em jejum"),(1,3,'2020-06-03',"TSH e T4 livre"),(1,4,'2020-06-03',"Ecocardiograma"),(1,5,'2020-06-03',"Trigliceridio");
INSERT INTO `Consultas`(nroPaciente,nroConsulta,crmMedico,diagnosticoConsulta,dataConsulta)VALUES(1,2,"516516416","Dor no corpo todo.","2020-11-1");
INSERT INTO `Exames`(idConsulta,nroExame,dataExame,tipoExame)VALUES(2,1,'2020-11-25',"Hemograma"),(2,2,'2020-11-25',"Covid19"),(2,3,'2020-11-25',"Sorológico Elisa IgM"),(2,4,'2020-11-25',"Sorológico Elisa IgG");



INSERT INTO `TipoLogradouros` (siglaLogradouro,nomeTipoLogradouro) VALUES("Rua","Rua");
INSERT INTO `Logradouros` (siglaLogradouro,nomeLogradouro) VALUES("Rua","Shimiofeng");
INSERT INTO `Bairros` (nomeBairro) VALUES("Jd. Osasco");
INSERT INTO `Enderecos` (idLogradouro,idBairro,idCidade,cep) VALUES(2,2,1,"526987456");
INSERT INTO `Pacientes` (idEndereco,nomePaciente,sobrenomePaciente,dataNascimentoPaciente,sexoPaciente,estadoCivilPaciente,identidadePaciente,nroCasa,complemento)  VALUES(2,"Caio","Cesar","1999-12-03","M","solteiro","45889632254",126,"Ao lado da pscina municipal");
INSERT INTO `Emails` (nroPaciente,email) VALUES(2,"caioslppuo@gmail.com");
INSERT INTO `Fones` (nroPaciente,nroDDD,nroDDI,numero) VALUES(2,"45","55","777458921");
INSERT INTO `Consultas`(nroPaciente,nroConsulta,crmMedico,diagnosticoConsulta,dataConsulta) VALUES(2,1,"516516416","Dor nas costas","2021-01-02");
INSERT INTO `Exames`(idConsulta,nroExame,dataExame,tipoExame) VALUES(3,1,'2021-01-03',"Radiografia"),(3,2,'2020-06-03',"Tomografia");



INSERT INTO `Logradouros` (siglaLogradouro,nomeLogradouro) VALUES("Av","Republica Cuba");
INSERT INTO `Bairros` (nomeBairro) VALUES("Carolina-las Mercedes-Mburukuja");
INSERT INTO `Enderecos` (idLogradouro,idBairro,idCidade,cep) VALUES(3,3,1,"84551678");
INSERT INTO `Pacientes` (idEndereco,nomePaciente,sobrenomePaciente,dataNascimentoPaciente,sexoPaciente,estadoCivilPaciente,identidadePaciente,nroCasa,complemento)  VALUES(3,"Levi","Arcanjo","1999-08-24","M","solteiro","41112568420",654,"Ao lado da igreja");
INSERT INTO `Emails` (nroPaciente,email) VALUES(3,"arcanjolevi@gmail.com");
INSERT INTO `Fones` (nroPaciente,nroDDD,nroDDI,numero) VALUES(3,"45","55","777458963");
INSERT INTO `Consultas`(nroPaciente,nroConsulta,crmMedico,diagnosticoConsulta,dataConsulta)VALUES(3,1,"516516416","Dor no Corpo todo","2020-05-30");
INSERT INTO `Exames`(idConsulta,nroExame,dataExame,tipoExame)VALUES(4,1,'2020-06-03',"Hemograma"),(4,2,'2020-06-03',"Glicemia em jejum"),(4,3,'2020-06-03',"TSH e T4 livre"),(4,4,'2020-06-03',"Ecocardiograma"),(4,5,'2020-06-03',"Trigliceridio");
INSERT INTO `Consultas`(nroPaciente,nroConsulta,crmMedico,diagnosticoConsulta,dataConsulta)VALUES(3,2,"516516416","Dor no Corpo todo","2021-02-01");
INSERT INTO `Exames`(idConsulta,nroExame,dataExame,tipoExame)VALUES(5,1,'2021-02-02',"Covid19");



INSERT INTO `Logradouros` (siglaLogradouro,nomeLogradouro) VALUES("Av","Por do Sol");
INSERT INTO `Bairros` (nomeBairro) VALUES("Conjunto Libra 2");
INSERT INTO `Enderecos` (idLogradouro,idBairro,idCidade,cep) VALUES(4,4,1,"48875698");
INSERT INTO `Pacientes` (idEndereco,nomePaciente,sobrenomePaciente,dataNascimentoPaciente,sexoPaciente,estadoCivilPaciente,identidadePaciente,nroCasa,complemento) VALUES(4,"Maria","Eduarda","2000-03-05","F","solteiro","45552136587",951,"Na baixada");
INSERT INTO `Emails` (nroPaciente,email) VALUES(4,"maria465@gmail.com");
INSERT INTO `Fones` (nroPaciente,nroDDD,nroDDI,numero) VALUES(4,"45","55","444256357");
INSERT INTO `Medicos`(crmMedico,nomeMedico,sobrenomeMedico) VALUES("4656589","Marcio","Ryo");
INSERT INTO `Consultas`(nroPaciente,nroConsulta,crmMedico,diagnosticoConsulta,dataConsulta) VALUES(4,1,"4656589","Dor no Corpo todo e frebre alta","2021-01-04");
INSERT INTO `Exames`(idConsulta,nroExame,dataExame,tipoExame) VALUES(6,1,'2021-01-05',"Covid19");



INSERT INTO `Logradouros` (siglaLogradouro,nomeLogradouro) VALUES("Rua","Belarmino de Mendonça");
INSERT INTO `Bairros` (nomeBairro) VALUES("Centro");
INSERT INTO `Enderecos` (idLogradouro,idBairro,idCidade,cep) VALUES(5,5,1,"74745961");
INSERT INTO `Pacientes` (idEndereco,nomePaciente,sobrenomePaciente,dataNascimentoPaciente,sexoPaciente,estadoCivilPaciente,identidadePaciente,nroCasa,complemento) VALUES(5,"Jose","Pedro","2000-07-18","M","solteiro","14445862158",16,"Ao lado da Unimed Foz");
INSERT INTO `Emails` (nroPaciente,email) VALUES(5,"PedroJose@gmail.com");
INSERT INTO `Fones` (nroPaciente,nroDDD,nroDDI,numero) VALUES(5,"45","55","444586125");
INSERT INTO `Consultas`(nroPaciente,nroConsulta,crmMedico,diagnosticoConsulta,dataConsulta)VALUES(5,1,"4656589","Febre","2021-01-30");
INSERT INTO `Exames`(idConsulta,nroExame,dataExame,tipoExame)VALUES(7,1,'2021-02-02',"Hemograma"),(7,2,'2020-02-02',"Glicemia em jejum"),(7,3,'2020-02-02',"TSH e T4 livre");
INSERT INTO `Consultas`(nroPaciente,nroConsulta,crmMedico,diagnosticoConsulta,dataConsulta)VALUES(5,2,"4656589","Consulta Rotineira","2020-02-28");
INSERT INTO `Exames`(idConsulta,nroExame,dataExame,tipoExame)VALUES(8,1,'2021-03-02',"Trigliceridios"),(8,2,'2020-03-02',"Glicemia em jejum");



