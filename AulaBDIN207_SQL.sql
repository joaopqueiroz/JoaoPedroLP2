--Liberar o uso do diagrama no SQL Server: exec sp_changedbowner 'sa';

--insert into Salesman values('S1', 'Smith', 20, 'London');
--insert into Salesman values('S2', 'Jones', 10, 'Paris');
--insert into Salesman values('S3', 'Blake', 30, 'Paris');
--insert into Salesman values('S4', 'Clark', 20, 'London');
--insert into Salesman values('S5', 'Adams', 30, 'Athens');

--insert into Pieces values('P1', 'Nut', 'Red', 12, 'London');
--insert into Pieces values('P2', 'Bolt', 'Green', 17, 'Paris');
--insert into Pieces values('P3', 'Screw', 'Blue', 17, 'Rome');
--insert into Pieces values('P4', 'Screw', 'Red', 14, 'London');
--insert into Pieces values('P5', 'Cam', 'Blue', 12, 'Paris');
--insert into Pieces values('P6', 'Cog', 'Red', 19, 'London');

--insert into SalesmanPieces values('S1', 'P1', 300);
--insert into SalesmanPieces values('S1', 'P2', 200);
--insert into SalesmanPieces values('S1', 'P3', 400);
--insert into SalesmanPieces values('S1', 'P4', 200);
--insert into SalesmanPieces values('S1', 'P5', 100);
--insert into SalesmanPieces values('S1', 'P6', 100);
--insert into SalesmanPieces values('S2', 'P1', 300);
--insert into SalesmanPieces values('S2', 'P2', 400);
--insert into SalesmanPieces values('S3', 'P2', 200);
--insert into SalesmanPieces(scod, pcod) values('S4', 'P2');
--insert into SalesmanPieces values('S4', 'P4', 300);
--insert into SalesmanPieces values('S4', 'P5', 400);

-- A linguagem SQL padrão SQL/92
--   SQL quer dizer Structured Query Language
--   É uma linguagem padrão para manipulação de Banco de Dados Relacionais

--   DML (Data Manipulation Language) é um subconjunto da linguagem da SQL que é 
--     utilizado para realizar inclusões, consultas, alterações e exclusões de dados 
--     presentes em registros. Estas tarefas podem ser executadas em vários registros 
--     de diversas tabelas ao mesmo tempo, os comandos que realizam respectivamente 
--     as funções acima referidas são Insert, Select, Update e Delete. 

--   DDL (Data Definition Language): permite ao utilizador definir tabelas novas e 
--     elementos associados. A maioria dos bancos de dados de SQL comerciais tem 
--     extensões proprietárias no DDL. Os comandos básicos da DDL são poucos: Create,
--     Drop e Alter.

-- Mais em http://pt.wikipedia.org/wiki/SQL

-- 16/11/2017 (IN207)

-- Sintaxe Geral do Comando SELECT
--   SELECT [DISTINCT] atributos 
--   FROM tabelas
--   [WHERE predicado]
--   [GROUP BY atributos]
--   [HAVING predicado]
--   [ORDER BY atributos];

-- Exemplos:

-- 1) Recuperar todas as informações sobre todos os fornecedores
SELECT * FROM Fornecedor;

-- 2) Projeção: define que atributos devem ser recuperados.
--    Ex: recuperar o nome e a cidade de todos os fornecedores
SELECT nome, cidade FROM Fornecedor;

-- Observe que SELECT * FROM Fornecedor equivale a:
SELECT id, nome, status, cidade FROM Fornecedor;

-- 3) Registros Duplicados:
--	  Ex: recuperar o código dos fornecedores de todos os fornecimentos
SELECT id_fornecedor FROM Fornecimento;

-- 4) Eliminando Duplicatas: indica que os registros duplicados devem ser eliminados
--    Ex: recuperar o código dos fornecedores que fornecem peças no momento
SELECT DISTINCT id_fornecedor FROM Fornecimento;

-- 5) Expressões: novas colunas podem ser derivadas através de expressões aritméticas
--    envolvendo atributos e constantes
--    Ex: recuperar o código e o peso das peças em gramas (o peso armazenado está em
--    libras). Operações aritméticas: +, -, *, /
SELECT id, (peso * 454) FROM Peça

-- 6) Cláusula ORDER BY: define um critério de ordenação para os registros resultantes
SELECT id, (peso * 454), cidade FROM Peça ORDER BY cidade;

