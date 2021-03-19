SELECT AVG(precio) from pistas;
SELECT id, codigo, tipo, AVG(precio) FROM pistas WHERE tipo = 'futbol';
SELECT id, codigo, tipo, AVG(precio) FROM pistas WHERE tipo = 'baloncesto';
SELECT id, codigo, tipo, AVG(precio) FROM pistas WHERE tipo = 'tenis';
SELECT id, codigo, tipo, AVG(precio) FROM pistas WHERE tipo = 'ping-pong';
SELECT DISTINCT tipo from pistas;


SELECT id, codigo, tipo, AVG(precio) FROM pistas WHERE tipo = 'futbol'
UNION
SELECT id, codigo, tipo, AVG(precio) FROM pistas WHERE tipo = 'baloncesto'
UNION
SELECT id, codigo, tipo, AVG(precio) FROM pistas WHERE tipo = 'tenis'
UNION
SELECT id, codigo, tipo, AVG(precio) FROM pistas WHERE tipo = 'ping-pong'
;

= igual a =

SELECT tipo, AVG(precio) AS 'Media de precio'
FROM pistas
GROUP BY tipo;

-- Precios medio de tipos que esten entre 10 y 11 --

SELECT tipo, AVG(precio) AS 'Media de precio'
FROM pistas
GROUP BY tipo
HAVING AVG(precio) BETWEEN 10 AND 11;

= igual a =

SELECT tipo, AVG(precio) AS 'Media de precio'
FROM pistas
GROUP BY tipo
HAVING AVG(precio) >= 10 AND AVG(precio) <= 11;

-- Precio redondeado con 2 decimales --
SELECT tipo, ROUND(AVG(precio), 2) AS 'Media de precio'
FROM pistas
GROUP BY tipo
HAVING AVG(precio) >= 10 AND AVG(precio) <= 11;

-- Media de las pistas cuyas medias esté entre 10 y 11 y cuyo precio este entre 5 y 13 --

SELECT tipo, ROUND(AVG(precio), 2) 'Media de precio'
FROM pistas
WHERE precio BETWEEN 5 AND 13
GROUP BY tipo
HAVING AVG(precio) BETWEEN 10 AND 11;

SELECT MAX precio FROM pistas;

-- Número de polideportivos que hay en cada ciudad --

SELECT ciudad COUNT(id)
FROM polideportivos
GROUP BY ciudad;

= igual =

SELECT ciudad COUNT(*) AS 'cantidad'  -- * es muy lento --
FROM polideportivos
GROUP BY ciudad;

-- Número de pistas de tenis en cada ciudad --

SELECT ciudad COUNT(*) AS 'cantidad'  -- * es muy lento --
FROM polideportivos pol INNER JOIN pistas pis ON pol.id = pis.id_polideportivo
WHERE pis.tipo = 'tenis'
GROUP BY ciudad;

SELECT *
FROM pistas
WHERE tipo = 'tenis'
        AND id_polideportivo IN (SELECT id FROM polideportivos WHERE ciudad = 'Huesca');

SELECT id
FROM polideportivos
WHERE ciudad = 'Huesca';

-- Precio medio, por tipo de pista, de las pistas que no estan operativas --

SELECT P.tipo, AVG(P.precio) AS precio_medio
FROM pistas P, pistas_abiertas PA
WHERE P.id = PA.id_pista AND PA.operativa = FALSE
GROUP BY P.tipo;

-- + cuyo precio minimo por pista se > 5 --

SELECT P.tipo, AVG(P.precio) AS precio_medio
FROM pistas P, pistas_abiertas PA
WHERE P.id = PA.id_pista AND PA.operativa = FALSE
GROUP BY P.tipo
HAVING MIN(P.precio > 11);

-- Cantidad de pistas en cada polideportivo --

SELECT id_polideportivo, AS Polideportivo, COUNT(id) AS 'Numero de pistas'
FROM pistas
GROUP BY id_polideportivo;

-- COMPROBAR (al azar) --

SELECT * FROM pistas WHERE id_polideportivo = 5;
SELECT * FROM pistas WHERE id_polideportivo = 24;

SELECT nombre, ciudad, pos
FROM participantes
ORDER BY pos ASC;

SELECT nombre, ciudad, pos
FROM participantes
ORDER BY ciudad, pos ASC;

SELECT *
FROM participantes
WHERE pos BETWEEN 10 AND 15;

SELECT *
FROM participantes
WHERE pos >= 10 and pos <= 15;

SELECT ciudad, COUNT(nombre) AS 'Numero de participantes por ciudad'
FROM participantes
GROUP BY ciudad;

SELECT sexo, COUNT(sexo) AS 'Numero por genero entre los 10 primeros'
FROM participantes
WHERE pos <= 10
GROUP BY sexo;

SELECT * FROM participantes ORDER BY pos ASC;

SELECT nombre
FROM participantes
WHERE sexo = 'H' AND ciudad = 'Burgos'
LIMIT 1;

SELECT *
FROM participantes
WHERE sexo = 'H' AND ciudad = 'Palencia'
LIMIT 2;

UPDATE pistas SET precio = precio + precio*0.1
WHERE tipo = 'tenis';

SELECT * 
FROM pistas
WHERE tipo = 'tenis';

UPDATE reservas SET precio = precio + precio*0.1
WHERE tipo = 'tenis';

SELECT YEAR(MAX(fecha_reserva)) AS 'Ultima reserva', 
YEAR(MIN(fecha_reserva)) AS 'Primera reserva'
FROM reservas;

UPDATE reservas SET fecha_reserva = DATE_ADD(fecha_reserva, interval 5 YEAR);