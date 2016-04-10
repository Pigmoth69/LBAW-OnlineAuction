CREATE TYPE gender AS ENUM (
    'masculino',
    'feminino'
);

CREATE TYPE state_auction AS ENUM (
    'cancelado',
    'aberto',
    'fechado'  
);

CREATE TABLE "Pais" (
    id_pais SERIAL,
    nome_pais CHARACTER(256) NOT NULL  
);

CREATE TABLE "Utilizador" (
    id_utilizador SERIAL,
    nome CHARACTER(256) NOT NULL,
    descricao CHARACTER(256),
    genero gender DEFAULT 'masculino'::gender,
    imagem_utilizador CHARACTER(256) DEFAULT "img\default_user.png",
    datanasc DATE NOT NULL,
    e-mail CHARACTER(256) NOT NULL,
    password CHARACTER(256) NOT NULL,
    classificacao NUMERIC DEFAULT 0,
    banido BOOLEAN,
    id_pais INTEGER
    CONSTRAINT "maior_18" CHECK (now()::DATE - datanasc > 18)
);

CREATE TABLE "UtilizadorModerador" (
    id_utilizador INTEGER REFERENCES "Utilizador"(id_utilizador)
);

CREATE TABLE "UtilizadorAdministrador" (
    id_utilizador INTEGER REFERENCES "Utilizador"(id_utilizador)
);

CREATE TABLE "HistoricoBanidos" (
    id_utilizador INTEGER REFERENCES "Utilizador"(id_utilizador),
    id_moderador INTEGER,
    data_banicao DATE NOT NULL DEFAULT (now()::DATE),
    data_fim DATE NOT NULL,
    motivo CHARACTER(256) NOT NULL
    CONSTRAINT "fim_maior_inicio_banidos" CHECK (data_banicao < data_fim)
);

CREATE TABLE "Mensagem" (
    id_mensagem SERIAL,
    id_emissor INTEGER,
    id_recetor INTEGER,
    conteudo CHARACTER(256) NOT NULL,
    data_mensagem DATE NOT NULL DEFAULT (now()::DATE),
    CONSTRAINT "emissor_nao_recetor" CHECK (id_emissor <> id_recetor),
);

CREATE TABLE "Categoria" (
    id_categoria SERIAL,
    descricao CHARACTER(256)
);

CREATE TABLE "Leilao" (
    id_leilao SERIAL,
    nome_produto CHARACTER(256) NOT NULL,
    descricao CHARACTER(256) NOT NULL,
    imagem_produto CHARACTER(256) DEFAULT "img\default_product.png",
    data_inicio DATE NOT NULL DEFAULT (now()::DATE),
    data_fim DATE NOT NULL,
    valor_base NUMERIC NOT NULL,
    id_vendedor INTEGER,
    id_estado_leilao INTEGER,
    id_categoria INTEGER,
    id_moderador INTEGER,
    CONSTRAINT "fim_maior_inicio_leilao" CHECK (data_inicio < data_fim),
    CONSTRAINT "id_vendedor_diferente_id_licitador" CHECK (id_vendedor <> (SELECT id_licitador FROM Licitacao WHERE Licitacao.id_leilao = Leilao.id_leilao))
);

CREATE TABLE "ClassificaoLeilao" (
    id_licitador INTEGER REFERENCES "Utilizador"(id_utilizador), 
    id_leilao INTEGER REFERENCES "Leilao"(id_leilao),
    valor_classificao DECIMAL DEFAULT 0
);

CREATE TABLE "Licitacao" (
    id_licitacao SERIAL,
    id_leilao INTEGER,
    id_utilizador INTEGER,
    data_licitacao DATE NOT NULL DEFAULT (now()::DATE),
    valor_licitacao DECIMAL NOT NULL,
    vencedor BOOLEAN,
    CONSTRAINT "valor_maior_base" CHECK (valor_licitacao > (SELECT valor_base FROM Leilao WHERE Licitacao.id_leilao = Leilao.id_leilao))
    CONSTRAINT "valor_maior_atual" CHECK (valor_licitacao > (SELECT valor_base FROM Leilao WHERE Licitacao.id_leilao = Leilao.id_leilao))
);

CREATE TABLE "EstadoLeilao" (
    id_estado_leilao SERIAL,
    valor_atual DECIMAL,
    estado_leilao state_auction DEFAULT 'fechado'::state_auction,
    motivo CHARACTER(256) DEFAULT NULL
);

CREATE TABLE "Pagamento" (
    id_pagamento SERIAL,
    quantia DECIMAL NOT NULL,
    token_confirmacao CHARACTER(256),
    token_pagamento CHARACTER(256),
    data_pagamento DATE NOT NULL DEFAULT (now()::DATE),
    morada_envio CHARACTER(256) NOT NULL,
    id_leilao INTEGER,
    id_utilizador INTEGER,
    CONSTRAINT "maior_licitacao" CHECK (quantia = quantia = (SELECT valor_actual FROM Licitacao WHERE Pagamento.id_leilao = Licitacao.id_leilao AND Pagamento.id_utilizador = Licitacao.id_utilizador AND Licitacao.vencedor = true))
);

ALTER TABLE ONLY "Pais"
    ADD CONSTRAINT "pais_pkey" PRIMARY KEY (id_pais)

