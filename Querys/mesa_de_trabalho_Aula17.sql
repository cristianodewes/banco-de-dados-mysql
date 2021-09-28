USE emarket;

/*GRUPO:
	CRISTIANO DEWES
    RODRIGO ESCOBAR
    RAFA VASCONCELOS
    MARCOS FONSECA
    MARIA ROSA MULLER
    */
#1
CREATE VIEW dados_cliente AS
	SELECT ClienteID AS ID, Contato, Fax, Telefone
		FROM clientes;

#2a
SELECT Contato, "0" = TESTE
		FROM clientes
        WHERE fax = "";

#2b
SELECT *
	FROM dados_cliente
	WHERE fax="";
        
#3
CREATE VIEW fornecedor AS
	SELECT ProvedorID, Contato, Empresa, Endereco, Cidade, CodigoPostal, Pais
		FROM provedores;
					
#4a
SELECT *
		FROM provedores
        WHERE Pais = "Brazil" AND Endereco LIKE "%Av. das Americanas%";
        
#4b
SELECT * FROM fornecedor
	WHERE Pais = "Brazil" AND Endereco LIKE "%Av. das Americanas%";
    
#5
CREATE VIEW produtos_prioridade AS
	SELECT ProdutoID, ProdutoNome, FORMAT(PrecoUnitario, 2) AS PrecoUnitario, UnidadesPedidas,
    CASE 
		WHEN UnidadesPedidas=0 THEN "BAIXA"
        WHEN UnidadesPedidas<UnidadesEstoque THEN "MÉDIA"
        WHEN UnidadesPedidas<UnidadesEstoque*2 THEN "ALTA"
        ELSE "ALTA"
    END AS Prioridade
    FROM produtos;
    
#6
SELECT a.Prioridade, COUNT(a.prioridade) AS Quantidade, FORMAT(AVG(a.PrecoUnitario), 2) AS MédiaPrecoUnitário
	FROM produtos_prioridade	a
    INNER JOIN produtos			b
    ON a.ProdutoID = b.ProdutoID
		WHERE b.UnidadesEstoque>=5
		GROUP BY prioridade;