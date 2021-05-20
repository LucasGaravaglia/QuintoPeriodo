DROP DATABASE Faturas;
CREATE DATABASE IF NOT EXISTS Faturas;
USE Faturas;

create table if not exists DDD (nroDDD varchar(2) unique not null);
create table if not exists DDI (nroDDI varchar(5) unique not null);
create table if not exists Logradouros (
    idLogradouro int unsigned unique auto_increment primary key not null,
    siglaLogradouro varchar(10),
    nomeLogradouro varchar(255)
);
create table Ufs(
    siglaNome varchar(3) unique not null primary key,
    nome varchar(255) not null
);
create table if not exists Cidades(
    idCidade int unsigned auto_increment unique not null primary key,
    siglaUf varchar(2),
    nomeCidade varchar(255) not null,
    foreign key (siglaUf) references Ufs(siglaNome)
);
create table if not exists Bairros (
    idBairro int unsigned unique auto_increment not null primary key,
    nomeBairro varchar(255) not null
);
create table if not exists Enderecos (
    idEndereco int unsigned unique auto_increment not null primary key,
    idLogradouro int unsigned,
    idBairro int unsigned,
    idCidade int unsigned,
    cep varchar(255) not null,
    foreign key(idLogradouro) references Logradouros(idLogradouro),
    foreign key(idBairro) references Bairros(idBairro),
    foreign key(idCidade) references Cidades(idCidade)
);
create table if not exists Clientes(
    idCliente int unsigned unique auto_increment not null primary key,
    idEndereco int unsigned,
    nome varchar(255) not null,
    sobrenome varchar(255) not null,
    cpf varchar(12) not null,
    nroCasaCliente int unsigned,
    complementoEnderecoCliente varchar(255),
    foreign key(idEndereco) references Enderecos(idEndereco)
);
create table if not exists Telefones(
    idFone int unsigned auto_increment primary key not null,
    idCliente int unsigned,
    nroDDD varchar(2) not null,
    nroDDI varchar(5) not null,
    numero varchar(255) not null,
    foreign key(idCliente) references Clientes(idCliente),
    foreign key(nroDDD) references DDD(nroDDD),
    foreign key(nroDDI) references DDI(nroDDI)
);
create table if not exists Emails(
    idEmail int unsigned auto_increment not null primary key,
    idCliente int unsigned,
    email varchar(255) not null,
    foreign key(idCliente) references Clientes(idCliente)
);
create table if not exists Faturas(
    nroFatura int unsigned auto_increment not null primary key,
    dataEmissao date not null,
    total float not null,
    idCliente int unsigned,
    idEnderecoComercial int unsigned,
    situacao varchar(255),
    foreign key(idCliente) references Clientes(idCliente),
    foreign key(idEnderecoComercial) references Enderecos(idEndereco)
);
create table if not exists Parcelas (
    idParcela int unsigned auto_increment not null primary key,
    nroFatura int unsigned not null,
    nroParcela int unsigned not null,
    dataVencimento date not null,
    valor float not null,
    situacao varchar(255),
    dataPagamento date,
    foreign key(nroFatura) references Faturas(nroFatura)
);


