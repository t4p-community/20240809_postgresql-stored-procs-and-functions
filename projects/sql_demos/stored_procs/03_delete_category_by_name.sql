CREATE OR REPLACE PROCEDURE delete_category_by_name(p_name CHARACTER VARYING(25))
LANGUAGE plpgsql AS $$

DECLARE
    v_category_id INTEGER;

BEGIN

    SELECT category_id INTO v_category_id FROM category WHERE name = p_name;

    DELETE FROM category WHERE category_id = v_category_id;

END;
$$;