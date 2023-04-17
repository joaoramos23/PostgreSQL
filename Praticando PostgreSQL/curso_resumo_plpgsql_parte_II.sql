/* -------------------------------------------------------------------------*/

CREATE OR REPLACE FUNCTION salario_ok (instrutor instrutor) RETURNS VARCHAR AS $$

	BEGIN
		IF instrutor.salario > 300 THEN
			RETURN 'Sálario OK!';
		ELSEIF instrutor.salario > 200 AND instrutor.salario < 300 THEN
			RETURN 'Sálario baixo do normal.';
		ELSE 
			RETURN 'Sálario defasado.';
		END IF;
	END;
$$ LANGUAGE plpgsql;

SELECT instrutor.*, salario_ok(instrutor) FROM instrutor;


/* -------------------------------------------------------------------------
	CASE WHEN:

	CASE 
		WHEN parametro THEN
			RETURN 
		WHEN parametro3 THEN
			RETURN 
		WHEN parametro3 THEN
			RETURN
		ELSE 
			RETURN
	END CASE;

-------------------------------------------------------------------------*/


CREATE OR REPLACE FUNCTION tabuada(numero INTEGER) RETURNS SETOF VARCHAR AS $$
	DECLARE
		contador INTEGER DEFAULT 1;
	BEGIN
		LOOP 
			RETURN NEXT CONCAT(contador,' * ',numero,' = ',contador * numero);
			contador := contador + 1;
			EXIT WHEN contador = 10;
		END LOOP;
	END;
$$ LANGUAGE plpgsql;

SELECT tabuada(2);

/* -------------------------------------------------------------------------*/

CREATE OR REPLACE FUNCTION tabuada_while(numero INTEGER) RETURNS SETOF VARCHAR AS $$
	DECLARE
		contador INTEGER DEFAULT 1;
	BEGIN
		WHILE contador < 10 LOOP 
			RETURN NEXT CONCAT(contador,' * ',numero,' = ',contador * numero);
			contador := contador + 1;
		END LOOP;
	END;
$$ LANGUAGE plpgsql;

SELECT tabuada_while(2);

/* -------------------------------------------------------------------------*/

CREATE OR REPLACE FUNCTION tabuada_for(numero INTEGER) RETURNS SETOF VARCHAR AS $$
	BEGIN
		FOR contador IN 1..9 LOOP 
			RETURN NEXT CONCAT(contador,' * ',numero,' = ',contador * numero);
		END LOOP;
	END;
$$ LANGUAGE plpgsql;

SELECT tabuada_for(6);

/* -------------------------------------------------------------------------*/

CREATE OR REPLACE FUNCTION instrutores_com_salario
(OUT nome VARCHAR, OUT salario_ok VARCHAR) RETURNS SETOF record AS $$
	DECLARE 
		instrutores instrutor;
	BEGIN
		FOR instrutores IN SELECT * FROM instrutor LOOP
			nome := instrutores.nome;
			IF instrutores.salario < 300 THEN
				salario_ok := instrutores.salario + 100;
			ELSE 
				salario_ok := instrutores.salario;
			END IF;
			RETURN NEXT;
		END LOOP;
	END;
$$ LANGUAGE plpgsql;

SELECT * FROM instrutores_com_salario();
SELECT * FROM instrutor;


/* -------------------------------------------------------------------------*/


