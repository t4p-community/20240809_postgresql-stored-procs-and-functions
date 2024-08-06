DROP PROCEDURE IF EXISTS insert_category;

CREATE OR REPLACE PROCEDURE insert_category(
    p_name CHARACTER VARYING(25),
    OUT new_category_id INTEGER
)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO category (name)
    VALUES (p_name)
    RETURNING category_id INTO new_category_id;
END;
$$;