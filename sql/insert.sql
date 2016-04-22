INSERT INTO Pais (id_pais, nome_pais) VALUES (0, 'Portugal');
INSERT INTO Pais (id_pais, nome_pais) VALUES(1, 'Senegal');
INSERT INTO Pais (id_pais, nome_pais) VALUES(2, 'France');
INSERT INTO Pais (id_pais, nome_pais) VALUES(3, 'England');
INSERT INTO Pais (id_pais, nome_pais) VALUES(4, 'Spain');
INSERT INTO Pais (id_pais, nome_pais) VALUES(5, 'Thailand');
INSERT INTO Pais (id_pais, nome_pais) VALUES(6, 'Italy');
INSERT INTO Pais (id_pais, nome_pais) VALUES(7, 'Bangladesh');
INSERT INTO Pais (id_pais, nome_pais) VALUES(8, 'Finland');
INSERT INTO Pais (id_pais, nome_pais) VALUES(9, 'Sweden');
INSERT INTO Pais (id_pais, nome_pais) VALUES(10, 'Denmark');
INSERT INTO Pais (id_pais, nome_pais) VALUES(11, 'Norway');

INSERT INTO Utilizador (id_utilizador, nome, descricao, genero, imagem_utilizador, datanasc, e_mail, password, classificacao, banido, id_pais) VALUES(0, 'Miguel Botelho', 'LBAW 4 LIFE', 'male', 'img/miguel.jpg', '1995-11-06', 'teste8@hotmail.com', md5('1234pass'), 0.0, FALSE, 0);
INSERT INTO Utilizador (id_utilizador, nome, descricao, genero, imagem_utilizador, datanasc, e_mail, password, classificacao, banido, id_pais) VALUES(1, 'Daniel Reis', 'LBAW 4 LIFE', 'male', 'img/reis.jpg', '1995-12-06', 'pigmoth@gmail.com', md5('1234pass1'), 0.0, TRUE, 1);
INSERT INTO Utilizador (id_utilizador, nome, descricao, genero, imagem_utilizador, datanasc, e_mail, password, classificacao, banido, id_pais) VALUES(2, 'Ricardo Mariz', 'LBAW 4 LIFE', 'male', 'img/duvidas.jpg', '1995-10-06', 'duvidas@hotmail.com', md5('1234pass2'), 0.0, FALSE, 2);
INSERT INTO Utilizador (id_utilizador, nome, descricao, genero, imagem_utilizador, datanasc, e_mail, password, classificacao, banido, id_pais) VALUES(3, 'Joao Bernardo', 'LBAW 4 LIFE', 'male', 'img/joao.jpg', '1995-09-06', 'joao@hotmail.com', md5('1234pass5'), 0.0, TRUE, 6);
INSERT INTO Utilizador (id_utilizador, nome, descricao, genero, imagem_utilizador, datanasc, e_mail, password, classificacao, banido, id_pais) VALUES(4, 'Joao Estrada', 'LBAW 4 LIFE', 'male', 'img/estrada.jpg', '1995-08-06', 'estrada@hotmail.com', md5('1234pass3'), 0.0, FALSE, 3);
INSERT INTO Utilizador (id_utilizador, nome, descricao, genero, imagem_utilizador, datanasc, e_mail, password, classificacao, banido, id_pais) VALUES(5, 'Andre Maia', 'LBAW 4 LIFE', 'male', 'img/maia.jpg', '1995-07-06', 'maia@hotmail.com', md5('1234pas45s'), 0.0, FALSE, 2);
INSERT INTO Utilizador (id_utilizador, nome, descricao, genero, imagem_utilizador, datanasc, e_mail, password, classificacao, banido, id_pais) VALUES(6, 'Ines Santos', 'LBAW 4 LIFE', 'female', 'img/memes.jpg', '1995-11-06', 'panados@hotmail.com', md5('1234pass'), 0.0, FALSE, 9);

INSERT INTO UtilizadorModerador (id_utilizador) VALUES(4);
INSERT INTO UtilizadorModerador (id_utilizador) VALUES(5);
INSERT INTO UtilizadorAdministrador (id_utilizador) VALUES(6);

