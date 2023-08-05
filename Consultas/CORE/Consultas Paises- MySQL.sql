USE world;
-- 1. ¿Qué consulta ejecutarías para obtener todos los países que hablan esloveno? Tu consulta debe devolver el nombre del país, el idioma y el porcentaje de habla del idioma.  Tu consulta debe ordenar el resultado por porcentaje de habla del idioma en orden descendente.
SELECT c.name, l.language, l.percentage
FROM countries c JOIN languages l  ON c.code = l.country_code
WHERE l.language = 'Slovene'
ORDER BY l.percentage DESC;
-- 2.¿Qué consulta ejecutarías para mostrar el número total de ciudades de cada país?  Tu consulta debe devolver el nombre del país, el idioma y el número total de ciudades. Tu consulta debe ordenar el resultado por el número de ciudades en orden descendente. 
SELECT c.name, COUNT(ci.id) AS total
FROM countries c
LEFT JOIN cities ci ON c.code = ci.country_code
GROUP BY c.name
ORDER BY total DESC;
-- 3.¿Qué consulta ejecutarías para obtener todos ciudades de México con una población mayor a 500,000? Tu consulta debe ordenar el resultado por población en orden descendente.
SELECT name, population, country_id
FROM cities
WHERE country_code = 'MEX' AND population > 500000
ORDER BY population DESC;
-- 4 ¿Qué consulta ejecutarías para obtener todos los idiomas en cada país con un porcentaje de habla mayor a 89%? Tu consulta debe ordenar el resultado por porcentaje de habla en orden descendente.
SELECT c.name, l.language, l.percentage
FROM countries c JOIN languages l  ON c.code = l.country_code
WHERE l.percentage > 89.0
ORDER BY l.percentage DESC;
-- 5.¿Qué consulta ejecutarías para obtener todos los países con un área de superficie menor a 501 y población mayor a 100,000?
SELECT name,surface_area, population
FROM countries
WHERE surface_area< 501 and population > 100000;
-- 6 ¿Qué consulta ejecutarías para obtener países solo con monarquía constitucional, un capital superior a 200 y una esperanza de vida mayor a 75 años?
SELECT name, government_form,capital, life_expectancy
FROM countries
WHERE capital> 200 and life_expectancy > 75;
-- 7 ¿Qué consulta ejecutarías para obtener todas las ciudades de Argentina dentro del distrito de Buenos Aires con una población mayor a 500,000 habitantes?  La consulta debe devolver el nombre del país, el nombre de la ciudad, el distrito y la población. 
SELECT c.name AS country_name, ci.name AS city_name, ci.district, ci.population
FROM countries c JOIN cities ci ON c.code = ci.country_code
WHERE c.name = 'Argentina' AND ci.district = 'Buenos Aires' AND ci.population > 500000;
-- 8  ¿Qué consulta ejecutarías para resumir el número de países en cada región? Tu consulta debe mostrar el nombre de la región y el número de países. Además, debe ordenar el resultado por el número de países en orden descendente.
SELECT region, COUNT(1) AS num_countries
FROM countries
GROUP BY region
ORDER BY num_countries DESC;



