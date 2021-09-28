/*Esse projeto simula um banco de dados de uma livraria. O cliente faz uma compra,
e em cada compra fica registrado o cliente, o vendedor, os livros que foram comprados
e suas respectivas quantidades e a data. O vendedor possuem um gerente responsável. 
Cada livro possui um autor, editora, assunto, fornecedor, nome, isbn, preço e 
quantidade em estoque.
*/

CREATE DATABASE livraria;

USE livraria;

CREATE TABLE autor 
(
	id_autor	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome		VARCHAR(50)
);

CREATE TABLE editora
(
	id_editora		INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cod_editora		VARCHAR(15),
    endereco		VARCHAR(100),
    telefone		VARCHAR(15),
    contato			VARCHAR(25)
);

CREATE TABLE assunto
(
	id_assunto		INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    descricao		VARCHAR(50)
);

CREATE TABLE fornecedor
(
	id_fornecedor	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome			VARCHAR(50),
    endereco		VARCHAR(100),
    telefone		VARCHAR(15),
    cnpj			VARCHAR(14)
);

CREATE TABLE livro
(
	id_livro			INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_autor			INT,
    id_editora			INT,
    id_assunto			INT,
    id_fornecedor		INT,
    preco				DECIMAL(6,2),
    isbn				VARCHAR(17),
    quantidade			INT,
    
    CONSTRAINT livro_autor
		FOREIGN KEY (id_autor)
		REFERENCES autor (id_autor),
	
    CONSTRAINT livro_editora
		FOREIGN KEY (id_editora)
        REFERENCES editora (id_editora),
        
	CONSTRAINT livro_assunto
		FOREIGN KEY (id_assunto)
        REFERENCES assunto (id_assunto),
	
    CONSTRAINT livro_fornecedor
		FOREIGN KEY (id_fornecedor)
        REFERENCES fornecedor (id_fornecedor)
);

CREATE TABLE gerente
(
	id_gerente			INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome				VARCHAR(50),
	telefone			VARCHAR(15),
    endereco			VARCHAR(100),
    data_nascimento		DATE,
    data_contratacao	DATE,
    cpf					VARCHAR(11),
    salario				DECIMAL(7,2)
);

CREATE TABLE vendedor
(
	id_vendedor			INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_gerente			INT,
    nome				VARCHAR(50),
    telefone			VARCHAR(15),
    endereco			VARCHAR(100),
    data_nascimento		DATE,
    data_contratacao	DATE,
    cpf					VARCHAR(11),
    
    CONSTRAINT vendedor_gerente
		FOREIGN KEY (id_gerente)
        REFERENCES gerente (id_gerente)
);

CREATE TABLE cliente
(
	id_cliente			INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome				VARCHAR(50),
    endereco			VARCHAR(100),
    telefone			VARCHAR(15),
    cod_cliente			INT
);

CREATE TABLE compra
(
	id_compra		INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_cliente		INT,
    id_vendedor		INT,
    data_compra		DATE,
    valor_total		DECIMAL(7,2),
    
    CONSTRAINT compra_cliente
		FOREIGN KEY (id_cliente)
		REFERENCES cliente (id_cliente),
	
    CONSTRAINT compra_vendedor
		FOREIGN KEY (id_vendedor)
        REFERENCES vendedor (id_vendedor)
);

CREATE TABLE livros_compra
(
	id_livros_compra	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_compra			INT,
    id_livro			INT,
    quantidade			INT,
    
    CONSTRAINT livrosCompra_compra
		FOREIGN KEY (id_compra)
        REFERENCES compra (id_compra),
        
	CONSTRAINT livrosCompra_livro
		FOREIGN KEY (id_livro)
        REFERENCES livro (id_livro)
);

INSERT INTO assunto(descricao)
VALUES ("Tecnologia da Informacao"), ("Economia"), ("Matematica"), ("Fisica"), ("Literatura Nacional"), ("Literatura Estrangeira");

INSERT INTO autor(nome)
VALUES ("George R. R. Martin"), ("Richard Feynman"), ("Aluisio Azevedo");

INSERT INTO editora(cod_editora, endereco, telefone, contato)
VALUES ("12", "Sao Paulo, SP", "11 123456789", "Joao Alfredo"), ("42", "Moscou, Russia", "87 54562631", "Maria Fridolina");

INSERT INTO fornecedor(nome, endereco, telefone, cnpj)
VALUES ("Rosa Marta", "POA, RS", "51 98613352", "5654948652");

