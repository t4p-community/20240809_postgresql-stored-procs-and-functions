-- This function, named 'get_total_payments_for_film', is created or replaced if it already exists.
-- It takes a single parameter 'p_film_id' which is the unique identifier for the film.
-- The function returns the total payments received for the specified film as a NUMERIC value.

CREATE OR REPLACE FUNCTION get_total_payments_for_film(p_film_id INTEGER) 
RETURNS NUMERIC 
AS $$
DECLARE 
    total_payments NUMERIC;  -- Variable to store the total payments for the film
BEGIN
    -- The function retrieves the total payments for the specified film_id.
    -- It selects the total_payments from the result of the 'get_total_payments_per_film' function
    -- where the film_id matches the input parameter 'p_film_id'.
    -- The results are ordered by total_payments in descending order and limited to 1 record.
    SELECT f.total_payments 
    INTO total_payments
    FROM get_total_payments_per_film() AS f
    WHERE f.film_id = p_film_id
    ORDER BY total_payments DESC
    LIMIT 1;

    -- The function returns the total payments for the specified film.
    RETURN total_payments;
END;
$$ LANGUAGE plpgsql;