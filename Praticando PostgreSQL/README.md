<h1 align="center"> SQL -- POSTGRESQL </h1>
<p align="center">Estudos de banco de dados e SGBD.</p>
By: João Ramos

# PostgreSQL

* Criar DATABASE(banco de dados) &rarr;
CREATE DATABASE nome_database;

* Apagar DATABASE(banco de dados) &rarr;
DROP DATABASE nome_database;


<h3>Data types PostgreSQL:</h3>

<br>interger &rarr; número inteiro;
<br>real &rarr; casas decimais com 6 digitos de precisão;
<br>serial &rarr; auto incremento é um inteiro;
<br>numeric &rarr; casas decimais escolhendo a precisão;

<br>varchar(n) &rarr; texto com limite de tamanho;
<br>char(n) &rarr; texto com exatamente o tamanho;
<br>text &rarr; texto sem limite de tamanho;

<br>boolean -> verdadeiro ou falso;

<br>date &rarr; para data;
<br>time &rarr; para hora;
<br>timestamp &rarr; para data/hora;
<br>

<h3>Para criar tabela(TABLE):</h3>
" CREACE TABLE nome_tabela(
    coluna1 'data type',
    coluna2 'data type',
    coluna3 'data type'

);"

<h3>Para consultar a tabela(SELECT):</h3>
"SELECT * FROM nome_tabela;"


<h3>Incluir dado na tabela(INSERT INTO):</h3>
"INSERT INTO nome_tabela (colunas) VALUES (valores);"


<h3>Atualizar dado na tabela(UPDATE):</h3>
"UPDATE nome_tabela SET (campos e valores para atualizar) WHERE (onde atualizar);"


<h3>Excluir dado na tabela(DELETE):</h3>
"DELETE FROM nome_tabela WHERE (onde vai excluir);"


<h3>Seleção de campos especificos:</h3>
"SELECT nome_coluna1 AS "Nome Coluna 1", nome_coluna2 AS nome_coluna_dois FROM nome_tabela; "

- Conseguimos mudar o nome da coluna para uma consulta mais detalhada. As duas formas são validas. Uma mostrará o nome com espaços e a outro utilizará o 'snake_case';


<h3>Filtrando registo de campo do tipo texto:</h3>
"SELECT * FROM nome_tabela WHERE nome_coluna LIKE "%xempl%" "
"SELECT * FROM nome_tabela WHERE nome_coluna NOT LIKE "exemp%" "

<h3>Filtrando registro de campos do tipo numero,data e boolean:</h3>
"SELECT * FROM nome_tabela WHERE nome_coluna IS NULL;"
"SELECT * FROM nome_tabela WHERE nome_coluna IS NOT NULL;"

"SELECT * FROM nome_tabela WHERE nome_coluna BETWEEN 10 AND 30;"


<h3>Filtrando utilizando operadores AND e OR:</h3>
"SELECT * FROM nome_tabela WHERE nome_coluna > 5 AND nome_coluna < 15;"

- Para o operador logico AND as duas condições precisam estar VERDADEIRO para ele ser VERDADEIRO, já o operador logico OR precisa apenas que umas das condições seja VERDADEIRO para ele ser VERDADEIRO;


<h3>Chaves primarias(PRIMARY KEY):</h3>
- Criando tabelas e adicionando "NOT NULL" onde informa que a coluna não pode receber valor vazio e adicionando "UNIQUI" onde a coluna só receberá valores únicos. Utilizando o "PRIMARY KEY" essa função tem essas duas características. 

<h3>Chaves estrangeiras (FOREIGN KEY):</h3>
- Um campo que estabelece relacionamento entre duas tabelas.
"FOREIGN KEY (nome_coluna_origem)
    REFERENCES nome_tabela_destino(nome_coluna_destino);"


<h3>Consultas com relacionamentos:</h3>

- JOIN: Juntar o dado da tabela_A com o dado da tabela_B onde deverá existir uma coluna em comum nas duas tabelas.
"SELECT nome_tabelaA.nome_colunaA, nome_tabelaB.nome_colunaB FROM nome_tabelaA JOIN nome_tabelaB 
    ON nome_tabelaA.nome_colunaA = nome_tabelaB.nome_colunaB;"

- LEFT JOIN: Mostra os itens da tabela da esquerda incluindo os itens em interseção com a tabela da direita.
"FROM tabela1 LEFT JOIN tabela2 ON tabela1.produto = tabela2.produto;"

- RIGHT JOIN: Mostra os itens da tabela da direita incluindo os itens em interseção com a tabela da esquerda.

