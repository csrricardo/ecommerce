USE loja;

DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  endereco VARCHAR(100),
  cidade VARCHAR(50),
  estado CHAR(2),
  email VARCHAR(50) NOT NULL,
  senha VARCHAR(50) NOT  NULL,
  PRIMARY KEY (id)
); 

INSERT INTO clientes (nome, endereco, cidade, email, senha)
VALUES ('Maria','Rua dos Ipês','Garça','maria@email.com','1234');

INSERT INTO clientes (nome, endereco, cidade, email, senha)
VALUES ('Luiz','Av. Brasil','Marilia','luiz@email.com','2016');

INSERT INTO clientes (nome, endereco, cidade, email, senha)
VALUES ('Ana','Rua 15','Garça','ana@email.com','abcd');

DROP TABLE IF EXISTS produtos;

CREATE TABLE produtos (

id INT NOT NULL AUTO_INCREMENT,
descricao VARCHAR(50) NOT NULL,
preco DECIMAL(7,2),
estoque INT,
PRIMARY KEY (id)
);

INSERT INTO produtos (descricao, preco, estoque)
VALUES ('Criando aplicativos para iPhone e iPad', 89.9, 10);

INSERT INTO produtos (descricao, preco, estoque)
VALUES ('Desenvolvendo seu primeiro app Android', 59.9, 5);
