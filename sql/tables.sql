DROP TYPE IF EXISTS gender CASCADE;
DROP TYPE IF EXISTS state_auction CASCADE;

DROP TABLE IF EXISTS Pais CASCADE;
DROP TABLE IF EXISTS HistoricoBanidos CASCADE;
DROP TABLE IF EXISTS Mensagem CASCADE;
DROP TABLE IF EXISTS Pagamento CASCADE;
DROP TABLE IF EXISTS Licitacao CASCADE;

DROP TABLE IF EXISTS Categoria CASCADE;
DROP TABLE IF EXISTS Utilizador CASCADE;

DROP TABLE IF EXISTS ClassificacaoLeilao CASCADE;
DROP TABLE IF EXISTS EstadoLeilao CASCADE;
DROP TABLE IF EXISTS Leilao CASCADE;
DROP TABLE IF EXISTS UtilizadorAdministrador CASCADE;
DROP TABLE IF EXISTS UtilizadorModerador CASCADE;
DROP TABLE IF EXISTS AssociacaoBanidos CASCADE;

CREATE TYPE gender AS ENUM (
    'masculino',
    'feminino'
);

CREATE TYPE state_auction AS ENUM (
    'cancelado',
    'aberto',
    'fechado'  
);

CREATE TABLE Pais (
    id_pais SERIAL,
    nome_pais CHARACTER(256) NOT NULL  
);

CREATE TABLE Utilizador (
    id_utilizador SERIAL,
    nome CHARACTER(256) NOT NULL,
    descricao CHARACTER(256),
    genero gender DEFAULT 'masculino'::gender,
    imagem_utilizador CHARACTER(256) DEFAULT 'img\default_user.png',
    datanasc DATE NOT NULL,
    e_mail CHARACTER(256) NOT NULL,
    password CHARACTER(256) NOT NULL,
    classificacao NUMERIC DEFAULT 0,
    banido BOOLEAN,
    id_pais INTEGER
);

CREATE TABLE UtilizadorModerador (
    id_utilizador INTEGER
);

CREATE TABLE UtilizadorAdministrador (
    id_utilizador INTEGER
);

CREATE TABLE HistoricoBanidos (
    id_historico_banidos SERIAL,
    id_utilizador INTEGER,
    id_moderador INTEGER,
    data_banicao DATE NOT NULL DEFAULT (now()::DATE),
    data_fim DATE NOT NULL,
    motivo CHARACTER(256) NOT NULL
);

CREATE TABLE AssociacaoBanidos (
    id_utilizador INTEGER,
    id_historico_banidos INTEGER
      
);

CREATE TABLE Mensagem (
    id_mensagem SERIAL,
    id_emissor INTEGER,
    id_recetor INTEGER,
    conteudo CHARACTER(256) NOT NULL,
    data_mensagem DATE NOT NULL DEFAULT (now()::DATE)
);

CREATE TABLE Categoria (
    id_categoria SERIAL,
    descricao CHARACTER(256)
);

CREATE TABLE Leilao (
    id_leilao SERIAL,
    nome_produto CHARACTER(256) NOT NULL,
    descricao CHARACTER(256) NOT NULL,
    imagem_produto CHARACTER(256) DEFAULT 'img\default_user.png',
    data_inicio DATE NOT NULL DEFAULT (now()::DATE),
    data_fim DATE NOT NULL,
    valor_base NUMERIC NOT NULL,
    id_vendedor INTEGER,
    id_estado_leilao INTEGER,
    id_categoria INTEGER,
    id_moderador INTEGER
);

CREATE TABLE ClassificacaoLeilao (
    id_licitador INTEGER, 
    id_leilao INTEGER,
    valor_classificacao DECIMAL DEFAULT 0
);

CREATE TABLE Licitacao (
    id_licitacao SERIAL,
    id_leilao INTEGER,
    id_utilizador INTEGER,
    data_licitacao DATE NOT NULL DEFAULT (now()::DATE),
    valor_licitacao DECIMAL NOT NULL,
    vencedor BOOLEAN
);

