CREATE SCHEMA prova;
use prova;

--- 1. Criar o script para as tabelas com base no seguinte modelo de dados (utilizar autoincremento quando possível e padronizar nomenclatura)
	--- Tb_Editora (cod_editora (pk), descricao, endereço) 

CREATE TABLE tb_editora (
	cod_editora INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50),
    endereco VARCHAR(50)
);
SELECT * FROM tb_editora;

	--- Tb_Livro (cod_livro (pk), ISBN, Título, num_edicao, Preco, cod_editora (fk)) 

CREATE TABLE tb_livro (
	cod_livro INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ISBN VARCHAR(20),
    titulo VARCHAR(45),
    num_edicao INT,
    preco FLOAT,
    cod_editora INT UNSIGNED,
	FOREIGN KEY (cod_editora) REFERENCES tb_editora (cod_editora)
);
SELECT * FROM tb_livro;

	--- TB_Autor (Cod_autor (pk), nome, sexo, data_nascimento) 
    
CREATE TABLE tb_autor(
	cod_autor INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    sexo CHARACTER,
    data_nascimento DATETIME
);
SELECT * FROM tb_autor;
	
    --- TB_Livro_Autor (cód_livro (pk)(fk), cód_autor (pk) (fk))
    
CREATE TABLE tb_livro_autor(
	cód_livro INT UNSIGNED, 
    cód_autor INT UNSIGNED, 
    PRIMARY KEY (cód_livro, cód_autor),
    FOREIGN KEY (cód_livro) REFERENCES tb_livro(cod_livro),
    FOREIGN KEY (cód_autor) REFERENCES tb_autor(cod_autor)
);
SELECT * FROM tb_livro_autor;


--- 2. Criar script de povoamento (inserção de dados) do banco de dados: 
	--- 1. TB_Editora :     
		--- a. ‘Campus’, ‘Rua do Timbó’ 
INSERT INTO tb_editora (descricao, endereco) VALUES ('Campus', 'Rua do Timbó');
SELECT * FROM tb_editora;

		--- b. ‘Abril’ 
INSERT INTO tb_editora(descricao) VALUES ('Abril');
SELECT * FROM tb_editora;

		--- c. ‘Editora Teste’ 
INSERT INTO tb_editora(descricao) VALUES ('Editora Teste');
SELECT * FROM tb_editora;


	--- 2. TB_Livro : 
		--- a. ‘12345’,’Banco de Dados’,3, 70.00, 1 
INSERT INTO tb_livro (ISBN, titulo, num_edicao, preco, cod_editora) VALUES ('12345', 'Banco de Dados', 3, 70.00, 1);
SELECT * FROM tb_livro;

		--- b. ‘35790’,’SGBD’,1, 85.00, 2 
INSERT INTO tb_livro (ISBN, titulo, num_edicao, preco, cod_editora) VALUES ('35790', 'SGBD', 1, 85.00, 2);
SELECT * FROM tb_livro;

		--- c. ‘98765’,’Redes de Computadores’,2, 80.00,2 
INSERT INTO tb_livro (ISBN, titulo, num_edicao, preco, cod_editora) VALUES ('98765', 'Redes de Computadores', 2, 80.00, 2);
SELECT * FROM tb_livro;


	--- 3. TB_Autor : 
		--- a. ‘João’,’M’,’01.01.1970’ 
INSERT INTO tb_autor (nome, sexo, data_nascimento) VALUES ('João', 'M', '1970-01-01');
SELECT * FROM tb_autor;
		
        --- b. ‘Maria, ‘F’, ’17.05.1974’. 
INSERT INTO tb_autor (nome, sexo, data_nascimento) VALUES ('Maria', 'F', '1974-05-17');
SELECT * FROM tb_autor;

		--- c. ‘José’, ‘M’, ’10.10.1977’. 
INSERT INTO tb_autor (nome, sexo, data_nascimento) VALUES ('José', 'M', '1977-10-10');
SELECT * FROM tb_autor; 

		--- d. ‘Carla’, ‘F’, 08.12.1964’ 
