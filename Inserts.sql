-- Populando a tabela 'pais'
INSERT INTO pais (nome, quantidade_populacional, idioma)
VALUES ('Brasil', 210147125, 'Português'),
       ('Estados Unidos', 331002651, 'Inglês'),
       ('China', 1444216107, 'Chinês'),
       ('Índia', 1380004385, 'Hindi');

-- Populando a tabela 'empresa'
INSERT INTO empresa (cnpj, nome, data_de_fundacao, telefone, endereco, pais)
VALUES ('12345678901234', 'Empresa A', '2000-01-01', '123456789', 'Rua A, 123', 'Brasil'),
       ('23456789012345', 'Empresa B', '1995-05-15', '987654321', 'Avenue B, 456', 'Estados Unidos'),
       ('34567890123456', 'Empresa C', '2008-10-20', '111222333', 'Calle C, 789', 'China');

-- Populando a tabela 'usuario'
INSERT INTO usuario (nome_do_usuario, primeiro_nome, ultimo_nome, data_de_nascimento, pais, ultimo_login)
VALUES ('user1', 'John', 'Doe', '1990-03-15', 'Estados Unidos', '2023-12-09 12:30:00'),
       ('user2', 'Maria', 'Silva', '1985-07-20', 'Brasil', '2023-12-08 14:45:00'),
       ('user3', 'Li', 'Chen', '1995-12-05', 'China', NULL);

-- Populando a tabela 'genero'
INSERT INTO genero (nome, descricao)
VALUES ('Ação', 'Jogos com foco em ação e aventura'),
       ('Esporte', 'Jogos de esportes virtuais'),
       ('Estratégia', 'Jogos de estratégia e simulação');

-- Populando a tabela 'jogo'
INSERT INTO jogo (nome, descricao, data_de_lancamento, preco, empresa, genero)
VALUES ('Need For Speed', 'Descrição do Jogo 1', '2022-05-10', 50, '12345678901234', 'Ação'),
       ('Far Cry 5', 'Descrição do Jogo 2', '2021-08-20', 30, '23456789012345', 'Ação'),
       ('Gta 6', 'Descrição do Jogo 3', '2023-01-15', 40, '34567890123456', 'Ação');

-- Populando a tabela 'jogo_usuario'
INSERT INTO jogo_usuario (nome_do_usuario, nome_do_jogo, data_da_compra)
VALUES ('user1', 'Game1', '2023-12-01'),
       ('user2', 'Game2', '2023-11-25'),
       ('user3', 'Game3', '2023-12-05');

-- Populando a tabela 'insignia'
INSERT INTO insignia (nome, nivel_de_raridade)
VALUES ('Insignia1', 1),
       ('Insignia2', 2),
       ('Insignia3', 3);

-- Populando a tabela 'conquista'
INSERT INTO conquista (nome, nome_do_jogo, descricao, imagem)
VALUES ('Conquista1', 'Game1', 'Conquista difícil de ser alcançada', 'imagem1.png'),
       ('Conquista2', 'Game2', 'Complete todos os níveis', 'imagem2.png'),
       ('Conquista3', 'Game3', 'Conquista secreta', 'imagem3.png');

-- Populando a tabela 'aplicativo'
INSERT INTO aplicativo (nome, descricao, data_de_lancamento, empresa)
VALUES ('App1', 'Descrição do App 1', '2023-02-01', '12345678901234'),
       ('App2', 'Descrição do App 2', '2023-04-15', '23456789012345'),
       ('App3', 'Descrição do App 3', '2023-06-20', '34567890123456');

-- Populando a tabela 'aplicativo_usuario'
INSERT INTO aplicativo_usuario (nome_do_usuario, nome_do_aplicativo, data_da_compra)
VALUES ('user1', 'App1', '2023-03-10'),
       ('user2', 'App2', '2023-05-18'),
       ('user3', 'App3', '2023-07-01');

-- Populando a tabela 'promocao'
INSERT INTO promocao (jogo, data_de_inicio, data_de_termino, desconto_preco)
VALUES ('Need For Speed', '2023-11-01', '2023-11-5', 3),
       ('Far Cry 5', '2023-11-10', '2023-11-17', 10),
       ('Gta 6', '2023-11-15', '2023-11-25', 6);
-- Populando a tabela 'grupo'
INSERT INTO grupo (nome, descricao, data_da_fundacao)
VALUES ('Grupo1', 'Descrição do Grupo 1', '2022-05-01'),
       ('Grupo2', 'Descrição do Grupo 2', '2021-10-15'),
       ('Grupo3', 'Descrição do Grupo 3', '2023-01-01');

-- Populando a tabela 'grupo_usuario'
INSERT INTO grupo_usuario (nome_do_usuario, nome_do_grupo, data_da_adesao)
VALUES ('user1', 'Grupo1', '2022-05-10'),
       ('user2', 'Grupo2', '2021-11-01'),
       ('user3', 'Grupo3', '2023-01-15');

-- Populando a tabela 'marcador'
INSERT INTO marcador (nome)
VALUES ('Marcador1'),
       ('Marcador2'),
       ('Marcador3');

-- Populando a tabela 'item'
INSERT INTO item (nome, nome_do_jogo)
VALUES ('Item1', 'Game1'),
       ('Item2', 'Game2'),
       ('Item3', 'Game3');

-- Populando a tabela 'item_marcador'
INSERT INTO item_marcador (nome_do_item, nome_do_jogo, nome_do_marcador)
VALUES ('Item1', 'Game1', 'Marcador1'),
       ('Item2', 'Game2', 'Marcador2'),
       ('Item3', 'Game3', 'Marcador3');

-- Populando a tabela 'item_usuario'
INSERT INTO item_usuario (nome_do_item, nome_do_jogo, nome_do_usuario)
VALUES ('Item1', 'Game1', 'user1'),
       ('Item2', 'Game2', 'user2'),
       ('Item3', 'Game3', 'user3');

-- Populando a tabela 'captura_de_tela'
INSERT INTO captura_de_tela (titulo, data_de_captura, nome_do_usuario, url, descricao)
VALUES ('Screenshot1', '2023-04-05', 'user1', 'url1.png', 'Descrição da captura 1'),
       ('Screenshot2', '2023-05-15', 'user2', 'url2.png', 'Descrição da captura 2'),
       ('Screenshot3', '2023-06-25', 'user3', 'url3.png', 'Descrição da captura 3');

-- Populando a tabela 'cartao'
INSERT INTO cartao (numero, data_de_validade, codigo_de_seguranca, owner)
VALUES ('1234567812345678', '2024-12-01', '123', 'user1'),
       ('2345678923456789', '2023-11-01', '456', 'user2'),
       ('3456789034567890', '2025-03-01', '789', 'user3');
