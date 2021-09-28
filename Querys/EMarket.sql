/* Nomes = Juan Rafael, Antonio Henrique, Nicholas Ruas, Marcus Rodrigues, Cristiano Dewes
*/
USE emarket;

SELECT * FROM categorias;

SELECT CategoriaNome, Descricao FROM categorias;

SELECT * FROM produtos;

SELECT * FROM produtos WHERE Descontinuado = '1';

SELECT * FROM produtos WHERE ProvedorId = '8';

SELECT * FROM produtos WHERE PrecoUnitario BETWEEN 10 AND 22;

SELECT * FROM produtos WHERE UnidadesEstoque < NivelReabastecimento;

SELECT * FROM produtos WHERE UnidadesEstoque < NivelReabastecimento AND UnidadesPedidas = '0';

SELECT Contato, Empresa, Titulo, Pais FROM clientes ORDER BY Pais;

SELECT * FROM clientes WHERE titulo = 'owner';

SELECT * FROM clientes WHERE Contato LIKE 'C%';

SELECT * FROM faturas ORDER BY DataFatura ASC;

SELECT * FROM faturas WHERE PaisEnvio = 'USA' AND FormaEnvio != '3';

SELECT * FROM faturas WHERE ClienteId LIKE 'GOURL';

SELECT * FROM faturas WHERE EmpregadoID IN (2, 3, 5, 8, 9);

SELECT * FROM produtos ORDER BY PrecoUnitario DESC;

SELECT * FROM produtos ORDER BY PrecoUnitario DESC LIMIT 5;

SELECT * FROM produtos ORDER BY UnidadesEstoque DESC LIMIT 10;

SELECT FaturaId, ProdutoId, Quantidade FROM detalhefatura;

SELECT FaturaId, ProdutoId, Quantidade FROM detalhefatura ORDER BY Quantidade DESC;

SELECT FaturaId, ProdutoId, Quantidade FROM detalhefatura 
WHERE Quantidade BETWEEN  50 AND 100 ORDER BY Quantidade DESC;

SELECT FaturaId AS 'Número da Fatura', ProdutoId AS Produto, Quantidade*PrecoUnitario AS Total 
FROM detalhefatura;

SELECT * FROM clientes WHERE Pais LIKE 'Brazil' OR 'Mexico' OR Titulo LIKE 'Sales%';

SELECT * FROM clientes WHERE Empresa LIKE 'a%';

SELECT Cidade, Contato AS "Nome e Sobrenome", Titulo AS Cargo FROM clientes
 WHERE Cidade LIKE 'Madrid';
 
SELECT * FROM faturas WHERE FaturaId BETWEEN 10000 AND 10500;

SELECT * FROM faturas WHERE FaturaId BETWEEN 10000 AND 10500 OR ClienteID LIKE 'B%';

SELECT * FROM faturas WHERE CidadeEnvio LIKE 'Vancouver' OR FormaEnvio = '3';

SELECT EmpregadoID FROM empregados
 WHERE Regioes OR Cidade OR Pais OR NOME OR SOBRENOME LIKE 'Buchanan';
 
SELECT * FROM faturas WHERE EmpregadoID = '5';