INSERT INTO tb_autor (nome, sexo, data_nascimento) VALUES ('Carla', 'F', '1964-12-08');
SELECT * FROM tb_autor;


	--- 4. TB_Livro_Autor
		--- a. Banco de Dados – Autores: João e Maria 
	SELECT * FROM tb_livro WHERE titulo = 'Banco de Dados';
	SELECT * FROM tb_autor WHERE nome IN ('João','Maria');

INSERT INTO tb_livro_autor (cód_livro, cód_autor) VALUES ('1', '1'), ('1', '2');
SELECT * FROM tb_livro_autor;


		--- b. SGBD – Autores: Maria e Carla 
	SELECT * FROM tb_livro WHERE titulo = 'SGBD';
    SELECT * FROM tb_autor WHERE nome IN ('Maria', 'Carla');
    
INSERT INTO tb_livro_autor (cód_livro, cód_autor) VALUES ('2', '2'), ('2', '4');
SELECT * FROM tb_livro_autor;


		--- c. Redes de Computadores – Autor: José
	SELECT * FROM tb_livro WHERE titulo = 'Redes de Computadores';
    SELECT * FROM tb_autor WHERE nome = 'José';
    
INSERT INTO tb_livro_autor (cód_livro, cód_autor) VALUES ('3','3');
SELECT * FROM tb_livro_autor;


--- 3. Criar script com comandos DML para as seguintes solicitações: 

	--- 1.Excluir a ‘Editora Teste’
    
    SELECT * FROM tb_editora;
DELETE FROM tb_editora WHERE cod_editora = '3';


	--- 2.Apresentar o nome e data de nascimento de todos os autores 
    
SELECT nome, data_nascimento FROM tb_autor;


	--- 3.Apresentar o nome e a data de nascimento dos autores por ordem de nome.
    
SELECT nome, data_nascimento FROM tb_autor ORDER BY nome;


	--- 4.Apresentar o nome e a data de nascimento dos autores do sexo feminino ordenados pelo nome. 
    
SELECT nome, data_nascimento FROM tb_autor WHERE sexo = 'F' ORDER BY nome;


	--- 5.Apresentar o nome das editoras que não tem o endereço cadastrado
    
SELECT descricao FROM tb_editora WHERE endereco IS NULL;


	--- 6.Apresentar o título do livro e o nome da sua editora 
    
SELECT tb_livro.titulo, tb_editora.descricao FROM tb_livro JOIN tb_editora ON tb_livro.cod_editora = tb_editora.cod_editora;


	--- 7.Apresentar o título do livro e o nome da sua editora. Caso haja alguma editora sem livro publicado, informar os dados da editora com valores nulos para os livros. 
    
SELECT tb_livro.titulo, tb_editora.descricao FROM tb_editora LEFT JOIN tb_livro ON tb_editora.cod_editora = tb_livro.cod_editora;


	--- 8.Apresentar o título do livro e o nome dos seus autores 
    
SELECT tb_livro.titulo, GROUP_CONCAT(tb_autor.nome) AS autores FROM tb_livro JOIN tb_livro_autor ON tb_livro.cod_livro = tb_livro_autor.cód_livro
JOIN tb_autor ON tb_autor.cod_autor = tb_livro_autor.cód_autor GROUP BY tb_livro.titulo;


	--- 9.Apresentar o nome da editora e o nome dos autores que já publicaram algum livro na editora. 

SELECT tb_editora.descricao, GROUP_CONCAT(tb_autor.nome) AS autores FROM tb_editora JOIN tb_livro ON tb_livro.cod_editora = tb_editora.cod_editora 
JOIN tb_autor ON tb_autor.cod_autor = tb_livro.cod_livro GROUP BY tb_editora.descricao;


	--- 10.Apresentar o título dos livros que começam a string ‘Banco’. 
    
SELECT titulo FROM tb_livro WHERE titulo LIKE 'Banco%';

	
	--- 11.Apresentar o título dos livros que tem a string ‘do’. 
    
SELECT titulo FROM tb_livro WHERE titulo LIKE '%do%';

	
    --- 12.Apresentar o nome de cada livro e seu preço reajustado em 5%
    
SELECT titulo, preco * 1.05 AS preco FROM tb_livro; 


	--- 13.Apresentar o nome dos autores que nasceram no mês de outubro
    
