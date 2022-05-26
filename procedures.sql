CREATE PROCEDURE `delete_items`(in idOrder int)
BEGIN
	delete from ItemPedidoVenda where idPedidoVenda = idOrder;
END

CREATE PROCEDURE update_storage (in productId int, in newValueStorage int)
BEGIN
	update Produto set QtdEstoque = newValueStorage where id = productId;
END

CREATE PROCEDURE decrease_storage_quantity (in productId int, in decreaseQuantity int)
BEGIN
	update Produto set QtdEstoque = 
    (select QtdEstoque from Produto where idProduto = productId) - decreaseQuantity
    where idProduto = productId;
END
