CREATE OR REPLACE FUNCTION get_total_payments_for_film(p_film_id INTEGER) RETURNS NUMERIC AS $$
DECLARE total_payments NUMERIC;
BEGIN
SELECT f.total_payments INTO total_payments
FROM get_total_payments_per_film() AS f
WHERE f.film_id = p_film_id
ORDER BY total_payments DESC
LIMIT 1;
RETURN total_payments;
END;
$$ LANGUAGE plpgsql;