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

-- A linguagem SQL padr�o SQL/92
--   SQL quer dizer Structured Query Language
--   � uma linguagem padr�o para manipula��o de Banco de Dados Relacionais

--   DML (Data Manipulation Language) � um subconjunto da linguagem da SQL que � 
--     utilizado para realizar inclus�es, consultas, altera��es e exclus�es de dados 
--     presentes em registros. Estas tarefas podem ser executadas em v�rios registros 
--     de diversas tabelas ao mesmo tempo, os comandos que realizam respectivamente 
--     as fun��es acima referidas s�o Insert, Select, Update e Delete. 

--   DDL (Data Definition Language): permite ao utilizador definir tabelas novas e 
--     elementos associados. A maioria dos bancos de dados de SQL comerciais tem 
--     extens�es propriet�rias no DDL. Os comandos b�sicos da DDL s�o poucos: Create,
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

-- 1) Recuperar todas as informa��es sobre todos os fornecedores
SELECT * FROM Fornecedor;

-- 2) Proje��o: define que atributos devem ser recuperados.
--    Ex: recuperar o nome e a cidade de todos os fornecedores
SELECT nome, cidade FROM Fornecedor;

-- Observe que SELECT * FROM Fornecedor equivale a:
SELECT id, nome, status, cidade FROM Fornecedor;

-- 3) Registros Duplicados:
--	  Ex: recuperar o c�digo dos fornecedores de todos os fornecimentos
SELECT id_fornecedor FROM Fornecimento;

-- 4) Eliminando Duplicatas: indica que os registros duplicados devem ser eliminados
--    Ex: recuperar o c�digo dos fornecedores que fornecem pe�as no momento
SELECT DISTINCT id_fornecedor FROM Fornecimento;

-- 5) Express�es: novas colunas podem ser derivadas atrav�s de express�es aritm�ticas
--    envolvendo atributos e constantes
--    Ex: recuperar o c�digo e o peso das pe�as em gramas (o peso armazenado est� em
--    libras). Opera��es aritm�ticas: +, -, *, /
SELECT id, (peso * 454) FROM Pe�a

-- 6) Cl�usula ORDER BY: define um crit�rio de ordena��o para os registros resultantes
SELECT id, (peso * 454), cidade FROM Pe�a ORDER BY cidade;

--    ASC = Forma crescente (padr�o); DESC = Forma decrescente;
--    As colunas podem ser identificadas pela posi��o. 
--    Ex: recuperar o c�digo, a cidade e o peso em gramas de todas as pe�as, ordenadas
--        de forma crescente por cidade e, para cidades iguais, ordenadas de forma 
--        decrescente pelo peso em gramas
SELECT id, cidade, (peso * 454) FROM Pe�a ORDER BY 2 ASC, 3 DESC;

-- 23/11/2017 (IN207)

-- 7) Cl�usula WHERE (Sele��o): atrav�s da cl�usula WHERE, s�o definidos os predicados
--    (condi��es) que selecionam os registros a serem recuperados.
--    Ex: recuperar o c�digo e o nome dos fornecedores de Londres
SELECT id, nome FROM Fornecedor WHERE cidade = 'London';

--   O predicado pode ser uma express�o l�gica envolvendo condi��es e os operadores
--   AND, OR ou NOT. Cada condi��o pode ser definida com os operadores comparativos
--   tradicionais: =, <>, <, <=, > ou >= .

--   Ex: recuperar todas as informa��es dos fornecedores que s�o de Londres OU que
--       tem status no intervalo fechado [10,20].
SELECT * FROM Fornecedor WHERE cidade = 'London' OR (status >= 10 AND status <= 20);

--   Ex2: recuperar o c�digo dos fornecedores que fornecem a pe�a P2
SELECT id_fornecedor FROM Fornecimento WHERE id_pe�a = 'P2';

-- 8) IS [NOT] NULL verifica se um atributo possui [ou n�o] o valor nulo.
--   Ex: recuperar as informa��es sobre os fornecimentos que tem quantidade desconhecida
SELECT * FROM Fornecimento WHERE quantidade IS NULL;

