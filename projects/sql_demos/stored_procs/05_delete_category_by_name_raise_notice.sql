CREATE OR REPLACE PROCEDURE delete_category_by_name(p_name CHARACTER VARYING(25))
LANGUAGE plpgsql AS $$

DECLARE
    v_category_id INTEGER;

BEGIN

    SELECT category_id INTO v_category_id FROM category WHERE name = p_name;

    IF v_category_id IS NULL THEN
        RAISE NOTICE 'Category with name "%" not found.', p_name;
    ELSE
        -- Proceed with the deletion if the category was found
        DELETE FROM category WHERE category_id = v_category_id;
        RAISE NOTICE 'Category with name "%" and ID % deleted.', p_name, v_category_id;
    END IF;
    
END;
$$;