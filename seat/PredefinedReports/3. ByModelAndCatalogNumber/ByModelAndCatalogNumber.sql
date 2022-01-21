-- base query
SELECT LEFT(mc.motor_full_code, 4) AS motor_full_code
     , a.part_number
     , MIN(a.name)                 AS accessory_name
     , SUM(mca.accessory_price)    AS accessory_price
     , COUNT(mca.accessory_id)     AS accessories_number
FROM offer o
         JOIN configuration_group cg ON o.id = cg.offer_id
         JOIN configuration c ON cg.id = c.configuration_group_id
         JOIN motor_configuration mc ON c.id = mc.configuration_id
         JOIN motor_configuration_accessory mca ON mc.id = mca.motor_configuration_id
         JOIN SEAT_CCWS.dbo.accessory a ON mca.accessory_id = a.code
         JOIN SEAT_CCWS.dbo.accessory_repository ar ON a.accessory_repository_id = ar.id
         JOIN sale_opportunity so ON o.sale_opportunity_id = so.id
         JOIN SEAT_CCWS.dbo.dealer d ON LEFT(d.number, 4) = so.dealer_no
WHERE o.is_closed = 1
  AND o.modified >= '2021-11-01'
  AND o.modified < '2021-12-01'
  AND cg.is_deleted = 0
  AND c.is_deleted = 0
  AND d.id NOT IN (66, 67, 68) -- exclude VW GROUP
  AND (ar.is_active = 1 OR ar.id IS NULL)
GROUP BY LEFT(mc.motor_full_code, 4), a.part_number


-- liczba konfiguracji oraz wartości w danym okresie
SELECT LEFT(mc.motor_full_code, 4)       AS motor_code
     , ISNULL(SUM(mc.motor_price), 0)    AS motor_price
     , ISNULL(SUM(mc.exterior_price), 0) AS exterior_price
     , ISNULL(SUM(p.value), 0)           AS discount_price
     , ISNULL(COUNT(c.version_price), 0) AS configurations_number
FROM offer o
         INNER JOIN configuration_group cg ON o.id = cg.offer_id
         INNER JOIN configuration c ON cg.id = c.configuration_group_id
         INNER JOIN motor_configuration mc ON c.id = mc.configuration_id
         INNER JOIN sale_opportunity so ON o.sale_opportunity_id = so.id
         INNER JOIN SEAT_CCWS.dbo.dealer d ON LEFT(d.number, 4) = so.dealer_no
         LEFT OUTER JOIN promo p ON mc.promo_id = p.id
WHERE o.is_closed = 1
  AND o.modified >= '2021-11-01'
  AND o.modified < '2021-12-01'
  AND cg.is_deleted = 0
  AND c.is_deleted = 0
  AND d.id NOT IN (66, 67, 68)
GROUP BY LEFT(mc.motor_full_code, 4)

-- wartość wyposażenia w dany okresie
SELECT LEFT(mc.motor_full_code, 4) AS model_code
     , SUM(mce.equipment_price)    AS equipment_price
FROM offer o
         JOIN configuration_group cg ON o.id = cg.offer_id
         JOIN configuration c ON cg.id = c.configuration_group_id
         JOIN motor_configuration mc ON c.id = mc.configuration_id
         JOIN motor_configuration_equipment mce ON mc.id = mce.motor_configuration_id
         JOIN sale_opportunity so ON o.sale_opportunity_id = so.id
         JOIN SEAT_CCWS.dbo.dealer d ON LEFT(d.number, 4) = so.dealer_no
WHERE o.is_closed = 1
  AND o.modified >= '2021-11-01'
  AND o.modified < '2021-12-01'
  AND cg.is_deleted = 0
  AND c.is_deleted = 0
  AND d.id NOT IN (66, 67, 68) -- exclude VW GROUP
GROUP BY LEFT(mc.motor_full_code, 4)

SELECT LEFT(mc.motor_full_code, 4) AS model_code
     , SUM(mcs.service_price)      AS services_value
FROM offer o
         JOIN configuration_group cg ON o.id = cg.offer_id
         JOIN configuration c ON cg.id = c.configuration_group_id
         JOIN motor_configuration mc ON c.id = mc.configuration_id
         JOIN motor_configuration_service mcs ON mc.id = mcs.motor_configuration_id
         JOIN sale_opportunity so ON o.sale_opportunity_id = so.id
         JOIN SEAT_CCWS.dbo.dealer d ON LEFT(d.number, 4) = so.dealer_no
WHERE o.is_closed = 1
  AND o.modified >= '2021-11-01'
  AND o.modified < '2021-12-01'
  AND cg.is_deleted = 0
  AND c.is_deleted = 0
  AND d.id NOT IN (66, 67, 68)-- exclude VW GROUP
GROUP BY LEFT(mc.motor_full_code, 4)

-- wartość akcesoriów w danym okresie
SELECT SUM(mca.accessory_price) AS accessories_price
FROM offer o
         JOIN configuration_group cg ON o.id = cg.offer_id
         JOIN configuration c ON cg.id = c.configuration_group_id
         JOIN motor_configuration mc ON c.id = mc.configuration_id
         JOIN motor_configuration_accessory mca ON mc.id = mca.motor_configuration_id
         JOIN sale_opportunity so ON o.sale_opportunity_id = so.id
         JOIN SEAT_CCWS.dbo.dealer d ON LEFT(d.number, 4) = so.dealer_no
WHERE o.is_closed = 1
  AND o.modified >= '2021-11-01'
  AND o.modified < '2021-12-01'
  AND cg.is_deleted = 0
  AND c.is_deleted = 0
  AND LEFT(mc.motor_full_code, 4) IN ('KM7B', 'KM7C')
  AND d.id NOT IN (66, 67, 68) -- exclude VW GROUP

