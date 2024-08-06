CREATE OR REPLACE FUNCTION get_films() RETURNS TABLE (
        film_id INTEGER,
        title character varying(255),
        description text,
        release_year year,
        language_id smallint,
        rental_duration smallint,
        rental_rate NUMERIC,
        length smallint,
        replacement_cost NUMERIC,
        rating mpaa_rating,
        last_update TIMESTAMP
    ) AS $$ BEGIN RETURN QUERY
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
END;
$$ LANGUAGE plpgsql;