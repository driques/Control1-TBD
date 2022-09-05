--1) lista de lugares al que más viajan los chilenos por año, durante los últimos 4 años

SELECT pais.nombre, can_des.cantidad
FROM(  SELECT COUNT(*) AS cantidad, vuelo.id_destino  
	 	FROM cliente, compra, pasaje, vuelo, pais 
	 	WHERE pais.nombre = 'Chile' 
	 	AND pais.id = cliente.id_pais 
	 	AND compra.id_cliente = cliente.id 
	 	AND compra.id_pasaje = pasaje.id
        AND pasaje.id_vuelo = vuelo.id 
	 	AND vuelo.anno BETWEEN 2018 and 2022
	 	GROUP BY vuelo.id_destino ORDER BY cantidad DESC LIMIT 3
) as can_des, pais WHERE can_des.id_destino = pais.id ORDER BY can_des.cantidad DESC


--2)) lista con las secciones de vuelo más comprada por Argentinos

SELECT clase.nombre, COUNT(*) as "cantidad comprada"
FROM clase
INNER JOIN pasaje ON pasaje.id_clase = clase.id
INNER JOIN compra ON compra.id_pasaje = pasaje.id
INNER JOIN cliente ON cliente.id = compra.id_cliente
INNER JOIN pais ON pais.id = cliente.id_pais
WHERE pais.nombre = 'Argentina'
GROUP BY clase.id
ORDER BY count(clase.id) DESC;

--3) lista mensual de países que más gastan en volar (durante los últimos 4 años)

SELECT pais.nombre, pais_gasto.total_gasto
FROM (
    SELECT vuelo.id_destino, SUM(compra.monto) as total_gasto 
	FROM compra, pasaje, vuelo 
	WHERE compra.id_pasaje = pasaje.id 
	AND pasaje.id_vuelo = vuelo.id 
	AND compra.anno = '2018' or compra.anno = '2019' or compra.anno ='2020' or compra.anno ='2021'

    GROUP BY vuelo.id_destino ORDER BY total_gasto DESC LIMIT 3
) as pais_gasto, pais WHERE pais.id = pais_gasto.id_destino


--4) lista de pasajeros que viajan en “First Class” más de 4 veces al mes
-- 4) lista de pasajeros que viajan en “First Class” más de 4 veces al mes
drop view if exists suma_meses cascade;
create view suma_meses as
select cliente.id as "cliente_id", vuelo.id AS "vuelo_id", vuelo.anno,vuelo.mes
from cliente, compra, pasaje, clase, vuelo
where cliente.id = compra.id_cliente and
compra.id_pasaje = pasaje.id and
pasaje.id_clase = clase.id and
pasaje.id_vuelo = vuelo.id and
clase.nombre = 'First class'
group by vuelo.mes,cliente.id,vuelo.id,vuelo.anno;
--Ahora agrupamos y sumamos
select cliente_id, count(mes) as "veces_viaje",mes,anno
from suma_meses
group by cliente_id,mes,anno
having count(mes)>4


--5) avión con menos vuelos
SELECT vuelo_avion.id_avion, count(*) as cantidad_vuelos FROM avion, vuelo_avion WHERE vuelo_avion.id_avion = avion.id GROUP BY vuelo_avion.id_avion
UNION
SELECT avion.id, 0 as cantidad_vuelos FROM avion WHERE avion.id NOT IN (SELECT vuelo_avion.id_avion FROM vuelo_avion)
ORDER BY cantidad_vuelos ASC LIMIT 1

--6) lista de mensual de pilotos con mayor sueldo durante los últimos 4 años
select DISTINCT ON(pago.anno,pago.mes) pago.anno, pago.mes, empleado.nombre, empleado.sueldo, cargo.nombre as "cargo" from pago,empleado,cargo,compania 
where pago.id_empleado = empleado.id 
	and empleado.id_cargo = cargo.id 
	and cargo.nombre = 'piloto' and pago.anno > 2018 
	and compania.id = empleado.id_compania 
	group by compania.nombre,pago.anno,pago.mes, empleado.nombre, empleado.sueldo,cargo.nombre 
	order by pago.anno,pago.mes,empleado.sueldo DESC,empleado.nombre,cargo.nombre;

--7) lista de compañías indicando cual es el avión que más ha recaudado en los últimos 4 años y cual es el monto recaudado
drop view if exists suma_montos cascade;
create view suma_montos as
select avion.id as "avion_id", compania.id as "compania_id", compania.nombre, vuelo.id as "vuelo_id",compra.monto
from avion, compania, pasaje,vuelo_avion, vuelo,compra
where avion.id_compania=compania.id
and vuelo_avion.id_avion = avion.id
and vuelo_avion.id_vuelo = pasaje.id_vuelo
and vuelo_avion.id_vuelo = vuelo.id
and compra.id_pasaje=pasaje.id
order by compania.nombre, compra.monto desc;
--Ahora agrupamos y sumamos
SELECT avion_id, nombre, SUM(monto) AS Resultado 
FROM suma_montos 
GROUP BY avion_id, nombre
order by nombre;

--8) lista de compañías y total de aviones por año, en los últimos 10 años
drop view if exists suma_aviones cascade;
create view suma_aviones as
select compania.nombre, count(avion.anno) as "cantidad_annio", avion.anno
from avion, compania
where avion.id_compania = compania.id
and avion.anno between 2012 and 2022
group by avion.anno,compania.nombre
order by compania.nombre,avion.anno;
    --El acumulado hace referencia al total de aviones acumulados a la fecha.
select nombre, cantidad_annio,anno, 
SUM(SUM(cantidad_annio))OVER ( PARTITION BY nombre 
ORDER BY nombre asc) as ACUMULADO
from suma_aviones
group by nombre, cantidad_annio, anno;

--9) lista anual de compañías que en promedio han pagado más a sus empleados durante los últimos 10 años
drop view if exists suma_empleados cascade;
create view suma_empleados as
SELECT compania.nombre, pago.anno,empleado.sueldo
FROM compania, empleado, pago
WHERE compania.id = empleado.id_compania
    and empleado.id = pago.id_empleado
    and pago.anno > 2011
order by pago.anno, compania.nombre,empleado.sueldo;
    --El acumulado hace referencia al total de aviones acumulados a la fecha.
select distinct on (anno) nombre, anno, 
SUM(SUM(sueldo))OVER ( PARTITION BY anno,nombre 
ORDER BY nombre asc) as acumulado
from suma_empleados
group by nombre, anno, sueldo
order by anno, acumulado desc, nombre;

--10) modelo de avión más usado por compañía durante el 2021
drop view if exists most_ids cascade;
create view most_ids as
Select avion.id as "id_avion", count(vuelo_avion.id_vuelo) as "contador"
From avion, vuelo_avion,vuelo
Where avion.id = vuelo_avion.id_avion and vuelo_avion.id_vuelo = vuelo.id
and vuelo.anno = 2021
and vuelo.mes BETWEEN 1 and 12
Group by avion.id
order by contador desc;
select distinct on (compania.nombre) compania.nombre, most_ids.id_avion,contador, avion.id_compania
from most_ids, avion, compania
where most_ids.id_avion = avion.id
and avion.id_compania=compania.id
order by  compania.nombre,contador desc;
