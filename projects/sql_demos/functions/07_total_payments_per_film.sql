-- This SQL query retrieves the total payments for each film.
-- It selects the film_id, title, and the sum of payments (total_payments) for each film.
-- The data is aggregated by film_id and title, and the results are ordered by total_payments in descending order.

SELECT 
    f.film_id,                  -- Unique identifier for the film
    f.title,                    -- Title of the film
    SUM(p.amount) AS total_payments -- Total payments received for the film
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