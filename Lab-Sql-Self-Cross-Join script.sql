USE  sakila;

-- 1) Get all pairs of actors that worked together
SELECT fa1.film_id, fa1.actor_id, fa2.actor_id
FROM film_actor fa1
LEFT JOIN film_actor fa2
ON fa1.actor_id <> fa2.actor_id
AND fa1.film_id = fa2.film_id
ORDER BY fa1.film_id;

SELECT fa1.film_id, 
concat(a1.first_name,' ',a1.last_name) AS Actor1, concat(a2.first_name,' ',a2.last_name) AS Actor2
FROM actor a1
INNER JOIN film_actor fa1 ON a1.actor_id = fa1.actor_id
INNER JOIN film_actor fa2 ON fa1.film_id = fa2.film_id AND fa1.actor_id <> fa2.actor_id
INNER JOIN actor a2 ON a2.actor_id = fa2.actor_id
GROUP BY Actor1, Actor2;

-- 2) Get all pairs of customers that have rented the same film more than 3 times.

SELECT r1.customer_id, r2.customer_id, COUNT(*) AS freq1 
FROM rental r1
JOIN rental r2 ON r1.inventory_id = r2.inventory_id AND r1.customer_id <> r2.customer_id
GROUP BY r1.customer_id, r2.customer_id
HAVING  count(*) > 3
ORDER BY freq1 desc
;

/* 3) Get all possible pairs of actors and films.
*/
SELECT fa1.film_id AS film1, fa1.actor_id AS actor1, fa2.actor_id AS actor2, fa2.film_id AS film2
FROM film_actor fa1
LEFT JOIN film_actor fa2
ON fa1.actor_id <> fa2.actor_id
AND fa1.film_id <> fa2.film_id
ORDER BY fa1.film_id;


