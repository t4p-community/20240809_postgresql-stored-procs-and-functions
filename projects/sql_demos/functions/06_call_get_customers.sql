-- This SQL query calls the 'get_customers' function.
-- The 'get_customers' function returns a table with customer information
-- including customer_id, first_name, last_name, address, city, postal_code, and country.

-- The query selects all columns from the result of the 'get_customers' function.
SELECT * 
FROM get_customers();