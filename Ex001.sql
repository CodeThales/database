--CRIAÇÃO DA TABELA SÉRIES
create table series(
id serial primary key,
categoria varchar(10) not null
);

--INSERÇÃO DAS CATEGORIAS NA TABÉLA SÉRIES
insert into series (categoria) values('Syfy');
insert into series (categoria) values('Ação');
insert into series (categoria) values ('Aventura');
insert into series (categoria) values ('Comédia');
insert into series (categoria) values ('+18');
insert into series (categoria) values ('Terror');
insert into series (categoria) values ('Drama');

--CRIAÇÃO DA TABELA SÉRIE
create table serie(
id serial primary key,
nome varchar(30) not null,
temporada int not null,
episodio int not null,
duracao time,
series_id int references series(id) not null
);

--INSERÇÃO DAS INFORMAÇÕES DAS SÉRIES NA TABELA SÉRIE
insert into serie (nome, temporada, episodio, duracao, series_id) values('The Black List', 8, 152, '00:43', 2);
insert into serie (nome, temporada, episodio, duracao, series_id) values('Blindspot', 5, 100, '00:42', 2);
insert into serie (nome, temporada, episodio, duracao, series_id) values('Agents of Shield', 7, 136, '00:44', 1);
insert into serie (nome, temporada, episodio, duracao, series_id) values('The 100', 7, 100, '00:59', 3);
insert into serie (nome, temporada, episodio, duracao, series_id) values('Arrow', 8, 170, '00:40', 3);
insert into serie (nome, temporada, episodio, duracao, series_id) values('Dark', 3, 26, '00:50', 1);
insert into serie (nome, temporada, episodio, duracao, series_id) values('Rick and Morty', 4, 70, '00:22', 4);
insert into serie (nome, temporada, episodio, duracao, series_id) values('Two and a Half Men', 12, 262, '00:21', 4);
insert into serie (nome, temporada, episodio, duracao, series_id) values('Vis a Vis', 4, 48, '00:50', 5);
insert into serie (nome, temporada, episodio, duracao, series_id) values('Femme Fatales', 2, 25, '00:50', 5);
insert into serie (nome, temporada, episodio, duracao, series_id) values('The Purge', 2, 20, '00:40', 6);
insert into serie (nome, temporada, episodio, duracao, series_id) values('The Exorcist', 2, 20, '00:59', 6);
insert into serie (nome, temporada, episodio, duracao, series_id) values('Peaky Blinders', 5, 30, '00:55', 7);
insert into serie (nome, temporada, episodio, duracao, series_id) values('Greys Anatomy', 17, 380, '00:45', 7);

--SELECIONANDO TODAS AS INFORMAÇÕES DAS TABELAS
select * from series;
select * from serie;

--SELECIONANDO APENAS O NOME E DURAÇÃO DE TODAS AS SÉRIES
select nome, duracao from serie;

--SELECIONANDO APENAS O NOME E OS EPISÓDIOS DA SÉRIE DARK
select nome, episodio from serie where nome = 'Dark';

--ADICIONANDO A COLUNA CAPA À TABELA SERIE
alter table serie add capa varchar(100) not null;

--EXCLUINDO A COLUNA CAPA
alter table serie drop column capa;

--ADICIONANDO A COLUNA CAPA À TABELA SERIE NOVAMENTE
alter table serie add capa varchar(100);

--ADICIONANDO UMA IMAGEM DE CAPA À SÉRIE THE BLACK LIST PELO ID
update serie set capa = 'https://veja.abril.com.br/wp-content/uploads/2016/11/s1bl-cartaz1.jpg?quality=70&strip=all' where id = 1;

--ADICIONANDO UMA IMAGEM DE CAPA À SÉRIE BLINDSPOT PELO NOME
update serie set capa = 'http://dinastiageek.com.br/wp-content/uploads/2019/07/Blindspot_Capa.jpg' where nome = 'Blindspot'; 

--ADICIONANDO UMA CAPA À SÉRIE ARROW PELO ID
update serie set capa = 'https://upload.wikimedia.org/wikipedia/pt/7/77/Arrow_Temporada_6_Poster.jpg' where id = 8;

--ADICIONANDO UMA CAPA À SÉRIE RICK AND MORTY PELO NOME COM ILIKE 'case sensitive'
update serie set capa = 'https://images-na.ssl-images-amazon.com/images/I/91MteSqsrJL.jpg' where nome ilike 'rick and morty';

--INSERINDO NOVOS REGISTROS PARA POSTERIOR EXCLUSÃO
insert into serie(nome, temporada, episodio, duracao, series_id) values('Eu, a Patroa e as Crianças', 15, 300, '00:35', 4);
insert into serie(nome, temporada, episodio, duracao, series_id) values ('Petter Pan', 3, 30, '00:45', 3);

--ALTERANDO TEMPORADA DO REGISTRO 'EU, A PATROA E AS CRIANÇAS' PELO ID
update serie set temporada = 5 where id = 21;

--ALTERANDO EPISODIO DO REGISTRO 'EU, A PATROA E AS CRIANÇAS' PELO NOME COM ILIKE
update serie set episodio  = 123 where nome ilike 'eu, a patroa e as crianças';

--EXCLUINDO TODO O REGISTRO DE 'PETTER PAN'
delete from serie where nome = 'Petter Pan';
