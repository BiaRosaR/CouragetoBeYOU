CREATE DATABASE ctby;
USE ctby;

CREATE TABLE Usuario(
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
email VARCHAR(70),
sexo CHAR(2) CHECK (sexo IN ('F', 'M')),
senha VARCHAR(45)
);

CREATE TABLE Pesquisas(
idPesquisa INT PRIMARY KEY AUTO_INCREMENT,
qtdBrancas INT,
qtdPretas INT,
qtdAzuis INT,
xadrez VARCHAR(70),
sapato VARCHAR(70),
fkUsuario INT,
FOREIGN KEY(fkUsuario) REFERENCES Usuario(idUsuario)
);

CREATE TABLE Comentarios(
idComentario INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(100),
descricao VARCHAR(180),
fkUsuario INT,
FOREIGN KEY(fkUsuario) REFERENCES Usuario(idUsuario)
)AUTO_INCREMENT = 	10;


SELECT * FROM Usuario;
SELECT * FROM Comentarios;
SELECT * FROM Pesquisas;

SELECT sum(qtdBrancas) AS totalBlusaBranca, sum(qtdPretas) AS totalBlusaPreta, sum(qtdAzuis) AS totalBlusaAzul  FROM Pesquisas;