--    ASC = Forma crescente (padrão); DESC = Forma decrescente;
--    As colunas podem ser identificadas pela posição. 
--    Ex: recuperar o código, a cidade e o peso em gramas de todas as peças, ordenadas
--        de forma crescente por cidade e, para cidades iguais, ordenadas de forma 
--        decrescente pelo peso em gramas
SELECT id, cidade, (peso * 454) FROM Peça ORDER BY 2 ASC, 3 DESC;

-- 23/11/2017 (IN207)

-- 7) Cláusula WHERE (Seleção): através da cláusula WHERE, são definidos os predicados
--    (condições) que selecionam os registros a serem recuperados.
--    Ex: recuperar o código e o nome dos fornecedores de Londres
SELECT id, nome FROM Fornecedor WHERE cidade = 'London';

--   O predicado pode ser uma expressão lógica envolvendo condições e os operadores
--   AND, OR ou NOT. Cada condição pode ser definida com os operadores comparativos
--   tradicionais: =, <>, <, <=, > ou >= .

--   Ex: recuperar todas as informações dos fornecedores que são de Londres OU que
--       tem status no intervalo fechado [10,20].
SELECT * FROM Fornecedor WHERE cidade = 'London' OR (status >= 10 AND status <= 20);

--   Ex2: recuperar o código dos fornecedores que fornecem a peça P2
SELECT id_fornecedor FROM Fornecimento WHERE id_peça = 'P2';

-- 8) IS [NOT] NULL verifica se um atributo possui [ou não] o valor nulo.
--   Ex: recuperar as informações sobre os fornecimentos que tem quantidade desconhecida
SELECT * FROM Fornecimento WHERE quantidade IS NULL;

-- 9) LIKE: comparando padrões.
--   O símbolo % representa uma sequencia qualquer de zero ou mais caracteres.
--   O símbolo _ representa um caracter qualquer
--   Ex: recuperar as informações das peças cujo nome começa pela letra C
SELECT * FROM Peça WHERE nome LIKE 'C%';

--   Ex1: nome LIKE '%SILVA%' será verdadeiro para todo nome que contenha o sobrenome SILVA
--   Ex2: nome NOT LIKE 'Z%' será verdadeiro para todo nome que não comece pela letra Z
--   Ex3: nome LIKE '_V_' será verdadeiro para todo nome que tenha 3 letras e que a 2ª
--        letra seja a letra V.

-- 10) BETWEEN: utilizando intervalos nas comparações.
SELECT * FROM Fornecedor WHERE cidade = 'London' OR status BETWEEN 10 AND 20;
-- EQUIVALE A: 
SELECT * FROM Fornecedor WHERE cidade = 'London' OR (status >= 10 AND status <= 20);
--   NOT BETWEEN: recupera valores fora do intervalo.
--   Ex: recupera as informações sobre os fornecimentos que tem quantidade menor que
--       200 ou maior que 300.
SELECT * FROM Fornecimento WHERE quantidade NOT BETWEEN 200 AND 300;

-- 11) Produto Cartesiano (mais de uma tabela)
--     A especificação de mais de uma tabela na cláusula FROM resulta no produto cartesiano
--     das tabelas envolvidas.
--     Ex: recuperar todos os registros da tabela de fornecedores combinados com todos
--         os registros da tabela de peças.
SELECT * FROM Fornecedor, Peça

--     Junção (JOIN), relaciona resgistros de duas (ou mais) tabelas. Esta operação
--     equivale a executar um produto cartesiano entre as relações e selecionar apenas
--     os registros que apresentem o mesmo valor para o atributo da junção.

--     Ex: recuperar os registros da tabela de fornecimentos combinados com os registros
--         da tabela de fornecedores, quando os códigos de fornecedores coincidirem.
SELECT * FROM Fornecedor, Fornecimento WHERE Fornecedor.id = Fornecimento.id_fornecedor;
--     Para evitar redundâncias, devemos qualificar os atributos com mesmo nome, 
--     indicando, através de um prefixo, a tabela de origem.

--	Ex: Join com condições extras e projeção. 
--		Recuperar o código, o nome e a cidade dos fornecedores que forneceram a peça P2.
SELECT Fornecedor.id, Fornecedor.Nome, Fornecedor.cidade
	FROM Fornecedor, Fornecimento
	WHERE Fornecimento.id_fornecedor = Fornecedor.id
	AND Fornecimento.id_peça = 'P2';

