-- PS: Algumas funções estão no arquivo de trigger 
-- Criação de uma função para calcular a media dos precos pelo genêros
CREATE OR REPLACE FUNCTION calculaMediaPrecoPorGenero(genero VARCHAR(100))
RETURNS DECIMAL(10, 2) AS $$
DECLARE
    media_preco DECIMAL(10, 2);
BEGIN
    SELECT AVG(j.preco) INTO media_preco
    FROM jogo j
    INNER JOIN empresa e ON j.empresa = e.cnpj
    WHERE j.genero = genero; 
    RETURN media_preco;
END;
$$ LANGUAGE plpgsql;

-- Inserir insgnia
CREATE OR REPLACE FUNCTION inserir_insignia()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO insignia (nome, nivel_de_raridade)
  VALUES (NEW.nomeInsignia, NEW.nivel_de_raridade);

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- fazer a atualização de um preço de um jogo
CREATE OR REPLACE FUNCTION atualizar_preco_jogo()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO insignia (nome, nivel_de_raridade)
  VALUES (NEW.nomeInsignia, NEW.nivel_de_raridade);

  UPDATE jogo
  SET preco = NEW.novo_preco_param
  WHERE nome = NEW.nome;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;


  