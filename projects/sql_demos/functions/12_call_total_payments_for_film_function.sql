-- This SQL query calls the 'get_total_payments_for_film' function with a specific film_id.
-- The 'get_total_payments_for_film' function returns the total payments received for the specified film.
-- The query retrieves the total payments for the film with film_id = 879 and aliases the result as 'total_payments'.

SELECT 
    get_total_payments_for_film(879) AS total_payments;  -- Call the function with film_id = 879 and alias the result