INSERT INTO HistoricoBanidos (id_utilizador, id_moderador, data_banicao, data_fim, motivo) VALUES (1, 4, '2013-01-01', '2020-01-01', 'e fagote');
INSERT INTO HistoricoBanidos (id_utilizador, id_moderador, data_banicao, data_fim, motivo) VALUES (3, 4, '2015-01-01', '2020-01-01', 'lbaw');

INSERT INTO Mensagem (id_mensagem, id_emissor, id_recetor, conteudo, data_mensagem) VALUES (0, 0, 1, 'Vai fazer lbaw', '2016-04-10');
INSERT INTO Mensagem (id_mensagem, id_emissor, id_recetor, conteudo, data_mensagem) VALUES (1, 0, 2, 'Vai fazer lbaw', '2016-04-10');
INSERT INTO Mensagem (id_mensagem, id_emissor, id_recetor, conteudo, data_mensagem) VALUES (2, 0, 3, 'Vai fazer lbaw', '2016-04-10');
INSERT INTO Mensagem (id_mensagem, id_emissor, id_recetor, conteudo, data_mensagem) VALUES (3, 1, 0, 'Vai tu', '2016-04-10');
INSERT INTO Mensagem (id_mensagem, id_emissor, id_recetor, conteudo, data_mensagem) VALUES (4, 0, 1, 'Ja fui', '2016-04-10');
INSERT INTO Mensagem (id_mensagem, id_emissor, id_recetor, conteudo, data_mensagem) VALUES (5, 1, 0, 'Vai fazer ppin', '2016-04-10');
INSERT INTO Mensagem (id_mensagem, id_emissor, id_recetor, conteudo, data_mensagem) VALUES (6, 0, 1, 'Nao tenho pepinos em casa', '2016-04-10');
INSERT INTO Mensagem (id_mensagem, id_emissor, id_recetor, conteudo, data_mensagem) VALUES (7, 2, 1, 'E comp?', '2016-04-10');
INSERT INTO Mensagem (id_mensagem, id_emissor, id_recetor, conteudo, data_mensagem) VALUES (8, 3, 1, 'E lgp?', '2016-04-10');

INSERT INTO Categoria (id_categoria, descricao) VALUES (0, 'Arte');
INSERT INTO Categoria (id_categoria, descricao) VALUES (1, 'Lazer');
INSERT INTO Categoria (id_categoria, descricao) VALUES (2, 'Magazines');
INSERT INTO Categoria (id_categoria, descricao) VALUES (3, 'Livros');
INSERT INTO Categoria (id_categoria, descricao) VALUES (4, 'Jogos');
INSERT INTO Categoria (id_categoria, descricao) VALUES (5, 'Cozinha');
INSERT INTO Categoria (id_categoria, descricao) VALUES (6, 'Culinaria');

INSERT INTO EstadoLeilao (id_estado_leilao, valor_atual, estado_leilao, motivo) VALUES(0, 400, 'fechado', NULL);
INSERT INTO EstadoLeilao (id_estado_leilao, valor_atual, estado_leilao, motivo) VALUES(1, 100, 'aberto', NULL);
INSERT INTO EstadoLeilao (id_estado_leilao, valor_atual, estado_leilao, motivo) VALUES(2, 9999, 'cancelado', 'o quadro nao vale claramente 9999 euros');

