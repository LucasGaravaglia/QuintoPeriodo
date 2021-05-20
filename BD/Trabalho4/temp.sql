"SELECT Clientes.nome,Clientes.sobrenome,Clientes.cpf,Faturas.dataEmissao,Faturas.total,Faturas.nroFatura,end1.cep CepCliente,end2.cep CepComercio,log1.nomeLogradouro LogradouroCliente,log2.nomeLogradouro LogradouroComercio,cid1.nomeCidade CidadeCliente,cid2.nomeCidade CidadeComercio,Telefones.numero,Telefones.nroDDD DDD,Telefones.nroDDI DDI,Count(Parcelas.nroFatura) TotalParcelasFROM FaturasINNER JOIN Clientes ON Clientes.idCliente = Faturas.idClienteINNER JOIN Enderecos end1 ON end1.idEndereco = Clientes.idEnderecoINNER JOIN Enderecos end2 ON end2.idEndereco = Faturas.idEnderecoComercial INNER JOIN Cidades cid1 ON end1.idCidade = end1.idCidadeINNER JOIN Cidades cid2 ON end2.idCidade = end2.idCidadeINNER JOIN Logradouros log1 ON log1.idLogradouro = end1.idLogradouroINNER JOIN Logradouros log2 ON log2.idLogradouro = end2.idLogradouroINNER JOIN Telefones ON Telefones.idCliente = Clientes.idClienteINNER JOIN Parcelas ON Parcelas.nroFatura = Faturas.nroFaturaWHERE Faturas.nroFatura = 5;"