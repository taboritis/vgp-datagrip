SELECT top 100 * from equipment
ORDER BY hash desc

SELECT TOP 10 id
            , HASHBYTES('SHA2_256', (
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
    FOR XML RAW))  AS hexFormat
            , CONVERT(BIGINT, HASHBYTES('SHA2_256', (
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
    FOR XML RAW))) AS integerFormat
            , CONVERT(VARCHAR, HASHBYTES('SHA2_256', (
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
    FOR XML RAW))) AS stringFormat
FROM equipment
ORDER BY created DESC