create database peliculas;
create table peliculas (
    id int primary key,
    titulo varchar,
    año_estreno int,
    director varchar
);
create table reparto (
    pelicula_id int,
    actor varchar,
    foreign key (pelicula_id) references peliculas(id)
);
truncate table peliculas, reparto;
copy peliculas(id, titulo, año_estreno, director)
from 'C:/peliculas.csv' with (FORMAT csv, HEADER true);
copy reparto(pelicula_id, actor)
from 'C:/reparto.csv' with (FORMAT csv, HEADER false);

select * from peliculas
select * from reparto

select id from peliculas where titulo = 'Titanic';

select actor from reparto
join peliculas on reparto.pelicula_id = peliculas.id
where peliculas.titulo = 'Titanic';

select COUNT(*) from reparto
join peliculas on reparto.pelicula_id = peliculas.id
where reparto.actor = 'Harrison Ford';

select titulo from peliculas
where año_estreno between 1990 and 1999
order by titulo asc;

select titulo, length(titulo) as longitud_titulo from peliculas;

select MAX(length(titulo)) from peliculas;

select titulo, length(titulo) as longitud_titulo
from peliculas
where length(titulo) = (
  select MAX(length(titulo))
  from peliculas
);