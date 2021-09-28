/*Nomes:
	Cristiano Antonio Dewes;
    Gabi Nakasone;
    Lucas Pimenta;
    Rafael Queiroz;
    Taynan Vitor Marins Souza
*/

USE musimundos;

SELECT MAX(valor_total), cidade_cobranca FROM faturas WHERE cidade_cobranca = 'Oslo';

SELECT AVG(valor_total) FROM faturas;

SELECT AVG(valor_total) FROM faturas WHERE pais_cobranca = 'Canada';

SELECT COUNT(id) FROM faturas WHERE pais_cobranca = 'Canada';

SELECT SUM(valor_total) FROM faturas;

SELECT id, data_fatura, valor_total FROM faturas
 WHERE valor_total < (SELECT AVG(valor_total) FROM faturas);

SELECT MAX(data_nascimento) FROM empregados;

SELECT MIN(data_nascimento) FROM empregados;

SELECT nome, DATE_FORMAT(data_nascimento, "%d %M %Y") AS "Data de nascimento" FROM empregados;

SELECT compositor, COUNT(*) FROM cancoes GROUP BY compositor HAVING compositor LIKE 'AC/DC';

SELECT AVG(duracao_milisegundos) AS "Duração média" FROM cancoes;

SELECT compositor, COUNT(*), AVG(duracao_milisegundos) FROM cancoes GROUP BY compositor HAVING compositor = 'AC/DC';

SELECT cidade, COUNT(*) FROM clientes GROUP BY cidade HAVING cidade LIKE 'São Paulo';

SELECT cidade, COUNT(*) FROM clientes GROUP BY cidade HAVING cidade LIKE 'Paris';

SELECT COUNT(*) AS "Clientes com email yahoo" FROM clientes WHERE email LIKE "%yahoo%";