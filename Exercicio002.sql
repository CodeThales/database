--Usando as tabelas criadas no codelab da aula 12, crie 3 inner joins, 2 left joins e 2 right joins.
--Não esqueça de usar campos diferentes nas consultas.


--UMA SELEÇÃO DE TODOS OS ELEMENTOS DA TABELA 'SERIE' APENAS PARA VISUALIZAR.
--OBSERVE QUE NÃO HÁ UMA COLUNA DE CATEGORIA.
select * from serie s; 

--UMA SELEÇÃO DE TODOS OS ELEMENTOS DA TABELA 'SERIES' APENAS PARA VISUALIZAR.
--OBSERVE QUE HÁ APENAS DUAS COLUNAS (ID E CATEGORIA).
select  * from series s;


--JUNÇÃO DE TABELAS COM PRODUTO CARTESIANO (APENAS PARA SABER QUE EXISTE ESTA MANEIRA).
select s.nome, s2.categoria
from serie s, series s2 
where s.series_id = s2.id 



-- INNER JOIN SELECIONANDO TODOS OS REGISTROS DAS TABELAS 'SERIE' E 'SERIES' QUE TENHAM RELAÇÃO ENTRE ID(PK) E ID(FK).
-- DESTA FORMA, AMBAS AS TABELAS SÃO APRESENTADAS POR COMPLETO.
select * 
from serie s inner join series s2 
on s.series_id = s2.id; 


--INNER JOIN SELECIONANDO A COLUNA 'NOME' DA TABELA 'SERIE', COM A COLUNA 'CATEGORIA' DA TABELA 'SERIES'
--QUE TENHAM RELAÇÃO ENTRE ID(PK) E ID(FK).
--AQUI JÁ PODEMOS CONSTATAR QUE REALMENTE HOUVE RELAÇÃO ENTRE AS TABELAS,
--POIS A COLUNA 'CATEGORIA' DA TABELA 'SERIES' É APRESENTADA.
select nome, categoria
from serie s inner join series s2 
on s.series_id = s2.id;  


--INNER JOIN SELECIONANDO OS REGISTROS DAS COLUNAS 'NOME' E 'CAPA' DA TABELA 'SERIE', 
--COM OS REGISTROS DA COLUNA 'CATEGORIA' DA TABELA 'SERIES' QUE TENHAM RELAÇÃO ENTRE ID(PK) E ID(FK).
select nome, capa, categoria
from serie s inner join series s2
on s.series_id  = s2.id;



--LEFT JOIN SELECIONANDO TODOS OS REGISTROS DA TABELA 'SERIE', MAIS OS ELEMENTOS QUE TEM RELAÇÃO COM OS REGISTROS DA TABELA 'SERIES'.
--OBSERVE QUE O RESULTADO NESTE CASO, SERÁ O MESMO DO INNER JOIN POIS NÃO HÁ REGISTROS SEM RELAÇÃO ENTRE AS TABELAS;
--ISSO OCORREU PORQUE A COLUNA 'SERIES_ID' (FK), DA TABELA 'SERIE', FOI DEFINIDA COMO NOT NULL.
select *
from serie s left join series s2 
on s.series_id = s2.id;


--LEFT JOIN COM SOLICITAÇÃO DAS TABELAS EM ORDEM INVERSA PARA MOSTRAR QUE A ORDEM DA REQUISIÇÃO IMPORTA.
--O RESULTADO MOSTRA AS TABELAS DE FORMA INVERSA EM RELAÇÃO A REQUISIÇÃO ANTERIOR.
select *
from series s2 left join serie s 
on s.series_id = s2.id;



--RIGHT JOIN SELECIONANDO APENAS OS REGISTROS DAS COLUNAS 'NOME' E 'DURACAO' DA TABELA 'SERIE'
--QUE TEM RELAÇÃO COM OS REGISTROS DA COLUNA 'CATEGORIA' DA TABELA SERIES,
--MAIS TODOS OS REGISTROS DA COLUNA 'CATEGORIA' DA TABELA 'SERIES',
--MOSTRANDO EM ORDEM ALFABÉTICA COM OS REGISTROS DA COLUNA NOME COMO PARÂMETRO 
select nome, duracao, categoria
from serie s right join series s2 
on s.series_id = s2.id
order by nome;


--RIGHT JOIN SELECIONANDO APENAS OS REGISTROS DA COLUNA 'CATEGORIA' DA TABELA 'SERIES', QUE TEM RELAÇÃO
--COM OS REGISTROS DA COLUNA 'NOME' DA TABELA SERIE, MAIS TODOS OS REGISTROS DA COLUNA 'NOME' DA TABELA 'SERIE'.
--ORDENEI A APRESENTAÇÃO DOS REGISTROS PELA COLUNA 'CATEGORIA' DA TABELA 'SERIES'.
select categoria, nome
from series s2 right join serie s 
on s2.id = s.series_id 
order by categoria;



--AGORA APENAS UNS TESTES ALÉM DO EXERCÍCIO PARA BRINCAR

--QUAIS SERIES EU TENHO NA CATEGORIA COMÉDIA?
select nome, categoria 
from serie s inner join series s2
on s.series_id  = s2.id
where categoria ilike 'comédia';

--QUAL A CATEGORIA DA SÉRIE VIS A VIS?
select nome, categoria
from serie s inner join series s2 
on s.series_id  = s2.id 
where nome ilike 'vis a vis';

--QUAIS AS SÉRIES QUE TEM UM VALOR INSERIDO NA COLUNA 'CAPA'?
select * from serie s where capa is not null;

--QUAIS OS REGISTROS QUE NÃO FORAM INSERIDOS UM VALOR COMO CAPA?
select * from serie s where capa is null;

--QUANTOS REGISTROS FORAM INSERIDOS NA MINHA TABELA 'SERIE'?
select count(*) from serie s;

--SERÁ QUE TENHO A SÉRIE RICK AND MORTY?
select * from serie where nome ilike 'rick and morty';

--QUAIS SÉRIES TEM MENOS DE 5 TEMPORADAS?
select nome, temporada from serie s where s.temporada < 5;

--QUAIS SERIES TEM DURAÇÃO DE MAIS DE 35 MINUTOS?
select nome, duracao from serie s where duracao >'00:35';

--QUANTAS SÉRIES TEM MENOS DE 30 EPISÓDIOS?
select count(*) from serie where episodio < 80;

-- QUAIS SÉRIES SÃO ESSAS?
select nome, episodio from serie where episodio < 80 order by episodio ;
