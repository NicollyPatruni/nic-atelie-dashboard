CREATE DATABASE nic_atelie;
USE nic_atelie;
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    cidade VARCHAR(50),
    estado VARCHAR(2),
    data_cadastro DATE
);
CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(150) NOT NULL,
    categoria VARCHAR(50),
    marca VARCHAR(50),
    preco DECIMAL(10,2),
    estoque INT
);
CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    status_pedido VARCHAR(20),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);
CREATE TABLE itens_pedido (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);
INSERT INTO clientes (nome, email, cidade, estado, data_cadastro) VALUES
('Ana Silva', 'ana.silva@email.com', 'Curitiba', 'PR', '2024-01-15'),
('Beatriz Costa', 'beatriz.costa@email.com', 'São Paulo', 'SP', '2024-02-20'),
('Carla Souza', 'carla.souza@email.com', 'Rio de Janeiro', 'RJ', '2024-03-10'),
('Daniela Lima', 'daniela.lima@email.com', 'Curitiba', 'PR', '2024-04-05'),
('Elaine Rocha', 'elaine.rocha@email.com', 'Belo Horizonte', 'MG', '2024-05-12'),
('Fernanda Alves', 'fernanda.alves@email.com', 'Porto Alegre', 'RS', '2024-06-18'),
('Gabriela Santos', 'gabriela.santos@email.com', 'Curitiba', 'PR', '2024-07-22'),
('Helena Martins', 'helena.martins@email.com', 'São Paulo', 'SP', '2024-08-30'),
('Isabela Ferreira', 'isabela.ferreira@email.com', 'Salvador', 'BA', '2024-09-14'),
('Julia Pereira', 'julia.pereira@email.com', 'Curitiba', 'PR', '2024-10-01');
SELECT * FROM clientes;
INSERT INTO produtos (nome_produto, categoria, marca, preco, estoque) VALUES
('Vestido Midi Floral', 'Vestido', 'Nic Ateliê', 189.90, 25),
('Blusa de Seda Manga Longa', 'Blusa', 'Nic Ateliê', 129.90, 40),
('Calça Wide Leg Alfaiataria', 'Calça', 'Nic Ateliê', 219.90, 18),
('Saia Midi Plissada', 'Saia', 'Nic Ateliê', 149.90, 30),
('Conjunto Cropped e Short', 'Conjunto', 'Nic Ateliê', 179.90, 22),
('Vestido Longo Estampado', 'Vestido', 'Nic Ateliê', 259.90, 15),
('Blazer Alfaiataria', 'Blazer', 'Nic Ateliê', 299.90, 12),
('Calça Jeans Skinny', 'Calça', 'Nic Ateliê', 169.90, 35),
('Blusa Cropped Básica', 'Blusa', 'Nic Ateliê', 79.90, 50),
('Macacão Pantalona', 'Macacão', 'Nic Ateliê', 229.90, 20);
SELECT * FROM produtos;
INSERT INTO pedidos (id_cliente, data_pedido, status_pedido) VALUES
(1, '2025-01-10', 'Entregue'),
(2, '2025-01-15', 'Entregue'),
(3, '2025-02-03', 'Entregue'),
(1, '2025-02-20', 'Entregue'),
(4, '2025-03-05', 'Entregue'),
(5, '2025-03-18', 'Cancelado'),
(6, '2025-04-02', 'Entregue'),
(7, '2025-04-14', 'Em processamento'),
(2, '2025-05-01', 'Entregue'),
(8, '2025-05-20', 'Entregue'),
(9, '2025-06-08', 'Entregue'),
(1, '2025-06-25', 'Entregue'),
(10, '2025-07-03', 'Entregue'),
(3, '2025-07-15', 'Em processamento'),
(4, '2025-07-28', 'Entregue');
SELECT * FROM pedidos;
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 1, 189.90),
(1, 3, 1, 219.90),
(2, 2, 2, 129.90),
(3, 5, 1, 179.90),
(4, 1, 1, 189.90),
(4, 6, 1, 259.90),
(5, 8, 1, 169.90),
(6, 9, 3, 79.90),
(7, 4, 1, 149.90),
(8, 7, 1, 299.90),
(9, 2, 1, 129.90),
(9, 10, 1, 229.90),
(10, 3, 2, 219.90),
(11, 6, 1, 259.90),
(12, 1, 2, 189.90),
(13, 9, 2, 79.90),
(14, 5, 1, 179.90),
(15, 8, 1, 169.90),
(15, 4, 1, 149.90);
SELECT * FROM itens_pedido;
SELECT 
    p.nome_produto,
    SUM(ip.quantidade) AS total_vendido
