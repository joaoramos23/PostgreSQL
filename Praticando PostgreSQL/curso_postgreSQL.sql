CREATE DATABASE curso_postgre; /* CRIAR DATABASE */

CREATE DATABASE teste;

DROP DATABASE teste; /* EXCLUIR DATABASE */

/* CRIAR TABELA */

CREATE TABLE aluno
(
    id SERIAL,
    nome  VARCHAR(255),
    cpf CHAR(11),
    observacao TEXT,
    idade INTEGER,
    dinheiro NUMERIC(10,2),
    altura REAL,
    ativo BOOLEAN,
    data_nascimento DATE,
    hora_aula TIME,
    matriculado_em TIMESTAMP
);

SELECT * FROM aluno; /* CULSUTAR TABELA */

/* INSERIR DADOS TABELA */

INSERT INTO aluno(
	nome,
	cpf,
	observacao,
	idade,
	dinheiro,
	altura,
	ativo,
	data_nascimento,
	hora_aula,
	matriculado_em) 
VALUES (
	'Diogo',
	'12345678901',
	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras finibus mollis justo in congue. Curabitur eget malesuada lorem, posuere varius ante. Mauris in est orci. Sed semper pretium velit vitae egestas. Donec finibus semper eleifend. Ut id velit ultricies, pellentesque purus nec, maximus risus. Nulla tristique tellus nec quam condimentum, sit amet convallis erat fermentum. Mauris in dictum dui. In et ante quam. Suspendisse tempor leo nec elementum mattis. Vestibulum rutrum quam risus, eu aliquam sem rhoncus eu.Vestibulum facilisis nunc at viverra luctus. Vestibulum quis tortor lacus. Sed at euismod mauris. Praesent sed neque risus. Donec sed cursus ligula. Nam cursus porttitor purus auctor consequat. In vitae turpis aliquet, euismod quam eu, finibus lacus. Curabitur volutpat tellus et pretium volutpat.',
	35,
	100.50,
	1.81,
	TRUE,
	'1984-08-27',
	'17:30:00',
	'2020-02-08 12:32:45'
);

SELECT * FROM aluno;

SELECT * FROM aluno WHERE ID = 1; 

/* ATUALIZAR TABELA */

UPDATE aluno SET 
	nome = 'Nico',
	cpf = '10987654321',
	observacao ='Teste',
	idade = 38,
	dinheiro = 15.32,
	altura = 1.90,
	ativo = FALSE,
	data_nascimento = '1980-01-15',
	hora_aula = '13:00:00',
	matriculado_em = '2020-01-02 15:00:00'
  WHERE id = 1;
  
  
SELECT * FROM aluno ;

SELECT * FROM aluno WHERE nome = 'Nico';

DELETE FROM aluno WHERE nome = 'Nico'; /* EXCLUIR TABELA */

INSERT INTO aluno(
	nome,
	cpf,
	observacao,
	idade,
	dinheiro,
	altura,
	ativo,
	data_nascimento,
	hora_aula,
	matriculado_em) 
VALUES (
	'Diogo',
	'12345678901',
	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras finibus mollis justo in congue. Curabitur eget malesuada lorem, posuere varius ante. Mauris in est orci. Sed semper pretium velit vitae egestas. Donec finibus semper eleifend. Ut id velit ultricies, pellentesque purus nec, maximus risus. Nulla tristique tellus nec quam condimentum, sit amet convallis erat fermentum. Mauris in dictum dui. In et ante quam. Suspendisse tempor leo nec elementum mattis. Vestibulum rutrum quam risus, eu aliquam sem rhoncus eu.Vestibulum facilisis nunc at viverra luctus. Vestibulum quis tortor lacus. Sed at euismod mauris. Praesent sed neque risus. Donec sed cursus ligula. Nam cursus porttitor purus auctor consequat. In vitae turpis aliquet, euismod quam eu, finibus lacus. Curabitur volutpat tellus et pretium volutpat.',
	35,
	100.50,
	1.81,
	TRUE,
	'1984-08-27',
	'17:30:00',
	'2020-02-08 12:32:45'
);

/* TIPOS DE CONSULTAS */

SELECT * FROM aluno;

SELECT nome FROM aluno;
  
SELECT nome, idade FROM aluno;
   
SELECT nome, idade, matriculado_em FROM aluno;
  
SELECT	nome,
 		idade,
		matriculado_em as quando_se_matriculou
FROM aluno;
  
SELECT	nome as "Nome do Aluno",
 		idade,
		matriculado_em as quando_se_matriculou
