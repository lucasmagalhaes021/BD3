
DROP VIEW IF EXISTS jogos_em_promocao_nov_2023;
DROP VIEW IF EXISTS jogos_2023_empresas_estados_unidos;

CREATE VIEW jogos_em_promocao_nov_2023 AS
SELECT
    j.nome AS nome_do_jogo,
    j.preco AS preco_original,
    p.desconto_preco AS preco_desconto,
    p.data_de_inicio,
    p.data_de_termino
FROM
    promocao p
    JOIN jogo j ON p.jogo = j.nome
WHERE
    EXTRACT(MONTH FROM p.data_de_inicio) = 11
    AND EXTRACT(YEAR FROM p.data_de_inicio) = 2023;

-- Criação de uma função para formatar a data
CREATE OR REPLACE FUNCTION formatar_data(data_original DATE)
RETURNS VARCHAR AS $$
BEGIN
  RETURN TO_CHAR(data_original, 'DD/MM/YYYY');
END;
$$ LANGUAGE plpgsql;

-- Criação da view usando a função de formatação
CREATE OR REPLACE VIEW jogos_2023_empresas_estados_unidos AS
SELECT
    j.nome AS nome_do_jogo,
    j.descricao,
    formatar_data(j.data_de_lancamento) AS data_de_lancamento_formatada,
    j.preco,
    e.nome AS nome_da_empresa,
    e.telefone,
    e.endereco
FROM
    jogo j
    JOIN empresa e ON j.empresa = e.cnpj
WHERE
    EXTRACT(YEAR FROM j.data_de_lancamento) = 2023
    AND e.pais = 'Estados Unidos';


SELECT * FROM jogos_em_promocao_nov_2023;
SELECT * FROM jogos_2023_empresas_estados_unidos;

