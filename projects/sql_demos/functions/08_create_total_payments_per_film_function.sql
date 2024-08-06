-- This function, named 'get_total_payments_per_film', is created or replaced if it already exists.
-- It returns a table with the specified columns and their respective data types.
-- The columns include film_id, title, and total_payments.

CREATE OR REPLACE FUNCTION get_total_payments_per_film() 
RETURNS TABLE (
    film_id INTEGER,                -- Unique identifier for the film
    title CHARACTER VARYING(255),   -- Title of the film
    total_payments NUMERIC          -- Total payments received for the film
) 
AS $$
BEGIN
    -- The function returns a query that retrieves the total payments for each film.
    -- It selects the film_id, title, and the sum of payments (total_payments) for each film.
    -- The data is aggregated by film_id and title, and the results are ordered by total_payments in descending order.
    RETURN QUERY
    SELECT 
        f.film_id, 
        f.title,
        SUM(p.amount) AS total_payments
    FROM 
        film f
        INNER JOIN inventory i ON f.film_id = i.film_id       -- Join film with inventory table on film_id
        INNER JOIN rental r ON i.inventory_id = r.inventory_id -- Join inventory with rental table on inventory_id
        INNER JOIN payment p ON r.rental_id = p.rental_id      -- Join rental with payment table on rental_id
    GROUP BY 
        f.film_id,                  -- Group by film_id to aggregate payments
        f.title                     -- Group by title to aggregate payments
    ORDER BY 
        total_payments DESC;        -- Order the results by total_payments in descending order
END;
$$ LANGUAGE plpgsql;