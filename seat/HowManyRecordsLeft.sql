WITH records_left AS (
    SELECT COUNT(*) AS result
    FROM motor_configuration mc
             INNER JOIN configuration c ON c.id = mc.configuration_id
             INNER JOIN configuration_group cg ON cg.id = c.configuration_group_id
             INNER JOIN offer o ON cg.offer_id = o.id
    WHERE c.created >= '2020-01-01'
      AND mc.final_car_price_brutto IS NULL
      AND c.is_deleted = 0
      AND cg.is_deleted = 0
      AND o.is_closed = 1
),
     records_done AS (
         SELECT COUNT(*) AS result
         FROM motor_configuration
         WHERE final_car_price_brutto IS NOT NULL
     )
SELECT TOP 1 o.offer_no                        AS currect_offer_for_calculation
           , c.created                         AS current_configuration_timestamp
           , (SELECT result FROM records_done) AS records_done
           , (SELECT result FROM records_left) AS records_left
FROM motor_configuration mc
         INNER JOIN configuration c ON c.id = mc.configuration_id
         INNER JOIN configuration_group cg ON cg.id = c.configuration_group_id
         INNER JOIN offer o ON cg.offer_id = o.id
WHERE final_car_price_brutto IS NULL
  AND c.is_deleted = 0
  AND cg.is_deleted = 0
  AND o.is_closed = 1
ORDER BY c.created DESC