FROM aluno;  

INSERT INTO aluno (nome) VALUES('Vinicius Dias');
INSERT INTO aluno (nome) VALUES('Nico Steppat');
INSERT INTO aluno (nome) VALUES('João Roberto');
INSERT INTO aluno (nome) VALUES('Diego');

SELECT * FROM aluno; 
  
SELECT * FROM alunO WHERE nome= 'Diogo';
 
SELECT * FROM aluno WHERE nome <> 'Diogo';
 
SELECT * FROM aluno WHERE nome != 'Diogo';
 
SELECT * FROM aluno WHERE nome LIKE '_iogo';
 
SELECT * FROM aluno WHERE nome LIKE 'Di_go';
 
SELECT * FROM aluno WHERE nome NOT LIKE 'Di_go';
 
SELECT * FROM aluno WHERE nome LIKE 'D%';
 
SELECT * FROM aluno WHERE nome LIKE '%s';
 
SELECT * FROM aluno WHERE nome LIKE '% %';
 
SELECT * FROM aluno WHERE nome LIKE '%i%a%';

SELECT * FROM alunO WHERE cpf IS NULL;
 
SELECT * FROM aluno WHERE cpf IS NOT NULL;

SELECT * FROM aluno WHERE idade = 35;

SELECT * FROM aluno WHERE idade <= 35;
   
SELECT * FROM aluno WHERE idade BETWEEN 10 AND 40;
 
SELECT * FROM aluno WHERE ativo = true;
SELECT * FROM aluno WHERE ativo = false; 
SELECT * FROM aluno WHERE ativo IS NULL;

SELECT * FROM aluno WHERE nome LIKE 'D%'
AND cpf IS NOT NULL;
   
SELECT * FROM aluno WHERE nome LIKE 'Diogo'
OR nome LIKE 'Rodrigo';
   
SELECT * FROM aluno WHERE nome LIKE 'Diogo'
OR nome LIKE 'Rodrigo'
OR nome LIKE 'Nico%';
	
SELECT * FROM aluno WHERE nome LIKE '%Steppat'
AND nome LIKE 'Nico%';
	
SELECT * FROM aluno WHERE nome LIKE 'Diogo'
OR nome LIKE 'Nico%';


CREATE TABLE curso(
	id INTEGER PRIMARY KEY,
	nome VARCHAR(255) NOT NULL
);

INSERT INTO curso (id, nome) VALUES (1, 'HTML');
INSERT INTO curso (id, nome) VALUES (2, 'Javascript');

SELECT * FROM curso;

SELECT * FROM aluno;

DROP TABLE aluno;

CREATE TABLE aluno (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL
);

INSERT  INTO aluno (nome) VALUES ('Diogo');
INSERT  INTO aluno (nome) VALUES ('Vinícius');

SELECT * FROM aluno;

SELECT * FROM curso;

CREATE TABLE aluno_curso (
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (aluno_id,curso_id),
	FOREIGN KEY (aluno_id)
		REFERENCES ALUNO(ID),
	FOREIGN KEY (curso_id)
		REFERENCES CURSO(ID)
);


INSERT  INTO aluno_curso (aluno_id,curso_id) VALUES (1,1);
INSERT  INTO aluno_curso (aluno_id,curso_id) VALUES (2,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,2);

SELECT ALUNO.ID AS ALUNO_ID,ALUNO.NOME AS NOME_ALUNO,CURSO.ID AS CURSO_ID,CURSO.NOME AS NOME_CURSO FROM ALUNO 
JOIN ALUNO_CURSO ON ALUNO_CURSO.ALUNO_ID = ALUNO.ID
JOIN CURSO ON CURSO.ID = ALUNO_CURSO.CURSO_ID;

INSERT INTO aluno (nome) VALUES ('Nico');

SELECT * FROM aluno;
  
INSERT INTO curso (id,nome) VALUES (3,'CSS');

SELECT * FROM curso;

SELECT ALUNO.ID AS ALUNO_ID,ALUNO.NOME AS NOME_ALUNO,CURSO.ID AS CURSO_ID,CURSO.NOME AS NOME_CURSO FROM ALUNO 
LEFT JOIN ALUNO_CURSO ON ALUNO_CURSO.ALUNO_ID = ALUNO.ID
LEFT JOIN CURSO ON CURSO.ID = ALUNO_CURSO.CURSO_ID;

