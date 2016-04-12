CREATE OR REPLACE FUNCTION time_left_auction(idleilao INTEGER) RETURNS DATE 
	AS $time_left_auction$
BEGIN
	SELECT data_fim  FROM Leilao WHERE Leilao.id_leilao = NEW.idleilao;
	RETURN data_fim - (now())::DATE;
END;
$time_left_auction$ LANGUAGE plpgsql;
 
CREATE FUNCTION can_cancel_auction() RETURNS TRIGGER 
    LANGUAGE plpgsql
    AS $can_cancel_auction$
	BEGIN
		IF NEW.data_fim - now()::DATE < 1
		THEN 
			RETURN FALSE;
		END IF;
 
		RETURN NEW;
	END;
$can_cancel_auction$;
 
CREATE FUNCTION auction_bid_over_base() RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $auction_bid_over_base$
	BEGIN
		IF NEW.valor_licitacao < (SELECT valorbase FROM Leilao WHERE Leilao.id_leilao = NEW.id_leilao)
		THEN 
			RETURN FALSE;
		END IF;
 
		RETURN NEW;
	END;
$auction_bid_over_base$;
 
CREATE FUNCTION auction_bid_over_max() RETURNS TRIGGER
          LANGUAGE plpgsql
          AS $auction_bid_over_max$
      BEGIN
	  IF NEW.valor_licitacao > (SELECT MAX(valor_licitacao) FROM Licitacao WHERE Licitacao.id_leilao = Leilao.id_leilao)
	  THEN 
		INSERT INTO Licitacao VALUES(NEW.id_licitacao,Leilao.id_leilao,New.id_utilizador,now()::DATE,New.valor_licitacao,FALSE);
	  ELSE
	  	RETURN FALSE;
       END IF;
      END;
$auction_bid_over_max$;

CREATE FUNCTION auction_user_ban() RETURNS TRIGGER
          LANGUAGE plpgsql
          AS $auction_user_ban$
      BEGIN
		UPDATE Utilizador SET banido = TRUE WHERE Utilizador.id_utilizador = New.id_utilizador;
      END;
$auction_user_ban$;

CREATE FUNCTION auction_user_unban() RETURNS TRIGGER
          LANGUAGE plpgsql
          AS $auction_user_ban$
      BEGIN
		UPDATE Utilizador SET banido = FALSE WHERE Utilizador.id_utilizador = New.id_utilizador;
      END;
$auction_user_ban$;
 
CREATE FUNCTION auction_bid_verify() RETURNS TRIGGER
        LANGUAGE plpgsql
        AS $auction_bid_verify$
      BEGIN
	  IF NEW.id_vendedor = (SELECT id_utilizador FROM Licitacao WHERE Licitacao.id_leilao = NEW.id_leilao) 
	  THEN
	     RETURN FALSE;
	  END IF;
 
	  RETURN NEW;
      END;
$auction_bid_verify$;

CREATE FUNCTION auction_classification_update() RETURNS TRIGGER
        LANGUAGE plpgsql
        AS $auction_classification_update$
      BEGIN -- erro no SELECT
      	UPDATE Utilizador SET classificacao = AVG(SELECT valor_classificacao FROM ClassificacaoLeilao WHERE Utilizador.id_utilizador = (SELECT id_vendedor FROM Leilao WHERE ClassificacaoLeilao.id_leilao = Leilao.id_leilao ) );
	  RETURN NULL;
      END;
$auction_classification_update$;

CREATE FUNCTION auction_state_update() RETURNS TRIGGER
        LANGUAGE plpgsql
        AS $auction_state_update$
      BEGIN
      	SELECT 
      	UPDATE Leilao SET classificacao = AVG(SELECT valor_classificacao FROM ClassificacaoLeilao WHERE Utilizador.id_utilizador = (SELECT id_vendedor FROM Leilao WHERE ClassificacaoLeilao.id_leilao = Leilao.id_leilao ) );
	  RETURN NULL;
      END;
$auction_state_update$;

 
CREATE TRIGGER can_cancel_auction BEFORE INSERT ON Leilao FOR EACH ROW EXECUTE PROCEDURE can_cancel_auction();

CREATE TRIGGER auction_bid_over_base BEFORE INSERT ON Licitacao FOR EACH ROW EXECUTE PROCEDURE auction_bid_over_base();
 
CREATE TRIGGER auction_bid_over_max AFTER INSERT ON Licitacao FOR EACH ROW EXECUTE PROCEDURE auction_bid_over_max();
 
CREATE TRIGGER auction_user_ban AFTER INSERT ON HistoricoBanidos FOR EACH ROW EXECUTE PROCEDURE auction_user_ban();

CREATE TRIGGER auction_bid_verify BEFORE INSERT ON Licitacao FOR EACH ROW EXECUTE PROCEDURE auction_bid_verify();
 
CREATE TRIGGER auction_classification_update AFTER INSERT ON ClassificacaoLeilao FOR EACH ROW EXECUTE PROCEDURE auction_classification_update();

CREATE TRIGGER auction_state_update AFTER INSERT ON Leilao FOR EACH ROW EXECUTE PROCEDURE auction_state_update(); /*NOT DONE... WITH ERRORS*/