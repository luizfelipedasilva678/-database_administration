CREATE PROCEDURE spRetornaClientComMaisDe1000 ()
BEGIN
    select NomeCliente from Cliente c
    join PedidoVenda pv on (c.idCliente = pv.idCliente)
    where substring(pv.DataPedido, 1, 4) = '2020' 
    group by c.idCliente
    having sum(pv.valor) > 1000;
END

CREATE PROCEDURE spRetornaEstoqueIgualAZero ()
BEGIN
	select * from Produto where QtdEstoque = 0;
END

CREATE PROCEDURE spDeletaClienteSemPedidos (in clienteId int)
BEGIN
	Delete from Cliente where idCliente = clienteId and not exists (select * from PedidoVenda where idCliente = clienteId);
END

CREATE PROCEDURE spRetornaQuantidadeVendida(in produtoId int, in ano int, out quantidadeVendida int)
BEGIN
    select sum(ipv.Qtd) into quantidadeVendida from ItemPedidoVenda ipv
    join PedidoVenda pv on (ipv.idItemPedidoVenda = pv.idPedidoVenda)
    where substring(pv.DataPedido, 1, 4) = ano and ipv.idProduto = produtoId
    group by ipv.idProduto;
END

CREATE PROCEDURE spSomaQtdVendida (in produtoId int)
BEGIN
    declare qtdTotal int;
    declare qtd int;
    declare fim boolean;
    declare c_pedidoVenda cursor FOR
    Select Qtd from ItemPedidoVenda where idProduto = produtoId; 
	declare CONTINUE handler for not found set fim = TRUE;
	open c_pedidoVenda; 
	set qtdTotal = 0;
	READ_LOOP:
	LOOP
		FETCH c_pedidoVenda INTO qtd; 
		IF fim THEN
			LEAVE read_loop;
		end IF;
        set qtdTotal = qtdTotal + 1;
	end LOOP;
    update Produto set QtdEstoque = qtdTotal where idProduto = produtoId;
	close c_pedidoVenda;
END
