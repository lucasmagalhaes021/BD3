-- Teste Trigger 1:

INSERT INTO empresa (cnpj, nome, data_de_fundacao, telefone, endereco, pais)
VALUES ('12345678901234', 'Empresa A', '2000-01-01', '123456789', 'Rua A, 123', 'Brasil');

-- Atualização da data de fundação da empresa 'Empresa A'
UPDATE empresa
SET data_de_fundacao = '2021-01-01'
WHERE cnpj = '12345678901234';


-- Teste Trigger 2:

-- Inserir dados na tabela 'pais' (caso ainda não tenha)
INSERT INTO pais (nome, quantidade_populacional, idioma)
VALUES ('Belgica', 212559417, 'Belga');

-- Inserir dados na tabela 'empresa' (caso ainda não tenha)
INSERT INTO empresa (cnpj, nome, data_de_fundacao, telefone, endereco, pais)
VALUES ('9876543253436', 'Empresa D', '2020-02-15', '555444333', 'Street X, 789', 'Belgica');

-- Inserir dados na tabela 'genero' (caso ainda não tenha)
INSERT INTO genero (nome, descricao)
VALUES ('Casual', 'Jogo casuais');

-- Inserir dados na tabela 'jogo' e acionar a trigger
INSERT INTO jogo (nome, descricao, data_de_lancamento, preco, empresa, genero)
VALUES ('Game7', 'Descrição do Jogo 7', '2023-01-20', 70, '98765432109876', 'Casual');

