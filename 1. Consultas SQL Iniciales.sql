--1.Consultas básicas de selección: Muestra los nombres de todas las películas con una clasificación por edades de ‘R’.

select
	film_id as "ID_pelicula",
	title as "nombre_pelicula",
	rating as "clasificacion_edades"
from
	public.film
where
	film.rating = 'R';

--2. **Rangos de identificación: Encuentra los nombres de los actores con `actor_id` entre 30 y 40.

select
	actor_id as "ID_actor",
	concat(first_name, ' ', last_name) as "Nombre_actor"
from
	public.actor
where
	actor.actor_id between 30 and 40;

--3. **Filtrar por idioma: - Obtén las películas cuyo idioma coincide con el idioma original.

select 
	film_id as "ID_Pelicula",
	title as "Titulo_pelicula"
from
	public.film
where
	film.language_id = film.original_language_id;

--4. Clasificación por duración: Ordena las películas por duración de forma ascendente.

select
	title as "Título_pelicula",
	length as "duracion"
from
	public.film
order by
	duracion asc;

--5. Filtro por apellido: Encuentra el nombre y apellido de los actores con ‘Allen’ en su apellido.

select 
	first_name	as "Nombre",
	last_name as "apellido"
from
	public.actor
where 
	last_name like '%Allen%';

--6. Conteo de películas por clasificación: Encuentra la cantidad total de películas en cada clasificación de la tabla `film` y muestra la clasificación junto con el recuento.
select
	rating,
	count(*) as "Cantidad_total"
from
	public.film
group by
	film.rating;

--7. Filtro combinado: Encuentra el título de todas las películas que son ‘PG13’ o tienen una duración mayor a 3 horas.
select
	title as "Título",
	rating,
	length as "Duración"
from
	public.film
where
	film.rating = 'PG-13' or film.length > 180;

--8. Análisis de costos: Encuentra la variabilidad de lo que costaría reemplazar las películas.
select
	stddev(replacement_cost) as desviacion, 
	variance(replacement_cost) as varianza 
from public.film;

--9. Duraciones extremas: Encuentra la mayor y menor duración de una película en la base de datos.
select 
	max(length) as "Mayor_duración",
	min(length) as "Menor_duración"
from
	public.film;

--10. Costo del alquiler: Encuentra lo que costó el antepenúltimo alquiler ordenado por día.

select
	amount
from
	public.payment
order by
	payment_date desc
	limit 1 offset 2;























