-- This function, named 'get_films', is created or replaced if it already exists.
-- It returns a table with the specified columns and their respective data types.
-- The columns include film_id, title, description, release_year, language_id, rental_duration,
-- rental_rate, length, replacement_cost, rating, and last_update.

CREATE OR REPLACE FUNCTION get_films() 
RETURNS TABLE (
    film_id INTEGER,                -- Unique identifier for the film
    title character varying(255),   -- Title of the film
    description text,               -- Description of the film
    release_year year,              -- Year the film was released
    language_id smallint,           -- Identifier for the language of the film
    rental_duration smallint,       -- Duration for which the film can be rented
    rental_rate NUMERIC,            -- Rental rate for the film
    length smallint,                -- Length of the film in minutes
    replacement_cost NUMERIC,       -- Cost to replace the film
    rating mpaa_rating,             -- MPAA rating of the film
    last_update TIMESTAMP           -- Timestamp of the last update to the film record
) 
AS $$
BEGIN
    -- The function returns a query that selects all columns from the 'film' table.
    RETURN QUERY
    SELECT 
        f.film_id,
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
END;
$$ LANGUAGE plpgsql;