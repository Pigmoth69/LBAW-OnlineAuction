------------------TRIGGERS REPARADOS!

--TRIGGERS ALREADY DONE!

--APENAS TEM O PROBLEMA DE ARREDONDAR A CLASSIFICACAO NÃO SEI PORQUE..
CREATE FUNCTION auction_classification_update() RETURNS TRIGGER
        LANGUAGE plpgsql
        AS $auction_classification_update$
        DECLARE 
        idUtilizador integer;
        average numeric(5);
      BEGIN
      idUtilizador := id_vendedor FROM Leilao WHERE New.id_leilao = Leilao.id_leilao;
      average := avg(valor_classificacao) FROM ClassificacaoLeilao INNER JOIN Leilao ON Leilao.id_leilao = ClassificacaoLeilao.id_leilao WHERE Leilao.id_vendedor = idUtilizador;
      UPDATE Utilizador SET classificacao = average WHERE Utilizador.id_utilizador=idUtilizador;
      	RETURN NEW;
      END;
$auction_classification_update$;

CREATE TRIGGER auction_classification_update AFTER INSERT ON ClassificacaoLeilao FOR EACH ROW EXECUTE PROCEDURE auction_classification_update();

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE FUNCTION authorize_ban() RETURNS TRIGGER
		LANGUAGE plpgsql
		AS $authorize_ban$
		DECLARE
		ut integer;
		BEGIN
		ut := id_utilizador FROM Utilizador Where id_utilizador=NEW.id_utilizador;
		IF ut is NOT NULL AND NEW.data_fim < CURRENT_TIMESTAMP THEN
			RAISE EXCEPTION 'Error authorizing BAN! Invalid User or ban date end!';
		END IF;
		UPDATE Utilizador SET banido = TRUE WHERE Utilizador.id_utilizador = ut;
		RETURN NEW;
		END;
$authorize_ban$;

CREATE TRIGGER authorize_ban BEFORE INSERT ON HistoricoBanidos FOR EACH ROW EXECUTE PROCEDURE authorize_ban();


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE FUNCTION can_cancel_auction() RETURNS TRIGGER 
    LANGUAGE plpgsql
    AS $can_cancel_auction$
	BEGIN
		IF NEW.data_fim < CURRENT_TIMESTAMP THEN 
			RAISE EXCEPTION 'Cannot end a auction on a date previouse of the current date!';
		END IF;
		RETURN NEW;
	END;
$can_cancel_auction$;

CREATE TRIGGER can_cancel_auction BEFORE INSERT ON Leilao FOR EACH ROW EXECUTE PROCEDURE can_cancel_auction();


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE FUNCTION auction_bid_over() RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $auction_bid_over$
	DECLARE
	lic numeric;
	BEGIN
		lic := MAX(valor_licitacao) FROM Licitacao WHERE Licitacao.id_leilao = NEW.id_leilao;
		IF NEW.valor_licitacao <  valor_base FROM Leilao WHERE Leilao.id_leilao = NEW.id_leilao THEN 
			RAISE EXCEPTION 'Licitation value inferior to base value of auction';
		END IF;
		IF  lic is NULL THEN
	  	    RETURN NEW;
        END IF;
			
		IF NEW.valor_licitacao <=  lic THEN 
		    RAISE EXCEPTION 'licitation inferior to actual licitation';
		END IF;
	    RETURN NEW;
	END;
$auction_bid_over$;


CREATE TRIGGER auction_bid_over BEFORE INSERT ON Licitacao FOR EACH ROW EXECUTE PROCEDURE auction_bid_over();

--INSERT INTO Licitacao (id_licitacao, id_leilao, id_utilizador, data_licitacao, valor_licitacao, vencedor) VALUES(0, 1, 6, '2015-04-11 10:00:00', 5000, FALSE);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE FUNCTION auction_bid_verify() RETURNS TRIGGER
        LANGUAGE plpgsql
        AS $auction_bid_verify$
		DECLARE
		vend integer;
		lic numeric;
      BEGIN
	  vend := id_vendedor FROM Leilao WHERE Leilao.id_leilao = NEW.id_leilao;
	  IF TRUE = banido FROM Utilizador WHERE Utilizador.id_utilizador = New.id_utilizador THEN
		RAISE EXCEPTION 'BANNED USER CANNOT MAKE LICITATION';
	  END IF;
	  IF NEW.id_utilizador = vend
	  THEN
	     RAISE EXCEPTION 'Seller cannot bid on his own auction!';
	  END IF;
 
	  RETURN NEW;
      END;
$auction_bid_verify$;


CREATE TRIGGER auction_bid_verify BEFORE INSERT ON Licitacao FOR EACH ROW EXECUTE PROCEDURE auction_bid_verify();

--INSERT INTO Licitacao (id_licitacao, id_leilao, id_utilizador, data_licitacao, valor_licitacao, vencedor) VALUES(2, 1, 1, '2015-04-11 10:00:00', 10001, FALSE);
 

 -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE FUNCTION auction_create_check_privilege_users() RETURNS TRIGGER
        LANGUAGE plpgsql
        AS $auction_create_check_privilege_users$
      BEGIN
	  IF NEW.id_vendedor = id_utilizador FROM UtilizadorAdministrador THEN
	     RAISE EXCEPTION 'Administrator cannot create a auction!!';
	  ELSIF NEW.id_vendedor = id_utilizador FROM UtilizadorModerador THEN
	     RAISE EXCEPTION 'Moderator cannot create a auction!!';
	  END IF;
	  
	  RETURN NEW;
      END;
$auction_create_check_privilege_users$;

CREATE TRIGGER auction_create_check_privilege_users BEFORE INSERT ON Leilao FOR EACH ROW EXECUTE PROCEDURE auction_create_check_privilege_users();

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



---DUNK tRIGGER 8)

--?????
--CREATE FUNCTION auction_state_update() RETURNS TRIGGER
--      LANGUAGE plpgsql
--      AS $auction_state_update$
--    BEGIN
--    	SELECT 
--    	UPDATE Leilao SET classificacao = AVG(SELECT valor_classificacao FROM ClassificacaoLeilao WHERE Utilizador.id_utilizador = (SELECT id_vendedor FROM Leilao WHERE ClassificacaoLeilao.id_leilao = Leilao.id_leilao ) );
--	  RETURN NULL;
--    END;
--$auction_state_update$;
 
 
 
--CREATE TRIGGER auction_state_update AFTER INSERT ON Leilao FOR EACH ROW EXECUTE PROCEDURE auction_state_update(); /*NOT DONE... WITH ERRORS*/
--????