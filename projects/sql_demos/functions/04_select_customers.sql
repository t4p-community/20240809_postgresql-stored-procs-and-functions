-- This SQL query retrieves customer information along with their address details.
-- It selects the customer_id, first_name, last_name, address, city, postal_code, and country.
-- The data is retrieved by joining the 'customer', 'address', 'city', and 'country' tables.

SELECT
    customer.customer_id,       -- Unique identifier for the customer
    customer.first_name,        -- First name of the customer
    customer.last_name,         -- Last name of the customer
    address.address,            -- Address of the customer
    city.city,                  -- City of the customer's address
    address.postal_code,        -- Postal code of the customer's address
    country.country             -- Country of the customer's address
FROM customer
    INNER JOIN address ON customer.address_id = address.address_id   -- Join customer with address table on address_id
    INNER JOIN city ON address.city_id = city.city_id                -- Join address with city table on city_id
    INNER JOIN country ON city.country_id = country.country_id;      -- Join city with country table on country_id