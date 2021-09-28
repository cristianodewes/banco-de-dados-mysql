/*NOMES:
	CRISTIANO DEWES
    KATY KAORI
    ROBELSA
    MATEUS AFONSO
    JONATHAS MAGALHAES
    VINICIUS EVANDRO
    */
    
USE emarket;

/*Mostre o contato, o endereço concatenado com a cidade dos clientes
cuja cidade é ‘London’
Tabela: clientes
Campos: Contato, Endereco, Cidade*/
DELIMITER $$
CREATE PROCEDURE sp_clienteCidade(IN cidadeNome VARCHAR(15))
BEGIN
	SELECT Contato, CONCAT(Endereco, ", ", Cidade)
		FROM clientes
		WHERE Cidade = cidadeNome;
END $$
DELIMITER ;

CALL sp_clienteCidade("London");

/*Concatene o nome e o sobrenome dos empregados e mostre a soma
dos valores em Transporte para cada um. Ordene os valores de forma
decrescente.
Tabelas: empregados, faturas
Campos: nome, sobrenome, transporte*/

SELECT CONCAT(a.Nome, " ", a.Sobrenome) AS Empregado, 
	FORMAT(SUM(b.Transporte), '2') AS Soma_Transporte
	FROM empregados			a
    INNER JOIN faturas		b
    ON a.EmpregadoID = b.EmpregadoID
    GROUP BY a.EmpregadoID;
    
/*Mostre a data da fatura mais recente
Tabela: faturas
Campo: DataFatura*/

SELECT DATE_FORMAT(MAX(DataFatura), "%d/%m/%Y") AS "Fatura mais recente"
	FROM faturas;

/*Mostre o produto mais barato
Tabelas: produtos
Campos: ProdutoNome, PrecoUnita*/

SELECT CONCAT("US$ ",FORMAT(MIN(PrecoUnitario), '2')) AS "Produto mais barato"
	FROM produtos;
    