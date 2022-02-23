SELECT * FROM sakila;

-- 1 Select all the actors with the first name ‘Scarlett’.
SELECT * FROM sakila.actor
Where first_name = 'Scarlett';

-- 2 How many films (movies) are available for rent and how many films have been rented?
Select count(rental_id) FROM sakila.rental
WHERE return_date IS NULL;

-- 3 What are the shortest and longest movie duration? Name the values max_duration and min_duration.
Select Min(length) as min_duration, Max(length) as max_duration FROM sakila.film;

-- 4. What's the average movie duration expressed in format (hours, minutes)?
Select AVG(length) as avg_duration FROM sakila.film;
Select CONVERT(AVG(length),time) as avg_duration FROM sakila.film; -- wrong!!!!!!!!

-- 5. How many distinct (different) actors' last names are there?
SELECT DISTINCT(last_name) FROM sakila.actor;

-- 6. Since how many days has the company been operating (check DATEDIFF() function)?
SELECT Max(rental_date), Min(rental_date) FROM sakila.rental;
SELECT Datediff(Max(rental_date), Min(rental_date)) FROM sakila.rental;

-- 7. Show rental info with additional columns month and weekday. Get 20 results.
Select *, date_format(convert(rental_date,date),'%M') as 'month', DAYNAME(convert(rental_date,date)) as weekday FROM sakila.rental
LIMIT 20;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
Select *, date_format(convert(rental_date,date),'%M') as 'month', DAYNAME(convert(rental_date,date)) as weekday, 
CASE
WHEN DAYNAME(convert(rental_date,date)) IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday') Then 'workday'
ELSE 'weekend'
END as day_type
FROM sakila.rental;

-- 9. Get release years.
SELECT DISTINCT(release_year) FROM sakila.film;

-- 10. Get all films with ARMAGEDDON in the title.
SELECT * FROM sakila.film
WHERE title LIKE '%ARMAGEDDON%';

-- 11. Get all films which title ends with APOLLO.
SELECT * FROM sakila.film
WHERE title LIKE '%APOLLO';

-- 12. Get 10 the longest films.
SELECT * FROM sakila.film
Order by length DESC
Limit 10;

-- 13. How many films include Behind the Scenes content?
SELECT count(film_id) FROM sakila.film
WHERE special_features LIKE '%Behind the Scenes%';


