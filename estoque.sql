CREATE DATABASE projetoestoque;

USE projetoestoque;


CREATE TABLE produto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (80) NOT NULL,
    descricao VARCHAR (256),
    preco DECIMAL (8,2) NOT NULL,
    quantidadeMinima INT NOT NULL,
    fk_fornecedor_id INT,
    fk_fornecedor_fk_pessoa_id INT,
    fk_categoria_id INT
);

CREATE TABLE endereco (
    id INT PRIMARY KEY AUTO_INCREMENT,
    uf CHAR (2) NOT NULL,
    bairro VARCHAR (30) NOT NULL,
    logradouro VARCHAR (80) NOT NULL,
    cep CHAR (8) NOT NULL,
    cidade VARCHAR (50) NOT NULL,
    numero VARCHAR (10) NOT NULL,
    fk_pessoa_id INT
);

CREATE TABLE pedido (
    id INT PRIMARY KEY AUTO_INCREMENT,
    observacao VARCHAR (256),
    dataPedido DATE NOT NULL,
    numeroPedido INT NOT NULL,
    fk_cliente_id INT,
    fk_cliente_fk_pessoa_id INT,
    UNIQUE (dataPedido, numeroPedido)
);

CREATE TABLE pagamento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (30) NOT NULL,
    fk_pedido_id INT
);

CREATE TABLE pessoa (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR (80) UNIQUE NOT NULL,
    telefone VARCHAR (15) NOT NULL,
    nome VARCHAR (80) NOT NULL
);

CREATE TABLE fornecedor (
    id INT,
    nomeContato VARCHAR (80),
    cnpj CHAR (14) UNIQUE NOT NULL,
    fk_pessoa_id INT,
    PRIMARY KEY (id, fk_pessoa_id)
);

CREATE TABLE cliente (
    id INT,
    cpf CHAR (11) UNIQUE NOT NULL,
    fk_pessoa_id INT,
    PRIMARY KEY (id, fk_pessoa_id)
);

CREATE TABLE categoria (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (50) NOT NULL
);

CREATE TABLE itemPedido (  -- antiga tabela possui
    id INT PRIMARY KEY AUTO_INCREMENT,
    quantidade INT NOT NULL,
    sessao CHAR (64) ,
    fk_pedido_id INT,
    fk_produto_id INT
);

RENAME  TABLE possui TO itemPedido;
 
ALTER TABLE produto ADD CONSTRAINT FK_produto_2
    FOREIGN KEY (fk_fornecedor_id, fk_fornecedor_fk_pessoa_id)
    REFERENCES fornecedor (id, fk_pessoa_id)
    ON DELETE RESTRICT;
 
ALTER TABLE produto ADD CONSTRAINT FK_produto_3
    FOREIGN KEY (fk_categoria_id)
    REFERENCES categoria (id)
    ON DELETE RESTRICT;
 
ALTER TABLE endereco ADD CONSTRAINT FK_endereco_2
    FOREIGN KEY (fk_pessoa_id)
    REFERENCES pessoa (id)
    ON DELETE CASCADE;
 
ALTER TABLE pedido ADD CONSTRAINT FK_pedido_2
    FOREIGN KEY (fk_cliente_id, fk_cliente_fk_pessoa_id)
    REFERENCES cliente (id, fk_pessoa_id)
    ON DELETE CASCADE;
 
ALTER TABLE pagamento ADD CONSTRAINT FK_pagamento_2
    FOREIGN KEY (fk_pedido_id)
    REFERENCES pedido (id)
    ON DELETE RESTRICT;
 
ALTER TABLE fornecedor ADD CONSTRAINT FK_fornecedor_2
    FOREIGN KEY (fk_pessoa_id)
    REFERENCES pessoa (id)
    ON DELETE CASCADE;
 
ALTER TABLE cliente ADD CONSTRAINT FK_cliente_2
    FOREIGN KEY (fk_pessoa_id)
    REFERENCES pessoa (id)
    ON DELETE CASCADE;
 
