-- This function, named 'get_customers', is created or replaced if it already exists.
-- It returns a table with the specified columns and their respective data types.
-- The columns include customer_id, first_name, last_name, address, city, postal_code, and country.

CREATE OR REPLACE FUNCTION get_customers() 
RETURNS TABLE (
    customer_id INTEGER,                -- Unique identifier for the customer
    first_name CHARACTER VARYING(45),   -- First name of the customer
    last_name CHARACTER VARYING(45),    -- Last name of the customer
    address CHARACTER VARYING(50),      -- Address of the customer
    city CHARACTER VARYING(50),         -- City of the customer's address
    postal_code CHARACTER VARYING(10),  -- Postal code of the customer's address
    country CHARACTER VARYING(50)       -- Country of the customer's address
) 
AS $$
BEGIN
    -- The function returns a query that selects customer information along with their address details.
    RETURN QUERY
    SELECT
        c.customer_id, 
        c.first_name, 
        c.last_name, 
        a.address, 
        city.city, 
        a.postal_code, 
        country.country
    FROM customer c
        INNER JOIN address a ON c.address_id = a.address_id       -- Join customer with address table on address_id
        INNER JOIN city ON a.city_id = city.city_id               -- Join address with city table on city_id
        INNER JOIN country ON city.country_id = country.country_id; -- Join city with country table on country_id
END;
$$ LANGUAGE plpgsql;