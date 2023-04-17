SELECT * FROM aluno;
SELECT * FROM aluno_curso;

SELECT aluno.primeiro_nome,COUNT(aluno_curso.curso_id) FROM aluno 
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	GROUP BY 1;
	

 SELECT curso.nome, 
		COUNT(aluno_curso.aluno_id) AS numero_alunos 
 	 FROM curso 
	 JOIN aluno_curso ON aluno_curso.curso_id = curso.id
 GROUP BY 1
 ORDER BY numero_alunos DESC;
 
 
 SELECT * FROM CURSO WHERE CATEGORIA_ID IN (1,2);
 
 SELECT * FROM vw_cursos_por_categoria WHERE numero_cursos > 3;
 
 SELECT categoria.id,vw_cursos_por_categoria.* FROM vw_cursos_por_categoria 
 	JOIN categoria ON vw_cursos_por_categoria.categoria = categoria.nome;
	
	
 SELECT curso.id,curso.nome FROM curso
 	JOIN categoria ON categoria.id = curso.categoria_id
	WHERE categoria.id = 2;
	
	
CREATE TABLE cursos_prog (
	id_curso INTEGER PRIMARY KEY,
	nome_curso VARCHAR(255) NOT NULL
);

INSERT INTO cursos_prog SELECT curso.id,curso.nome FROM curso
 	JOIN categoria ON categoria.id = curso.categoria_id
	WHERE categoria.id = 2;

SELECT * FROM cursos_prog ORDER BY id_curso;

SELECT * FROM curso ORDER BY id;

UPDATE curso SET nome = 'PHP Básico' WHERE id = 4;

UPDATE cursos_prog SET nome_curso = curso.nome 
	FROM curso
	WHERE cursos_prog.id_curso = curso.id
	AND cursos_prog.id_curso <= 6;
	
SELECT * FROM categoria;
INSERT INTO aluno (primeiro_nome,ultimo_nome,data_nascimento)
VALUES ('Marileide','Santos','1973-08-07');
SELECT NEXTVAL('categoria_id_seq');

INSERT INTO categoria (nome) VALUES ('DBA');

