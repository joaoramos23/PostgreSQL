# Projeto categoria e cursos
> Status do projeto: Em desenvolvimento

Para rodar esse projeto em sua maquina você irá precisar:<br>
* SGBD PostgreSQL (pgAdmin 4).

<br>Objetivo do projeto:<br>
* Projeto utilizando linguagem plpgsql para inserir um curso em determinada categoria.<br>
* Se não existir a categoria, será criada uma nova categoria e o curso será inserido.<br>
* Se já existir um curso com aquele nome, nada será alterado.<br>

<br>Para rodar o projeto na sua maquina você irá precisar adicionar schemas, tables e insert. Basta digitar:

* Crie um schema:
```
CREATE SCHEMA projeto_curso_cat;
```

* Adicione as tabelas no schema criado:
```
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

```

* Adicionando dados as tabelas criadas:
```
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
```

<h3>Observação:</h3>
No codigo disponibilizado tambem existe informações de como usa-lo.
