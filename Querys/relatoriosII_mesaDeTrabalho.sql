USE emarket;

#1 Liste todas as categorias junto com informações sobre seus produtos. Incluir todas as categorias, mesmo que não tenham produtos.

SELECT DISTINCT(b.ProdutoNome), a.Descricao
	FROM categorias			a
    LEFT JOIN produtos		b
    ON a.categoriaID = b.CategoriaID;    

#2 Liste as informações de contato de clientes que nunca compraram no emarket.
SELECT contato
	FROM clientes				a
    LEFT JOIN faturas			b
    ON a.ClienteID = b.ClienteID
    WHERE b.ClienteID IS NULL;

#3 Faça uma lista de produtos. Para cada um, indique seu nome, categoria e as informações de contato de seu fornecedor. 
#Lembre-se que podem existir produtos para os quais o fornecedor não foi indicado.
SELECT a.ProdutoNome, c.CategoriaNome, b.Contato
	FROM produtos				a
    LEFT JOIN provedores		b
    ON a.ProvedorID = b.ProvedorID
	LEFT JOIN categorias		c
    ON a.CategoriaID = c.CategoriaID;
    
#4 Para cada categoria, liste o preço unitário médio de seus produtos.
SELECT b.CategoriaNome, 
	CASE
		WHEN TRUNCATE(AVG(a.ProdutoID), 2) IS NULL THEN "R$ 0.00"
        ELSE CONCAT("R$ ",TRUNCATE(AVG(a.ProdutoID), 2))
    END AS "Preço médio"
	FROM produtos				a
    RIGHT JOIN categorias		b
    ON a.CategoriaID = b.CategoriaID
    GROUP BY b.CategoriaID;

#5Para cada cliente, indique a última nota fiscal de compra. Inclua clientes que nunca compraram no e-market.
SELECT a.ClienteID, DATE_FORMAT(MAX(b.DataFatura), "%d/%M/%Y") AS "Data da última fatura"
	FROM clientes				a
    LEFT JOIN faturas			b
    ON a.ClienteID = b.ClienteID
    GROUP BY a.ClienteID;
    
#6Todas as faturas têm uma empresa de correio associada (envio). Gere uma lista com todas as empresas de 
#correio e o número de faturas correspondentes. Execute a consulta usando RIGHT JOIN.
SELECT b.Empresa, COUNT(a.FaturaID), b.CorreioID
	FROM faturas			a
    RIGHT JOIN correios		b
    ON a.FormaEnvio = CorreioID
    GROUP BY b.CorreioID;