CREATE TABLE EstadoLeilao (
    id_estado_leilao SERIAL,
    valor_atual DECIMAL,
    estado_leilao state_auction DEFAULT 'fechado'::state_auction,
    motivo CHARACTER(256) DEFAULT NULL
);

CREATE TABLE Pagamento (
    id_pagamento SERIAL,
    quantia DECIMAL NOT NULL,
    token_confirmacao CHARACTER(256),
    token_pagamento CHARACTER(256),
    data_pagamento DATE NOT NULL DEFAULT (now()::DATE),
    morada_envio CHARACTER(256) NOT NULL,
    id_leilao INTEGER,
    id_utilizador INTEGER
);

/* Inicio das primary keys */
ALTER TABLE Pais
    ADD CONSTRAINT pais_pkey PRIMARY KEY (id_pais);

ALTER TABLE Utilizador
    ADD CONSTRAINT utilizador_pkey PRIMARY KEY (id_utilizador);
    
ALTER TABLE Leilao
    ADD CONSTRAINT leilao_pkey PRIMARY KEY (id_leilao);
    
ALTER TABLE UtilizadorModerador
    ADD CONSTRAINT utilizador_moderador_pkey PRIMARY KEY (id_utilizador);
    
ALTER TABLE UtilizadorAdministrador
    ADD CONSTRAINT utilizador_administrador_pkey PRIMARY KEY (id_utilizador);
   
ALTER TABLE HistoricoBanidos
    ADD CONSTRAINT historico_banidos_pkey PRIMARY KEY (id_historico_banidos);
    
ALTER TABLE ClassificacaoLeilao
    ADD CONSTRAINT class_leilao PRIMARY KEY (id_licitador, id_leilao);
    
ALTER TABLE Mensagem
    ADD CONSTRAINT mensagem_pkey PRIMARY KEY (id_mensagem);
    
ALTER TABLE Categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id_categoria);
    
ALTER TABLE Licitacao
    ADD CONSTRAINT licitacao_pkey PRIMARY KEY (id_licitacao);
    
ALTER TABLE EstadoLeilao
    ADD CONSTRAINT estado_leilao_pkey PRIMARY KEY (id_estado_leilao);
    
ALTER TABLE Pagamento
    ADD CONSTRAINT pagamento_pkey PRIMARY KEY (id_pagamento);
/* Fim das primary keys */

/* Inicio das foreign keys */
ALTER TABLE UtilizadorModerador
    ADD CONSTRAINT utilizador_moderador_pkey1 FOREIGN KEY (id_utilizador) REFERENCES Utilizador(id_utilizador);
    
ALTER TABLE UtilizadorAdministrador
    ADD CONSTRAINT utilizador_administrador_pkey1 FOREIGN KEY (id_utilizador) REFERENCES Utilizador(id_utilizador);
    
ALTER TABLE HistoricoBanidos
    ADD CONSTRAINT historico_banidos_pkey1 FOREIGN KEY (id_utilizador) REFERENCES Utilizador(id_utilizador);
    
ALTER TABLE ClassificacaoLeilao
    ADD CONSTRAINT class_leilao1 FOREIGN KEY (id_licitador) REFERENCES Utilizador(id_utilizador);
    
ALTER TABLE ClassificacaoLeilao
    ADD CONSTRAINT class_leilao2 FOREIGN KEY (id_leilao) REFERENCES Leilao(id_leilao);
    
ALTER TABLE AssociacaoBanidos
    ADD CONSTRAINT associacao_banidos_leilao1 FOREIGN KEY (id_utilizador) REFERENCES Utilizador(id_utilizador);
    
ALTER TABLE AssociacaoBanidos
    ADD CONSTRAINT associacao_banidos_leilao2 FOREIGN KEY (id_historico_banidos) REFERENCES HistoricoBanidos(id_historico_banidos);

