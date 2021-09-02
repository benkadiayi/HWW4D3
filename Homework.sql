--  list all customers who live in Texas.
SELECT first_name , last_name, city, district
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULl JOIN city
ON address.city_id = city.city_id
WHERE district = 'Texas';

-- Get all apyments above 6.99$ with the customer's full name
SELECT first_name, last_name, amount
FROM customer
FULL JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;

--show all customers names who have made payments over 175$
SELECT *
FROM customer
WHERE customer_id IN (
	SELECT payment.customer_id
	FROM payment
	GROUP BY payment.customer_id
	HAVING SUM(amount) > 175
	
);

-- list all customers that lives in Nepal
SELECT first_name , last_name, city, district, country
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULl JOIN city
ON address.city_id = city.city_id
FULL JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';

-- which member had the most transaction
SELECT first_name, last_name, COUNT(payment.staff_id) AS total
FROM staff
FULL JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY first_name, last_name, payment.staff_id
ORDER BY COUNT(payment.staff_id) DESC;

-- how many movies of each ratings are there
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating;

-- show customers who have made a single payment above 6.99
SELECT *
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	WHERE amount > 6.99
	GROUP BY customer_id
	HAVING COUNT(amount) = 1
	
)
;

-- HOW many free rentals our store giveaway?
SELECT COUNT(amount)
FROM payment 
WHERE amount = 0;