INSERT INTO Leilao (id_leilao, nome_produto, descricao, imagem_produto, data_inicio, data_fim, valor_base, id_vendedor, id_estado_leilao, id_categoria, id_moderador) VALUES(0, 'Relogio Vintage', 'Um relogio antigo', 'img/relogio.jpg', '2016-04-10', '2016-04-12', 50, 1, 0, 0, 4);
INSERT INTO Leilao (id_leilao, nome_produto, descricao, imagem_produto, data_inicio, data_fim, valor_base, id_vendedor, id_estado_leilao, id_categoria, id_moderador) VALUES(1, 'PC de 1980', 'Um pc antigo', 'img/pc.jpg', '2016-04-10', '2016-04-12', 100, 2, 1, 1, 5);
INSERT INTO Leilao (id_leilao, nome_produto, descricao, imagem_produto, data_inicio, data_fim, valor_base, id_vendedor, id_estado_leilao, id_categoria, id_moderador) VALUES(2, 'Quadro de cenas', 'Um quadro antigo', 'img/quadro.jpg', '2016-04-10', '2016-04-20', 9999, 1, 2, 0, 4);
INSERT INTO Leilao (id_leilao, nome_produto, descricao, imagem_produto, data_inicio, data_fim, valor_base, id_vendedor, id_estado_leilao, id_categoria, id_moderador) VALUES(3, 'Relogio Vintage', 'Um relogio antigo', 'img/relogio.jpg', '2016-04-10', '2016-04-12', 50, 1, 0, 0, 4);
INSERT INTO Leilao (id_leilao, nome_produto, descricao, imagem_produto, data_inicio, data_fim, valor_base, id_vendedor, id_estado_leilao, id_categoria, id_moderador) VALUES(4, 'PC de 1980', 'Um pc antigo', 'img/pc.jpg', '2016-04-10', '2016-04-12', 100, 2, 1, 1, 5);
INSERT INTO Leilao (id_leilao, nome_produto, descricao, imagem_produto, data_inicio, data_fim, valor_base, id_vendedor, id_estado_leilao, id_categoria, id_moderador) VALUES(5, 'Quadro de cenas', 'Um quadro antigo', 'img/quadro.jpg', '2016-04-10', '2016-04-20', 9999, 1, 2, 0, 4);
INSERT INTO Leilao (id_leilao, nome_produto, descricao, imagem_produto, data_inicio, data_fim, valor_base, id_vendedor, id_estado_leilao, id_categoria, id_moderador) VALUES(6, 'Relogio Vintage', 'Um relogio antigo', 'img/relogio.jpg', '2016-04-10', '2016-04-12', 50, 1, 0, 0, 4);
INSERT INTO Leilao (id_leilao, nome_produto, descricao, imagem_produto, data_inicio, data_fim, valor_base, id_vendedor, id_estado_leilao, id_categoria, id_moderador) VALUES(7, 'PC de 1980', 'Um pc antigo', 'img/pc.jpg', '2016-04-10', '2016-04-12', 100, 2, 1, 1, 5);
INSERT INTO Leilao (id_leilao, nome_produto, descricao, imagem_produto, data_inicio, data_fim, valor_base, id_vendedor, id_estado_leilao, id_categoria, id_moderador) VALUES(8, 'Quadro de cenas', 'Um quadro antigo', 'img/quadro.jpg', '2016-04-10', '2016-04-20', 9999, 1, 2, 0, 4);
INSERT INTO Leilao (id_leilao, nome_produto, descricao, imagem_produto, data_inicio, data_fim, valor_base, id_vendedor, id_estado_leilao, id_categoria, id_moderador) VALUES(9, 'Relogio Vintage', 'Um relogio antigo', 'img/relogio.jpg', '2016-04-10', '2016-04-12', 50, 1, 0, 0, 4);
INSERT INTO Leilao (id_leilao, nome_produto, descricao, imagem_produto, data_inicio, data_fim, valor_base, id_vendedor, id_estado_leilao, id_categoria, id_moderador) VALUES(10, 'PC de 1980', 'Um pc antigo', 'img/pc.jpg', '2016-04-10', '2016-04-12', 100, 2, 1, 1, 5);
INSERT INTO Leilao (id_leilao, nome_produto, descricao, imagem_produto, data_inicio, data_fim, valor_base, id_vendedor, id_estado_leilao, id_categoria, id_moderador) VALUES(11, 'Quadro de cenas', 'Um quadro antigo', 'img/quadro.jpg', '2016-04-10', '2016-04-20', 9999, 1, 2, 0, 4);


