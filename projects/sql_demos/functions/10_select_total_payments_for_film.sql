-- This SQL query calls the 'get_total_payments_per_film' function and filters the results.
-- The 'get_total_payments_per_film' function returns a table with the total payments for each film.
-- The returned table includes columns such as film_id, title, and total_payments.

-- The query selects all columns from the result of the 'get_total_payments_per_film' function
-- and filters the results to include only the film with film_id = 879.
SELECT * 
FROM get_total_payments_per_film() 
WHERE film_id = 879;  -- Filter the results to include only the film with film_id = 879