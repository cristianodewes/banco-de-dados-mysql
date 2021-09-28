USE musimundos;

SELECT * FROM faturas;

CREATE VIEW FATURAS_NACIONAIS AS
	SELECT a.id AS "Fatura ID", b.id AS "Cliente ID", b.nome, b.sobrenome, a.valor_total AS "Valor Total"
		FROM faturas		a
        INNER JOIN clientes	b
        ON a.id_cliente = b.id
        WHERE a.pais_cobranca = "Argentina";
        
SELECT * FROM FATURAS_NACIONAIS;

SELECT * FROM generos;

CREATE VIEW LATINOS AS
	SELECT c.nome AS Artista, b.titulo AS Álbum, a.nome AS Música
		FROM cancoes			a
        INNER JOIN 	albuns		b
        ON a.id_album = b.id
        INNER JOIN artistas		c
        ON b.id_artista = c.id
        INNER JOIN generos		d
        ON a.id_genero = d.id
        WHERE d.nome = "Latin";
        
SELECT * FROM LATINOS ORDER BY Artista, Música;

SELECT pais_cobranca FROM faturas;

CREATE VIEW Faturas_Brazil AS
	SELECT CONCAT(a.nome, " ", a.sobrenome) AS cliente, b.pais_cobranca AS "pais de cobranca", SUM(valor_total) AS "soma das faturas"
		FROM clientes			a
        INNER JOIN faturas		b
        ON a.id = b.id_cliente
        WHERE b.pais_cobranca = "Brazil"
        GROUP BY a.id;
        
SELECT * FROM Faturas_Brazil ;

SELECT a.nome, a.sobrenome AS cliente, b.pais_cobranca AS "pais de cobranca", SUM(valor_total) AS "soma das faturas"
		FROM clientes			a
        INNER JOIN faturas		b
        ON a.id = b.id_cliente
        WHERE b.pais_cobranca = "Brazil"
        GROUP BY a.id
        ORDER BY sobrenome;