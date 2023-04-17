/* --------------------------------------------------------------------- */


CREATE OR REPLACE FUNCTION criar_curso(nome_curso VARCHAR,nome_categoria VARCHAR) RETURNS VOID AS $$
	DECLARE
			id_categoria INTEGER;
			id_curso INTEGER;
		BEGIN

			SELECT id INTO id_curso FROM curso WHERE nome = nome_curso;
			IF NOT FOUND THEN

				SELECT id INTO id_categoria FROM categoria WHERE nome = nome_categoria;
				IF NOT FOUND THEN

					INSERT INTO categoria (nome) VALUES (nome_categoria) 
					RETURNING id INTO id_categoria;

				END IF;

				INSERT INTO curso (nome, categoria_id) VALUES (nome_curso,id_categoria);

			END IF;
		END;
$$ LANGUAGE plpgsql;
		

SELECT criar_curso ('Teste Cloud','Cloud');

SELECT * FROM curso;
SELECT * FROM categoria;

/* --------------------------------------------------------------------- */

/* INSERIR */
	BEGIN
		INSERT INTO a VALUES (inserir_a.nome);
 		RETURN QUERY SELECT * FROM a;
	END;


/* REMOVER */
	BEGIN
		DELETE FROM a WHERE a.nome = remover_a.nome;
 		RETURN QUERY SELECT * FROM a;
	END;


SELECT * FROM a;

SELECT * FROM inserir_a('João Ramos');
SELECT * FROM remover_a('João Ramos');


/* --------------------------------------------------------------------- */
/* 

  * Inserir instrutores (com salario). 
  * Se o salário for maior do que a média, salvar log.
  * Salvar outro log dizendo que fulano recebe mais do que X% da grade de instrutores.

*/

/* CRIANDO ARMAZENAMENTO DE LOG */

CREATE TABLE log_instrutores(
	id SERIAL PRIMARY KEY,
	informacao VARCHAR(255),
	momento_criado TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE OR REPLACE FUNCTION criar_instrutor(nome_instrutor VARCHAR, salario_instrutor DECIMAL) 
RETURNS VOID AS $$

	DECLARE
		id_instrutor INTEGER;
		media_salario DECIMAL;
		recebem_menos INTEGER DEFAULT 0;
		total_instrutores INTEGER DEFAULT 0;
		salario DECIMAL;
		percentual DECIMAL;
	BEGIN
		INSERT INTO instrutor (nome,salario) VALUES (nome_instrutor,salario_instrutor)
		RETURNING id INTO id_instrutor;
		
		SELECT AVG(instrutor.salario) INTO media_salario FROM instrutor WHERE id != id_instrutor;
		
		IF salario_instrutor > media_salario THEN
			INSERT INTO log_instrutores (informacao) 
			VALUES (CONCAT(nome_instrutor, ' recebe acima da média!'));
		END IF;
		
		FOR salario IN SELECT instrutor.salario FROM instrutor WHERE id != id_instrutor LOOP
			total_instrutores := total_instrutores + 1;
			
			IF salario_instrutor > salario THEN
				recebem_menos := recebem_menos + 1;
			END IF;	
		END LOOP;
		
		percentual := recebem_menos::DECIMAL / total_instrutores::DECIMAL * 100;
		INSERT INTO log_instrutores (informacao) 
			VALUES (CONCAT (nome_instrutor,' recebe mais do que ',percentual,'% da grade de instrutores.'));
		
	END;
	
$$ LANGUAGE plpgsql;

SELECT * FROM instrutor ORDER BY id;

SELECT criar_instrutor('Fulana ', 100);
SELECT * FROM log_instrutores;