INSERT INTO `Ufs` (siglaNome,nome) VALUES("PR","Paraná");
INSERT INTO `Cidades` (siglaUf,nomeCidade) VALUES("PR","Foz do Iguaçu");
INSERT INTO `Logradouros` (siglaLogradouro,nomeLogradouro) VALUES("Av","Por do Sol");
INSERT INTO `Bairros` (nomeBairro) VALUES("Jd. São Paulo 2");
INSERT INTO `Enderecos` (idLogradouro,idBairro,idCidade,cep) VALUES(1,1,1,"82843957");
INSERT INTO `Clientes` (idEndereco,nome,sobrenome,cpf,nroCasaCliente,ComplementoEnderecoCliente) VALUES(1,"Lucas","Garavaglia","15889632766",648,"Proximo ao mercado");
INSERT INTO `Emails` (idCliente,email) VALUES(1,"lucasgrafimar@gmail.com");
INSERT INTO `DDI` VALUES("55");
INSERT INTO `DDD` VALUES("45");
INSERT INTO `Telefones` (idCliente,nroDDD,nroDDI,numero) VALUES(1,"45","55","999087584");
INSERT INTO `Logradouros` (siglaLogradouro,nomeLogradouro) VALUES("Av","Brasil");
INSERT INTO `Bairros` (nomeBairro) VALUES("Centro");
INSERT INTO `Enderecos` (idLogradouro,idBairro,idCidade,cep) VALUES(2,2,1,"45786942");
INSERT INTO `Faturas` (dataEmissao,total,idCliente,idEnderecoComercial,situacao) VALUES('2020-12-01',3456.24,1,2,"Não paga");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao,dataPagamento) VALUES(1,1,'2021-01-01',288.02,"Paga","2020-12-23");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao,dataPagamento) VALUES(1,2,'2021-01-30',288.02,"Paga","2021-01-30");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao) VALUES(1,3,'2021-03-01',288.02,"Não paga");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao) VALUES(1,4,'2021-04-01',288.02,"Não paga");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao) VALUES(1,5,'2021-05-01',288.02,"Não paga");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao) VALUES(1,6,'2021-06-01',288.02,"Não paga");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao) VALUES(1,7,'2021-07-01',288.02,"Não paga");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao) VALUES(1,8,'2021-08-01',288.02,"Não paga");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao) VALUES(1,9,'2021-09-01',288.02,"Não paga");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao) VALUES(1,10,'2021-10-01',288.02,"Não paga");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao) VALUES(1,11,'2021-11-01',288.02,"Não paga");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao) VALUES(1,12,'2021-12-01',288.02,"Não paga");
INSERT INTO `Faturas` (dataEmissao,total,idCliente,idEnderecoComercial,situacao) VALUES('2021-03-01',1100.00,1,2,"Não paga");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao) VALUES(2,1,'2021-04-01',110.00,"Não paga");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao) VALUES(2,2,'2021-05-01',110.00,"Não paga");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao) VALUES(2,3,'2021-06-01',110.00,"Não paga");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao) VALUES(2,4,'2021-07-01',110.00,"Não paga");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao) VALUES(2,5,'2021-08-01',110.00,"Não paga");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao) VALUES(2,6,'2021-09-01',110.00,"Não paga");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao) VALUES(2,7,'2021-10-01',110.00,"Não paga");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao) VALUES(2,8,'2021-11-01',110.00,"Não paga");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao) VALUES(2,9,'2021-12-01',110.00,"Não paga");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao) VALUES(2,10,'2022-01-01',110.00,"Não paga");

INSERT INTO `Logradouros` (siglaLogradouro,nomeLogradouro) VALUES("Rua","shimiofeng");
INSERT INTO `Bairros` (nomeBairro) VALUES("Jd. Osasco");
INSERT INTO `Enderecos` (idLogradouro,idBairro,idCidade,cep) VALUES(3,3,1,"42659874");
INSERT INTO `Clientes` (idEndereco,nome,sobrenome,cpf,nroCasaCliente,ComplementoEnderecoCliente) VALUES(3,"Caio","Cezar das Neves","45889632145",854,"Proximo ao Batalhão");
INSERT INTO `Emails` (idCliente,email) VALUES(2,"caioslppuo@gmail.com");
INSERT INTO `Telefones` (idCliente,nroDDD,nroDDI,numero) VALUES(2,"45","55","998520160");
INSERT INTO `Logradouros` (siglaLogradouro,nomeLogradouro) VALUES("Av","Brasil");
INSERT INTO `Bairros` (nomeBairro) VALUES("Centro");
INSERT INTO `Enderecos` (idLogradouro,idBairro,idCidade,cep) VALUES(4,4,1,"45786942");
INSERT INTO `Faturas` (dataEmissao,total,idCliente,idEnderecoComercial,situacao) VALUES('2020-05-03',500.00,2,4,"Paga");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao,dataPagamento) VALUES(3,1,'2020-06-03',100.00,"Paga","2020-06-03");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao,dataPagamento) VALUES(3,2,'2020-07-03',100.00,"Paga","2020-07-01");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao,dataPagamento) VALUES(3,3,'2020-08-03',100.00,"Paga","2020-08-02");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao,dataPagamento) VALUES(3,4,'2020-09-03',100.00,"Paga","2020-09-02");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao,dataPagamento) VALUES(3,5,'2020-10-03',100.00,"Paga","2020-09-30");
INSERT INTO `Faturas` (dataEmissao,total,idCliente,idEnderecoComercial,situacao) VALUES('2018-05-03',3000.00,2,4,"Cancelada");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao) VALUES(4,1,'2018-06-03',1500.00,"Cancelada");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao) VALUES(4,2,'2018-07-03',1500.00,"Cancelada");

