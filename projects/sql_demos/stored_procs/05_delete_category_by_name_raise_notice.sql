-- This procedure, named 'delete_category_by_name', is created or replaced if it already exists.
-- It takes a single parameter 'p_name' which is the name of the category to be deleted.
-- The procedure deletes the category with the specified name from the 'category' table.
-- If the category is not found, it raises a notice indicating that the category was not found.
-- If the category is found and deleted, it raises a notice indicating that the category was deleted.

CREATE OR REPLACE PROCEDURE delete_category_by_name(p_name CHARACTER VARYING(25))
LANGUAGE plpgsql AS $$

DECLARE
    v_category_id INTEGER;  -- Variable to store the category_id of the category to be deleted

BEGIN
    -- Retrieve the category_id of the category with the specified name and store it in v_category_id
    SELECT category_id 
    INTO v_category_id 
    FROM category 
    WHERE name = p_name
    LIMIT 1;

    -- Check if the category was found
    IF v_category_id IS NULL THEN
        -- Raise a notice if the category was not found
        RAISE NOTICE 'Category with name "%" not found.', p_name;
    ELSE
        -- Proceed with the deletion if the category was found
        DELETE FROM category 
        WHERE category_id = v_category_id;
        
        -- Raise a notice indicating that the category was deleted
        RAISE NOTICE 'Category with name "%" and ID % deleted.', p_name, v_category_id;
    END IF;
    
END;
$$;