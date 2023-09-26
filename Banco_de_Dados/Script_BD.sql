DROP DATABASE IF EXISTS ctby;
CREATE DATABASE ctby;
USE ctby;

CREATE TABLE Usuario(
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
email VARCHAR(70),
sexo CHAR(2) CHECK (sexo IN ('F', 'M')),
senha VARCHAR(45)
);

CREATE TABLE TipoRoupa(
idTipoRoupa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
tecido VARCHAR(45)
);

CREATE TABLE Roupas(
idRoupas INT PRIMARY KEY AUTO_INCREMENT,
cor VARCHAR(45),
tamanho VARCHAR(15),
fkUsuario INT,
fkTipoRoupa INT,
FOREIGN KEY (fkUsuario) REFERENCES Usuario(idUsuario),
FOREIGN KEY (fkTipoRoupa) REFERENCES TipoRoupa(idTipoRoupa)
);

CREATE TABLE Pesquisas(
idPesquisa INT PRIMARY KEY AUTO_INCREMENT,
qtdBrancas INT,
qtdPretas INT,
qtdAzuis INT,
xadrez VARCHAR(10),
sapato VARCHAR(70),
fkUsuario INT,
FOREIGN KEY(fkUsuario) REFERENCES Usuario(idUsuario)
);

-- INSERINDO USUÁRIOS
INSERT INTO Usuario(nome, email, sexo, senha) VALUES("Bianca de Andrade", "BiancaAndrade@gmail.com", "F", "12345"),
													("Pharrell Williams", "PWilliams@gmail.com", "M", "12345"),
													("Coco Chanel", "CC@gmail.com", "F", "12345"),
													("Christian Dior", "ChrisDior@hotmail.com", "M", "12345"),
													("Winnie Harlow", "WHarlow@gmail.com", "F", "12345"),
													("Gisele Bündchen", "GiseleB@globomail.com", "F", "12345");
                                                    
                                                   
-- iNSERINDO ALGUNS TIPOS PADRÕES DE ROUPAS
INSERT INTO TipoRoupa(nome, tecido) VALUES("Calça", "Jeans"),
										  ("Short", "Jeans"),
                                          ("Short", "Tactel"),
                                          ("Moletom", "Algodão"),
                                          ("Camiseta", "Algodão"),
                                          ("Blazer", "Gabardine"),
                                          ("Terno", "Gabardine"),
                                          ("Blazer", "Gabardine"),
                                          ("Macacão", "Linho"),
                                          ("Vestido", "Renda");
                                          
                                          
-- INSERINDO ALGUMAS RESPOSTAS PARA PESQUISA
INSERT INTO Pesquisas(qtdBrancas, qtdPretas, qtdAzuis, xadrez, sapato, fkUsuario) VALUES(3, 10, 2, "sim","Salto Alto", 1),
																						(15, 25, 15, "sim","Tênis", 2),
                                                                                        (10, 10, 15, "Sim","Salto Alto", 3),
                                                                                        (15, 30, 10, "Não","Botina Masculina", 4),
                                                                                        (5, 8, 20, "Não","Tênis", 5),
                                                                                        (25, 15, 9, "sim","Bota de boiadeira", 6);
                                                                                        
                                          
-- VIEW vizualização das Têndencias nas Blusas
DROP VIEW IF EXISTS vw_pesquisaBlusas;
CREATE OR REPLACE VIEW vw_pesquisaBlusas AS
SELECT
  SUM(qtdBrancas) AS totalBlusaBranca,
  SUM(qtdPretas) AS totalBlusaPreta,
  SUM(qtdAzuis) AS totalBlusaAzul 
FROM
  Pesquisas;
  
SELECT * FROM vw_pesquisaBlusas;

-- VIEW para vizualização da aceitação do xadrez
DROP VIEW IF EXISTS vw_pequisasXadrez;
CREATE OR REPLACE VIEW vw_pequisasXadrez AS
SELECT
  COUNT(CASE WHEN xadrez = 'Sim' THEN 1 END) AS qtd_sim,
  COUNT(CASE WHEN xadrez = 'Não' THEN 1 END) AS qtd_nao
FROM
  Pesquisas;
  
SELECT * FROM vw_pequisasxadrez;

-- VIEW para vizualização da preferencia dos usuários referente ao sapato
  
