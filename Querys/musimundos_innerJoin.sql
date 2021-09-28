/*Nome: Cristiano Antonio Dewes,
	Michel Nunes,
	Lucas Gabriel,
	Taynan Victor,
	Moises Bollela,
    Katy Kaori
*/

USE musimundos;

SELECT a.nome AS Artista, b.titulo AS Albúm
	FROM artistas a
    INNER JOIN albuns b
ON a.id = b.id_artista
ORDER BY a.id;

SELECT a.nome AS Cliente, b.valor_total AS "Valor da fatura"
	FROM clientes a
    INNER JOIN faturas b
ON a.id = b.id_cliente
HAVING b.valor_total > 5
ORDER BY b.valor_total DESC;

SELECT a.nome AS Canção, b.nome AS "Tipo de arquivo"
	FROM cancoes a
    INNER JOIN tipos_de_arquivo b
ON a.id_tipo_de_arquivo = b.id
ORDER BY a.id;