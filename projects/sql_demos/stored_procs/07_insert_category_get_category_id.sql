-- This procedure, named 'insert_category', is created or replaced if it already exists.
-- It takes a single input parameter 'p_name' which is the name of the category to be inserted.
-- It also has an output parameter 'new_category_id' which will store the ID of the newly inserted category.
-- The procedure inserts a new record into the 'category' table with the provided name and returns the new category_id.

DROP PROCEDURE IF EXISTS insert_category;

CREATE OR REPLACE PROCEDURE insert_category(
    p_name CHARACTER VARYING(25),  -- Input parameter: name of the category to be inserted
    OUT new_category_id INTEGER    -- Output parameter: ID of the newly inserted category
)
LANGUAGE plpgsql AS $$
BEGIN
    -- Insert a new category into the 'category' table with the provided name.
    -- Return the category_id of the newly inserted category into the output parameter 'new_category_id'.
    INSERT INTO category (name)
    VALUES (p_name)
    RETURNING category_id INTO new_category_id;
END;
$$;