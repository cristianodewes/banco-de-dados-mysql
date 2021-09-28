USE musimundos;

SELECT * FROM clientes;

SELECT * FROM clientes WHERE pais LIKE 'USA';

SELECT * FROM cancoes;

SELECT * FROM cancoes WHERE duracao_milisegundos BETWEEN '200000' AND '300000' ORDER BY duracao_milisegundos ASC;

SELECT * FROM clientes WHERE pais IN ('Argentina', 'Spain');

SELECT * FROM generos;

SELECT * FROM generos ORDER BY nome ASC;

SELECT * FROM clientes;

SELECT nome FROM clientes ORDER BY pais DESC, cidade ASC;

SELECT * FROM clientes;

SELECT COUNT(id) AS total FROM clientes WHERE pais='Brazil';

SELECT * FROM cancoes;

SELECT COUNT(id) AS Total, id_genero  FROM cancoes GROUP BY id_genero;

SELECT SUM(valor_total) FROM faturas;

SELECT AVG(duracao_milisegundos), id_album FROM cancoes GROUP BY id_album;

SELECT MIN(bytes) FROM cancoes;

SELECT id_cliente, SUM(valor_total) AS Total FROM faturas  GROUP BY id_cliente HAVING SUM(valor_total) > 45;

SELECT MAX(valor_total), cidade_cobranca FROM faturas WHERE cidade_cobranca = 'Oslo';

SELECT AVG(valor_total) FROM faturas;

SELECT AVG(valor_total) FROM faturas WHERE pais_cobranca = 'Canada';

SELECT COUNT(id) FROM faturas WHERE pais_cobranca = 'Canada';

SELECT SUM(valor_total) FROM faturas;

SELECT id, data_fatura, valor_total FROM faturas WHERE valor_total < (SELECT AVG(valor_total) FROM faturas);

SELECT MAX(data_nascimento) FROM empregados;

SELECT MIN(data_nascimento) FROM empregados;

SELECT nome, DATE_FORMAT(data_nascimento, "%d %M %Y") AS "Data de nascimento" FROM empregados;

SELECT compositor, COUNT(*) FROM cancoes GROUP BY compositor HAVING compositor = 'AC/DC';

SELECT AVG(duracao_milisegundos) AS "Duração média" FROM cancoes;

SELECT compositor, COUNT(*), AVG(duracao_milisegundos) FROM cancoes GROUP BY compositor HAVING compositor = 'AC/DC';

SELECT cidade, COUNT(*) FROM clientes GROUP BY cidade HAVING cidade = 'São Paulo';

SELECT cidade, COUNT(*) FROM clientes GROUP BY cidade HAVING cidade = 'Paris';

SELECT COUNT(*) AS "Clientes com email yahoo" FROM clientes WHERE email LIKE "%yahoo%";

SELECT * FROM cancoes;
SELECT generos.nome, generos.id, cancoes.nome, cancoes.id_genero  FROM  generos, cancoes WHERE (cancoes.id_genero LIKE generos.id);

USE musimundos;
SELECT* FROM albuns;
SELECT artistas.nome, albuns.titulo FROM albuns INNER JOIN artistas  
		ON artistas.id = albuns.id_artista ORDER BY artistas.id;
        
SELECT clientes.nome, faturas.valor_total FROM clientes INNER JOIN faturas 
	ON clientes.id = faturas.id_cliente HAVING faturas.valor_total>5 ORDER BY faturas.valor_total DESC;
    
SELECT cancoes.nome, cancoes.id, tipos_de_arquivo.nome FROM cancoes INNER JOIN tipos_de_arquivo
	ON cancoes.id_tipo_de_arquivo = tipos_de_arquivo.id ORDER BY cancoes.id ASC;
    
SELECT a.nome AS nomeMusica, b.nome AS genero, c.titulo AS Album, c.id
		 FROM cancoes a
	INNER JOIN generos b
ON a.id_genero = b.id
	INNER JOIN albuns c
ON a.id_album = c.id
	ORDER BY c.id;
    















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
ORDER BY a.id

