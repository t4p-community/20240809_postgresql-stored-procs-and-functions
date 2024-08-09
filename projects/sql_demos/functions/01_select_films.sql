-- This SQL query selects all columns from the 'film' table.
-- It retrieves all records available in the 'film' table.
-- The 'film' table is expected to contain information about films,
-- such as film_id, title, description, release_year, language_id, etc.

SELECT f.film_id,
        f.title,
        f.description,
        f.release_year,
        f.language_id,
        f.rental_duration,
        f.rental_rate,
        f.length,
        f.replacement_cost,
        f.rating,
        f.last_update 
FROM film f;