ALTER TABLE itemPedido ADD CONSTRAINT FK_possui_2
    FOREIGN KEY (fk_pedido_id)
    REFERENCES pedido (id)
    ON DELETE RESTRICT;
 
ALTER TABLE itemPedido ADD CONSTRAINT FK_possui_3
    FOREIGN KEY (fk_produto_id)
    REFERENCES produto (id)
    ON DELETE SET NULL;
    


DESCRIBE produto;
DESCRIBE endereco;
DESCRIBE pedido;
DESCRIBE pagamento;
DESCRIBE pessoa;
DESCRIBE fornecedor;
DESCRIBE cliente;
DESCRIBE categoria;
DESCRIBE itemPedido;
 

SELECT * FROM produto;
SELECT * FROM endereco;
SELECT * FROM pedido;
SELECT * FROM pagamento;
SELECT * FROM pessoa;
SELECT * FROM fornecedor;
SELECT * FROM cliente;
SELECT * FROM categoria;
SELECT * FROM itemPedido;


INSERT INTO categoria (nome) VALUES ('Bebidas');
INSERT INTO categoria (nome) VALUES ('Eletrônicos');
INSERT INTO categoria (nome) VALUES ('Alimentos');
INSERT INTO categoria (nome) VALUES ('Móveis');
INSERT INTO categoria (nome) VALUES ('Vestuário');


INSERT INTO produto (nome, descricao, preco, quantidadeMinima, fk_fornecedor_id, fk_fornecedor_fk_pessoa_id, fk_categoria_id) VALUES ('Refrigerante', 'Bebida gaseificada', 4.50, 50, 1, 1, 1);
INSERT INTO produto (nome, descricao, preco, quantidadeMinima, fk_fornecedor_id, fk_fornecedor_fk_pessoa_id, fk_categoria_id) VALUES ('Suco de Laranja', 'Suco natural de laranja', 6.99, 30, 1, 1, 1);
INSERT INTO produto (nome, descricao, preco, quantidadeMinima, fk_fornecedor_id, fk_fornecedor_fk_pessoa_id, fk_categoria_id) VALUES ('Notebook', 'Notebook 15" com 8GB RAM', 2999.90, 5, 2, 2, 2);
INSERT INTO produto (nome, descricao, preco, quantidadeMinima, fk_fornecedor_id, fk_fornecedor_fk_pessoa_id, fk_categoria_id) VALUES ('Smartphone', 'Smartphone Android 128GB', 1999.99, 10, 2, 2, 2);
INSERT INTO produto (nome, descricao, preco, quantidadeMinima, fk_fornecedor_id, fk_fornecedor_fk_pessoa_id, fk_categoria_id) VALUES ('TV LED 42"', 'Televisão LED 42"', 1799.90, 8, 2, 2, 2);
INSERT INTO produto (nome, descricao, preco, quantidadeMinima, fk_fornecedor_id, fk_fornecedor_fk_pessoa_id, fk_categoria_id) VALUES ('Arroz 5kg', 'Pacote de arroz 5kg', 12.90, 20, 1, 1, 3);
INSERT INTO produto (nome, descricao, preco, quantidadeMinima, fk_fornecedor_id, fk_fornecedor_fk_pessoa_id, fk_categoria_id) VALUES ('Feijão 1kg', 'Pacote de feijão 1kg', 8.50, 25, 1, 1, 3);
INSERT INTO produto (nome, descricao, preco, quantidadeMinima, fk_fornecedor_id, fk_fornecedor_fk_pessoa_id, fk_categoria_id) VALUES ('Cama Queen Size', 'Cama Queen Size com colchão', 2999.90, 2, 2, 2, 4);
INSERT INTO produto (nome, descricao, preco, quantidadeMinima, fk_fornecedor_id, fk_fornecedor_fk_pessoa_id, fk_categoria_id) VALUES ('Sofá 3 lugares', 'Sofá de tecido 3 lugares', 1599.99, 3, 2, 2, 4);
INSERT INTO produto (nome, descricao, preco, quantidadeMinima, fk_fornecedor_id, fk_fornecedor_fk_pessoa_id, fk_categoria_id) VALUES ('Mesa de Jantar', 'Mesa de jantar 6 lugares', 1899.90, 4, 2, 2, 4);
INSERT INTO produto (nome, descricao, preco, quantidadeMinima, fk_fornecedor_id, fk_fornecedor_fk_pessoa_id, fk_categoria_id) VALUES ('Calça Jeans', 'Calça jeans masculina', 89.90, 15, 1, 1, 5);
INSERT INTO produto (nome, descricao, preco, quantidadeMinima, fk_fornecedor_id, fk_fornecedor_fk_pessoa_id, fk_categoria_id) VALUES ('Camisa Polo', 'Camisa polo masculina', 49.90, 20, 1, 1, 5);
INSERT INTO produto (nome, descricao, preco, quantidadeMinima, fk_fornecedor_id, fk_fornecedor_fk_pessoa_id, fk_categoria_id) VALUES ('Jaqueta de Couro', 'Jaqueta de couro sintético', 299.90, 10, 1, 1, 5);
INSERT INTO produto (nome, descricao, preco, quantidadeMinima, fk_fornecedor_id, fk_fornecedor_fk_pessoa_id, fk_categoria_id) VALUES ('Tênis Esportivo', 'Tênis esportivo para corrida', 199.99, 12, 1, 1, 5);
INSERT INTO produto (nome, descricao, preco, quantidadeMinima, fk_fornecedor_id, fk_fornecedor_fk_pessoa_id, fk_categoria_id) VALUES ('Camisa Social', 'Camisa social masculina', 79.90, 15, 1, 1, 5);