-- 9) LIKE: comparando padr�es.
--   O s�mbolo % representa uma sequencia qualquer de zero ou mais caracteres.
--   O s�mbolo _ representa um caracter qualquer
--   Ex: recuperar as informa��es das pe�as cujo nome come�a pela letra C
SELECT * FROM Pe�a WHERE nome LIKE 'C%';

--   Ex1: nome LIKE '%SILVA%' ser� verdadeiro para todo nome que contenha o sobrenome SILVA
--   Ex2: nome NOT LIKE 'Z%' ser� verdadeiro para todo nome que n�o comece pela letra Z
--   Ex3: nome LIKE '_V_' ser� verdadeiro para todo nome que tenha 3 letras e que a 2�
--        letra seja a letra V.

-- 10) BETWEEN: utilizando intervalos nas compara��es.
SELECT * FROM Fornecedor WHERE cidade = 'London' OR status BETWEEN 10 AND 20;
-- EQUIVALE A: 
SELECT * FROM Fornecedor WHERE cidade = 'London' OR (status >= 10 AND status <= 20);
--   NOT BETWEEN: recupera valores fora do intervalo.
--   Ex: recupera as informa��es sobre os fornecimentos que tem quantidade menor que
--       200 ou maior que 300.
SELECT * FROM Fornecimento WHERE quantidade NOT BETWEEN 200 AND 300;

-- 11) Produto Cartesiano (mais de uma tabela)
--     A especifica��o de mais de uma tabela na cl�usula FROM resulta no produto cartesiano
--     das tabelas envolvidas.
--     Ex: recuperar todos os registros da tabela de fornecedores combinados com todos
--         os registros da tabela de pe�as.
SELECT * FROM Fornecedor, Pe�a

--     Jun��o (JOIN), relaciona resgistros de duas (ou mais) tabelas. Esta opera��o
--     equivale a executar um produto cartesiano entre as rela��es e selecionar apenas
--     os registros que apresentem o mesmo valor para o atributo da jun��o.

--     Ex: recuperar os registros da tabela de fornecimentos combinados com os registros
--         da tabela de fornecedores, quando os c�digos de fornecedores coincidirem.
SELECT * FROM Fornecedor, Fornecimento WHERE Fornecedor.id = Fornecimento.id_fornecedor;
--     Para evitar redund�ncias, devemos qualificar os atributos com mesmo nome, 
--     indicando, atrav�s de um prefixo, a tabela de origem.

--	Ex: Join com condi��es extras e proje��o. 
--		Recuperar o c�digo, o nome e a cidade dos fornecedores que forneceram a pe�a P2.
SELECT Fornecedor.id, Fornecedor.Nome, Fornecedor.cidade
	FROM Fornecedor, Fornecimento
	WHERE Fornecimento.id_fornecedor = Fornecedor.id
	AND Fornecimento.id_pe�a = 'P2';

--	Ex: Join de tr�s tabelas. 
--		Recuperar todas as informa��es dos fornecedores que fornecem pelo menos uma pe�a vermelha.
SELECT Fornecedor.* FROM Fornecedor, Fornecimento, Pe�a 
	WHERE Fornecedor.id = Fornecimento.id_fornecedor
	AND Pe�a.id = Fornecimento.id_pe�a AND Pe�a.cor = 'Red';

-- Sin�nimo (ALIAS): quando uma mesma tabela � utilizada mais de uma vez em uma
-- consulta, precisamos, para n�o gerar ambiguidades, definir sin�nimos para esta tabela.
SELECT f.* FROM Fornecedor AS f, Fornecimento AS ft, Pe�a AS p
	WHERE f.id = ft.id_fornecedor
	AND ft.id_pe�a = p.id
	AND p.cor = 'Red';
-- EQUIVALE A :
SELECT Fornecedor.id, Fornecedor.Nome, Fornecedor.cidade
	FROM Fornecedor, Fornecimento
	WHERE Fornecimento.id_fornecedor = Fornecedor.id
	AND Fornecimento.id_pe�a = 'P2';

