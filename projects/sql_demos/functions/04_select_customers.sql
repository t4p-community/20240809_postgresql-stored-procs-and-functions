

select
    customer_id, first_name, last_name, address, city, postal_code, country
from customer
    inner join address on customer.address_id = address.address_id
    inner join city on address.city_id = city.city_id
    inner join country on city.country_id = country.country_id;