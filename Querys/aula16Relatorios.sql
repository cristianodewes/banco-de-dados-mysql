/*Nomes:
	Cristiano Antonio Dewes,
    Wladi,
    Robelsa Vasconcelos,
    Geyson Kaio,
    Wellington Siqueira
*/

USE emarket;

SELECT a.Descricao, b.ProdutoNome
	FROM categorias			a
    LEFT JOIN produtos		b
ON a.CategoriaID = b.CategoriaID;

SELECT *
	FROM clientes			a
    LEFT JOIN faturas		b
ON a.id = b.id_cliente
WHERE faturas.id_cliente IS NULL;

SELECT a.ProdutoNome, c.CategoriaNome, b.Contato
	FROM produtos 			a
    LEFT JOIN provedores	b
ON a.ProvedorID = b.ProvedorID
	INNER JOIN categorias	c
ON a.CategoriaID = c.CategoriaID;