-- Ex: Recuperar os c�digos de fornecedores localizados na mesma cidade.
SELECT a.id, a.nome, a.cidade, b.id, b.nome, b.cidade
	FROM Fornecedor AS a, Fornecedor AS b
	WHERE a.cidade = b.cidade
	AND a.id < b.id;

-- Exerc�cio 1: Recuperar o nome do fornecedor e da pe�a de todos os fornecimentos de londres cujo peso 
-- em gramas da pe�a esteja entre 2000 e 6000.

-- 30/11/2017 (IN207)

		SELECT f.nome, p.nome 
			FROM Fornecedor f, Fornecimento ft, Pe�a p
			WHERE f.id = ft.id_fornecedor
			AND ft.id_pe�a = p.id
			AND f.cidade = 'London'
			AND (p.peso * 454) BETWEEN 2000 AND 6000;

-- Exerc�cio 2: Recuperar o nome da pe�a e o status dos fornecedores que forneceram pe�as que n�o s�o
-- vermelhas ou que possuem peso em gramas menor que 3000
		SELECT DISTINCT p.nome, f.status FROM Fornecedor f, Fornecimento ft, Pe�a p
			WHERE f.id = ft.id_fornecedor AND ft.id_pe�a = p.id	
			AND (NOT p.cor = 'red' OR (p.peso * 454) < 3000);

-- Fun��es Embutidas
-- COUNT(*), COUNT(DISTINCT atributo), SUM, AVG, MIN, MAX

-- COUNT(*) retorna o n�mero de registros da tabela resultante
-- Ex1: retornar o n�mero de fornecedores
SELECT COUNT(*) FROM Fornecedor;

-- Ex2: retornar o n�mero de pe�as vermelhas
SELECT COUNT(*) FROM Pe�a WHERE cor = 'Red';

-- COUNT(DISTINCT atributo) retorna o n�mero de valores distintos do atributo
-- Ex1: retornar o n�mero de fornecedores que fornecem pe�as no momento
SELECT COUNT(DISTINCT id_fornecedor) FROM Fornecimento;

-- Ex2: retornar o n�mero distintos de status dos fornecedores de Londres
SELECT COUNT(DISTINCT status) FROM Fornecedor WHERE cidade = 'London';

-- SUM(atributo) calcula a soma dos valores do atributo
-- Ex: retornar a quantidade total de pe�as P2 fornecidas
SELECT SUM(quantidade) FROM Fornecimento WHERE id_pe�a = 'P2';

-- AVG(atributo) calcula a m�dia dos valores do atributo
-- Ex: retornar a quantidade m�dia dos fornecimentos da pe�a P1
SELECT AVG(quantidade) FROM Fornecimento WHERE id_pe�a = 'P1';

-- MIN(atributo) calcula o menor valor do atributo
-- Ex: retornar o menor status dos fornecedores
SELECT MIN(status) FROM Fornecedor;

-- MAX(atributo) calcula o maior valor do atributo
-- Ex: retornar o maior status dos fornecedores
SELECT MAX(status) FROM Fornecedor;

-- Cl�usula GROUP BY organiza registros em grupos l�gicos
-- Ex: recuperar o c�digo das pe�as e o total fornecido das mesmas neste caso, as fun��es embutidas passam 
--     a ser calculadas para cada grupo.
SELECT id_pe�a, SUM(quantidade) AS total_fornecido FROM Fornecimento GROUP BY id_pe�a;

-- Cl�usula HAVING define, atrav�s de condi��es, que grupos devem fazer parte da resposta.
-- Ex: recuperar o c�digo das pe�as fornecidas por mais de um fornecedor
SELECT id_pe�a FROM Fornecimento GROUP BY id_pe�a HAVING COUNT(*) > 1;

-- Exerc�cio 1: Recuperar o nome das cidades que possuem mais de um fornecedor
SELECT cidade FROM Fornecedor GROUP BY cidade HAVING COUNT(*) > 1;

-- Exerc�cio 2: Recuperar o nome das pe�as fornecidas por mais de um fornecedor
SELECT nome FROM Pe�a p, Fornecimento ft WHERE p.id = ft.id_pe�a GROUP BY nome HAVING COUNT(*) > 1;