SELECT ALUNO.ID AS ALUNO_ID,ALUNO.NOME AS NOME_ALUNO,CURSO.ID AS CURSO_ID,CURSO.NOME AS NOME_CURSO FROM ALUNO 
RIGHT JOIN ALUNO_CURSO ON ALUNO_CURSO.ALUNO_ID = ALUNO.ID
RIGHT JOIN CURSO ON CURSO.ID = ALUNO_CURSO.CURSO_ID;

SELECT ALUNO.ID AS ALUNO_ID,ALUNO.NOME AS NOME_ALUNO,CURSO.ID AS CURSO_ID,CURSO.NOME AS NOME_CURSO FROM ALUNO 
FULL JOIN ALUNO_CURSO ON ALUNO_CURSO.ALUNO_ID = ALUNO.ID
FULL JOIN CURSO ON CURSO.ID = ALUNO_CURSO.CURSO_ID;

INSERT INTO aluno (nome) VALUES ('João');

SELECT ALUNO.ID AS ALUNO_ID,ALUNO.NOME AS NOME_ALUNO,CURSO.ID AS CURSO_ID,CURSO.NOME AS NOME_CURSO FROM ALUNO 
CROSS JOIN CURSO;

DROP TABLE aluno_curso;

CREATE TABLE aluno_curso (
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (aluno_id,curso_id),
	
	FOREIGN KEY (aluno_id)
     REFERENCES aluno (id)
	 ON DELETE CASCADE,
	
	FOREIGN KEY (curso_id)
   REFERENCES curso (id)
);

INSERT  INTO aluno_curso (aluno_id,curso_id) VALUES (1,1);
INSERT  INTO aluno_curso (aluno_id,curso_id) VALUES (2,1);

INSERT  INTO aluno_curso (aluno_id,curso_id) VALUES (3,1);
INSERT  INTO aluno_curso (aluno_id,curso_id) VALUES (1,3);

SELECT * FROM aluno_curso;

SELECT ALUNO.ID AS ALUNO_ID,ALUNO.NOME AS NOME_ALUNO,CURSO.ID AS CURSO_ID,CURSO.NOME AS NOME_CURSO FROM ALUNO 
JOIN ALUNO_CURSO ON ALUNO_CURSO.ALUNO_ID = ALUNO.ID
JOIN CURSO ON CURSO.ID = ALUNO_CURSO.CURSO_ID;

DELETE FROM aluno WHERE id =1;

SELECT ALUNO.ID AS ALUNO_ID,ALUNO.NOME AS NOME_ALUNO,CURSO.ID AS CURSO_ID,CURSO.NOME AS NOME_CURSO FROM ALUNO 
JOIN ALUNO_CURSO ON ALUNO_CURSO.ALUNO_ID = ALUNO.ID
JOIN CURSO ON CURSO.ID = ALUNO_CURSO.CURSO_ID;
	
DROP TABLE aluno_curso;

