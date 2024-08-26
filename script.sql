CREATE DATABASE bookstore;

USE bookstore;

CREATE TABLE Fornecedores(
 idFornecedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  
 nome VARCHAR(255) NOT NULL,  
 contato VARCHAR(14) NOT NULL,  
 cnpj VARCHAR(18) NOT NULL  
) engine = myisam; 

CREATE TABLE Livros (
 idLivro INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 idFornecedor INT NOT NULL,
 titulo VARCHAR(255) NOT NULL,  
 autor VARCHAR(255) NOT NULL,  
 preco DECIMAL(10,2) NOT NULL,  
 qtdEstoque INT NOT NULL, 
 FOREIGN KEY(idFornecedor) REFERENCES Fornecedores(idFornecedor)
) engine = myisam;

CREATE TABLE Vendas(
 idVenda INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
 idLivro INT NOT NULL,
 cliente VARCHAR(255) NOT NULL,  
 dataVenda DATE NOT NULL,  
 livros INT NOT NULL,  
 total DECIMAL(10,2) NOT NULL,
 FOREIGN KEY(idLivro) REFERENCES Livros(idLivro)
) engine = myisam; 

CREATE TABLE Clientes(
 idCliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
 idVenda INT NOT NULL,
 nome VARCHAR(255) NOT NULL,  
 email VARCHAR(100) NOT NULL,  
 telefone VARCHAR(14) NOT NULL,
 FOREIGN KEY(idVenda) REFERENCES Vendas(idVenda)
) engine = myisam; 

INSERT INTO Fornecedores(nome, contato, cnpj) VALUES ('Cleitin','43940028922','38714496000138');

INSERT INTO Livros(idFornecedor, titulo, autor, preco, qtdEstoque) VALUES (1,'Romeu E Julieta','William Shakespeare',62.72,300);

INSERT INTO Vendas(idLivro, cliente, dataVenda, livros, total) VALUES (1,'Guilherme','2024/08/25',1,62.72);

INSERT INTO Clientes(idVenda, nome, email, telefone) VALUES (1,'Guilherme','guilherme@gmail.com','43988726999');