#!/usr/bin/env python3

import mariadb
import sqlparse
from os import system

def connect():
    try:
        connection = mariadb.connect(
            user='root',
            password='123',
            host='localhost',
            port=3306,
            database='Faturas'
        )
        return connection
    except mariadb.Error as e:
        print(str(e))

def consult_bill(connection) -> None:
    db = connection.cursor()
    command = "SELECT Clientes.nome,Clientes.sobrenome,Clientes.cpf,\n\
            Faturas.dataEmissao,Faturas.total,Faturas.nroFatura,\n\
            end1.cep CepCliente,\n\
            end2.cep CepComercio,\n\
            log1.nomeLogradouro LogradouroCliente,\n\
            log2.nomeLogradouro LogradouroComercio,\n\
            cid1.nomeCidade CidadeCliente,\n\
            cid2.nomeCidade CidadeComercio,\n\
            Telefones.numero,Telefones.nroDDD DDD,Telefones.nroDDI DDI,\n\
            Count(Parcelas.nroFatura) TotalParcelas\n\
            FROM Faturas\n\
            INNER JOIN Clientes ON Clientes.idCliente = Faturas.idCliente\n\
            INNER JOIN Enderecos end1 ON end1.idEndereco = Clientes.idEndereco\n\
            INNER JOIN Enderecos end2 ON end2.idEndereco = Faturas.idEnderecoComercial \n\
            INNER JOIN Cidades cid1 ON end1.idCidade = end1.idCidade\n\
            INNER JOIN Cidades cid2 ON end2.idCidade = end2.idCidade\n\
            INNER JOIN Logradouros log1 ON log1.idLogradouro = end1.idLogradouro\n\
            INNER JOIN Logradouros log2 ON log2.idLogradouro = end2.idLogradouro\n\
            INNER JOIN Telefones ON Telefones.idCliente = Clientes.idCliente\n\
            INNER JOIN Parcelas ON Parcelas.nroFatura = Faturas.nroFatura\n\
        WHERE Faturas.nroFatura = 5;"
    print("Comando Sql\n" +74*'.'+ '\n' + sqlparse.format(sqlparse.split(command)[0],reindent=True,keyword_case='upper'))
    print(74 * '.'+'\n')
    db.execute(command)
    db = db.fetchall()
    for i in db:
        print('nome: {0}'.format(i[0]))
        print('sobrenome: {0}'.format(i[1]))
        print('cpf: {0}'.format(i[2]))
        print('dataEmissao: {0}'.format(i[3]))
        print('total: {0}'.format(i[4]))
        print('nroFatura: {0}'.format(i[5]))
        print('cepCliente: {0}'.format(i[6]))
        print('cepComercio: {0}'.format(i[7]))
        print('logradouroCliente: {0}'.format(i[8]))
        print('logradouroComercio: {0}'.format(i[9]))
        print('cidadeCliente: {0}'.format(i[10]))
        print('cidadeComercio: {0}'.format(i[11]))
        print('numero: {0}'.format(i[12]))
        print('DDD: {0}'.format(i[13]))
        print('DDI: {0}'.format(i[14]))
        print('totalParcelas: {0}'.format(i[15]))

def overcome_and_not_paid(connection) -> None:
    db = connection.cursor()
    command = "select * from Parcelas \n\
    where situacao='Não paga' AND dataVencimento < CURDATE();"
    print("Comando Sql\n" +33*'.'+ '\n' + sqlparse.format(sqlparse.split(command)[0],reindent=True,keyword_case='upper'))
    print(33 * '.' + '\n')
    db.execute(command)
    db = db.fetchall()
    for i in db:
        print('\nidParcela: {0}'.format(i[0]))
        print('nroFatura: {0}'.format(i[1]))
        print('nroParcela: {0}'.format(i[2]))
        print('dataVencimento: {0}'.format(i[3]))
        print('valor: {0}'.format(i[4]))
        print('situacao: {0}'.format(i[5]))
        print('dataPagamento: {0}'.format(i[6]),end='\n'+26*'*'+'\n')