ALTER TABLE ONLY "Pais"
    ADD CONSTRAINT "pais_unique" UNIQUE(nome_pais)
    
ALTER TABLE ONLY "Utilizador"
    ADD CONSTRAINT "utilizador_pkey" PRIMARY KEY (id_utilizador)
    
ALTER TABLE ONLY "Utilizador"
    ADD CONSTRAINT "utilizador_unique" UNIQUE (e-mail)
   
ALTER TABLE ONLY "UtilizadorModerador"
    ADD CONSTRAINT "utilizador_moderador_pkey" PRIMARY KEY (id_utilizador)
    
ALTER TABLE ONLY "UtilizadorAdministrador"
    ADD CONSTRAINT "utilizador_administrador_pkey" PRIMARY KEY (id_utilizador)
    
ALTER TABLE ONLY "HistoricoBanidos"
    ADD CONSTRAINT "historico_banidos_pkey" PRIMARY KEY (id_utilizador, data_banido)
    
ALTER TABLE ONLY "Mensagem"
    ADD CONSTRAINT "mensagem_pkey" PRIMARY KEY (id_mensagem)
    
ALTER TABLE ONLY "Categoria"
    ADD CONSTRAINT "categoria_pkey" PRIMARY KEY (id_categoria)
    
ALTER TABLE ONLY "Categoria"
    ADD CONSTRAINT "categoria_unique" UNIQUE (descricao)
    
ALTER TABLE ONLY "Leilao"
    ADD CONSTRAINT "leilao_pkey" PRIMARY KEY (id_leilao)
    
ALTER TABLE ONLY "ClassificaoLeilao"
    ADD CONSTRAINT "classificacao_leilao_pkey" PRIMARY KEY (id_licitador, id_leilao)
    
ALTER TABLE ONLY "Licitacao"
    ADD CONSTRAINT "licitacao_pkey" PRIMARY KEY (id_licitacao)
    
ALTER TABLE ONLY "EstadoLeilao"
    ADD CONSTRAINT "estado_leilao_pkey" PRIMARY KEY (id_estado_leilao)
    
ALTER TABLE ONLY "Pagamento"
    ADD CONSTRAINT "pagamento_pkey" PRIMARY KEY (id_pagamento)
    
ALTER TABLE ONLY "Pais"
    ADD CONSTRAINT "pais_pkey" PRIMARY KEY (id_pais)

CREATE UNIQUE INDEX "Index_e_mail" ON "Utilizador" USING btree (e_mail)

CREATE UNIQUE INDEX "Index_pais" ON "Pais" USING btree (nome_pais)

CREATE UNIQUE INDEX "Index_categoria" ON "Categoria" USING btree (descricao)

ALTER TABLE ONLY "Utilizador"
    ADD CONSTRAINT "utilizador_fkey" FOREIGN KEY (id_pais) REFERENCES "Pais"(id_pais)
    
ALTER TABLE ONLY "HistoricoBanidos"
    ADD CONSTRAINT "historico_banidos_fkey" FOREIGN KEY (id_moderador) REFERENCES "UtilizadorModerador"(id_utilizador)
    
ALTER TABLE ONLY "Mensagem"
    ADD CONSTRAINT "mensagem_fkey1" FOREIGN KEY (id_emissor) REFERENCES "Utilizador"(id_utilizador)
    
ALTER TABLE ONLY "Mensagem"
    ADD CONSTRAINT "mensagem_fkey2" FOREIGN KEY (id_recetor) REFERENCES "Utilizador"(id_utilizador)
    
ALTER TABLE ONLY "Leilao"
    ADD CONSTRAINT "leilao_fkey1" FOREIGN KEY (id_vendedor) REFERENCES "Utilizador"(id_utilizador)
    
ALTER TABLE ONLY "Leilao"
    ADD CONSTRAINT "leilao_fkey2" FOREIGN KEY (id_moderador) REFERENCES "UtilizadorModerador"(id_utilizador)

ALTER TABLE ONLY "Leilao"
    ADD CONSTRAINT "leilao_fkey3" FOREIGN KEY (id_estado_leilao) REFERENCES "EstadoLeilao"(id_estado_leilao)
    
ALTER TABLE ONLY "Leilao"
    ADD CONSTRAINT "leilao_fkey4" FOREIGN KEY (id_categoria) REFERENCES "Categoria"(id_categoria)
    
ALTER TABLE ONLY "Licitacao"
    ADD CONSTRAINT "licitacao_fkey1" FOREIGN KEY (id_leilao) REFERENCES "Leilao"(id_leilao)
    
ALTER TABLE ONLY "Licitacao"
    ADD CONSTRAINT "licitacao_fkey2" FOREIGN KEY (id_utilizador) REFERENCES "Utilizador"(id_utilizador)
   
ALTER TABLE ONLY "Pagamento"
    ADD CONSTRAINT "pagamento_fkey1" FOREIGN KEY (id_leilao) REFERENCES "Leilao"(id_leilao)
    
ALTER TABLE ONLY "Pagamento"
    ADD CONSTRAINT "pagamento_fkey2" FOREIGN KEY (id_utilizador) REFERENCES "Utilizador"(id_utilizador)
