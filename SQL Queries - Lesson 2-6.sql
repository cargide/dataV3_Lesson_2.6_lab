-- 1) https://www.mysqltutorial.org/mysql-find-duplicate-values/
SELECT first_name, last_name
FROM sakila.actor 
GROUP BY last_name
HAVING COUNT(last_name) = 1
ORDER BY last_name;
-- 2) 
SELECT last_name, COUNT(last_name) AS amount 
FROM sakila.actor 
GROUP BY last_name
HAVING amount > 1
ORDER BY last_name;

-- 3)
SELECT staff_id, COUNT(rental_id) AS amount
FROM sakila.rental 
GROUP BY staff_id;

-- 4)
SELECT release_year, COUNT(film_id)  AS amount
FROM sakila.film 
GROUP BY release_year;

-- 5)
SELECT ROUND(AVG(length),2) AS avg_length, rating 
FROM sakila.film
GROUP BY rating;

-- 6) 
SELECT rating, AVG(length) AS mean_length
FROM sakila.film
GROUP BY rating
HAVING AVG(length) > 120;

-- 7) https://www.geeksengine.com/database/single-row-functions/rank.php
SELECT title, length,
	DENSE_RANK() OVER (ORDER BY length DESC) as ranking
FROM sakila.film
WHERE length IS NOT NULL
ORDER BY length DESC;
