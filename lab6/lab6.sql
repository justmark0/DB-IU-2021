-- Task 1.1
SELECT * FROM film WHERE film.film_id IN (
	SELECT film_category.film_id FROM film_category WHERE film_category.film_id=film.film_id AND category_id IN (
		SELECT category.category_id FROM category WHERE (category.name='Horror' OR category.name='Sci-fi'))
	) AND (film.rating='R' OR film.rating='PG-13') AND (film.rating='PG-13' OR film.rating='R') 
	AND film.film_id NOT IN (SELECT inventory.film_id FROM inventory WHERE inventory.inventory_id IN (
		SELECT rental.inventory_id FROM rental));


-- Task 1.2 
EXPLAIN (verbose, analyze) SELECT store_id, sum(amount) AS "money" FROM payment 
LEFT OUTER JOIN customer using (customer_id) LEFT OUTER JOIN store using (store_id) 
WHERE payment_date > '2007/04/14' AND payment_date < '2007/05/14' GROUP BY store_id;
-- storeid=1 is in city: Lethbridge
-- stere_id=2 is city: Woodridge


-- Task 2
-- Using: EXPLAIN (verbose, analyze) 
-- In task 1 most expensive operation is merge semi join which taking about 0.57 ms. Most probably it is better to replace it with other join and it will increase speed
-- In task 2 most expensive operation is sequential scan on public.payment. It cannot be improved sinve the task was about to get sum of entries and there no other way (not including precalculating) of improving it since we need to go thrue all numbers
