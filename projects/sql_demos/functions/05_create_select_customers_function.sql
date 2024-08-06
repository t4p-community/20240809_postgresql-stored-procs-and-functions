CREATE OR REPLACE FUNCTION get_customers() RETURNS TABLE (
        customer_id INTEGER,
        first_name CHARACTER VARYING(45),
        last_name CHARACTER VARYING(45),
        address CHARACTER VARYING(50),
        city CHARACTER VARYING(50),
        postal_code CHARACTER VARYING(10),
        country CHARACTER VARYING(50)
    ) AS $$ BEGIN RETURN QUERY
select
    c.customer_id, c.first_name, c.last_name, a.address, city.city, a.postal_code, country.country
from customer c
    inner join address a on c.address_id = a.address_id
    inner join city on a.city_id = city.city_id
    inner join country on city.country_id = country.country_id;
END;
$$ LANGUAGE plpgsql;