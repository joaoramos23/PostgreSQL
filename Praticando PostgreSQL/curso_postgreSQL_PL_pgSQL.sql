/* FUNÇÕES UTILIZANDO SQL */
CREATE FUNCTION PRIMEIRA_FUNCAO() RETURNS INTEGER AS '
	SELECT (5 - 3) * 2
' LANGUAGE SQL;

SELECT PRIMEIRA_FUNCAO();
SELECT * FROM PRIMEIRA_FUNCAO();
SELECT PRIMEIRA_FUNCAO() AS NUMERO;

/* FUNÇÕES COM PARAMETROS */
CREATE FUNCTION SOMA(N1 INTEGER,N2 INTEGER) RETURNS INTEGER AS '
	SELECT N1 + N2;
'LANGUAGE SQL;

DROP FUNCTION SOMA;

CREATE FUNCTION SOMA(INTEGER,INTEGER) RETURNS INTEGER AS '
	SELECT $1 + $2;
'LANGUAGE SQL;

SELECT SOMA(3,17);

/* INSERT NAS FUNÇÕES */
CREATE TABLE A (NOME VARCHAR(255) NOT NULL);

CREATE FUNCTION CRIA_A(NOME VARCHAR) RETURNS VOID AS $$ 
	INSERT INTO A (NOME) VALUES (CRIA_A.NOME);
$$ LANGUAGE SQL;

SELECT CRIA_A('RAMOS JOAO');
SELECT * FROM A;

/* PARAMETROS COMPOSTOS */

CREATE TABLE INSTRUTOR(
	ID SERIAL PRIMARY KEY,
	NOME VARCHAR(255) NOT NULL,
	SALARIO DECIMAL(10,2)
);

INSERT INTO INSTRUTOR (NOME,SALARIO) VALUES ('JOÃO RAMOS',350);

CREATE OR REPLACE FUNCTION DOBRO_DO_SALARIO(INSTRUTOR) RETURNS DECIMAL AS $$
	SELECT $1.SALARIO * 2 AS DOBRO;
$$ LANGUAGE SQL;

SELECT NOME,DOBRO_DO_SALARIO(INSTRUTOR.*) FROM INSTRUTOR;

/* RETORNO COMPOSTO */

CREATE OR REPLACE FUNCTION INSTRUTOR_FALSO() RETURNS INSTRUTOR AS $$
	SELECT 22,'INSTRUTOR FALSO', 200;
$$ LANGUAGE SQL;
SELECT * FROM INSTRUTOR_FALSO();

/* RETORNANDO CONJUNTOS */

CREATE FUNCTION INSTRUTORES_BEM_PAGOS(VALOR_SALARIO DECIMAL) RETURNS SETOF INSTRUTOR AS $$ 
	SELECT * FROM INSTRUTOR WHERE SALARIO > VALOR_SALARIO;
$$ LANGUAGE SQL;

SELECT * FROM INSTRUTORES_BEM_PAGOS(300);

/* PARAMETROS DE SAIDA */

CREATE TYPE DOIS_VALORES AS (SOMA INTEGER, PRODUTO INTEGER);

CREATE FUNCTION SOMA_E_PRODUTO (IN NUMERO_1 INTEGER, IN NUMERO_2 INTEGER) RETURNS DOIS_VALORES AS $$
	SELECT NUMERO_1 + NUMERO_2 AS SOMA, NUMERO_1 * NUMERO_2 AS PRODUTO;
$$ LANGUAGE SQL;

SELECT * FROM SOMA_E_PRODUTO(3,5);


/* PLpgSQL */

CREATE FUNCTION PRIMEIRA_PL() RETURNS INTEGER AS $$
	BEGIN
		--VÁRIOS COMANDOS EM SQL
		RETURN 1;
	END
$$ LANGUAGE plpgsql;
SELECT PRIMEIRA_PL();

CREATE OR REPLACE FUNCTION segunda_pl() RETURNS INTEGER AS $$
	DECLARE
		primeira_variavel INTEGER DEFAULT 3;
	BEGIN
		primeira_variavel := primeira_variavel * 2;
		RETURN primeira_variavel;
	END;
$$ LANGUAGE plpgsql;

SELECT segunda_pl();