USE SEAT_GO

SELECT LEFT(mc.motor_full_code, 4) AS motor_code,
       COUNT(DISTINCT c.id)        AS configurations_number
FROM configuration c
         INNER JOIN configuration_group cg ON c.configuration_group_id = cg.id
         INNER JOIN offer o ON cg.offer_id = o.id
         INNER JOIN user_account u ON o.user_account_id = u.id
         INNER JOIN motor_configuration mc ON c.id = mc.configuration_id
         INNER JOIN motor_configuration_accessory mca ON mc.id = mca.motor_configuration_id
WHERE c.is_deleted = 0
  AND c.created BETWEEN '2021-12-01 00:00:00' AND '2021-12-31 23:59:59'
  AND cg.is_deleted = 0
  AND o.is_hidden = 0
  AND o.is_closed = 1
  AND u.company_number NOT IN (82368, 90002, 90003)
  AND LEFT(mc.motor_full_code, 4) IN ('KN22', 'KN24', 'KN25')

GROUP BY LEFT(mc.motor_full_code, 4)


SELECT LEFT(mc.motor_full_code, 4) AS motor_full_code
     , a.part_number
     , MIN(a.name)                 AS accessory_name
     , SUM(mca.accessory_price)    AS accessories_price
     , COUNT(mca.accessory_id)     AS accessories_number
FROM configuration c
         INNER JOIN configuration_group cg ON c.configuration_group_id = cg.id
         INNER JOIN offer o ON cg.offer_id = o.id
         INNER JOIN user_account u ON o.user_account_id = u.id
         INNER JOIN motor_configuration mc ON c.id = mc.configuration_id
         INNER JOIN motor_configuration_accessory mca ON mc.id = mca.motor_configuration_id
         INNER JOIN SEAT_CCWS_DEV.dbo.accessory a ON mca.accessory_id = a.code
         INNER JOIN SEAT_CCWS_DEV.dbo.accessory_repository ar ON a.accessory_repository_id = ar.id
WHERE c.is_deleted = 0
  AND c.created BETWEEN '2021-12-01 00:00:00' AND '2021-12-31 23:59:59'
  AND cg.is_deleted = 0
  AND o.is_hidden = 0
  AND o.is_closed = 1
  AND u.company_number NOT IN (82368, 90002, 90003)
  AND (ar.is_active = 1 OR ar.id IS NULL)
  AND LEFT(mc.motor_full_code, 4) IN ('KN22', 'KN24', 'KN25')

GROUP BY LEFT(mc.motor_full_code, 4), a.part_number


SELECT LEFT(mc.motor_full_code, 4) AS motor_code
     , SUM(mca.accessory_price)    AS accessory_price
FROM configuration c
         INNER JOIN configuration_group cg ON c.configuration_group_id = cg.id
         INNER JOIN offer o ON cg.offer_id = o.id
         INNER JOIN user_account u ON o.user_account_id = u.id
         INNER JOIN motor_configuration mc ON c.id = mc.configuration_id
         INNER JOIN motor_configuration_accessory mca ON mc.id = mca.motor_configuration_id
WHERE c.is_deleted = 0
  AND c.created BETWEEN '2021-12-01 00:00:00' AND '2021-12-31 23:59:59'
  AND cg.is_deleted = 0
  AND o.is_closed = 1
  AND o.is_hidden = 0
  AND u.company_number NOT IN (82368, 90002, 90003)
GROUP BY LEFT(mc.motor_full_code, 4)


SELECT mca.accessory_id
     , COUNT(DISTINCT c.id) AS configurations_number
FROM configuration c
         INNER JOIN configuration_group cg ON c.configuration_group_id = cg.id
         INNER JOIN offer o ON cg.offer_id = o.id
         INNER JOIN user_account u ON o.user_account_id = u.id
         INNER JOIN motor_configuration mc ON c.id = mc.configuration_id
         INNER JOIN motor_configuration_accessory mca ON mc.id = mca.motor_configuration_id
WHERE c.is_deleted = 0
  AND c.created BETWEEN '2021-12-01 00:00:00' AND '2021-12-31 23:59:59'
  AND cg.is_deleted = 0
  AND o.is_hidden = 0
  AND o.is_closed = 1
  AND u.company_number NOT IN (82368, 90002, 90003)
  AND LEFT(mc.motor_full_code, 4) IN ('KN22', 'KN24', 'KN25')

GROUP BY mca.accessory_id

SELECT c.id, count(DISTINCT mca.id)
FROM configuration c
         INNER JOIN configuration_group cg ON c.configuration_group_id = cg.id
         INNER JOIN offer o ON cg.offer_id = o.id
         INNER JOIN user_account u ON o.user_account_id = u.id
         INNER JOIN motor_configuration mc ON c.id = mc.configuration_id
         INNER JOIN motor_configuration_accessory mca ON mc.id = mca.motor_configuration_id
WHERE c.is_deleted = 0
  AND c.created BETWEEN '2021-12-01 00:00:00' AND '2021-12-31 23:59:59'
  AND cg.is_deleted = 0
  AND o.is_hidden = 0
  AND o.is_closed = 1
  AND u.company_number NOT IN (82368, 90002, 90003)
  AND LEFT(mc.motor_full_code, 4) IN ('KN22', 'KN24', 'KN25')
GROUP BY c.id