--	Ex: Join de três tabelas. 
--		Recuperar todas as informações dos fornecedores que fornecem pelo menos uma peça vermelha.
SELECT Fornecedor.* FROM Fornecedor, Fornecimento, Peça 
	WHERE Fornecedor.id = Fornecimento.id_fornecedor
	AND Peça.id = Fornecimento.id_peça AND Peça.cor = 'Red';

-- Sinônimo (ALIAS): quando uma mesma tabela é utilizada mais de uma vez em uma
-- consulta, precisamos, para não gerar ambiguidades, definir sinônimos para esta tabela.
SELECT f.* FROM Fornecedor AS f, Fornecimento AS ft, Peça AS p
	WHERE f.id = ft.id_fornecedor
	AND ft.id_peça = p.id
	AND p.cor = 'Red';
-- EQUIVALE A :
SELECT Fornecedor.id, Fornecedor.Nome, Fornecedor.cidade
	FROM Fornecedor, Fornecimento
	WHERE Fornecimento.id_fornecedor = Fornecedor.id
	AND Fornecimento.id_peça = 'P2';

-- Ex: Recuperar os códigos de fornecedores localizados na mesma cidade.
SELECT a.id, a.nome, a.cidade, b.id, b.nome, b.cidade
	FROM Fornecedor AS a, Fornecedor AS b
	WHERE a.cidade = b.cidade
	AND a.id < b.id;

-- Exercício 1: Recuperar o nome do fornecedor e da peça de todos os fornecimentos de londres cujo peso 
-- em gramas da peça esteja entre 2000 e 6000.

-- 30/11/2017 (IN207)

		SELECT f.nome, p.nome 
			FROM Fornecedor f, Fornecimento ft, Peça p
			WHERE f.id = ft.id_fornecedor
			AND ft.id_peça = p.id
			AND f.cidade = 'London'
			AND (p.peso * 454) BETWEEN 2000 AND 6000;

-- Exercício 2: Recuperar o nome da peça e o status dos fornecedores que forneceram peças que não são
-- vermelhas ou que possuem peso em gramas menor que 3000
		SELECT DISTINCT p.nome, f.status FROM Fornecedor f, Fornecimento ft, Peça p
			WHERE f.id = ft.id_fornecedor AND ft.id_peça = p.id	
			AND (NOT p.cor = 'red' OR (p.peso * 454) < 3000);

-- Funções Embutidas
-- COUNT(*), COUNT(DISTINCT atributo), SUM, AVG, MIN, MAX

-- COUNT(*) retorna o número de registros da tabela resultante
-- Ex1: retornar o número de fornecedores
SELECT COUNT(*) FROM Fornecedor;

-- Ex2: retornar o número de peças vermelhas
SELECT COUNT(*) FROM Peça WHERE cor = 'Red';

-- COUNT(DISTINCT atributo) retorna o número de valores distintos do atributo
-- Ex1: retornar o número de fornecedores que fornecem peças no momento
SELECT COUNT(DISTINCT id_fornecedor) FROM Fornecimento;

-- Ex2: retornar o número distintos de status dos fornecedores de Londres
SELECT COUNT(DISTINCT status) FROM Fornecedor WHERE cidade = 'London';

-- SUM(atributo) calcula a soma dos valores do atributo
-- Ex: retornar a quantidade total de peças P2 fornecidas
SELECT SUM(quantidade) FROM Fornecimento WHERE id_peça = 'P2';

-- AVG(atributo) calcula a média dos valores do atributo
-- Ex: retornar a quantidade média dos fornecimentos da peça P1
SELECT AVG(quantidade) FROM Fornecimento WHERE id_peça = 'P1';

-- MIN(atributo) calcula o menor valor do atributo
-- Ex: retornar o menor status dos fornecedores
SELECT MIN(status) FROM Fornecedor;

-- MAX(atributo) calcula o maior valor do atributo
-- Ex: retornar o maior status dos fornecedores
SELECT MAX(status) FROM Fornecedor;

-- Cláusula GROUP BY organiza registros em grupos lógicos
-- Ex: recuperar o código das peças e o total fornecido das mesmas neste caso, as funções embutidas passam 
--     a ser calculadas para cada grupo.
SELECT id_peça, SUM(quantidade) AS total_fornecido FROM Fornecimento GROUP BY id_peça;

-- Cláusula HAVING define, através de condições, que grupos devem fazer parte da resposta.
-- Ex: recuperar o código das peças fornecidas por mais de um fornecedor
SELECT id_peça FROM Fornecimento GROUP BY id_peça HAVING COUNT(*) > 1;

