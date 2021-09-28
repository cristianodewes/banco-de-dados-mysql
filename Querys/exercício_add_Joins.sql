USE extra_joins;

#1
SELECT CONCAT(a.nome, " ", a.sobrenome) AS Artista 
	FROM artista 				a
    INNER JOIN artista_filmes	b
    ON a.id = b.artista_id;
#2
SELECT a.titulo, a.id
	FROM filmes					a
    INNER JOIN artista_filmes	b
    ON a.id = b.filme_id
    GROUP BY a.id
    HAVING COUNT(a.id) > 1;

#3
SELECT * FROM artista;

SELECT * FROM artista_filmes;

#4
SELECT a.titulo
	FROM filmes					a
    LEFT JOIN artista_filmes	b
    ON a.id = b.filme_id
    WHERE b.filme_id IS NULL;
    
#5
SELECT CONCAT(a.nome, " ", a.sobrenome) AS artista
	FROM artista				a
    LEFT JOIN artista_filmes	b
    ON a.id = b.artista_id
    WHERE b.artista_id IS NULL;
    
#6
SELECT CONCAT(a.nome, " ", a.sobrenome)
	FROM artista					a
    INNER JOIN artista_filmes	b
    ON a.id = b.artista_id
    GROUP BY a.id
    HAVING COUNT(a.id)>1;
    
#7
SELECT * FROM filmes;