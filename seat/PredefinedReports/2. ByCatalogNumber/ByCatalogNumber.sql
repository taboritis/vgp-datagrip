SELECT a.part_number
     , MIN(a.name)          AS accessory_name
     , COUNT(DISTINCT c.id) AS configurations_number
FROM offer o
         INNER JOIN configuration_group cg ON o.id = cg.offer_id
         INNER JOIN configuration c ON cg.id = c.configuration_group_id
         INNER JOIN motor_configuration mc ON c.id = mc.configuration_id
         INNER JOIN motor_configuration_accessory mca ON mc.id = mca.motor_configuration_id
         INNER JOIN SEAT_CCWS.dbo.accessory a ON mca.accessory_id = a.code
         INNER JOIN SEAT_CCWS.dbo.accessory_repository ar ON a.accessory_repository_id = ar.id
WHERE o.is_closed = 1
  AND c.is_deleted = 0
  AND ar.is_active = 1
  AND o.modified >= '2021-10-01'
  AND o.modified <= '2021-11-01'
  AND mca.accessory_id IS NOT NULL
GROUP BY a.part_number
ORDER BY configurations_number DESC

-- liczba wszystkich konfiguracji z akcesowriami
-- liczba konfiguracji z akcesoriami

-- dla danego akcesorium sprawdza wartości: kwota akcesoriów, liczba , średnia cena akcesorium
SELECT a.part_number                              AS part_number
     , SUM(mca.accessory_price)                   AS accessories_total_price
     , SUM(mca.amount)                            AS accessories_quantity
     , SUM(mca.accessory_price) / SUM(mca.amount) AS accessory_average_price
FROM offer o
         INNER JOIN configuration_group cg ON o.id = cg.offer_id
         INNER JOIN configuration c ON cg.id = c.configuration_group_id
         INNER JOIN motor_configuration mc ON c.id = mc.configuration_id
         INNER JOIN motor_configuration_accessory mca ON mc.id = mca.motor_configuration_id
         INNER JOIN SEAT_CCWS.dbo.accessory a ON mca.accessory_id = a.code
         INNER JOIN SEAT_CCWS.dbo.accessory_repository ar ON a.accessory_repository_id = ar.id
WHERE o.is_closed = 1
  AND c.is_deleted = 0
  AND mca.accessory_id IS NOT NULL
  AND ar.is_active = 1
  AND o.modified >= '2021-10-01'
  AND o.modified <= '2021-11-01'
GROUP BY a.part_number
ORDER BY SUM(mca.accessory_price) DESC

-- liczba wszstkich konfiguracji w intervale
SELECT COUNT(*)
FROM offer o
         JOIN configuration_group cg ON o.id = cg.offer_id
         JOIN configuration c ON cg.id = c.configuration_group_id
WHERE o.is_closed = 1
  AND o.is_hidden = 0
  AND c.is_deleted = 0
  AND o.modified > '2021-10-01'
  AND o.modified < '2021-11-01'


-- średnia wartość samochodu w danym okresie
-- wartość model_price
-- wartość exterior
-- wartość equipments
-- wartość accessories
-- wartość services
-- - discount

SELECT COUNT(c.id)            AS configurations_number
     , SUM(c.version_price)   AS version_price
     , SUM(mc.exterior_price) AS exterior_price
     , SUM(p.value)           AS value_price
FROM offer o
         JOIN configuration_group cg ON o.id = cg.offer_id
         JOIN configuration c ON cg.id = c.configuration_group_id
         JOIN motor_configuration mc ON c.id = mc.configuration_id
         JOIN promo p ON mc.promo_id = p.id
WHERE o.is_closed = 1
  AND cg.is_deleted = 0
  AND c.is_deleted = 0
  AND o.modified >= '2021-10-01'
  AND o.modified <= '2021-11-01'


SELECT SUM(mce.equipment_price) AS equipment_price
FROM offer o
         JOIN configuration_group cg ON o.id = cg.offer_id
         JOIN configuration c ON cg.id = c.configuration_group_id
         JOIN motor_configuration mc ON c.id = mc.configuration_id
         JOIN motor_configuration_equipment mce ON mc.id = mce.motor_configuration_id
WHERE o.is_closed = 1
  AND cg.is_deleted = 0
  AND c.is_deleted = 0
  AND o.modified >= '2021-10-01'
  AND o.modified <= '2021-11-01'

SELECT SUM(mca.accessory_price) AS accessory_price
FROM offer o
         JOIN configuration_group cg ON o.id = cg.offer_id
         JOIN configuration c ON cg.id = c.configuration_group_id
         JOIN motor_configuration mc ON c.id = mc.configuration_id
         JOIN motor_configuration_accessory mca ON mc.id = mca.motor_configuration_id
WHERE o.is_closed = 1
  AND cg.is_deleted = 0
  AND c.is_deleted = 0
  AND o.modified >= '2021-10-01'
  AND o.modified <= '2021-11-01'

SELECT SUM(mcs.service_price) AS service_price
FROM offer o
         JOIN configuration_group cg ON o.id = cg.offer_id
         JOIN configuration c ON cg.id = c.configuration_group_id
         JOIN motor_configuration mc ON c.id = mc.configuration_id
         JOIN motor_configuration_service mcs ON mc.id = mcs.motor_configuration_id
WHERE o.is_closed = 1
  AND cg.is_deleted = 0
  AND c.is_deleted = 0
  AND o.modified >= '2021-10-01'
  AND o.modified <= '2021-11-01'