INSERT INTO `Ufs` (siglaNome,nome) VALUES("AP","Alto Paraná");
INSERT INTO `Cidades` (siglaUf,nomeCidade) VALUES("AP","Ciudad del Este");
INSERT INTO `Logradouros` (siglaLogradouro,nomeLogradouro) VALUES("Av","Republica de Cuba");
INSERT INTO `Bairros` (nomeBairro) VALUES("Carolina-las Mercedes-Mburukuja");
INSERT INTO `Enderecos` (idLogradouro,idBairro,idCidade,cep) VALUES(5,5,2,"54651");
INSERT INTO `Clientes` (idEndereco,nome,sobrenome,cpf,nroCasaCliente,ComplementoEnderecoCliente) VALUES(3,"Levi","Cicero Arcanjo","15665748532",157,"Ao lado da Iglesa San Marcos");
INSERT INTO `Emails` (idCliente,email) VALUES(3,"arcanjoLevi@gmail.com");
INSERT INTO `Telefones` (idCliente,nroDDD,nroDDI,numero) VALUES(3,"45","55","998520160");
INSERT INTO `Logradouros` (siglaLogradouro,nomeLogradouro) VALUES("Av","Juscelino Kubitscheck");
INSERT INTO `Bairros` (nomeBairro) VALUES("Vila portes");
INSERT INTO `Enderecos` (idLogradouro,idBairro,idCidade,cep) VALUES(6,6,2,"45786215");
INSERT INTO `Faturas` (dataEmissao,total,idCliente,idEnderecoComercial,situacao) VALUES('2021-02-03',2800.00,3,6,"Não paga");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao) VALUES(5,1,'2020-03-03',400.00,"Não paga");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao) VALUES(5,2,'2020-04-03',400.00,"Não paga");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao) VALUES(5,3,'2020-05-03',400.00,"Não paga");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao) VALUES(5,4,'2020-06-03',400.00,"Não paga");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao) VALUES(5,5,'2020-07-03',400.00,"Não paga");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao) VALUES(5,6,'2020-08-03',400.00,"Não paga");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao) VALUES(5,7,'2020-09-03',400.00,"Não paga");
INSERT INTO `Faturas` (dataEmissao,total,idCliente,idEnderecoComercial,situacao) VALUES('2019-05-03',3000.00,3,6,"Não Paga");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao,dataPagamento) VALUES(6,1,'2020-08-03',1500.00,"Paga","2020-08-01");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao,dataPagamento) VALUES(6,2,'2020-09-03',1500.00,"Paga","2020-08-30");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao,dataPagamento) VALUES(6,3,'2020-10-03',1500.00,"Paga","2020-10-03");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao,dataPagamento) VALUES(6,4,'2020-11-03',1500.00,"Paga","2020-10-20");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao,dataPagamento) VALUES(6,5,'2020-12-03',1500.00,"Paga","2020-12-01");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao,dataPagamento) VALUES(6,6,'2021-01-03',1500.00,"Paga","2020-12-29");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao,dataPagamento) VALUES(6,7,'2021-02-03',1500.00,"Paga","2021-01-30");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao,dataPagamento) VALUES(6,8,'2021-03-03',1500.00,"Paga","2021-03-03");
INSERT INTO `Parcelas` (nroFatura,nroParcela,dataVencimento,valor,situacao) VALUES(6,9,'2021-04-03',1500.00,"Não paga");

create view faturaSimplificada as select Clientes.nome, Clientes.cpf, Faturas.nroFatura, Faturas.total from Faturas inner join Clientes ON Faturas.idCliente = Clientes.idCliente;