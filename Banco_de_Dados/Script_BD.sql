CREATE DATABASE ctby;
USE ctby;

CREATE TABLE Usuario(
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
email VARCHAR(70),
senha VARCHAR(45),
sexo CHAR(2) CHECK (sexo IN ('F', 'M'))
);