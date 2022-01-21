USE AUDI_CCWS;

SELECT * FROM configuration WHERE audi_code = 'A5G7LD35'

UPDATE configuration SET is_active = 0 WHERE audi_code = 'A5G7LD35'
