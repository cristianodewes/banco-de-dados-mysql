CREATE DATABASE spotfy;

#Nome:  Cristiano Dewes, Gabi Nakasone, Geyson Kaio, Jonas Pacheco, Pablo Gonçalves
USE spotfy;

CREATE TABLE usuario
(
	idUsuario			INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeusuario			VARCHAR(45),
    data_nac			DATE,
    sexo				VARCHAR(1),
    email				VARCHAR(150),
    senha				VARCHAR(45)
);

create table genero
(
id_genero int not null auto_increment primary key,
genero varchar(45)
);

CREATE TABLE artista
(
idArtista INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(45),
sobrenome VARCHAR(100)
);

CREATE TABLE album(
idAlbum INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(45),
idArtista INT
);

ALTER TABLE album ADD CONSTRAINT fk_album_artista FOREIGN KEY (idArtista) REFERENCES artista(idArtista);

CREATE TABLE playlist
(
idPlaylist    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_usuario     INT,
titulo         VARCHAR(45),
qtdcancoes     INT,
datacriacao    DATETIME,

CONSTRAINT fk_playlist_usuario
    FOREIGN KEY (id_usuario)
    REFERENCES usuario(idUsuario)
);

CREATE TABLE cancoes
(
idCancao INT NOT NULL AUTO_INCREMENT,
titulo VARCHAR(45),
duracao DOUBLE,
qtdreproducao INT,
qtdlikes INT,
idAlbum INT,
PRIMARY KEY (idCancao),

CONSTRAINT fk_idAlbum
   FOREIGN KEY (idAlbum)
   REFERENCES album (idAlbum)
);

CREATE TABLE playlist_cancao
(
	idPlaylist_Cancao	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Idcancao			INT,
    idPlaylist			INT,
    
    CONSTRAINT fk_playlist_cancao
    FOREIGN KEY (Idcancao)
    REFERENCES cancoes(idCancao),
    
    CONSTRAINT fk_playlist_playlist
    FOREIGN KEY (idPlaylist)
    REFERENCES playlist(idPlaylist)
);

create table genero_cancao
(
id_genero_cancao int not null auto_increment primary key,
id_cancao int,
id_genero int,
constraint fk_idcancao
foreign key (id_cancao) references cancoes (idCancao),
constraint fk_idgenero 
foreign key (id_genero) references genero (id_genero)

);

INSERT INTO usuario (nomeusuario, data_nac, sexo, email, senha)
VALUES  ('cristiano', '1995-11-08', 'M', 'asinbaicnm', 'aaaaa'),
		('asda', '1995-11-08', 'M', 'asinbaicnm', 'aaaaa'),
		('asdas', '19-11-08', 'M', 'asinbaicnm', 'aaaaa');
        
SELECT * FROM usuario;

INSERT INTO cancoes (titulo, duracao, qtdreproducao, qtdlikes, idAlbum)
VALUES  ('sabdu', '00-05-02', 1257, 66, 1),
		('guhio', '00-03-55', 1, 0, 2),
        ('bnnm', '00-00-30', 66664581, 48563, 3);

