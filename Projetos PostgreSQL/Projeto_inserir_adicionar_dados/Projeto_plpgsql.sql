-- Projeto utilizando plpgsql para inserir um curso em determinada categoria.
-- Se não existir a categoria, será criada uma nova categoria e o curso será inserido.
-- Se já existir um curso com aquele nome, nada será alterado.

/* CRIAÇÃO SCHEMA SEPARADO */
-- Crie o schema.

CREATE SCHEMA projeto_curso_cat;

/* TABLE UTILIZADAS NO PROJETO */
-- Crie as tables no schema criado.

CREATE TABLE projeto_curso_cat.aluno (
    id SERIAL PRIMARY KEY,
	primeiro_nome VARCHAR(255) NOT NULL,
	ultimo_nome VARCHAR(255) NOT NULL,
	data_nascimento DATE NOT NULL
);

CREATE TABLE projeto_curso_cat.categoria (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE projeto_curso_cat.curso (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	categoria_id INTEGER NOT NULL REFERENCES projeto_curso_cat.categoria(id)
);

CREATE TABLE projeto_curso_cat.aluno_curso (
	aluno_id INTEGER NOT NULL REFERENCES projeto_curso_cat.aluno(id),
	curso_id INTEGER NOT NULL REFERENCES projeto_curso_cat.curso(id),
	PRIMARY KEY (aluno_id, curso_id)
);

-- Verifique se estão criadas.

SELECT * FROM projeto_curso_cat.aluno;
SELECT * FROM projeto_curso_cat.categoria;
SELECT * FROM projeto_curso_cat.curso;
SELECT * FROM projeto_curso_cat.aluno_curso;


/* ALIMENTANDO TABELAS */
-- Adicionando dados as tabelas criadas.

INSERT INTO projeto_curso_cat.aluno (primeiro_nome, ultimo_nome, data_nascimento) VALUES (
	'Vinicius', 'Dias', '1997-10-15'
), (
	'Patricia', 'Freitas', '1986-10-25'
), (
	'Diogo', 'Oliveira', '1984-08-27'
), (
	'Maria', 'Rosa', '1985-01-01'
);

INSERT INTO projeto_curso_cat.categoria (nome) VALUES ('Front-end'), ('Programação'), ('Bancos de dados'), ('Data Science');

INSERT INTO projeto_curso_cat.curso (nome, categoria_id) VALUES
	('HTML', 1),
	('CSS', 1),
	('JS', 1),
	('PHP', 2),
	('Java', 2),
	('C++', 2),
	('PostgreSQL', 3),
	('MySQL', 3),
	('Oracle', 3),
	('SQL Server', 3),
	('SQLite', 3),
	('Pandas', 4),
	('Machine Learning', 4),
	('Power BI', 4);
	
INSERT INTO projeto_curso_cat.aluno_curso VALUES (1, 4), (1, 11), (2, 1), (2, 2), (3, 4), (3, 3), (4, 4), (4, 6), (4, 5);


-- Verifique se os dados foram inseridos.

SELECT * FROM projeto_curso_cat.aluno;
SELECT * FROM projeto_curso_cat.categoria;
SELECT * FROM projeto_curso_cat.curso;
SELECT * FROM projeto_curso_cat.aluno_curso;

/* CRIANDO A FUNÇÃO */

CREATE OR REPLACE FUNCTION projeto_curso_cat.criar_curso_cat(nome_curso VARCHAR, nome_categoria VARCHAR) RETURNS VARCHAR AS $$
	DECLARE
		id_categoria INTEGER;
		id_curso INTEGER;
	BEGIN
		
		SELECT id FROM projeto_curso_cat.curso WHERE nome = nome_curso INTO id_curso;
		
		IF NOT FOUND THEN
		
			SELECT id INTO id_categoria FROM projeto_curso_cat.categoria WHERE nome = nome_categoria;

			IF NOT FOUND THEN
				INSERT INTO projeto_curso_cat.categoria (nome) VALUES (nome_categoria) RETURNING id INTO id_categoria;
			END IF;

			INSERT INTO projeto_curso_cat.curso (nome,categoria_id) VALUES (nome_curso,id_categoria);
			RETURN 'Alterações concluidas!';	
		ELSE 
			RETURN 'O nome do curso já existente, nada foi alterado!';
		END IF;
	END;
$$ LANGUAGE plpgsql;

-- Testando função:

SELECT * FROM projeto_curso_cat.curso;
SELECT * FROM projeto_curso_cat.categoria;

SELECT projeto_curso_cat.criar_curso_cat('PHP','Data Science');

-- Dois retornos:
-- 1- Se já ouver o nome do curso aparecerá a mensagem "O nome do curso já existente, nada foi alterado!". E não irá alterar nada.
-- 2- Se não existir o nome do curso ou não existir e nome do curso e a categoria parecerá a mensagem "Alterações concluidas!". E irá executar as alterações.