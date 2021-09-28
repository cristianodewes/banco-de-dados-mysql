/*Nomes:
	Juan Rafael,
    Glauber Silva,
    Pablo Gonçalves,
    Vinicius Evandro,
    Katy Kaori,
    Guilherme Pereira
*/

USE emarket;

DELIMITER $$
CREATE PROCEDURE sp_listaNomeSobrenome()
BEGIN
    SELECT Sobrenome, Nome
		FROM empregados
        ORDER BY sobrenome;
END $$
DELIMITER ;

CALL sp_listaNomeSobrenome();

DELIMITER $$
CREATE PROCEDURE sp_empregadoCidade(IN cidadeEmpregado VARCHAR(15))
BEGIN
    SELECT Nome
		FROM empregados
        WHERE Cidade LIKE cidadeEmpregado;
END $$
DELIMITER ;

CALL sp_empregadoCidade("Seattle");

DELIMITER $$
CREATE PROCEDURE sp_clientesPais(IN nomePais VARCHAR(15), OUT numClientes INT)
BEGIN
    SELECT COUNT(*) INTO numClientes
		FROM clientes
        WHERE Pais = nomePais;
END $$
DELIMITER ;

CALL sp_clientesPais("Portugal", @numClientes);

SELECT @numClientes;

DELIMITER $$
CREATE PROCEDURE sp_produtosSemEstoque(IN numEstoque INT)
BEGIN
	SELECT ProdutoNome, UnidadesEstoque
		FROM produtos
        WHERE UnidadesEstoque < numEstoque;
END $$
DELIMITER ;

CALL sp_produtosSemEstoque(10);

CALL sp_produtosSemEstoque(1);

SELECT * FROM detalhefatura;

DELIMITER $$
CREATE PROCEDURE sp_vendasComDesconto(IN percentualDesconto DOUBLE)
BEGIN
	SELECT a.ProdutoNome, d.ClienteID, FORMAT((b.Desconto)*100, '2') AS Desconto
		FROM produtos				a
		INNER JOIN detalhefatura	b
        ON a.ProdutoID = b.ProdutoID
        INNER JOIN faturas			c
        ON b.FaturaId = c.FaturaId
        INNER JOIN clientes			d
        ON c.ClienteID = d.ClienteID
		WHERE b.Desconto >= (percentualDesconto/100);
END $$
DELIMITER ;

CALL sp_vendasComDesconto(10);

DROP PROCEDURE sp_vendasComDesconto;