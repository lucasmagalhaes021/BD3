-- Criação da trigger
CREATE OR REPLACE FUNCTION empresa_trigger()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.data_de_fundacao <> OLD.data_de_fundacao THEN
    RAISE EXCEPTION 'Não é permitido alterar a data de fundação da empresa.';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Associação da trigger à tabela 'empresa'
CREATE TRIGGER empresa_trigger
BEFORE UPDATE ON empresa
FOR EACH ROW
EXECUTE FUNCTION empresa_trigger();




CREATE OR REPLACE FUNCTION inserir_comissao() RETURNS TRIGGER
AS $$
BEGIN
  INSERT INTO comissao_jogo (jogo_nome, valor_comissao)
  VALUES (NEW.nome, NEW.preco * 0.6);
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_inserir_comissao
AFTER INSERT ON jogo
FOR EACH ROW
EXECUTE PROCEDURE inserir_comissao();