INSERT INTO pessoa (email, telefone, nome) VALUES ('fornecedor1@example.com', '61912345678', 'Fornecedor 1');
INSERT INTO pessoa (email, telefone, nome) VALUES ('fornecedor2@example.com', '61923456789', 'Fornecedor 2');
INSERT INTO pessoa (email, telefone, nome) VALUES ('cliente1@example.com', '61934567890', 'Cliente 1');
INSERT INTO pessoa (email, telefone, nome) VALUES ('cliente2@example.com', '61945678901', 'Cliente 2');
INSERT INTO pessoa (email, telefone, nome) VALUES ('cliente3@example.com', '61956789012', 'Cliente 3');
INSERT INTO pessoa (email, telefone, nome) VALUES ('cliente4@example.com', '61967890123', 'Cliente 4');
INSERT INTO pessoa (email, telefone, nome) VALUES ('cliente5@example.com', '61978901234', 'Cliente 5');


INSERT INTO fornecedor (id, nomeContato, cnpj, fk_pessoa_id) VALUES (1, 'Contato Fornecedor 1', '12345678000101', 1);
INSERT INTO fornecedor (id, nomeContato, cnpj, fk_pessoa_id) VALUES (2, 'Contato Fornecedor 2', '23456789000102', 2);


INSERT INTO cliente (id, cpf, fk_pessoa_id) VALUES (3, '12345678901', 3);
INSERT INTO cliente (id, cpf, fk_pessoa_id) VALUES (4, '23456789012', 4);
INSERT INTO cliente (id, cpf, fk_pessoa_id) VALUES (5, '34567890123', 5);
INSERT INTO cliente (id, cpf, fk_pessoa_id) VALUES (6, '45678901234', 6);
INSERT INTO cliente (id, cpf, fk_pessoa_id) VALUES (7, '56789012345', 7);


