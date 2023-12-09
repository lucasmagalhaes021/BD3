
DROP VIEW IF EXISTS jogos_em_promocao_nov_2023;

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

SELECT * FROM jogos_em_promocao_nov_2023;
