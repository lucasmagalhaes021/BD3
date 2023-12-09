DROP TABLE IF EXISTS cartao,
    insignia,
    pais, 
    empresa, 
    usuario, 
    genero, 
    banimento, 
    jogo, 
    jogo_usuario, 
    conquista, 
    conquista_usuario,
    promocao, 
    aplicativo, 
    aplicativo_usuario,
    insignia,
    insignia_usuario,
    grupo,
    grupo_usuario,
    marcador,
    item,
    item_marcador,
    item_usuario,
    captura_de_tela;

CREATE TABLE cartao (
    numero VARCHAR(16) PRIMARY KEY,
    data_de_validade DATE NOT NULL,
    codigo_de_seguranca VARCHAR(3) NOT NULL
);

CREATE table pais (
    nome VARCHAR(50) PRIMARY KEY,
    quantidade_populacional INTEGER NOT NULL,
    idioma VARCHAR(50) NOT NULL
);

create table empresa (
    cnpj VARCHAR(14) PRIMARY KEY, 
    nome VARCHAR(100) NOT NULL,
    data_de_fundacao DATE NOT NULL,
    telefone VARCHAR(11) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    pais VARCHAR(100) NOT NULL,
    CONSTRAINT foreign_pais FOREIGN KEY(pais) REFERENCES pais(nome)
);

CREATE TABLE usuario (
    nome_do_usuario VARCHAR(100) PRIMARY KEY,
    primeiro_nome VARCHAR(100) NOT NULL,
    ultimo_nome VARCHAR(100) NOT NULL,
    data_de_nascimento DATE NOT NULL,
    pais VARCHAR(50) NOT NULL,
    ultimo_login TIMESTAMP,
    CONSTRAINT foreign_pais FOREIGN KEY(pais) REFERENCES pais(nome)
);

CREATE table genero (
    nome VARCHAR(100) PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL
);

create table jogo (
    nome VARCHAR(100) PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    data_de_lancamento DATE NOT null,
    preco INTEGER NOT NULL,
    empresa VARCHAR(14) NOT NULL,
    genero VARCHAR(100) NOT NULL,
    CONSTRAINT foreign_empresa FOREIGN KEY (empresa) REFERENCES empresa(cnpj),
    CONSTRAINT foreign_genero FOREIGN KEY (genero) REFERENCES genero(nome)
);

CREATE TABLE jogo_usuario (
    nome_do_usuario VARCHAR(100),
    nome_do_jogo VARCHAR(100),
    data_da_compra DATE NOT NULL,
    PRIMARY KEY (nome_do_usuario, nome_do_jogo),
    CONSTRAINT foreign_nome_do_usuario FOREIGN KEY (nome_do_usuario) REFERENCES usuario(nome_do_usuario),
    CONSTRAINT foreign_nome_do_jogo FOREIGN KEY (nome_do_jogo) REFERENCES jogo(nome)
);

CREATE table banimento (
    nome_do_usuario VARCHAR(100),
    nome_do_jogo VARCHAR(100),
    data_de_inicio DATE,
    data_de_termino DATE,
    motivo VARCHAR(255) NOT NULL,
    PRIMARY key (nome_do_usuario, nome_do_jogo, data_de_inicio, data_de_termino),
    CONSTRAINT foreign_nome_do_usuario FOREIGN KEY (nome_do_usuario) REFERENCES usuario(nome_do_usuario),
    CONSTRAINT foreign_nome_do_jogo FOREIGN KEY (nome_do_jogo) REFERENCES jogo(nome)
);

CREATE TABLE aplicativo (
    nome VARCHAR(100) PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    data_de_lancamento DATE NOT NULL,
    empresa VARCHAR(100) NOT NULL,
    CONSTRAINT foreign_empresa FOREIGN KEY (empresa) REFERENCES empresa(cnpj)
);

create table aplicativo_usuario (
    nome_do_usuario VARCHAR(100),
    nome_do_aplicativo VARCHAR(100),
    data_da_compra DATE NOT NULL,
    PRIMARY KEY (nome_do_usuario, nome_do_aplicativo),
    CONSTRAINT foreign_nome_do_usuario FOREIGN KEY (nome_do_usuario) REFERENCES usuario(nome_do_usuario),
    CONSTRAINT foreign_nome_do_aplicativo FOREIGN KEY (nome_do_aplicativo) REFERENCES aplicativo(nome)
);

CREATE TABLE insignia (
    nome VARCHAR(100) PRIMARY KEY,
    nivel_de_raridade INTEGER NOT NULL
);

