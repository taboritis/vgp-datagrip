USE AUDI_GO_DEV

SELECT *
FROM equipment;

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'configuration_id';

/*

calculation
- ma klucz obcy
- ma opcję ON DELETE CASCADE

equipment
- ma index, który nie jest FK
- ergo nie ma ON DELETE CASCADE

exterior_image
- ma index na polu configuration_id, ale nie jest to FK
- ergo nie ma ON DELETE CASCADE

interior_image
- ma FK - z opcją ON DELETE CASCADE

interior_info
- ma FK - z opcją ON DELETE CASCADE

technical_data_value
-- ma FK on delete cascade

ufo_token
- ma FK on delete cascade

*/

SELECT TOP 10 e.created
FROM equipment e
         LEFT JOIN configuration c ON e.configuration_id = c.id
WHERE 1 = 1
  AND c.id IS NULL
ORDER BY e.created DESC

-- 1370


-- equipment_include - nie ma FK do equipment

SELECT COUNT(ei.equipment_id) AS brakujace_equipment_id
FROM equipment_include ei
         LEFT JOIN equipment e ON e.id = ei.equipment_id
WHERE e.id IS NULL

-- nie ma "zombie", ale trzeba założyć FK

DELETE
FROM equipment
WHERE id IN (
    SELECT e.id
    FROM equipment e
             LEFT JOIN configuration c ON e.configuration_id = c.id
    WHERE c.id IS NULL
)



ALTER TABLE equipment
    ADD CONSTRAINT equipment_configuration_id_fk
        FOREIGN KEY (configuration_id) REFERENCES configuration (id)
            ON DELETE CASCADE
