-- 1. Escribe una consulta que recupere los Vuelos (flights) y su identificador que figuren con status On Time.
select f.flight_id, f.status 
from flights f 
where f.status = 'On Time'

-- 2. Escribe una consulta que extraiga todas las columnas de la tabla bookings y refleje todas las reservas que han supuesto una cantidad total mayor a 1.000.000 (Unidades monetarias).
select *
from bookings b
where b.total_amount > 1000000;

-- 3. Escribe una consulta que extraiga todas las columnas de los datos de los modelos de aviones disponibles (aircraft_data). Puede que os aparezca en alguna actualización como "aircrafts_data", revisad las tablas y elegid la que corresponda.
select *
from aircrafts_data;

-- 4. Con el resultado anterior visualizado previamente, escribe una consulta que extraiga los identificadores de vuelo que han volado con un Boeing 737. (Código Modelo Avión = 733)
select f.flight_id 
from flights f 
where f.aircraft_code = '733'

-- 5. Escribe una consulta que te muestre la información detallada de los tickets que han comprado las personas que se llaman Irina.
select *
from tickets t 
where t.passenger_name ilike 'irina %'
-- 6. Mostrar las ciudades con más de un aeropuerto.
select a.city, COUNT(*) AS total_aeropuertos
from airports a 
group by a.city 
having count(*)>1

-- 7. Mostrar el número de vuelos por modelo de avión.
select ad.model, count (f.flight_id) as total_vuelos
from flights f 
join aircrafts_data ad on f.aircraft_code = ad.aircraft_code
group by ad.model 


-- 8. Reservas con más de un billete (varios pasajeros).
select b.book_ref, 
count(t.ticket_no) as numero_total_pasajeros
from bookings b 
join  tickets t on b.book_ref = t.book_ref 
group by b.book_ref 
having count(t.ticket_no) >1


-- 9. Vuelos con retraso de salida superior a una hora.
select f.flight_id , (f.actual_departure  - f.scheduled_departure ) as retraso
from flights f 
where f.actual_departure - f.scheduled_departure > interval '1 hour'