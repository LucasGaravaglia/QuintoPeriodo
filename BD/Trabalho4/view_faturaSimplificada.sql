create view faturaSimplificada as select Clientes.nome, Clientes.cpf, Faturas.nroFatura, Faturas.total from Faturas inner join Clientes ON Faturas.idCliente = Clientes.idCliente;