SELECT nome, data_nascimento FROM tb_autor WHERE EXTRACT(MONTH FROM data_nascimento) = 08;


	--- 14.Apresentar o número de livros do acervo;
    
SELECT COUNT(*) AS 'Livros do acervo' FROM tb_livro;


	--- 15.Apresentar o número de autores do livro ‘Banco de Dados’ 
    
SELECT count(DISTINCT tb_autor.cod_autor) AS 'Quantidade de autor(es)' FROM tb_autor
JOIN tb_livro_autor ON tb_autor.cod_autor = tb_livro_autor.cód_autor
JOIN tb_livro ON tb_livro.cod_livro = tb_livro_autor.cód_livro
WHERE tb_livro.titulo = 'Banco de Dados';

	--- 16.Apresentar o somatório dos preços dos livros do acervo 
    
SELECT SUM(preco) AS 'Soma dos preços' FROM tb_livro;

	--- 17. Apresentar a média de preços dos livros da editora Campus 

SELECT AVG(preco) AS 'Media do valor do(s) livro(s) da editora Campus' FROM tb_livro
JOIN tb_editora ON tb_livro.cod_editora = tb_editora.cod_editora
WHERE tb_editora.descricao = 'Campus';


	--- 18.Apresentar o maior preço dentre todos os livros do acervo. 
    
SELECT MAX(preco) AS 'Mais caro' FROM tb_livro;

	--- 19. Apresentar a data de nascimento do autor mais velho 
    
SELECT MIN(data_nascimento) AS 'Autor mais Velho' FROM tb_autor;


	--- 20.Apresentar o número de livros por editora

SELECT tb_editora.descricao AS 'Editoras', COUNT(tb_livro.cod_livro) AS 'Numeros de Livros' FROM tb_editora
JOIN tb_livro ON tb_livro.cod_editora = tb_editora.cod_editora
GROUP BY tb_editora.cod_editora;

	--- 21.Apresentar o somatório e média de preço dos livros por editora 
    
SELECT tb_editora.descricao AS 'Editora', AVG(tb_livro.preco) AS 'Media de preço dos livros', SUM(tb_livro.preco) AS 'Soma de preço dos livros'
FROM tb_editora JOIN tb_livro ON tb_livro.cod_editora = tb_editora.cod_editora GROUP BY tb_editora.cod_editora;


	--- 22.Apresentar o número de autores por livro, mas apenas dos livros que possuem mais de 1 autor   
    
SELECT tb_livro.titulo AS 'Titulo', COUNT(tb_livro_autor.cód_autor) AS 'Numero de autor(es)' FROM tb_livro
JOIN tb_livro_autor ON tb_livro_autor.cód_livro = tb_livro.cod_livro
GROUP BY tb_livro.cod_livro HAVING COUNT(tb_livro_autor.cód_autor) > 1;


	--- 25. Apresentar a média de preços geral por editora, mas apenas as editoras que possuem média maior que R$ 80,00 

SELECT tb_editora.descricao AS 'Editora', AVG(tb_livro.preco) AS 'Media' FROM tb_editora 
JOIN tb_livro ON tb_editora.cod_editora = tb_livro.cod_editora 
GROUP BY tb_editora.cod_editora HAVING AVG(tb_livro.preco) > 80.00;


	--- 26. Apresentar o nome dos autores que não são autores do livro Banco de Dados 

SELECT tb_autor.nome AS 'Nome de autor(es)' FROM tb_autor
JOIN tb_livro_autor ON tb_autor.cod_autor = tb_livro_autor.cód_autor
JOIN tb_livro ON tb_livro.cod_livro = tb_livro_autor.cód_livro
WHERE tb_livro.titulo != 'Banco de Dados';

	--- 27.Apresentar a quantidade de livros da editora Campus e Abril em colunas diferentes.
SELECT COUNT(CASE WHEN tb_editora.descricao = 'Campus' THEN tb_livro.cod_livro END) AS 'Quantida Campus',
COUNT(CASE WHEN tb_editora.descricao = 'Abril' THEN tb_livro.cod_livro END) AS 'Quantida Abril' FROM tb_editora
JOIN tb_livro ON tb_editora.cod_editora = tb_livro.cod_editora WHERE tb_editora.descricao IN ('Campus', 'Abril');