- FULL JOIN: Mostra a junção de todos os dados.

- CROSS JOIN: Faz uma junção colocando todos ta tabelaA junto com todos da tabelaB.
"SELECT * FROM nome_tabela CROSS JOIN nome_tabela2;"


<h3>Restrição de chave estrangeira:</h3>

- DELETE CASCADE: Ao criar a tabela adicionar a instrução de -> "ON DELETE CASCADE;" para poder excluir a coluna.

- UPDATE CASCADE: Ao criar a tabela adicionar a instrução de -> "ON UPDATE CASCADE;" para poder atualizar a coluna.


<h3>Ordenando as consultas:</h3>

- ORDER BY: Ordena um campo tanto CRESCENTE como DECRESCENTE. "ORDER BY nome_coluna ASC;" / "ORDER BY nome_coluna DESC;" utilizando sempre no final da consulta.

- LIMIT: Para limitar os registros. "LIMIT 5;" irá mostrar apenas os 5 registros.
- OFFSET: Ira percorrer os registro a partir do parâmetro dado. 
"OFFSET 1;" -> Começará a consultar a partir da posição 2.


<h3>Funções de agregação:</h3>
- COUNT: Calcula a quantidade de registros. "SELECT COUNT(nome_coluna) FROM nome_tabela;".

- SUM: Soma os valores do registro. "SELECT SUM(nome_coluna) FROM nome_tabela;".

- MAX / MIN: Mostra o valor minimo e maximo da tabela.. "SELECT MAX / MIN(nome_coluna) FROM nome_tabela;".

- COUNT: Calcula a media dos valores do registros. "SELECT AVG(nome_coluna) FROM nome_tabela;".

- ROUND: Arredando os valores dos registros.
"ROUND(AVG(nome_coluna),qntd. casas decimais)"


<h3>Agrupamento de consultas:</h3>

- DISTINCT: Todos os dados da consulta não irão se repetir.

- GROUP BY: Utilizamos quando utilizamos funções de agregação.

- HAVING: Função é a mesma coisa do WHERE, mas é utilizada quando usamos funções de agrupamento.

# PostgreSQL parte II

<h3>Chave Estrangeira:</h3>
- Podemos utilizar outra forma para nomear uma chave estrangeira. Podemos criar a tabela e na coluna que queremos referenciar a chave estrangeira usamos -> "nome_coluna1 TIPO REFERENCES nome_coluna2; "

<h3>Informações com relacionamento de campo:</h3>
- Não é necessário ter um método CASCADE para atualizar ou deletar colunas que não tem vinculo/relacionamentos com outras colunas.  

<h3>Operador IN:</h3>
- Com a cláusula "IN()" , conseguimos passar vários parâmetros, que serão comparados com o campo que determinamos. "SELECT * FROM nome_tabela WHERE nome_coluna  IN(parametro1,parametro2,parametroX);"

<h3>Subqueries:</h3>
- Instrução do tipo SELECT dentro de outra instrução SQL, que efetua consultas que, de outra forma, seriam extremamente complicadas ou impossíveis de serem feitas. Normalmente utilizando a cláusula "IN()".
"SELECT * FROM nome_tabela1 WHERE nome_coluna1 IN (SELECT nome_coluna2 FROM nome_tabela2 WHERE nome_coluna3 NOT LIKE '% %');"