CREATE TABLE aluno_curso (
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (aluno_id,curso_id),
	
	FOREIGN KEY (aluno_id)
    	REFERENCES aluno (id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	FOREIGN KEY (curso_id)
   		REFERENCES curso (id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
	
);

INSERT  INTO aluno_curso (aluno_id,curso_id) VALUES (2,1);
INSERT  INTO aluno_curso (aluno_id,curso_id) VALUES (3,1);

SELECT ALUNO.ID AS ALUNO_ID,ALUNO.NOME AS NOME_ALUNO,CURSO.ID AS CURSO_ID,CURSO.NOME AS NOME_CURSO FROM ALUNO 
JOIN ALUNO_CURSO ON ALUNO_CURSO.ALUNO_ID = ALUNO.ID
JOIN CURSO ON CURSO.ID = ALUNO_CURSO.CURSO_ID;
  
UPDATE ALUNO SET ID = 1 WHERE ID = 3;

UPDATE CURSO SET ID = 1 WHERE ID = 5;



CREATE TABLE funcionarios (
	id			SERIAL PRIMARY KEY,
	matricula	VARCHAR(10),
	nome		VARCHAR(255),
	sobrenome	VARCHAR(255)
);

INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES('M001','Diogo','Mascarenha');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES('M002','Vinicius','Dias');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES('M003','Nico','Steppat');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES('M004','João','Roberto');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES('M005','Diogo','Mascarenha');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES('M006','Alberto','Martins');


SELECT * FROM funcionarios ORDER BY nome;
	
SELECT * FROM funcionarios ORDER BY nome DESC;
	
SELECT * FROM funcionarios ORDER BY nome,matricula DESC;
	
SELECT * FROM funcionarios ORDER BY 3,4,2;
	
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES('M007','Diogo','Oliveira');
	
SELECT * FROM funcionarios ORDER BY 4 DESC, nome DESC, 2 ASC;
		
SELECT ALUNO.ID AS ALUNO_ID,ALUNO.NOME AS NOME_ALUNO,CURSO.ID AS CURSO_ID,CURSO.NOME AS NOME_CURSO FROM ALUNO 
JOIN ALUNO_CURSO ON ALUNO_CURSO.ALUNO_ID = ALUNO.ID
JOIN CURSO ON CURSO.ID = ALUNO_CURSO.CURSO_ID
ORDER BY ALUNO.NOME;
  
SELECT ALUNO.ID AS ALUNO_ID,ALUNO.NOME AS NOME_ALUNO,CURSO.ID AS CURSO_ID,CURSO.NOME AS NOME_CURSO FROM ALUNO 
JOIN ALUNO_CURSO ON ALUNO_CURSO.ALUNO_ID = ALUNO.ID
JOIN CURSO ON CURSO.ID = ALUNO_CURSO.CURSO_ID
ORDER BY ALUNO.NOME DESC, CURSO.NOME;
 	
SELECT * FROM ALUNO;
SELECT * FROM CURSO;

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (4,3);
  
SELECT ALUNO.ID AS ALUNO_ID,ALUNO.NOME AS NOME_ALUNO,CURSO.ID AS CURSO_ID,CURSO.NOME AS NOME_CURSO FROM ALUNO 
JOIN ALUNO_CURSO ON ALUNO_CURSO.ALUNO_ID = ALUNO.ID
JOIN CURSO ON CURSO.ID = ALUNO_CURSO.CURSO_ID
ORDER BY ALUNO.NOME, CURSO.NOME ASC;

SELECT * FROM funcionarios;

SELECT * FROM funcionarios LIMIT 5;

SELECT * FROM funcionarios 
ORDER BY nome
LIMIT 5;
	
SELECT * FROM funcionarios 
ORDER BY id
LIMIT 5
OFFSET 3;

-- COUNT - Retorna a quantidade de registros
-- SUM   - Retorna a soma dos registros
-- MAX   - Retorna o maior valor dos registros
-- MIN   - Retorna o menor valor dos registros
-- AVG   - Retorna a média dos registros

SELECT * FROM funcionarios;
	
SELECT COUNT(id) 
	FROM funcionarios;
	
SELECT	COUNT(id),
		SUM(id)
FROM funcionarios;
	
SELECT COUNT(id),
	   SUM(id),
	   MAX(id)
FROM funcionarios;

SELECT COUNT(id),
	   SUM(id),
	   MAX(id),
	   MIN(Id)
FROM funcionarios;
	
SELECT COUNT(id),
	   SUM(id),
	   MAX(id),
	   MIN(Id),
	   ROUND(AVG(id),0)
FROM funcionarios;


	
SELECT nome FROM funcionarios;

SELECT nome FROM funcionarios
ORDER BY nome;
	
	
SELECT DISTINCT /* UTILIZADO PARA NAO REPETIR VALORES DAS COLUNAS */
	   nome
	FROM funcionarios
	ORDER BY nome;
	
SELECT DISTINCT nome, sobrenome FROM funcionarios
ORDER BY nome;
	
SELECT NOME,COUNT(ID) FROM FUNCIONARIOS
GROUP BY NOME
ORDER BY COUNT(ID) DESC;
	
SELECT  
	   nome,
	   sobrenome,
	   COUNT(id)
	FROM funcionarios
	GROUP BY 1, 2
	ORDER BY nome;
	
	
SELECT curso.nome, COUNT(aluno.id) FROM aluno
JOIN aluno_curso ON aluno.id = aluno_curso.aluno_id
JOIN curso ON curso.id = aluno_curso.curso_id
GROUP BY 1
ORDER BY 1;
	
SELECT  curso.nome,COUNT(aluno.id) FROM curso
LEFT JOIN aluno_curso ON aluno_curso.curso_id = curso.id
LEFT JOIN aluno ON aluno.id = aluno_curso.aluno_id
GROUP BY 1
HAVING COUNT(aluno.id) > 1;
		
SELECT nome, COUNT(id) FROM funcionarios
GROUP BY nome
HAVING COUNT(id) > 1;

SELECT nome, COUNT(id)FROM funcionarios
GROUP BY nome
HAVING COUNT(id) = 1;

					
