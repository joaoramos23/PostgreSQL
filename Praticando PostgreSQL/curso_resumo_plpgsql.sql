/* -------------------------------------------------------------------------*/

CREATE OR REPLACE FUNCTION testando_pl() RETURNS INTEGER AS $$
	DECLARE
		numero INTEGER DEFAULT 3;
	BEGIN
		numero := numero * 2;
		BEGIN
			numero := 3 * numero;
		END;		
		RETURN numero;
	END;
$$ LANGUAGE plpgsql;

SELECT testando_pl();


/* -------------------------------------------------------------------------*/

CREATE OR REPLACE FUNCTION inserir_a(nome VARCHAR) RETURNS SETOF a AS $$
	BEGIN
		INSERT INTO a VALUES (inserir_a.nome);
 		RETURN QUERY SELECT * FROM a;
	END;
$$ LANGUAGE plpgsql;

SELECT nome FROM inserir_a('Beira Mar');


/* -------------------------------------------------------------------------*/


CREATE OR REPLACE FUNCTION remover_a(nome VARCHAR) RETURNS SETOF a AS $$
	BEGIN
		DELETE FROM a WHERE a.nome = remover_a.nome;
 		RETURN QUERY SELECT * FROM a;
	END;
$$ LANGUAGE plpgsql;

SELECT nome FROM remover_a('Beira Mar');


/* -------------------------------------------------------------------------*/

CREATE OR REPLACE FUNCTION criar_instrutor_falso(id INTEGER,nome VARCHAR,salario DECIMAL)
RETURNS instrutor AS $$
	DECLARE 
		retorno instrutor;
	BEGIN
		SELECT id, nome, salario INTO retorno;
		RETURN retorno;
	END;
$$ LANGUAGE plpgsql;

SELECT id,nome,salario FROM criar_instrutor_falso(32,'João Ramos',58.7651);

/* -------------------------------------------------------------------------*/


CREATE TYPE nome_salario AS (nome_instrutor VARCHAR,salario_instrutor DECIMAL);

CREATE OR REPLACE FUNCTION bem_pagos(valor_salario DECIMAL) RETURNS SETOF nome_salario AS $$
	BEGIN
		RETURN QUERY SELECT nome, salario
		FROM instrutor 
			WHERE salario > valor_salario ;
	END;
$$ LANGUAGE plpgsql; 

SELECT * FROM bem_pagos(250);


/* -------------------------------------------------------------------------*/


