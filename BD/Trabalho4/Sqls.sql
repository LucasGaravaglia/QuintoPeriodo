--Pergunta 1
select Clientes.nome,
    Clientes.sobrenome,
    Clientes.cpf,
    Faturas.dataEmissao,
    Faturas.total,
    Faturas.nroFatura,
    end1.cep CepCliente,
    end2.cep CepComercio,
    log1.nomeLogradouro LogradouroCliente,
    log2.nomeLogradouro LogradouroComercio,
    cid1.nomeCidade CidadeCliente,
    cid2.nomeCidade CidadeComercio,
    Telefones.numero,
    Telefones.nroDDD DDD,
    Count(Parcelas.nroFatura) TotalParcelas
from Faturas
    inner join Clientes on Clientes.idCliente = Faturas.idCliente
    inner join Enderecos end1 on end1.idEndereco = Clientes.idEndereco
    inner join Enderecos end2 on end2.idEndereco = Faturas.idEnderecoComercial
    inner join Cidades cid1 on end1.idCidade = end1.idCidade
    inner join Cidades cid2 on end2.idCidade = end2.idCidade
    inner join Logradouros log1 on log1.idLogradouro = end1.idLogradouro
    inner join Logradouros log2 on log2.idLogradouro = end2.idLogradouro
    inner join Telefones on Telefones.idCliente = Clientes.idCliente
    inner join Parcelas on Parcelas.nroFatura = Faturas.nroFatura
where Faturas.nroFatura = 5;
--Pergunta 2
select *
from Parcelas
where situacao = 'Não paga'
    AND dataVencimento < CURDATE();
--Pergunta 3
select *
from Parcelas
where dataPagamento = '2021-01-30';
--Pergunta 4
select *
from Clientes
    JOIN Enderecos USING(idEndereco)
    JOIN Cidades USING (idCidade)
where Cidades.nomeCidade = 'Foz do Iguaçu';
--Pergunta 5
select Clientes.nome,
    sum(Parcelas.valor),
    Parcelas.nroFatura
from Clientes
    inner join Faturas on Faturas.idCliente = Clientes.idCliente
    inner join Parcelas on Parcelas.nroFatura = Faturas.nroFatura
where Parcelas.situacao = "Não paga"
group by Parcelas.nroFatura;