INSERT INTO endereco (uf, bairro, logradouro, cep, cidade, numero, fk_pessoa_id) VALUES ('SP', 'Centro', 'Av. Paulista', '01310900', 'São Paulo', '1000', 1);
INSERT INTO endereco (uf, bairro, logradouro, cep, cidade, numero, fk_pessoa_id) VALUES ('RJ', 'Copacabana', 'Rua Barata Ribeiro', '22011002', 'Rio de Janeiro', '500', 2);
INSERT INTO endereco (uf, bairro, logradouro, cep, cidade, numero, fk_pessoa_id) VALUES ('DF', 'Asa Sul', 'Rua 1', '70000000', 'Brasília', '101', 3);
INSERT INTO endereco (uf, bairro, logradouro, cep, cidade, numero, fk_pessoa_id) VALUES ('DF', 'Asa Sul', 'Rua 1', '70000000', 'Brasília', '101', 4);
INSERT INTO endereco (uf, bairro, logradouro, cep, cidade, numero, fk_pessoa_id) VALUES ('DF', 'Asa Norte', 'Rua 2', '70000001', 'Brasília', '202', 5);
INSERT INTO endereco (uf, bairro, logradouro, cep, cidade, numero, fk_pessoa_id) VALUES ('DF', 'Asa Norte', 'Rua 3', '70000002', 'Brasília', '303', 6);


INSERT INTO pedido (observacao, dataPedido, numeroPedido, fk_cliente_id, fk_cliente_fk_pessoa_id) VALUES ('Pedido urgente', '2024-08-01', 1001, 3, 3);
INSERT INTO pedido (observacao, dataPedido, numeroPedido, fk_cliente_id, fk_cliente_fk_pessoa_id) VALUES ('Entrega rápida', '2024-08-02', 1002, 4, 4);
INSERT INTO pedido (observacao, dataPedido, numeroPedido, fk_cliente_id, fk_cliente_fk_pessoa_id) VALUES ('Desconto aplicado', '2024-08-03', 1003, 5, 5);
INSERT INTO pedido (observacao, dataPedido, numeroPedido, fk_cliente_id, fk_cliente_fk_pessoa_id) VALUES ('Pagamento na entrega', '2024-08-04', 1004, 6, 6);


INSERT INTO itemPedido (quantidade, sessao, fk_pedido_id, fk_produto_id) VALUES (3, 'A1', 1, 5);
INSERT INTO itemPedido (quantidade, sessao, fk_pedido_id, fk_produto_id) VALUES (2, 'A2', 1, 6);
INSERT INTO itemPedido (quantidade, sessao, fk_pedido_id, fk_produto_id) VALUES (1, 'B1', 2, 7);
INSERT INTO itemPedido (quantidade, sessao, fk_pedido_id, fk_produto_id) VALUES (4, 'B2', 2, 8);
INSERT INTO itemPedido (quantidade, sessao, fk_pedido_id, fk_produto_id) VALUES (5, 'C1', 3, 9);
INSERT INTO itemPedido (quantidade, sessao, fk_pedido_id, fk_produto_id) VALUES (3, 'C2', 3, 10);
INSERT INTO itemPedido (quantidade, sessao, fk_pedido_id, fk_produto_id) VALUES (2, 'D1', 4, 11);
INSERT INTO itemPedido (quantidade, sessao, fk_pedido_id, fk_produto_id) VALUES (4, 'D2', 4, 12);



INSERT INTO pagamento (nome, fk_pedido_id) VALUES ('Pix', 1);
INSERT INTO pagamento (nome, fk_pedido_id) VALUES ('Pix', 2);
INSERT INTO pagamento (nome, fk_pedido_id) VALUES ('Cartão de Crédito', 3);
INSERT INTO pagamento (nome, fk_pedido_id) VALUES ('Dinheiro', 4);


SELECT * FROM categoria WHERE id=3;
SELECT * FROM pagamento WHERE nome='Pix';

UPDATE endereco SET bairro='Vicente Pires' WHERE fk_pessoa_id=5;

