CREATE DATABASE bd_formativa_vdd;
use bd_formativa_vdd;

CREATE TABLE Universidade(
id_uni INT PRIMARY KEY auto_increment,
nome VARCHAR(255) NOT NULL,
telefone VARCHAR(255) NOT NULL,
rua VARCHAR(255) NOT NULL,
numero INT NOT NULL,
cep VARCHAR(255) NOT NULL,
bairro VARCHAR(255) NOT NULL,
cidade VARCHAR(255) NOT NULL
);

CREATE TABLE Estudante(
id_estudante INT PRIMARY KEY auto_increment,
nome VARCHAR(255) NOT NULL,
telefone VARCHAR(255) NOT NULL,
rua VARCHAR(255) NOT NULL,
numero VARCHAR(255) NOT NULL,
cep VARCHAR(255) NOT NULL,
bairro VARCHAR(255) NOT NULL,
cidade VARCHAR(255) NOT NULL,
id_uni INT,
FOREIGN KEY (id_uni) REFERENCES Universidade(id_uni)
);

INSERT INTO Universidade (nome, telefone, rua, numero, cep, bairro, cidade)
VALUES ('Universidade de Oxford','123456789','Rua de Oxford',321,'12345678','Bairro de Oxford','Cidade de Oxford'),
	   ('Universidade de Stanford','234567891','Rua de Stanford',123,'23456789','Bairro de Stanford','Cidade de Stanford'),
       ('MIT','345678912','Rua de MIT',456,'34567891','Bairro de MIT','Cidade de MIT'),
       ('Universidade de Harvard','456789123','Rua de Harvard',789,'45678912','Bairro de Harvard','Cidade de Harvard'),
       ('Universidade de Cambridge','567891234','Rua de Cambridge',135,'56789123','Bairro de Cambridge','Cidade de Cambridge');
       
INSERT INTO Estudante (nome, telefone, rua, numero, cep, bairro, cidade, id_uni)
VALUES ('João Pedro','999999999','Rua do João Pedro',999,'99999999','Bairro do João Pedro','Cidade do João Pedro',1),
	   ('Samuel Oliveira','888888888','Rua do Samuel Olieira',888,'88888888','Bairro do Samuel Oliveira','Cidade do Samuel Oliveira',1),
       ('Samuel Freitas','777777777','Rua do Samuel Freitas',777,'77777777','Bairro do Samuel Freitas','Cidade do Samuel Freitas',2),
       ('Chiquinho','666666666','Rua do Chiquinho',666,'66666666','Bairro do Chiquinho','Cidade do Chiquinho',3),
       ('Charles','555555555','Rua do Charles',555,'55555555','Bairro do Charles','Cidade do Charles',5);
       
SELECT * FROM Universidade;
SELECT * FROM Estudante;

UPDATE Estudante
SET nome = "Joe Yabuki"
WHERE id_estudante = 1;

UPDATE Universidade
SET nome = "Universidade Zoide"
WHERE id_uni = 3;

DELETE FROM Estudante
WHERE id_estudante = 5;

CREATE view vw_estuda_onde AS 
SELECT
	estudante.nome AS Nome_Estudante,
    universidade.nome AS Nome_Universidade
FROM
	estudante
INNER JOIN
	universidade ON estudante.id_uni = universidade.id_uni;
    
SELECT * FROM vw_estuda_onde;