-- Exercício 1: Recuperar o nome das cidades que possuem mais de um fornecedor
SELECT cidade FROM Fornecedor GROUP BY cidade HAVING COUNT(*) > 1;

-- Exercício 2: Recuperar o nome das peças fornecidas por mais de um fornecedor
SELECT nome FROM Peça p, Fornecimento ft WHERE p.id = ft.id_peça GROUP BY nome HAVING COUNT(*) > 1;

-- 07/12/2017 (IN207)

-- Exercício 3: Recuperar o menor status entre os fornecedores que forneceram mais de duas vezes
	SELECT DISTINCT MIN(f.status) FROM Fornecedor AS f, Fornecimento AS ft
		WHERE f.id = ft.id_fornecedor 
		GROUP BY ft.id_fornecedor HAVING COUNT(*) > 2;

-- O Operador IN verifica se um elemento pertence a um conjunto.
-- Ex: recuperar todas as informações dos fornecedores S1, S3 e S5
SELECT * FROM Fornecedor WHERE id IN ('S1', 'S3', 'S5');

-- Subconsultas IN, são subconsultas aninhadas. O operador IN indica que as consultas mais internas 
-- devem ser avaliadas primeiro.
-- Ex1: retornar o código, o nome e a cidade dos fornecedores que fornecem a peça P2.
SELECT id, nome, cidade FROM Fornecedor	
	WHERE id IN(SELECT id_fornecedor FROM Fornecimento WHERE id_peça = 'P2');

-- Ex2: recuperar todas as informações dos fornecedores que fornecem pelo menos uma peça vermelha.
SELECT * FROM Fornecedor
	WHERE id IN 
		(SELECT DISTINCT(id_fornecedor) FROM Fornecimento WHERE id_peça IN 
			(SELECT id FROM Peça WHERE cor = 'Red')
		);

-- Subconsultas NOT IN
-- Ex: retornar o código, o nome e a cidade dos fornecedores que NÃO fornecem a peça P2
SELECT id, nome, cidade FROM Fornecedor 
	WHERE id NOT IN (SELECT id_fornecedor FROM Fornecimento WHERE id_peça = 'P2');

-- Subconsulta com operador de comparação.
-- Ex: retornar o código e o nome dos fornecedores localizados na mesma cidade que o fornecedor S1
SELECT id, nome FROM Fornecedor
	WHERE cidade = (SELECT cidade FROM Fornecedor WHERE id = 'S1');

-- Subconsulta EXISTS; o operador EXISTS representa o quantificador lógico existencial.
-- Ex: retornar o código, o nome e a cidade dos fornecedores que fornecem a peça P2
SELECT id, nome, cidade FROM Fornecedor	AS f
	WHERE EXISTS (SELECT * FROM Fornecimento AS ft WHERE id_peça = 'P2' AND f.id = ft.id_fornecedor);

-- Subconsultas NOT EXISTS.
-- Ex: retornar o código, o nome e a cidade dos fornecedores que NÃO fornecem a peça P2
SELECT id, nome, cidade FROM Fornecedor	AS f
	WHERE NOT EXISTS (SELECT * FROM Fornecimento AS ft WHERE id_peça = 'P2' AND f.id = ft.id_fornecedor);

-- Cláusula UNION executa a união de duas consultas
-- Ex: recuperar o código e o nome das peças que tem o peso maior que 16 ou que são fornecidas pelo 
-- fornecedor S2
SELECT id, nome FROM Peça WHERE peso > 16
UNION
SELECT p.id, p.nome FROM Fornecimento AS ft, Peça AS p
	WHERE ft.id_fornecedor = 'S2' AND ft.id_peça = p.id;

-- 14/12/2017 (IN207)

-- Usando OR
SELECT DISTINCT p.id, p.nome FROM Peça AS p, Fornecimento AS ft
	WHERE ft.id_peça = p.id
	AND (ft.id_fornecedor = 'S2' OR p.peso > 16);

-- Sintaxe Geral do Comando UPDATE (atualização de dados)
--   UPDATE tabela
--   SET atribuições
--   [WHERE predicado];

UPDATE Fornecedor SET cidade = 'Rio de Janeiro' WHERE id = 'S4';

-- Exercício:
-- Fazer um Update com Select para alterar cor para amarela das peças fornecidas pelo Fornecedor S4 


SELECT * FROM Fornecedor;