SELECT * FROM produto WHERE nome LIKE '%PO%'; -- pesquisa caracteres específicos. ao usar % no inicio pesquisa pavalavras que começam com o caractere, no final pesquisa palavras que terminam com o caractere, entre (%%) pesquisa em qualquer posição
SELECT *  FROM produto WHERE nome = 'camisa polo';
SELECT * FROM  produto WHERE preco > 500 AND preco < 2500;
SELECT * FROM  produto WHERE preco < 500 OR preco > 2500;

SHOW FULL COLUMNS FROM produto;
SHOW TABLE STATUS LIKE 'produto';

SELECT
	produto.id AS código,
    produto.nome,
    produto.descricao,
    produto.preco,
    -- produto.quantidadeMinima,
    categoria.nome AS categoria
FROM
	produto
JOIN
	categoria ON produto.fk_categoria_id = categoria.id;
    


-- 5 JOINs

SELECT       
    pessoa.id AS código,
    pessoa.nome AS empresa,
    fornecedor.nomeContato AS contato,
    fornecedor.cnpj AS CNPJ
    
FROM 
    fornecedor
JOIN 
    pessoa ON fornecedor.fk_pessoa_id = pessoa.id;
    
SELECT * FROM produto;
    
 SELECT 
    pessoa.id AS pessoa_id,
    pessoa.nome AS pessoa_nome,
    pessoa.email AS pessoa_email,
    pessoa.telefone AS pessoa_telefone,
    fornecedor.id AS fornecedor_id,
    fornecedor.nomeContato AS fornecedor_nomeContato,
    fornecedor.cnpj AS fornecedor_cnpj,
    produto.id AS produto_id,
    produto.nome AS produto_nome,
    produto.preco AS produto_preco,
    produto.quantidadeMinima AS produto_quantidadeMinima,
    categoria.id AS categoria_id,
    categoria.nome AS categoria_nome
FROM 
    produto
JOIN 
    fornecedor ON produto.fk_fornecedor_id = fornecedor.id
    AND produto.fk_fornecedor_fk_pessoa_id = fornecedor.fk_pessoa_id
JOIN 
    pessoa ON fornecedor.fk_pessoa_id = pessoa.id
JOIN 
    categoria ON produto.fk_categoria_id = categoria.id;
   

SELECT
	pessoa.id AS pessoa_id,
    pessoa.nome AS pessoa_nome,
    pessoa.email AS pessoa_email,
    pessoa.telefone AS pessoa_telefone,
    cliente.id AS cliente_id,
    cliente.cpf,
    endereco.uf AS estado,
    endereco.cidade,
    endereco.bairro,
    endereco.logradouro,
    endereco.numero,
    endereco.cep
FROM
    pessoa
JOIN
    cliente ON pessoa.id = cliente.fk_pessoa_id -- inverter a ordem tbm funciona!!
JOIN
    endereco ON pessoa.id = endereco.fk_pessoa_id;    


SELECT
	pedido.id AS pedido_id,
    pedido.dataPedido AS data_compra,
    pedido.numeroPedido AS numero_do_pedido,
    pagamento.nome AS forma_pagamento,
    cliente.cpf,
    pessoa.nome,
    pessoa.telefone
FROM
	pedido
JOIN
	pagamento ON pedido.id = pagamento.fk_pedido_id
JOIN
	cliente ON pedido.fk_cliente_id = cliente.id
    AND pedido.fk_cliente_fk_pessoa_id = cliente.fk_pessoa_id
JOIN
	pessoa ON pessoa.id = cliente.fk_pessoa_id;
    
    
DELETE FROM produto WHERE id = 19;
-- deletei um produto (atual produto id=20) para fins didáticos


SELECT TRUNCATE (AVG(preco),2)  FROM produto;
SELECT SUM(preco) FROM produto;
SELECT DATE(dataPedido) FROM pedido WHERE id=4;