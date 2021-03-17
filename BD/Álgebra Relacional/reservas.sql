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
GROUP BY tipo
;

-- Precios medio de tipos que esten entre 10 y 11 --

SELECT tipo, AVG(precio) AS 'Media de precio'
FROM pistas
GROUP BY tipo
HAVING AVG(precio) BETWEEN 10 AND 11
;

= igual a =

SELECT tipo, AVG(precio) AS 'Media de precio'
FROM pistas
GROUP BY tipo
HAVING AVG(precio) >= 10 AND AVG(precio) <= 11
;

-- Precio redondeado con 2 decimales --
SELECT tipo, ROUND(AVG(precio), 2) AS 'Media de precio'
FROM pistas
GROUP BY tipo
HAVING AVG(precio) >= 10 AND AVG(precio) <= 11
;

-- Media de las pistas cuyas medias esté entre 10 y 11 y cuyo precio este entre 5 y 13 --

SELECT tipo, ROUND(AVG(precio), 2) 'Media de precio'
FROM pistas
WHERE precio BETWEEN 5 AND 13
GROUP BY tipo
HAVING AVG(precio) BETWEEN 10 AND 11
;

SELECT MAX precio FROM pistas;

-- Número de polideportivos que hay en cada ciudad --

SELECT ciudad COUNT(id)
FROM polideportivos
GROUP BY ciudad
;

= igual =

SELECT ciudad COUNT(*) AS 'cantidad'  -- * es muy lento --
FROM polideportivos
GROUP BY ciudad
;

-- Número de pistas de tenis en cada ciudad --

SELECT ciudad COUNT(*) AS 'cantidad'  -- * es muy lento --
FROM polideportivos pol INNER JOIN pistas pis ON pol.id = pis.id_polideportivo
WHERE pis.tipo = 'tenis'
GROUP BY ciudad
;

SELECT *
FROM pistas
WHERE tipo = 'tenis'
        AND id_polideportivo IN (SELECT id FROM polideportivos WHERE ciudad = 'Huesca')
;

SELECT id
FROM polideportivos
WHERE ciudad = 'Huesca'
;
