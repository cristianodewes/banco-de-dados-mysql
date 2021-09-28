CREATE DATABASE livrariaEx;

USE livrariaEX;

CREATE TABLE cliente
(
	id_cliente		INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    endereco		VARCHAR(100),
    telefone		VARCHAR(15),
    cod_cliente		INT
);

CREATE TABLE autor
(
	id_autor		INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome			VARCHAR(50)
);

CREATE TABLE editora
(
	id_editora		INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cod_editora		VARCHAR(15),
    endereco		VARCHAR(100),
    telefone		VARCHAR(15),
    nome_gerente	VARCHAR(25)
);

CREATE TABLE assuntos
(
	id_assuntos		INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    descricao		VARCHAR(50)
);

CREATE TABLE livro
(
	id_livro		INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_autor		INT,
    id_editora		INT,
    id_assunto		INT,
    isbn			INT,
    quantidade		SMALLINT,
    preco			DECIMAL(6,2),
    
    CONSTRAINT livro_autor
    FOREIGN KEY (id_autor)
    REFERENCES autor (id_autor),
    
    CONSTRAINT livro_editora
    FOREIGN KEY (id_editora)
    REFERENCES editora (id_editora),
    
    CONSTRAINT livro_assunto
    FOREIGN KEY (id_assunto)
    REFERENCES assuntos (id_assuntos)
);

CREATE TABLE compra
(
	id_compra		INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_cliente		INT,
    id_livro		INT,
    data_comrpa		DATE,
    
    CONSTRAINT compra_cliente
    FOREIGN KEY (id_cliente)
    REFERENCES cliente (id_cliente),
    
    CONSTRAINT compra_livro
    FOREIGN KEY (id_livro)
    REFERENCES livro (id_livro)
);

 ALTER TABLE cliente ADD COLUMN nome VARCHAR(50) AFTER id_cliente;

 INSERT INTO cliente (nome, endereco, telefone, cod_cliente) 
 VALUES('Cristiano', 'Alto Feliz', '5199999999', '123456');
 
 USE livraria;
 SELECT * FROM cliente;
 
 INSERT INTO autor (nome)
 VALUES('Cabral');
 
 INSERT INTO editora (cod_editora, endereco, telefone, nome_gerente)
 VALUES('asdasd', 'Sao Paulo', '11999999', 'Paulo');
 
 INSERT INTO assuntos (descricao)
 VALUES('Tecnologia da Informação');
 
 INSERT INTO livro (id_autor, id_editora, id_assunto, isbn, quantidade, preco)
 VALUES(1, 1, 1, '555555', '10', '1509.33');
 
 INSERT INTO livro (id_autor, id_editora, id_assunto, isbn, quantidade, preco)
 VALUES(1, 1, 1, '4545', '2', '119.33');
 
 SELECT * FROM livro;
 
 UPDATE livro SET
 isbn = '8989',
 quantidade = '5',
 preco = '55.9'
 WHERE id_livro=4;
 
 DELETE FROM autor;
 
 SELECT id_livro, preco FROM livro;
 
 USE livrariaEX;