-- 07/12/2017 (IN207)

-- Exerc�cio 3: Recuperar o menor status entre os fornecedores que forneceram mais de duas vezes
	SELECT DISTINCT MIN(f.status) FROM Fornecedor AS f, Fornecimento AS ft
		WHERE f.id = ft.id_fornecedor 
		GROUP BY ft.id_fornecedor HAVING COUNT(*) > 2;

-- O Operador IN verifica se um elemento pertence a um conjunto.
-- Ex: recuperar todas as informa��es dos fornecedores S1, S3 e S5
SELECT * FROM Fornecedor WHERE id IN ('S1', 'S3', 'S5');

-- Subconsultas IN, s�o subconsultas aninhadas. O operador IN indica que as consultas mais internas 
-- devem ser avaliadas primeiro.
-- Ex1: retornar o c�digo, o nome e a cidade dos fornecedores que fornecem a pe�a P2.
SELECT id, nome, cidade FROM Fornecedor	
	WHERE id IN(SELECT id_fornecedor FROM Fornecimento WHERE id_pe�a = 'P2');

-- Ex2: recuperar todas as informa��es dos fornecedores que fornecem pelo menos uma pe�a vermelha.
SELECT * FROM Fornecedor
	WHERE id IN 
		(SELECT DISTINCT(id_fornecedor) FROM Fornecimento WHERE id_pe�a IN 
			(SELECT id FROM Pe�a WHERE cor = 'Red')
		);

-- Subconsultas NOT IN
-- Ex: retornar o c�digo, o nome e a cidade dos fornecedores que N�O fornecem a pe�a P2
SELECT id, nome, cidade FROM Fornecedor 
	WHERE id NOT IN (SELECT id_fornecedor FROM Fornecimento WHERE id_pe�a = 'P2');

-- Subconsulta com operador de compara��o.
-- Ex: retornar o c�digo e o nome dos fornecedores localizados na mesma cidade que o fornecedor S1
SELECT id, nome FROM Fornecedor
	WHERE cidade = (SELECT cidade FROM Fornecedor WHERE id = 'S1');

-- Subconsulta EXISTS; o operador EXISTS representa o quantificador l�gico existencial.
-- Ex: retornar o c�digo, o nome e a cidade dos fornecedores que fornecem a pe�a P2
SELECT id, nome, cidade FROM Fornecedor	AS f
	WHERE EXISTS (SELECT * FROM Fornecimento AS ft WHERE id_pe�a = 'P2' AND f.id = ft.id_fornecedor);

-- Subconsultas NOT EXISTS.
-- Ex: retornar o c�digo, o nome e a cidade dos fornecedores que N�O fornecem a pe�a P2
SELECT id, nome, cidade FROM Fornecedor	AS f
	WHERE NOT EXISTS (SELECT * FROM Fornecimento AS ft WHERE id_pe�a = 'P2' AND f.id = ft.id_fornecedor);

-- Cl�usula UNION executa a uni�o de duas consultas
-- Ex: recuperar o c�digo e o nome das pe�as que tem o peso maior que 16 ou que s�o fornecidas pelo 
-- fornecedor S2
SELECT id, nome FROM Pe�a WHERE peso > 16
UNION
SELECT p.id, p.nome FROM Fornecimento AS ft, Pe�a AS p
	WHERE ft.id_fornecedor = 'S2' AND ft.id_pe�a = p.id;

-- 14/12/2017 (IN207)

-- Usando OR
SELECT DISTINCT p.id, p.nome FROM Pe�a AS p, Fornecimento AS ft
	WHERE ft.id_pe�a = p.id
	AND (ft.id_fornecedor = 'S2' OR p.peso > 16);

-- Sintaxe Geral do Comando UPDATE (atualiza��o de dados)
--   UPDATE tabela
--   SET atribui��es
--   [WHERE predicado];

UPDATE Fornecedor SET cidade = 'Rio de Janeiro' WHERE id = 'S4';

-- Exerc�cio:
-- Fazer um Update com Select para alterar cor para amarela das pe�as fornecidas pelo Fornecedor S4 


SELECT * FROM Fornecedor;

