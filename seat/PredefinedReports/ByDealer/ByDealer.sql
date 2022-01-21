SELECT LEFT(mc.motor_full_code, 4) AS motor_code
     , d.number
     , d.name
     , COUNT(c.id)                 AS configurations_number
FROM configuration c
         JOIN motor_configuration mc ON c.id = mc.configuration_id
         JOIN configuration_group cg ON c.configuration_group_id = cg.id
         JOIN offer o ON cg.offer_id = o.id
         JOIN user_account u ON o.user_account_id = u.id
         JOIN SEAT_CCWS.dbo.dealer d ON u.company_number = d.number
WHERE c.is_deleted = 0
  AND c.created >= '2021-11-01'
  AND c.created < '2021-12-01'
  AND cg.is_deleted = 0
  AND o.is_hidden = 0
  AND d.id NOT IN (66, 67, 68)-- exclude VW GROUP
GROUP BY LEFT(mc.motor_full_code, 4), d.number, d.name


SELECT LEFT(mc.motor_full_code, 4) AS motor_code
     , d.number
     , COUNT(*)                    AS configurations_number
FROM configuration c
         JOIN motor_configuration mc ON c.id = mc.configuration_id
         JOIN motor_configuration_accessory mca ON mc.id = mca.motor_configuration_id
         JOIN configuration_group cg ON c.configuration_group_id = cg.id
         JOIN offer o ON cg.offer_id = o.id
         JOIN user_account u ON o.user_account_id = u.id
         JOIN SEAT_CCWS.dbo.dealer d ON u.company_number = d.number
    AND c.created >= '2021-11-01'
    AND c.created < '2021-12-01'
    AND cg.is_deleted = 0
    AND o.is_hidden = 0
    AND d.id NOT IN (66, 67, 68)-- exclude VW GROUP
WHERE mca.accessory_price IS NOT NULL
GROUP BY LEFT(mc.motor_full_code, 4), d.number


SELECT LEFT(mc.motor_full_code, 4) AS motor_code
     , COUNT(c.model_name)         AS configurations_number
     , SUM(c.version_price)        AS version_price
     , SUM(mc.exterior_price)      AS exterior_price
     , SUM(p.value)                AS discount
FROM configuration c
         LEFT JOIN configuration_group cg ON c.configuration_group_id = cg.id
         LEFT JOIN offer o ON cg.offer_id = o.id
         LEFT JOIN motor_configuration mc ON c.id = mc.configuration_id
         LEFT JOIN promo p ON mc.promo_id = p.id
WHERE c.is_deleted = 0
  AND cg.is_deleted = 0
  AND o.is_closed = 1
  AND o.modified >= '{$startDate}'
  AND o.modified < '{$endDate}'
GROUP BY LEFT(mc.motor_full_code, 4)
