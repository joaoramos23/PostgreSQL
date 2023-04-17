/* -------------------------------------------------------------------------*/


CREATE OR REPLACE FUNCTION dobrar_salario(instrutor instrutor) RETURNS DECIMAL AS $$ 
	SELECT instrutor.salario * 2;
$$ LANGUAGE SQL;

SELECT instrutor.*, dobrar_salario(instrutor.*) as dobro FROM instrutor;

SELECT instrutor.*, dobrar_salario(instrutor.*) as dobro FROM instrutor 
WHERE dobrar_salario(instrutor.*) > 200;


/* -------------------------------------------------------------------------*/


CREATE OR REPLACE FUNCTION falso() RETURNS instrutor AS $$
	SELECT 12, 'Nome Falso', 234; 
$$ LANGUAGE SQL;

SELECT * FROM falso();
SELECT falso.*,dobrar_salario(falso) FROM falso();


/* -------------------------------------------------------------------------*/


SELECT * FROM instrutor ORDER BY id;

INSERT INTO instrutor (nome,salario) VALUES ('Maria Alberta',250);
INSERT INTO instrutor (nome,salario) VALUES ('Marcela Falcao',650);
INSERT INTO instrutor (nome,salario) VALUES ('Abda Almeida',450);
INSERT INTO instrutor (nome,salario) VALUES ('Risharlisson Santos',150);


CREATE OR REPLACE FUNCTION instrutor_bem_pagos(valor_salario INTEGER) 
RETURNS SETOF instrutor AS $$ 
	SELECT * FROM instrutor WHERE salario > valor_salario ORDER BY id;
$$ LANGUAGE SQL;

SELECT * FROM instrutor_bem_pagos(100);


/* -------------------------------------------------------------------------*/


CREATE TYPE dois AS (soma INTEGER, produto INTEGER);

CREATE FUNCTION dois_ret(IN INTEGER,IN INTEGER) RETURNS dois AS $$
	SELECT $1 + $2 AS soma, $1 * $2 AS produto;
$$ LANGUAGE SQL;

SELECT * FROM dois_ret(5,2);


/* -------------------------------------------------------------------------*/


CREATE FUNCTION dois_retornos(IN INTEGER,IN INTEGER,OUT soma INTEGER,OUT produto INTEGER) AS $$
	SELECT $1 + $2 AS soma, $1 * $2 AS produto;
$$ LANGUAGE SQL;

SELECT * FROM dois_retornos(5,2);


/* -------------------------------------------------------------------------*/

