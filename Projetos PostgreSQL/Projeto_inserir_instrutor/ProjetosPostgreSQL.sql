-- Inserir instrutores (com salário);
-- Se o salário for maior do que a média, salvar um log.
-- Salvar outro log dizendo que x instrutor recebe mais doque X% da grade de instrutores.

/* CRIAÇÃO SCHEMA SEPARADO */
-- Crie o schema.

CREATE SCHEMA projeto_instrutor;

/* TABLE UTILIZADAS NO PROJETO */
-- Crie as tabelas no schema criado.

CREATE TABLE projeto_instrutor.instrutor (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255),
	salario DECIMAL(10,2)	
);

-- Essa tabela será utilizada para armazenar as logs:

CREATE TABLE projeto_instrutor.log_instrutor(
	id SERIAL PRIMARY KEY,
	id_instrutor INTEGER REFERENCES projeto_instrutor.instrutor(id), 
	informacao VARCHAR(255),
	momento_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM projeto_instrutor.instrutor;

SELECT * FROM projeto_instrutor.log_instrutor;


/* CRIANDO FUNCTION */

CREATE OR REPLACE FUNCTION projeto_instrutor.inserir_instrutor () RETURNS TRIGGER AS $$
	DECLARE 
		media_salario DECIMAL;
		total_instrutor INTEGER DEFAULT 0;
		instrutor_recebem_menos INTEGER DEFAULT 0;
		percentual DECIMAL;
		salario INTEGER;
	BEGIN
		
		SELECT AVG(instrutor.salario) INTO media_salario FROM projeto_instrutor.instrutor WHERE id != NEW.id;
		
		IF NEW.salario > media_salario AND media_salario != 0 THEN
			INSERT INTO projeto_instrutor.log_instrutor (id_instrutor,informacao) 
			VALUES (NEW.id,CONCAT('Salário do instrutor ', NEW.nome,' é acima da media.'));
		END IF;
		
		FOR salario IN SELECT instrutor.salario FROM projeto_instrutor.instrutor WHERE id != NEW.id LOOP
			
			total_instrutor := total_instrutor + 1;
		
			IF NEW.salario > salario THEN
				instrutor_recebem_menos := instrutor_recebem_menos + 1;
			END IF;
			
		END LOOP;
		IF salario > 0 THEN
			percentual = instrutor_recebem_menos::DECIMAL / total_instrutor::DECIMAL * 100;

			INSERT INTO projeto_instrutor.log_instrutor (id_instrutor,informacao) 
				VALUES (NEW.id,CONCAT('O instrutor ', NEW.nome,' recebe mais que ', ROUND(percentual,2) ,'% da grade de instrutores.')); 
		
		ELSE 
			INSERT INTO projeto_instrutor.log_instrutor (id_instrutor,informacao) 
				VALUES (NEW.id,CONCAT('O instrutor ', NEW.nome,' foi o primeiro cadastro.')); 
		END IF;
		RETURN NEW;
	END;
$$ LANGUAGE plpgsql;

-- Configurando TRIGGER:

CREATE TRIGGER inserir_log AFTER INSERT ON projeto_instrutor.instrutor
	FOR EACH ROW EXECUTE FUNCTION projeto_instrutor.inserir_instrutor ();
	
-- Inserir dados utilizando a função:

INSERT INTO projeto_instrutor.instrutor (nome,salario) VALUES ('João Ramos', 1250);
INSERT INTO projeto_instrutor.instrutor (nome,salario) VALUES ('Marcelo Aberto', 250);
INSERT INTO projeto_instrutor.instrutor (nome,salario) VALUES('Carla Suzart', 500);
INSERT INTO projeto_instrutor.instrutor (nome,salario) VALUES ('Alcivan Araujo', 150);
INSERT INTO projeto_instrutor.instrutor (nome,salario) VALUES ('Fernando Ramos', 750);
INSERT INTO projeto_instrutor.instrutor (nome,salario) VALUES ('Marileide Santos', 2000);
INSERT INTO projeto_instrutor.instrutor (nome,salario) VALUES ('Devinho Novaes', 267);
INSERT INTO projeto_instrutor.instrutor (nome,salario) VALUES ('Felipe Amorim', 456);
INSERT INTO projeto_instrutor.instrutor (nome,salario) VALUES ('Zé Neto', 983);
INSERT INTO projeto_instrutor.instrutor (nome,salario) VALUES ('Leo Santana', 356);
INSERT INTO projeto_instrutor.instrutor (nome,salario) VALUES ('Luciano Hulk', 259);
INSERT INTO projeto_instrutor.instrutor (nome,salario) VALUES ('Raquel dos Teclados', 1897);


SELECT * FROM projeto_instrutor.instrutor;
SELECT * FROM projeto_instrutor.log_instrutor;

-- Criando uma VIEW para os resultados:

CREATE VIEW projeto_instrutor.vw_instrutor_log_instrutor AS SELECT projeto_instrutor.instrutor.id AS id_instrutor,
		projeto_instrutor.instrutor.nome AS nome_instrutor,
		projeto_instrutor.instrutor.salario AS salario_instrutor,
		projeto_instrutor.log_instrutor.id AS id_log,
		projeto_instrutor.log_instrutor.informacao,
		projeto_instrutor.log_instrutor.momento_criacao
	FROM projeto_instrutor.instrutor 
	JOIN projeto_instrutor.log_instrutor ON projeto_instrutor.instrutor.id = projeto_instrutor.log_instrutor.id_instrutor;
	
-- Utilizando a VIEW:

SELECT * FROM projeto_instrutor.vw_instrutor_log_instrutor;

