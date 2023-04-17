# Projeto inserir instrutor e adicionar ao log
> Status do projeto: Em desenvolvimento

Para rodar esse projeto em sua maquina você irá precisar:<br>
* SGBD PostgreSQL (pgAdmin 4).

<br>Objetivo do projeto:<br>
* Projeto utilizando linguagem plpgsql para inserir um instrutor e o salário a tabela instrutor.<br>
* Se o salário for maior do que a média, salvar um log.<br>
* Salvar outro log dizendo que x instrutor recebe mais doque X% da grade de instrutores.<br>

<br>Para rodar o projeto na sua maquina você irá precisar adicionar schemas, tables e insert. Basta digitar:

* Crie um schema:
```
CREATE SCHEMA projeto_instrutor;
```

* Adicione as tabelas no schema criado:
```
CREATE TABLE projeto_instrutor.instrutor (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255),
	salario DECIMAL(10,2)	
);
```

* Adicionando tambem uma tabela para log:
```
CREATE TABLE projeto_instrutor.log_instrutor(
	id SERIAL PRIMARY KEY,
	id_instrutor INTEGER REFERENCES projeto_instrutor.instrutor(id), 
	informacao VARCHAR(255),
	momento_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```
* Configurando TRIGGER:

```
CREATE TRIGGER inserir_log AFTER INSERT ON projeto_instrutor.instrutor
	FOR EACH ROW EXECUTE FUNCTION projeto_instrutor.inserir_instrutor ();
```

* Para melhor vizualização dos resultodas, estou disponibilizando uma VIEW com os principais dados:
```
CREATE VIEW projeto_instrutor.vw_instrutor_log_instrutor AS SELECT projeto_instrutor.instrutor.id AS id_instrutor,
		projeto_instrutor.instrutor.nome AS nome_instrutor,
		projeto_instrutor.instrutor.salario AS salario_instrutor,
		projeto_instrutor.log_instrutor.id AS id_log,
		projeto_instrutor.log_instrutor.informacao,
		projeto_instrutor.log_instrutor.momento_criacao
	FROM projeto_instrutor.instrutor 
	JOIN projeto_instrutor.log_instrutor ON projeto_instrutor.instrutor.id = projeto_instrutor.log_instrutor.id_instrutor;
```	
* Utilizando a VIEW:
```
SELECT * FROM projeto_instrutor.vw_instrutor_log_instrutor;
```
<h3>Observação:</h3>
No codigo disponibilizado tambem existe informações de como usa-lo.