<h3>Funções STRINGS:</h3>
(Link documentação: https://www.postgresql.org/docs/15/functions-string.html)

- || Serve para concatenar STRINGS. "SELECT (nome_coluna1 || 'espaço' || nome_coluna2) AS nome_concatenacao FROM tabela;"
- Utilizando a função "CONCAT()" tambem serve para concatenar STRINGS mas ela ignora os parâmetros vazios "NULL".

<h3>Funções DATAS:</h3>
(Link documentação:
https://www.postgresql.org/docs/15/functions-datetime.html)

- "NOW()" Retorna a data, hora e timezone daquele instante.
- "AGE()" Retorna quantos anos a pessoa tem.

<h3>Funções MATEMATICAS:</h3>
(Link documentação:
https://www.postgresql.org/docs/15/functions-math.html)

<h3>Conversão de dados:</h3>
- " :: " é utilizado para converter um valor em tipo de dado diferente.
- Utiliza-se " TO_CHAR() " para fazer a conversão de dados para string. Exemplo: " TO_CHAR(NOW('DD/MM/YYYY');"

<h3>Nomear consultas:</h3>
- Para nomear consultas basta utilizar o "VIEW();". 
- Boa praticar nomear a VIEW começando por 'VW_NOME_VIEW'.
- Pensemos na hipótese de executarmos SELECT FROM cursos_por_categoria WHERE numero_cursos > 3. O código executaria, inicialmente, o SQL que retorna o número de cursos por categoria para, em seguida, executar o filtro, mas sem as otimizações internas do banco de dados. Isso significa que se executássemos o filtro diretamente na nossa query, teríamos uma performance melhor do que aplicando o filtro sobre uma tabela virtual.

# PostgreSQL - DML e DDL - parte III

 <h3> DDL:</h3>
- Data Definition Language - Linguagem de Definição de Dados. São os comandos que interagem com os objetos do banco. Exemplo: "CREATE","ALTER" e "DROP".

<h3>Schemas:</h3>
- O schema é um tipo de objeto de banco de dados cujo propósito é ser uma camada de organização hierárquica que está logo abaixo de uma base de dados.
" CREATE SCHEMA nome_schema; "

<h3>Parâmetros para criar DATABASE:</h3>
(Link documentação: https://www.postgresql.org/docs/current/sql-createdatabase.html)

- OWNER: Dono do banco de dados, por padrão é o usuário que esta conectado.
- TEMPLATE: O que o banco de dados irá conter.
- ENCODING: A tabela de caracteres que a gente vai utilizar. Exemplo: "utf-8".
- LC_COLLATE: Como o SGBD vai tratar a ordenação dos dados.
- LC_CTYPE: Letras maiúsculas ou minúsculas vão interferir em comparações.
- TABLESPACE: Criar espaços físicos onde o SGBD vai separar, para otimizar o banco de dados.
- ALLOW_CONNECTIONS: Para permitir conexões. A ideia é que a gente permita sempre.
- CONNECTION LIMIT: Limite da conexão que iremos ter.
- IS_TEMPLATE: Se estamos criando um template. Por padrão não vem como template.


<h3>Parâmetros para criar TABLE:</h3> 
(Link documentação: https://www.postgresql.org/docs/12/sql-createtable.html)

- TEMPORARY: Podemos criar uma tabela temporária que irá deixar de existir logo após desconectar do banco de dados.
- " IF NOT EXISTS ": Só irá criar a tabela se ela não existir.
- DEFAULT: Podemos adicionar um valor padrão a uma coluna, se ela não for preenchida ela terá um valor padrão.
- CHECK: Podemos fazer verificações para garantir que a coluna não seja uma string vazia por exemplo.


<h3>Alterando informações da TABLE:</h3>
(Link documentação: https://www.postgresql.org/docs/12/sql-altertable.html)

- "ALTER TABLE;": Altera informações da tabela.
- Para alterar o nome da tabela usamos " ALTER TABLE nome_tabela RENAME TO novo_nome_tabela; "
 


<h3>DML:</h3>
- Data Manipulation Language - Linguagem de Manipulação de Dados. Exemplo: "INSERT","UPDATE","DELETE" e "SELECT".

* Utilizando SELECT COM INSERT:
" INSERT INTO nome_tabela SELECT corpo_do_select;"

<h3>Importação de arquivos:</h3>
- Utilizando a função de exportação e importação de dados.
- Utilizando o comando "COPY";
* UPDATE FROM:
- Para atualizar alguma informação da coluna basta utilizar " UPDATE nome_tabela SET coluna_alteracao WHERE onde_alterar ".

<h3>Transações:</h3>
 (Link documentação: https://www.postgresql.org/docs/current/tutorial-transactions.html)

- "START TRANSACTION" ou "BEGIN" para iniciar um transação.
- "ROLLBACK": Desfaz todas as alterações a partir do ponto de transação.
- "COMMIT": Confirma todas as alterações a partir do ponto de transação.

<h3>Sequencias:</h3>
- As "SEQUENCES" facilitam relacionamentos, e trazem algumas facilidades.
- Para criar uma SEQUENCES basta digitar "CREATE SEQUENCE nome_sequences".
- Inserir umas SEQUENCES na hora de criar uma tabela, basta por ela como valor DEFAULT e utilizar um parametro de proximo valor : "DEFAULT NEXTVAL('nome_sequences')".
- Outro parâmetro é o "SELECT CURRVAL ('nome_sequences');" que mostra o valor atual da SQUENCES.

<h3>ENUM:</h3>
(Link documentação: https://www.postgresql.org/docs/current/sql-createtype.html)

- Criar a coluna já especificando quais as informações podem ter nela.
