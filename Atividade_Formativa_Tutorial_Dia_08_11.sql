CREATE DATABASE bd_formativa_1e;
use bd_formativa_1e;

CREATE TABLE Aeronave(
id_nave INT PRIMARY KEY auto_increment,
nome VARCHAR(255) NOT NULL,
comunicador VARCHAR(255) NOT NULL,
destino VARCHAR(255) NOT NULL
);

CREATE TABLE Passageiros(
id_pass INT PRIMARY KEY auto_increment,
nome VARCHAR(255) NOT NULL,
telefone VARCHAR(255) NOT NULL,
endereco VARCHAR(255) NOT NULL,
id_nave INT,
FOREIGN KEY (id_nave) REFERENCES Aeronave(id_nave)
);

INSERT INTO Aeronave (nome, comunicador, destino)
VALUES ('Airbus A320','Comunicador Alfa','Paris'),
	   ('Boeing 737','Comunicador Bravo','Nova Iorque'),
       ('Embraer E195','Comunicador Charlie','Londres'),
       ('Cessna 172','Comunicador Delta','Tóquio'),
       ('G650','Comunicador Echo','Dubai');
       
INSERT INTO Passageiros (nome, telefone, endereco, id_nave)
VALUES ('Albert Einstein','123456789', '123 Rua da Ciência',1),
	   ('Marie Curie','987654321', '456 Avenida da Radiação',1),
       ('Isaac Newton','456789123', '789 Praça da Gravidade',1),
       ('Samuel Oliveira','876543219', '987 Praça da Liberdade',1),
       ('João Pedro','321654987', '897 Rua Geraldo Ayres',1);
       
SELECT * FROM AERONAVE;
SELECT * FROM PASSAGEIROS;

UPDATE PASSAGEIROS
SET NOME = "ALBERTO ROBERTO"
WHERE id_pass = 1;

UPDATE AERONAVE
SET NOME = "SPACEX"
WHERE id_nave = 3;

DELETE FROM PASSAGEIROS
WHERE id_pass = 5;

-- Listar Passageiros com as Informações da Aeronave
-- Nome pass, telefone pass, nome aeronave e Destino
CREATE view vw_passageiros_voa AS 
SELECT
	passageiros.nome AS Nome_Passageiro,
    aeronave.nome AS Nome_Aeronave,
    aeronave.destino AS Destino_Aeronave
FROM
	passageiros	
INNER JOIN
	aeronave ON passageiros.id_nave = aeronave.id_nave;
    
SELECT * FROM vw_passageiros_voa;