FROM itens_pedido ip
JOIN produtos p ON ip.id_produto = p.id_produto
GROUP BY p.nome_produto
ORDER BY total_vendido DESC;
SELECT 
    c.nome,
    SUM(ip.quantidade * ip.preco_unitario) AS total_gasto
FROM itens_pedido ip
JOIN pedidos ped ON ip.id_pedido = ped.id_pedido
JOIN clientes c ON ped.id_cliente = c.id_cliente
GROUP BY c.nome
ORDER BY total_gasto DESC;
SELECT 
    DATE_FORMAT(ped.data_pedido, '%Y-%m') AS mes,
    SUM(ip.quantidade * ip.preco_unitario) AS faturamento
FROM itens_pedido ip
JOIN pedidos ped ON ip.id_pedido = ped.id_pedido
GROUP BY mes
ORDER BY mes;
INSERT INTO clientes (nome, email, cidade, estado, data_cadastro) VALUES
('Larissa Oliveira', 'larissa.oliveira@email.com', 'Curitiba', 'PR', '2024-11-02'),
('Mariana Cardoso', 'mariana.cardoso@email.com', 'São Paulo', 'SP', '2024-11-10'),
('Natalia Ribeiro', 'natalia.ribeiro@email.com', 'Curitiba', 'PR', '2024-11-18'),
('Olivia Barbosa', 'olivia.barbosa@email.com', 'Rio de Janeiro', 'RJ', '2024-11-25'),
('Patricia Gomes', 'patricia.gomes@email.com', 'Belo Horizonte', 'MG', '2024-12-03'),
('Quezia Nunes', 'quezia.nunes@email.com', 'Porto Alegre', 'RS', '2024-12-10'),
('Renata Dias', 'renata.dias@email.com', 'Curitiba', 'PR', '2024-12-15'),
('Sabrina Teixeira', 'sabrina.teixeira@email.com', 'São Paulo', 'SP', '2024-12-20'),
('Tatiana Moreira', 'tatiana.moreira@email.com', 'Salvador', 'BA', '2025-01-05'),
('Ursula Castro', 'ursula.castro@email.com', 'Curitiba', 'PR', '2025-01-12'),
('Vanessa Pinto', 'vanessa.pinto@email.com', 'Recife', 'PE', '2025-01-18'),
('Wanessa Correia', 'wanessa.correia@email.com', 'São Paulo', 'SP', '2025-01-25'),
('Ximena Duarte', 'ximena.duarte@email.com', 'Curitiba', 'PR', '2025-02-02'),
('Yasmin Freitas', 'yasmin.freitas@email.com', 'Florianópolis', 'SC', '2025-02-08'),
('Zilda Monteiro', 'zilda.monteiro@email.com', 'Rio de Janeiro', 'RJ', '2025-02-14'),
('Amanda Vieira', 'amanda.vieira@email.com', 'Curitiba', 'PR', '2025-02-20'),
('Bianca Cunha', 'bianca.cunha@email.com', 'Brasília', 'DF', '2025-03-01'),
('Camila Azevedo', 'camila.azevedo@email.com', 'São Paulo', 'SP', '2025-03-08'),
('Debora Melo', 'debora.melo@email.com', 'Curitiba', 'PR', '2025-03-15'),
('Eduarda Lopes', 'eduarda.lopes@email.com', 'Salvador', 'BA', '2025-03-22'),
('Flavia Rezende', 'flavia.rezende@email.com', 'Porto Alegre', 'RS', '2025-04-01'),
('Giovanna Farias', 'giovanna.farias@email.com', 'Curitiba', 'PR', '2025-04-08'),
('Hadassa Peixoto', 'hadassa.peixoto@email.com', 'São Paulo', 'SP', '2025-04-15'),
('Ingrid Sales', 'ingrid.sales@email.com', 'Recife', 'PE', '2025-04-22'),
('Joana Cavalcante', 'joana.cavalcante@email.com', 'Curitiba', 'PR', '2025-05-01'),
('Kelly Rocha', 'kelly.rocha@email.com', 'Belo Horizonte', 'MG', '2025-05-08'),
('Larissa Batista', 'larissa.batista@email.com', 'São Paulo', 'SP', '2025-05-15'),
('Mirela Andrade', 'mirela.andrade@email.com', 'Curitiba', 'PR', '2025-05-22'),
('Nadia Franco', 'nadia.franco@email.com', 'Florianópolis', 'SC', '2025-06-01'),
('Otavia Ramos', 'otavia.ramos@email.com', 'Rio de Janeiro', 'RJ', '2025-06-08');
SELECT COUNT(*) FROM clientes;
INSERT INTO produtos (nome_produto, categoria, marca, preco, estoque) VALUES
('Vestido Curto Alcinha', 'Vestido', 'Nic Ateliê', 139.90, 28),
('Camisa Social Feminina', 'Camisa', 'Nic Ateliê', 159.90, 33),
('Short Jeans Cintura Alta', 'Short', 'Nic Ateliê', 119.90, 45),
('Cardigan Tricot', 'Cardigan', 'Nic Ateliê', 189.90, 20),
('Regata Canelada', 'Blusa', 'Nic Ateliê', 59.90, 60),
('Vestido Tubinho', 'Vestido', 'Nic Ateliê', 209.90, 17),
('Calça Legging', 'Calça', 'Nic Ateliê', 89.90, 55),
('Body Manga Longa', 'Body', 'Nic Ateliê', 99.90, 38),
('Saia Jeans', 'Saia', 'Nic Ateliê', 129.90, 25),
('Jaqueta Jeans', 'Jaqueta', 'Nic Ateliê', 249.90, 15),
('Blusa Tricot Gola Alta', 'Blusa', 'Nic Ateliê', 149.90, 30),
('Vestido Longo Festa', 'Vestido', 'Nic Ateliê', 349.90, 10),
('Calça Pantalona Linho', 'Calça', 'Nic Ateliê', 199.90, 22),
('Top Cropped Esportivo', 'Blusa', 'Nic Ateliê', 69.90, 48),
('Kimono Estampado', 'Kimono', 'Nic Ateliê', 169.90, 19);
SELECT COUNT(*) FROM produtos;
INSERT INTO pedidos (id_cliente, data_pedido, status_pedido) VALUES
(11, '2024-08-05', 'Entregue'), (12, '2024-08-10', 'Entregue'), (13, '2024-08-15', 'Entregue'),
(14, '2024-08-20', 'Cancelado'), (15, '2024-08-25', 'Entregue'), (16, '2024-09-02', 'Entregue'),
(17, '2024-09-08', 'Entregue'), (18, '2024-09-14', 'Entregue'), (19, '2024-09-20', 'Entregue'),
(20, '2024-09-26', 'Cancelado'), (21, '2024-10-03', 'Entregue'), (22, '2024-10-09', 'Entregue'),
(23, '2024-10-15', 'Entregue'), (24, '2024-10-21', 'Entregue'), (25, '2024-10-27', 'Entregue'),
(26, '2024-11-03', 'Entregue'), (27, '2024-11-09', 'Entregue'), (28, '2024-11-15', 'Cancelado'),
(29, '2024-11-21', 'Entregue'), (30, '2024-11-27', 'Entregue'), (11, '2024-12-03', 'Entregue'),
(12, '2024-12-09', 'Entregue'), (13, '2024-12-15', 'Entregue'), (14, '2024-12-20', 'Entregue'),
(15, '2024-12-24', 'Entregue'), (16, '2025-01-05', 'Entregue'), (17, '2025-01-11', 'Cancelado'),
(18, '2025-01-17', 'Entregue'), (19, '2025-01-23', 'Entregue'), (20, '2025-01-29', 'Entregue'),
(31, '2025-02-03', 'Entregue'), (32, '2025-02-08', 'Entregue'), (33, '2025-02-13', 'Entregue'),
(34, '2025-02-18', 'Entregue'), (35, '2025-02-23', 'Cancelado'), (36, '2025-02-28', 'Entregue'),
(37, '2025-03-05', 'Entregue'), (38, '2025-03-10', 'Entregue'), (39, '2025-03-15', 'Entregue'),
(40, '2025-03-20', 'Entregue'), (21, '2025-03-25', 'Entregue'), (22, '2025-03-30', 'Entregue'),
(23, '2025-04-04', 'Entregue'), (24, '2025-04-09', 'Cancelado'), (25, '2025-04-14', 'Entregue'),
(26, '2025-04-19', 'Entregue'), (27, '2025-04-24', 'Entregue'), (28, '2025-04-29', 'Entregue'),
(31, '2025-05-04', 'Entregue'), (32, '2025-05-09', 'Entregue'), (33, '2025-05-14', 'Entregue'),
(34, '2025-05-19', 'Entregue'), (35, '2025-05-24', 'Entregue'), (36, '2025-05-29', 'Cancelado'),
(37, '2025-06-03', 'Entregue'), (38, '2025-06-08', 'Entregue'), (39, '2025-06-13', 'Entregue'),
(40, '2025-06-18', 'Entregue'), (11, '2025-06-23', 'Entregue'), (12, '2025-06-28', 'Entregue'),
(13, '2025-07-02', 'Entregue'), (14, '2025-07-06', 'Entregue'), (15, '2025-07-10', 'Em processamento'),
(16, '2025-07-14', 'Entregue'), (17, '2025-07-18', 'Entregue'), (18, '2025-07-22', 'Em processamento'),
(19, '2025-07-26', 'Entregue'), (20, '2025-07-30', 'Entregue'), (5, '2024-08-12', 'Entregue'),
(6, '2024-09-18', 'Entregue'), (7, '2024-10-24', 'Entregue'), (8, '2024-11-30', 'Entregue'),
(9, '2024-12-16', 'Entregue'), (10, '2025-01-20', 'Entregue'), (2, '2025-02-26', 'Entregue'),
(3, '2025-03-14', 'Entregue'), (4, '2025-04-16', 'Entregue'), (6, '2025-05-18', 'Entregue'),
(7, '2025-06-20', 'Entregue'), (8, '2025-07-24', 'Entregue');
SELECT COUNT(*) FROM pedidos;
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(16, 1, 1, 189.90), (16, 11, 1, 139.90), (17, 2, 2, 129.90), (18, 5, 1, 179.90),
(19, 21, 1, 149.90), (20, 8, 1, 169.90), (21, 3, 1, 219.90), (22, 15, 2, 89.90),
(23, 9, 3, 79.90), (24, 12, 1, 159.90), (25, 6, 1, 259.90), (26, 25, 1, 169.90),
(27, 4, 1, 149.90), (28, 17, 1, 89.90), (29, 10, 1, 229.90), (30, 20, 1, 249.90),
(31, 1, 2, 189.90), (32, 22, 1, 349.90), (33, 7, 1, 299.90), (34, 13, 1, 119.90),
(35, 16, 1, 209.90), (36, 24, 1, 69.90), (37, 2, 1, 129.90), (38, 19, 1, 129.90),
(39, 5, 2, 179.90), (40, 23, 1, 199.90), (41, 8, 1, 169.90), (42, 14, 1, 189.90),
(43, 9, 1, 79.90), (44, 18, 1, 99.90), (45, 3, 1, 219.90), (46, 11, 2, 139.90),
(47, 6, 1, 259.90), (48, 21, 1, 149.90), (49, 25, 1, 169.90), (50, 1, 1, 189.90),
(51, 15, 1, 89.90), (52, 20, 1, 249.90), (53, 4, 1, 149.90), (54, 12, 2, 159.90),
(55, 17, 1, 89.90), (56, 10, 1, 229.90), (57, 22, 1, 349.90), (58, 7, 1, 299.90),
(59, 2, 1, 129.90), (60, 13, 1, 119.90), (61, 16, 1, 209.90), (62, 24, 2, 69.90),
(63, 19, 1, 129.90), (64, 5, 1, 179.90), (65, 23, 1, 199.90), (66, 8, 1, 169.90),
(67, 14, 1, 189.90), (68, 9, 2, 79.90), (69, 18, 1, 99.90), (70, 3, 1, 219.90),
(71, 11, 1, 139.90), (72, 6, 1, 259.90), (73, 21, 1, 149.90), (74, 25, 1, 169.90),
(75, 1, 1, 189.90), (76, 15, 1, 89.90), (77, 20, 1, 249.90), (78, 4, 2, 149.90),
(79, 12, 1, 159.90), (80, 17, 1, 89.90), (81, 10, 1, 229.90), (82, 22, 1, 349.90),
(83, 7, 1, 299.90), (84, 2, 1, 129.90), (85, 13, 1, 119.90), (86, 16, 1, 209.90),
(87, 24, 1, 69.90), (88, 19, 2, 129.90), (89, 5, 1, 179.90), (90, 23, 1, 199.90),
(91, 8, 1, 169.90), (92, 14, 1, 189.90), (93, 9, 1, 79.90), (94, 18, 1, 99.90),
(95, 3, 2, 219.90);
SELECT COUNT(*) FROM itens_pedido;
