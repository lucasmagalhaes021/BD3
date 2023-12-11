CREATE INDEX idx_genero_empresa ON jogo(genero, empresa);

CREATE INDEX idx_genero ON jogo(genero);

CREATE INDEX idx_pais_empresa ON empresa(pais, cnpj);

CREATE INDEX idx_nome_do_usuario_jogo_usuario ON jogo_usuario(nome_do_usuario);

CREATE INDEX idx_nivel_de_raridade ON insignia(nivel_de_raridade);

CREATE INDEX idx_populacao_pais_usuario ON pais(nome, quantidade_populacional);

CREATE INDEX idx_idioma_pais_usuario ON pais(idioma, nome);

CREATE INDEX idx_pais_empresa_item ON empresa(pais, cnpj);

CREATE INDEX idx_nome_do_usuario_grupo_usuario ON grupo_usuario(nome_do_usuario);


-- Selecionar pais, empresa e média de preço dos jogos pelo genero FPS
SELECT AVG(j1.preco), e1.nome, e1.pais
from jogo j1
inner join empresa e1
on j1.empresa = e1.cnpj
WHERE j1.genero = 'FPS'
GROUP by e1.nome, e1.pais, j1.preco;

-- Selecionar a quantidade de jogos agrupado pelo genero de Ação
SELECT COUNT(*) Quantidade, genero 
from jogo 
where genero = 'Ação'
GROUP BY genero;

-- Selecionar  os jogos e empresa que são brasileiras 
SELECT j1.nome, e1.nome, e1.pais
from jogo j1
inner join empresa e1
on j1.empresa = e1.cnpj
where e1.pais = 'Brasil';


-- Selecionar a quantidade de jogos de cada usuario
SELECT COUNT (*) Quantidade, nome_do_usuario 
from jogo_usuario GROUP BY nome_do_usuario;

-- Selecionar as insinsignias que tem o nivel de raridade maior ou igual a 3
SELECT nome, nivel_de_raridade from insignia where nivel_de_raridade >= 3;

-- Selecionar nome do pais, idioma e Usuários com população maior que 200M
SELECT p1.nome, p1.idioma ,u1.primeiro_nome, u1.ultimo_nome 
FROM usuario u1
inner join pais p1
on u1.pais = p1.nome
WHERE u1.pais = p1.nome AND p1.quantidade_populacional > 200000000
GROUP by p1.nome, p1.idioma ,u1.primeiro_nome, u1.ultimo_nome;

-- Selecionar ultimo login e o pais dos Usuários que moram em países que falam inglês e portugues, 
SELECT u1.ultimo_login, u1.primeiro_nome, u1.ultimo_nome, p1.nome
FROM usuario u1
INNER JOIN pais p1 ON u1.pais = p1.nome
WHERE (p1.idioma = 'Inglês' OR p1.idioma = 'Português')
GROUP BY u1.ultimo_login, u1.primeiro_nome, u1.ultimo_nome, p1.nome;

-- Selecionar a somo de todos os jogos agrupado pelo usuario
SELECT SUM(j1.preco) AS Valor_Total, ju1.nome_do_usuario
FROM jogo_usuario ju1
INNER JOIN jogo j1
ON ju1.nome_do_jogo = j1.nome
GROUP BY ju1.nome_do_usuario;

-- Selecionar todos os itens de jogos ondem a empresa tem como pais a Brasil
SELECT i1.nome, j1.nome, e1.nome
FROM item i1
INNER JOIN jogo j1
ON i1.nome_do_jogo = j1.nome
INNER JOIN empresa e1
ON j1.empresa = e1.cnpj
WHERE e1.pais = 'Brasil';

-- Seleciona todos os grupos de cada usuario
SELECT gu1.nome_do_grupo, u1.primeiro_nome,u1.ultimo_nome
FROM usuario u1
INNER JOIN grupo_usuario gu1 ON gu1.nome_do_usuario = u1.nome_do_usuario
GROUP BY gu1.nome_do_grupo, u1.primeiro_nome, u1.ultimo_nome;