def total_bill_one_day(connection) -> None:
    db = connection.cursor()
    command = "SELECT * FROM Parcelas \n\
WHERE dataPagamento='2021-01-30';"
    print("Comando Sql\n" +33*'.'+ '\n' + sqlparse.format(sqlparse.split(command)[0],reindent=True,keyword_case='upper'))
    print(33 * '.' + '\n')
    db.execute(command)
    db = db.fetchall()
    for i in db:
        print('nroFatura: {0}'.format(i[0]))
        print('dataEmissao: {0}'.format(i[1]))
        print('total: {0}'.format(i[2]))
        print('idCliente: {0}'.format(i[3]))
        print('idEnderecoComercial: {0}'.format(i[4]))
        print('situacao: {0}'.format(i[5]))
        print('dataPagamento: {0}'.format(i[6]),end='\n'+27*'*'+'\n')


def who_lives_where(connection) -> None:
    db = connection.cursor()
    command = "SELECT * \n\
    FROM Clientes \n\
        JOIN Enderecos USING(idEndereco) \n\
        JOIN Cidades USING (idCidade) \n\
WHERE Cidades.nomeCidade='Foz do Iguaçu';"
    print("Comando Sql\n" +41*'.'+ '\n' + sqlparse.format(sqlparse.split(command)[0],reindent=True,keyword_case='upper'))
    print(41 * '.' + '\n')
    db.execute(command)
    db = db.fetchall()
    for i in db:
        print('idCliente: {0}'.format(i[0]))
        print('idEndereco: {0}'.format(i[1]))
        print('nome: {0}'.format(i[2]))
        print('sobrenome: {0}'.format(i[3]))
        print('cpf: {0}'.format(i[4]))
        print('nroCasaCliente: {0}'.format(i[5]))
        print('ComplementoEnderecoCliente: {0}'.format(i[6]),end='\n'+31*'*'+'\n')
        

def client_list(connection) -> None:
    db = connection.cursor()
    command = "SELECT Clientes.nome, sum(Parcelas.valor), Parcelas.nroFatura \n\
    FROM Clientes \n\
        INNER JOIN Faturas ON Faturas.idCliente = Clientes.idCliente \n\
        INNER JOIN Parcelas ON Parcelas.nroFatura = Faturas.nroFatura \n\
WHERE Parcelas.situacao='Não paga'\n\
GROUP BY Parcelas.nroFatura;"
    print("Comando Sql\n" +61*'.'+ '\n' + sqlparse.format(sqlparse.split(command)[0],reindent=True,keyword_case='upper'))
    print(61 * '.' + '\n')
    db.execute(command)
    db = db.fetchall()
    for i in db:
        print('nome: {0}'.format(i[0]))
        print('soma das parcelas: {0:.2f}'.format(i[1]))
        print('nroFatura: {0}'.format(i[2]),end='\n'+26*'*'+'\n')

def executeSql1(conn):
    system('clear')
    print(33 * '-')
    print('Consulta de fatura de nroFatura=5\n'+33*'-',end='\n\n')
    consult_bill(conn)

def executeSql2(conn):
    system('clear')
    print('\n'+29 * '-')
    print('Parcelas não pagas e vencidas\n'+29*'-',end='\n\n')
    overcome_and_not_paid(conn)

def executeSql3(conn):
    system('clear')
    print('\n'+44*'-')
    print('Total de parcelas pagas em um dia 2021-01-30\n'+44*'-',end='\n\n')
    total_bill_one_day(conn)

def executeSql4(conn):
    system('clear')
    print('\n'+44*'-')
    print('Lista de clientes que vivem em Foz do Iguaçu\n'+44*'-',end='\n\n')
    who_lives_where(conn)

def executeSql5(conn):
    system('clear')
    print('\n'+17*'-')
    print('Lista de clientes\n'+17*'-',end='\n\n')
    client_list(conn)

if __name__ == "__main__":
    conn = connect()
    input('')
    executeSql1(conn)
    input('')
    executeSql2(conn)
    input('')
    executeSql3(conn)
    input('')
    executeSql4(conn)
    input('')
    executeSql5(conn)
