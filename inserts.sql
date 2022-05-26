insert into Cliente (idCliente,NomeCliente, CPF) values (1, "Teste", "4234234234234"); 

insert into PedidoVenda (idCliente, DataPedido, Valor) values(1, '2022-05-25 13:17:17', 400.00)

insert into Produto (idProduto, NomeProduto, Preco, QtdEstoque) values (1, "Produto 1", 30.00, 12);

insert into ItemPedidoVenda (idProduto, Qtd, Preco, idPedidoVenda) values(1, 10, 300.00, 1);

insert into Fornecedor (idFornecedor, Nome, CNPJ) values (1, "Forncedor 1", "123123123");

insert into PedidoCompra (idFornecedor, DataPedido, Valor) values (1, '2022-05-25 13:17:17', 300.00)

insert into ItemPedidoCompra (idProduto, Qtd, Preco, idPedidoCompra) values (1, 2, 40.00, 1)