create table insignia_usuario (
    nome_da_insignia VARCHAR(100),
    nome_do_usuario VARCHAR(100),
    data_da_conquista DATE NOT NULL,
    PRIMARY KEY (nome_da_insignia, nome_do_usuario),
    CONSTRAINT foreign_nome_da_insignia FOREIGN KEY (nome_da_insignia) REFERENCES insignia(nome),
    cONSTRAINT foreign_nome_do_usuario FOREIGN KEY (nome_do_usuario) REFERENCES usuario(nome_do_usuario)
);

CREATE TABLE conquista (
    nome VARCHAR(100),
    nome_do_jogo VARCHAR(100),
    descricao VARCHAR(255) NOT NULL,
    imagem VARCHAR(255) NOT NULL,
    PRIMARY KEY (nome, nome_do_jogo),
    CONSTRAINT foreign_nome_do_jogo FOREIGN KEY (nome_do_jogo) REFERENCES jogo(nome)
);

create table conquista_usuario (
    nome_da_conquista VARCHAR(100),
    nome_do_jogo VARCHAR(100),
    nome_do_usuario VARCHAR(100),
    data_da_conquista DATE NOT NULL,
    PRIMARY KEY (nome_da_conquista, nome_do_usuario, nome_do_jogo),
    CONSTRAINT foreign_nome_da_conquista FOREIGN KEY (nome_da_conquista, nome_do_jogo) REFERENCES conquista(nome, nome_do_jogo),
    cONSTRAINT foreign_nome_do_usuario FOREIGN KEY (nome_do_usuario) REFERENCES usuario(nome_do_usuario)
);

create table promocao (
    jogo VARCHAR(100),
    data_de_inicio DATE,
    data_de_termino DATE,
    desconto_preco INTEGER NOT NULL,
    PRIMARY KEY (jogo, data_de_inicio, data_de_termino),
    CONSTRAINT foreign_jogo FOREIGN KEY (jogo) REFERENCES jogo(nome)
);

CREATE TABLE grupo (
    nome VARCHAR(100) PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    data_da_fundacao DATE NOT NULL
);

CREATE TABLE grupo_usuario (
  nome_do_usuario VARCHAR(100),
  nome_do_grupo VARCHAR(100),
  data_da_adesao DATE NOT NULL,
  PRIMARY key (nome_do_usuario, nome_do_grupo),
  cONSTRAINT foreign_nome_do_usuario FOREIGN KEY (nome_do_usuario) REFERENCES usuario(nome_do_usuario),
  cONSTRAINT foreign_nome_do_grupo FOREIGN KEY (nome_do_grupo) REFERENCES grupo(nome)
);

CREATE TABLE marcador (
    nome VARCHAR(100) PRIMARY KEY
);

CREATE TABLE item (
    nome VARCHAR(100),
    nome_do_jogo VARCHAR(100),
    PRIMARY KEY (nome, nome_do_jogo),
    CONSTRAINT foreign_jogo FOREIGN KEY (nome_do_jogo) REFERENCES jogo(nome)
);

CREATE TABLE item_marcador (
    nome_do_item VARCHAR(100),
    nome_do_jogo VARCHAR(100),
    nome_do_marcador VARCHAR(100),
    PRIMARY KEY (nome_do_item, nome_do_jogo, nome_do_marcador),
    CONSTRAINT foreign_nome_do_item FOREIGN KEY (nome_do_item, nome_do_jogo) REFERENCES item(nome, nome_do_jogo),
    CONSTRAINT foreign_nome_do_marcador FOREIGN KEY (nome_do_marcador) REFERENCES marcador(nome)
);

CREATE TABLE item_usuario (
    nome_do_item VARCHAR(100),
    nome_do_jogo VARCHAR(100),
    nome_do_usuario VARCHAR(100),
    PRIMARY KEY (nome_do_item, nome_do_jogo, nome_do_usuario),
    CONSTRAINT foreign_nome_do_item FOREIGN KEY (nome_do_item, nome_do_jogo) REFERENCES item(nome, nome_do_jogo),
    CONSTRAINT foreign_nome_do_usuario FOREIGN KEY (nome_do_usuario) REFERENCES usuario(nome_do_usuario)
);

CREATE TABLE captura_de_tela (
    titulo VARCHAR(100),
    data_de_captura DATE,
    nome_do_usuario VARCHAR(100) NOT NULL,
    url VARCHAR(255) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    PRIMARY key (titulo, data_de_captura),
    CONSTRAINT foreign_nome_do_usuario FOREIGN KEY (nome_do_usuario) REFERENCES usuario(nome_do_usuario)
);
