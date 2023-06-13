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
sapato VARCHAR(70)
);

SELECT * FROM Usuario;