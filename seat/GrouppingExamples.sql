-- grupowanie po nazwach
SELECT o.brand, c.model_name
FROM offer o
         JOIN configuration_group cg ON o.id = cg.offer_id
         JOIN configuration c ON cg.id = c.configuration_group_id
WHERE o.is_closed = 1
  AND cg.is_deleted = 0
  AND c.is_deleted = 0
  AND o.modified >= '2020-01-01'
  AND o.modified < '2021-12-01'
GROUP BY o.brand, c.model_name

-- SELECT model_name
-- FROM configuration
-- WHERE configuration.model_name like '%CUPRA%'
-- GROUP BY model_name

-- grupowanie po kodach modelowychy
SELECT LEFT(mc.motor_full_code, 4) AS motor_code,
       o.brand,
       c.model_name
FROM configuration c
         LEFT JOIN configuration_group cg ON c.configuration_group_id = cg.id
         LEFT JOIN offer o ON cg.offer_id = o.id
         LEFT JOIN motor_configuration mc ON c.id = mc.configuration_id
         LEFT JOIN promo p ON mc.promo_id = p.id
WHERE c.is_deleted = 0
  AND cg.is_deleted = 0
  AND o.is_closed = 1
  AND o.modified >= '2020-01-01'
  AND o.modified < '2021-12-01'
GROUP BY LEFT(mc.motor_full_code, 4), o.brand, c.model_name


-- grupowanie po carline
SELECT CASE mg.carline
           WHEN 81000 THEN 'CUPRA'
           ELSE 'SEAT'
           END AS brand_from_carline,
       mg.name
FROM offer o
         JOIN configuration_group cg ON o.id = cg.offer_id
         JOIN configuration c ON cg.id = c.configuration_group_id
         JOIN motor_configuration mc ON c.id = mc.configuration_id
         JOIN SEAT_CCWS.dbo.motor m ON mc.motor_full_code = m.full_code
         JOIN SEAT_CCWS.dbo.version v ON m.version_id = v.id
         JOIN SEAT_CCWS.dbo.model mo ON v.model_id = mo.id
         JOIN SEAT_CCWS.dbo.model_group mg ON mo.model_group_id = mg.id
WHERE c.is_deleted = 0
  AND cg.is_deleted = 0
  AND o.is_closed = 1
  AND o.modified >= '2020-01-01'
  AND o.modified < '2021-12-01'
GROUP BY mg.name,
         CASE mg.carline
             WHEN 81000 THEN 'CUPRA'
             ELSE 'SEAT'
             END
SELECT mo.sales_group,
       mo.name,
       CASE mg.carline
           WHEN 81000 THEN 'CUPRA'
           ELSE 'SEAT'
           END
FROM offer o
         JOIN configuration_group cg ON o.id = cg.offer_id
         JOIN configuration c ON cg.id = c.configuration_group_id
         JOIN motor_configuration mc ON c.id = mc.configuration_id
         JOIN SEAT_CCWS.dbo.motor m ON mc.motor_full_code = m.full_code
         JOIN SEAT_CCWS.dbo.version v ON m.version_id = v.id
         JOIN SEAT_CCWS.dbo.model mo ON v.model_id = mo.id
         JOIN SEAT_CCWS.dbo.model_group mg ON mo.model_group_id = mg.id
WHERE c.is_deleted = 0
  AND cg.is_deleted = 0
  AND o.is_closed = 1
  AND o.modified >= '2020-01-01'
  AND o.modified < '2021-12-01'
GROUP BY mo.sales_group, mo.name,
         CASE mg.carline
             WHEN 81000 THEN 'CUPRA'
             ELSE 'SEAT'
             END