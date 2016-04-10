-- Queries 





 
--Licitacao Maior a partir do id leilao -->CHECKED
 
SELECT valor_licitacao FROM Licitacao WHERE valor_licitacao = ( 
							SELECT MAX(valor_licitacao) FROM Licitacao WHERE Licitacao.id_leilao = "1" ) AND Licitacao.id_leilao = "1" ;
 
-- view para vendedor a partir do id leilao -->CHECKED
 
CREATE VIEW vendedor AS SELECT nome , descricao ,genero ,imagem_utilizador , datanasc , e_mail ,id_pais, classificacao FROM Utilizador
						 WHERE Utilizador.id_utilizador = (SELECT Leilao.id_vendedor FROM Leilao WHERE Leilao.id_leilao = "4" )  ;
 
-- mensagens a partir do id user -->CHECKED
 
SELECT id_mensagem , id_recetor , conteudo ,data_mensagem FROM Mensagem WHERE Mensagem.id_emissor =  "2" ;
 
SELECT id_mensagem , id_emissor , conteudo ,data_mensagem FROM Mensagem WHERE Mensagem.id_recetor = "2" ;
 
-- data do utilizador bloqueado apartir do seu id_utilizador -->CHECKED
 
SELECT data_fim FROM HistoricosBanidos WHERE HistoricosBanidos.id_utilizador = "11" ;
 
-- query email e password-->CHECKED
SELECT id_utilizador,nome FROM Utilizador WHERE Utilizador.password = md5("PalavraChave23") AND Utilizador.e_mail = "palavras.23@gmail.com" ;
 
-- leiloes em que licitou--> CHECKED
SELECT id_leilao FROM Leilao WHERE id_leilao = ( SELECT id_leilao FROM Licitacao WHERE Licitacao.id_licitador = "2" ) ;
 
-- leiloes que criou -->CHECKED
SELECT id_leilao FROM Leilao WHERE Leilao.id_vendedor = "2" ; 
 
-- pesquisar leiloes a partir de nome (titulo, descricao) -->CHECKED
SELECT id_leilao FROM Leilao WHERE  Leilao.nome_produto LIKE "%iphone6%" OR
descricao LIKE "%iphone6 como novo%";
 
 
-- pesquisar leiloes a partir de categoria --> CHECKED
SELECT id_leilao FROM Leilao WHERE Leilao.nome_produto LIKE "%iphone6%" OR ProdutoLeilao.descricao LIKE "%iphone6 como novo%"
		 Leilao.id_produto IN ( SELECT id_produto FROM Categoria WHERE ( Cetegoria.id_categoria IN ( SELECT id_categoria FROM Categoria WHERE Categoria.descricao LIKE "%telemoveis%") ) ) ;

