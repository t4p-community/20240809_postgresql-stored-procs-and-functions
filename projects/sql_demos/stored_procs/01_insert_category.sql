-- This procedure, named 'insert_category', is created or replaced if it already exists.
-- It takes a single parameter 'p_name' which is the name of the category to be inserted.
-- The procedure inserts a new record into the 'category' table with the provided name.

CREATE OR REPLACE PROCEDURE insert_category(p_name CHARACTER VARYING(25))
LANGUAGE plpgsql AS $$
BEGIN
    -- Insert a new category into the 'category' table with the provided name.
    INSERT INTO category (name)
    VALUES (p_name);
END;
$$;