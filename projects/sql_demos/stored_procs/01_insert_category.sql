CREATE OR REPLACE PROCEDURE insert_category(p_name CHARACTER VARYING(25))
LANGUAGE plpgsql AS $$
BEGIN

    INSERT INTO category (name)
    VALUES (p_name);

END;
$$;