ALTER TABLE livro ADD COLUMN nome VARCHAR(50) AFTER id_fornecedor;

INSERT INTO livro(id_autor, id_editora, id_assunto, id_fornecedor, preco, isbn, quantidade, nome)
VALUES (1, 2, 6, 1, "18.54", "aksjuclkasc", 10, "A fúria dos reis"), (2, 2, 1, 1, "150.58", "sakjcbeifvub", 3, "Licoes de Fisica");

INSERT INTO livro(id_autor, id_assunto, id_fornecedor, preco, isbn, quantidade, nome)
VALUES (1, 6, 1, "18.54", "aksjuclkasc", 10, "A guerra dos tronos");

UPDATE livro SET 
id_assunto = 4
WHERE id_livro=2;

UPDATE editora SET
endereco = "Orlando, USA"
WHERE id_editora=2;

INSERT INTO cliente(nome, endereco, telefone, cod_cliente)
VALUES ("Ricardo", "Salvador, BH", "12 345678945", "58");

INSERT INTO vendedor(nome, data_nascimento, data_contratacao, cpf)
VALUES ("Carlos", "1987-12-24", "2015-01-03", "1234567894");

INSERT INTO gerente(nome, salario)
VALUES ("Lucia", "2500.98");

UPDATE vendedor SET
id_gerente = 1
WHERE id_vendedor=1;

ALTER TABLE vendedor ADD COLUMN salario DECIMAL(7,2) AFTER nome;

UPDATE vendedor SET
salario = "1500.00"
WHERE id_vendedor=1;

INSERT INTO compra(id_cliente, id_vendedor, data_compra, valor_total)
VALUES (1, 1, "2021-08-12", "515.20");

INSERT INTO livros_compra(id_compra, id_livro, quantidade)
VALUES (1, 2, 5), (1,1,3);

INSERT INTO compra(id_cliente, id_vendedor, data_compra, valor_total)
VALUES (1, 1, "2011-01-08", "890.00");

INSERT INTO livros_compra(id_compra, id_livro, quantidade)
VALUES (2, 2, 2), (2,3,1);

INSERT INTO cliente(nome, endereco, telefone, cod_cliente)
VALUES ("Roberto", "Rio de Janeiro/RJ", "12 51564196", "620");

INSERT INTO livros_compra(id_compra, id_livro, quantidade)
VALUES (4, 3, 588), (3,3,10);

#Buscando todos os livros mesmo com atributo nulo
SELECT a.nome AS Nome, b.nome AS Autor, c.contato AS Editora, d.descricao AS Assunto, e.nome AS Fornecedor, a.preco AS Preco
	FROM livro				a
    LEFT JOIN autor			b
    ON a.id_autor = b.id_autor
    LEFT JOIN editora		c
    ON a.id_editora = c.id_editora
    LEFT JOIN assunto		d
    ON a.id_assunto = d.id_assunto
    LEFT JOIN fornecedor	e
    ON a.id_fornecedor = e.id_fornecedor;

#buscando as compras e somando o total de compras por cliente, o valor total das compras e o valor médio por compra
SELECT LPAD(b.cod_cliente, 4, 0) AS "Codigo cliente", b.nome AS Cliente, c.nome AS Vendedor, COUNT(b.id_cliente) AS "Total de compras",
 CONCAT("R$ ", SUM(a.valor_total)) AS "Valor total", CONCAT("R$ ",TRUNCATE(AVG(a.valor_total), 2)) AS "Valor médio das compras"
	FROM compra 			a
    INNER JOIN cliente		b
    ON a.id_cliente = b.id_cliente
    INNER JOIN vendedor		c
    ON a.id_vendedor = c.id_vendedor
    LEFT JOIN livros_compra	d
    ON a.id_compra = d.id_compra
GROUP BY a.id_cliente 
ORDER BY SUM(a.valor_total) DESC;

#Buscando os livros vendidos, somando a quantidade de livros vendidos, e calculando o valo total das vendas, agrupando por livro
SELECT b.nome AS "Livro", SUM(a.quantidade) AS "Vendidos", CONCAT("R$ ", TRUNCATEcliente(a.quantidade*b.preco, 2)) AS "Valor total"
	FROM livros_compra 			a
    INNER JOIN livro			b
    ON a.id_livro = b.id_livro
GROUP BY b.id_livro
ORDER BY SUM(a.quantidade);

SELECT * FROM assunto;

DELETE FROM assunto WHERE id_assunto = 2;