ALTER TABLE Utilizador
    ADD CONSTRAINT utilizador_fkey FOREIGN KEY (id_pais) REFERENCES Pais(id_pais);
    
ALTER TABLE HistoricoBanidos
    ADD CONSTRAINT historico_banidos_fkey FOREIGN KEY (id_moderador) REFERENCES UtilizadorModerador(id_utilizador);
    
ALTER TABLE Mensagem
    ADD CONSTRAINT mensagem_fkey1 FOREIGN KEY (id_emissor) REFERENCES Utilizador(id_utilizador);
    
ALTER TABLE Mensagem
    ADD CONSTRAINT mensagem_fkey2 FOREIGN KEY (id_recetor) REFERENCES Utilizador(id_utilizador);
    
ALTER TABLE Leilao
    ADD CONSTRAINT leilao_fkey1 FOREIGN KEY (id_vendedor) REFERENCES Utilizador(id_utilizador);
    
ALTER TABLE Leilao
    ADD CONSTRAINT leilao_fkey2 FOREIGN KEY (id_moderador) REFERENCES UtilizadorModerador(id_utilizador);

ALTER TABLE Leilao
    ADD CONSTRAINT leilao_fkey3 FOREIGN KEY (id_estado_leilao) REFERENCES EstadoLeilao(id_estado_leilao);
    
ALTER TABLE Leilao
    ADD CONSTRAINT leilao_fkey4 FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria);
    
ALTER TABLE Licitacao
    ADD CONSTRAINT licitacao_fkey1 FOREIGN KEY (id_leilao) REFERENCES Leilao(id_leilao);
    
ALTER TABLE Licitacao
    ADD CONSTRAINT licitacao_fkey2 FOREIGN KEY (id_utilizador) REFERENCES Utilizador(id_utilizador);
   
ALTER TABLE Pagamento
    ADD CONSTRAINT pagamento_fkey1 FOREIGN KEY (id_leilao) REFERENCES Leilao(id_leilao);
    
ALTER TABLE Pagamento
    ADD CONSTRAINT pagamento_fkey2 FOREIGN KEY (id_utilizador) REFERENCES Utilizador(id_utilizador);
/* Fim das foreign keys */

/* Inicio dos uniques */
ALTER TABLE Pais
    ADD CONSTRAINT pais_unique UNIQUE(nome_pais);
  
ALTER TABLE Utilizador
    ADD CONSTRAINT utilizador_unique UNIQUE (e_mail);
    
ALTER TABLE Categoria
    ADD CONSTRAINT categoria_unique UNIQUE (descricao);
/* Fim dos uniques */

/* Inicio dos indexs */
CREATE UNIQUE INDEX Index_e_mail ON Utilizador USING btree (e_mail);

CREATE UNIQUE INDEX Index_pais ON Pais USING btree (nome_pais);

CREATE INDEX leilao_text ON Leilao USING gin(to_tsvector('portuguese', descricao));

CREATE INDEX Leilao_nome ON Leilao USING gin(to_tsvector('portuguese', nome_produto));

CREATE INDEX Utilizador_nome ON Utilizador USING gin(to_tsvector('portuguese', nome));

CREATE INDEX leilao_id_cat ON Leilao USING btree(id_categoria);
/* Fim dos indexs */

/* Inicio dos checks */
ALTER TABLE Utilizador ADD CONSTRAINT maior_18 CHECK (now()::DATE - datanasc > 18);
ALTER TABLE HistoricoBanidos ADD CONSTRAINT fim_maior_inicio_banidos CHECK (data_banicao < data_fim);
ALTER TABLE Mensagem ADD CONSTRAINT emissor_nao_recetor CHECK (id_emissor <> id_recetor);
ALTER TABLE Leilao ADD CONSTRAINT fim_maior_inicio_leilao CHECK (data_inicio < data_fim);
/* Fim dos checks */