INSERT INTO ClassificacaoLeilao (id_licitador, id_leilao, valor_classificacao) VALUES(0, 1, 5);
INSERT INTO ClassificacaoLeilao (id_licitador, id_leilao, valor_classificacao) VALUES(1, 1, 1);
INSERT INTO ClassificacaoLeilao (id_licitador, id_leilao, valor_classificacao) VALUES(2, 1, 3);
INSERT INTO ClassificacaoLeilao (id_licitador, id_leilao, valor_classificacao) VALUES(3, 1, 2);
INSERT INTO ClassificacaoLeilao (id_licitador, id_leilao, valor_classificacao) VALUES(0, 0, 5);
INSERT INTO ClassificacaoLeilao (id_licitador, id_leilao, valor_classificacao) VALUES(1, 0, 1);
INSERT INTO ClassificacaoLeilao (id_licitador, id_leilao, valor_classificacao) VALUES(2, 0, 3);
INSERT INTO ClassificacaoLeilao (id_licitador, id_leilao, valor_classificacao) VALUES(3, 0, 2);
INSERT INTO ClassificacaoLeilao (id_licitador, id_leilao, valor_classificacao) VALUES(0, 2, 5);
INSERT INTO ClassificacaoLeilao (id_licitador, id_leilao, valor_classificacao) VALUES(1, 2, 1);
INSERT INTO ClassificacaoLeilao (id_licitador, id_leilao, valor_classificacao) VALUES(2, 2, 3);
INSERT INTO ClassificacaoLeilao (id_licitador, id_leilao, valor_classificacao) VALUES(3, 2, 2);

INSERT INTO Licitacao (id_licitacao, id_leilao, id_utilizador, data_licitacao, valor_licitacao, vencedor) VALUES(0, 1, 3, '2015-04-11', 100, FALSE);
INSERT INTO Licitacao (id_licitacao, id_leilao, id_utilizador, data_licitacao, valor_licitacao, vencedor) VALUES(1, 1, 2, '2015-04-11', 200, FALSE);
INSERT INTO Licitacao (id_licitacao, id_leilao, id_utilizador, data_licitacao, valor_licitacao, vencedor) VALUES(2, 1, 1, '2015-04-11', 300, FALSE);
INSERT INTO Licitacao (id_licitacao, id_leilao, id_utilizador, data_licitacao, valor_licitacao, vencedor) VALUES(3, 1, 6, '2015-04-11', 400, TRUE);
INSERT INTO Licitacao (id_licitacao, id_leilao, id_utilizador, data_licitacao, valor_licitacao, vencedor) VALUES(4, 2, 3, '2015-04-11', 100, FALSE);
INSERT INTO Licitacao (id_licitacao, id_leilao, id_utilizador, data_licitacao, valor_licitacao, vencedor) VALUES(5, 2, 2, '2015-04-11', 200, FALSE);
INSERT INTO Licitacao (id_licitacao, id_leilao, id_utilizador, data_licitacao, valor_licitacao, vencedor) VALUES(6, 2, 1, '2015-04-11', 300, FALSE);
INSERT INTO Licitacao (id_licitacao, id_leilao, id_utilizador, data_licitacao, valor_licitacao, vencedor) VALUES(7, 2, 6, '2015-04-11', 400, TRUE);
INSERT INTO Licitacao (id_licitacao, id_leilao, id_utilizador, data_licitacao, valor_licitacao, vencedor) VALUES(8, 0, 3, '2015-04-11', 100, FALSE);
INSERT INTO Licitacao (id_licitacao, id_leilao, id_utilizador, data_licitacao, valor_licitacao, vencedor) VALUES(9, 0, 2, '2015-04-11', 200, FALSE);
INSERT INTO Licitacao (id_licitacao, id_leilao, id_utilizador, data_licitacao, valor_licitacao, vencedor) VALUES(10, 0, 1, '2015-04-11', 300, FALSE);
INSERT INTO Licitacao (id_licitacao, id_leilao, id_utilizador, data_licitacao, valor_licitacao, vencedor) VALUES(11, 0, 6, '2015-04-11', 400, TRUE);


INSERT INTO Pagamento (id_pagamento, quantia, token_confirmacao, token_pagamento, data_pagamento, morada_envio, id_leilao, id_utilizador) VALUES(0, 400, 'adka sdk', 'adnasndkas', '2016-04-12', 'Rua Alfredo Costa Nº 25', 1, 6);
INSERT INTO Pagamento (id_pagamento, quantia, token_confirmacao, token_pagamento, data_pagamento, morada_envio, id_leilao, id_utilizador) VALUES(1, 400, 'adka sdk', 'adnasndkas', '2016-04-12', 'Rua Alfredo Costa Nº 25', 2, 6);
INSERT INTO Pagamento (id_pagamento, quantia, token_confirmacao, token_pagamento, data_pagamento, morada_envio, id_leilao, id_utilizador) VALUES(2, 400, 'adka sdk', 'adnasndkas', '2016-04-12', 'Rua Alfredo Costa Nº 25', 0, 6);