-- This anonymous code block calls the 'insert_category' procedure and captures the output.
-- The 'insert_category' procedure inserts a new category with the provided name and returns the new category_id.
-- The new category_id is stored in the variable 'new_category_id' and optionally displayed using RAISE NOTICE.

DO $$
DECLARE
    new_category_id INTEGER;  -- Variable to store the ID of the newly inserted category
BEGIN
    -- Call the stored procedure and capture the output into the variable
    CALL insert_category('New Category', new_category_id);
    
    -- Optionally, you can use RAISE NOTICE to display the result
    RAISE NOTICE 'New Category ID: %', new_category_id;
END;
$$;