USE AUDI_GO

SELECT COUNT(*)
FROM equipment
WHERE hash is null
-- 95 025 634

SELECT top 100 *
FROM equipment
WHERE created > '2022-03-01'


SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'equipment'


SELECT configuration_id, COUNT(configuration_id)
FROM equipment
WHERE created > '2022-01-10'
GROUP BY configuration_id
ORDER BY COUNT(configuration_id) DESC


SELECT TOP 10 HASHBYTES('SHA2_256', (
    SELECT equipment_group_id,
           name,
           price,
           code,
           original_code,
           description,
           is_standard,
           is_included,
           replaced_by,
           image_url,
           is_package,
           package_link,
           is_promo_package,
           is_fake_promo
    FOR XML RAW))
FROM equipment
ORDER BY created DESC


SELECT TOP 10 hash
FROM equipment
WHERE created > '2022-02-01'

/*
 kwerenda, która pokazuje liczbę zduplikowanych wartości
 */
SELECT COUNT(subq.hash) AS unique_hash, SUM(subq.ile) AS sum
FROM (
         SELECT hash, COUNT(hash) AS ile
         FROM equipment
         GROUP BY hash
         HAVING COUNT(hash) > 1
     ) AS subq


-- 1 398 932 - with only one record
-- 590 020 - with more than one record
-- 93 626 702 number of duplicated records