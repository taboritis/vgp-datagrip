USE AUDI_GO

SELECT COUNT(*)
FROM equipment
WHERE created > '2022-02-01'

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'equipment'


SELECT COUNT(*)
FROM (
         SELECT MAX(id)      AS last_duplicated_id
              , MAX(created) AS max_created_at
              , MIN(created) AS min_created_at
              , COUNT(*)     AS ile
              , equipment_group_id
              , name
              , price
              , code
              , original_code
              , description
              , is_standard
              , is_included
              , replaced_by
              , image_url
              , is_package
              , package_link
              , is_promo_package
              , is_fake_promo
         FROM equipment e
         WHERE e.created > '2022-01-01'
         GROUP BY equipment_group_id, name, price, code, original_code, description, is_standard,
                  is_included,
                  replaced_by, image_url, is_package, package_link, is_promo_package, is_fake_promo
         HAVING COUNT(*) > 1
     ) AS subq


SELECT configuration_id, COUNT(configuration_id)
FROM equipment
WHERE created > '2022-01-10'
GROUP BY configuration_id
ORDER BY COUNT(configuration_id) DESC


SELECT TOP 100 HASHBYTES('SHA2_256', (
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
WHERE created > '2022-02-01'


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

-- 93626702 number of duplicated records