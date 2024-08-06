DO $$
DECLARE
    new_category_id INTEGER;
BEGIN
    -- Call the stored procedure and capture the output into the variable
    CALL insert_category('New Category', new_category_id);
    
    -- Optionally, you can use RAISE NOTICE to display the result
    RAISE NOTICE 'New Category ID: %', new_category_id;
END;
$$;