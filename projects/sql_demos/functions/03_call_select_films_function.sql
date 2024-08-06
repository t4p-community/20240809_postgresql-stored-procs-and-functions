-- This SQL query calls the 'get_films' function.
-- The 'get_films' function returns a table with details about films.
-- The returned table includes columns such as film_id, title, description, release_year,
-- language_id, rental_duration, rental_rate, length, replacement_cost, rating, and last_update.

-- The query selects all columns from the result of the 'get_films' function.
SELECT * FROM get_films();