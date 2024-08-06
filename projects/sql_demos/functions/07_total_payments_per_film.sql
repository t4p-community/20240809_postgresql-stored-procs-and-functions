select f.film_id, f.title,
    sum(p.amount) as total_payments
from film f
    inner join inventory i on f.film_id = i.film_id
    inner join rental r on i.inventory_id = r.inventory_id
    inner join payment p on r.rental_id = p.rental_id
group by f.film_id, f.title
order by total_payments desc;