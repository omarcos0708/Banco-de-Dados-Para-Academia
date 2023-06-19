CREATE TABLE Clientes 
( 
 id_cliente INT PRIMARY KEY AUTO_INCREMENT,  
 nome VARCHAR(n) NOT NULL,  
 idade INT NOT NULL,  
 telefone INT NOT NULL,  
 id_plano INT NOT NULL,  
 prox_aula DATE NOT NULL,  
 CHECK (idade > 14 AND telefone <> 0),
 UNIQUE (telefone)
); 

CREATE TABLE atividades 
( 
 id_atividade INT PRIMARY KEY AUTO_INCREMENT,  
 nome CHAR(n) NOT NULL,  
 horario DATE NOT NULL,  
 descricao VARCHAR(n) NOT NULL,  
); 

CREATE TABLE Pagamentos 
( 
 id_pagamento INT PRIMARY KEY,  
 id_cliente INT NOT NULL,  
); 

CREATE TABLE plano 
( 
 id_plano INT PRIMARY KEY AUTO_INCREMENT,  
 nome VARCHAR(n) NOT NULL,  
 valor INT NOT NULL,  
 data_inicio DATE NOT NULL,  
 data_fim INT NOT NULL,  
 UNIQUE (nome,valor)
); 

CREATE TABLE Aula 
( 
 id_aula INT PRIMARY KEY NOT NULL AUTO_INCREMENT,  
 id_cliente INT,  
 id_atividade INT,  
 data DATE NOT NULL,  
 UNIQUE (id_aula: PK,id_cliente: FK,id_atividade: FK)
); 

CREATE TABLE AcessoCatracas 
( 
 id_catraca INT PRIMARY KEY,  
 id_cliente INT NOT NULL,  
 Data_Acesso DATE,  
); 

ALTER TABLE Clientes ADD FOREIGN KEY(id_plano) REFERENCES plano (id_plano)
ALTER TABLE Clientes ADD FOREIGN KEY(prox_aula) REFERENCES atividades (prox_aula)
ALTER TABLE Pagamentos ADD FOREIGN KEY(id_cliente) REFERENCES Clientes (id_cliente)
ALTER TABLE Aula ADD FOREIGN KEY(id_cliente) REFERENCES Clientes (id_cliente)
ALTER TABLE Aula ADD FOREIGN KEY(id_atividade) REFERENCES atividades (id_atividade)
ALTER TABLE AcessoCatracas ADD FOREIGN KEY(id_cliente) REFERENCES Clientes (id_cliente)