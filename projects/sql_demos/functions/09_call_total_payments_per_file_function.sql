-- This SQL query calls the 'get_total_payments_per_film' function.
-- The 'get_total_payments_per_film' function returns a table with the total payments for each film.
-- The returned table includes columns such as film_id, title, and total_payments.

-- The query selects all columns from the result of the 'get_total_payments_per_film' function.
SELECT * 
FROM get_total_payments_per_film();