/* Kwerenda zbiorcza - zbyt duża aby używać */
SELECT c.id
     , o.brand
     , c.model_name
     , c.version_price
     , mc.exterior_price
     , ISNULL((
                  SELECT SUM(equipment_price)
                  FROM motor_configuration_equipment
                  WHERE motor_configuration_id = mc.id)
    , 0)            AS equipment_total_value
     , ISNULL((
                  SELECT SUM(accessory_price)
                  FROM motor_configuration_accessory
                  WHERE motor_configuration_id = mc.id),
              0)    AS accessories_total_value
     , ISNULL((
                  SELECT SUM(service_price)
                  FROM motor_configuration_service
                  WHERE motor_configuration_service.motor_configuration_id = mc.id
              ), 0) AS services_total_value
     , p.value      AS discount_value

FROM configuration c
         LEFT JOIN configuration_group cg ON c.configuration_group_id = cg.id
         LEFT JOIN offer o ON cg.offer_id = o.id
         LEFT JOIN motor_configuration mc ON c.id = mc.configuration_id
         LEFT JOIN promo p ON mc.promo_id = p.id
WHERE c.is_deleted = 0
  AND cg.is_deleted = 0
  AND o.is_closed = 1
  AND o.modified >= '2021-10-01'
  AND o.modified < '2021-11-01'


SELECT o.brand
     , c.model_name
FROM configuration c
         LEFT JOIN configuration_group cg
                   ON c.configuration_group_id = cg.id
         LEFT JOIN offer o ON cg.offer_id = o.id
WHERE c.is_deleted = 0
  AND cg.is_deleted = 0
  AND o.is_closed = 1
  AND o.modified >= '2021-10-01'
  AND o.modified < '2021-11-01'
GROUP BY o.brand, c.model_name


/**
  Zapytanie o modele i podstawowe ceny
 */
SELECT o.brand
     , c.model_name
     , SUM(c.version_price)   AS version_price
     , SUM(mc.exterior_price) AS exterior_price
     , SUM(p.value)           AS discount
FROM configuration c
         LEFT JOIN configuration_group cg
                   ON c.configuration_group_id = cg.id
         LEFT JOIN offer o ON cg.offer_id = o.id
         LEFT JOIN motor_configuration mc ON c.id = mc.configuration_id
         LEFT JOIN promo p ON mc.promo_id = p.id
WHERE c.is_deleted = 0
  AND cg.is_deleted = 0
  AND o.is_closed = 1
  AND o.modified >= '2021-10-01'
  AND o.modified < '2021-11-01'
GROUP BY o.brand, c.model_name


SELECT UPPER(o.brand)                      AS brand
     , UPPER(c.model_name)                 AS model_name
     , ISNULL(SUM(mce.equipment_price), 0) AS equipment_price
FROM configuration c
         LEFT JOIN configuration_group cg
                   ON c.configuration_group_id = cg.id
         LEFT JOIN offer o ON cg.offer_id = o.id
         LEFT JOIN motor_configuration mc ON c.id = mc.configuration_id
         LEFT JOIN motor_configuration_equipment mce ON mc.id = mce.motor_configuration_id
WHERE c.is_deleted = 0
  AND cg.is_deleted = 0
  AND o.is_closed = 1
  AND o.modified >= '2021-10-01'
  AND o.modified < '2021-11-01'
GROUP BY c.model_name, o.brand


SELECT UPPER(o.brand)                      AS brand
     , UPPER(c.model_name)                 AS model_name
     , ISNULL(SUM(mca.accessory_price), 0) AS accessory_price
FROM configuration c
         LEFT JOIN configuration_group cg
                   ON c.configuration_group_id = cg.id
         LEFT JOIN offer o ON cg.offer_id = o.id
         LEFT JOIN motor_configuration mc ON c.id = mc.configuration_id
         LEFT JOIN motor_configuration_accessory mca ON mc.id = mca.motor_configuration_id
WHERE c.is_deleted = 0
  AND cg.is_deleted = 0
  AND o.is_closed = 1
  AND o.modified >= '2021-10-01'
  AND o.modified < '2021-11-01'
GROUP BY c.model_name, o.brand

SELECT UPPER(o.brand) as brand
     , UPPER(c.model_name) as model_name
     , ISNULL(SUM(mcs.service_price), 0) AS service_price
FROM configuration c
         LEFT JOIN configuration_group cg
                   ON c.configuration_group_id = cg.id
         LEFT JOIN offer o ON cg.offer_id = o.id
         LEFT JOIN motor_configuration mc ON c.id = mc.configuration_id
         LEFT JOIN motor_configuration_service mcs ON mc.id = mcs.motor_configuration_id
WHERE c.is_deleted = 0
  AND cg.is_deleted = 0
  AND o.is_closed = 1
  AND o.modified >= '2021-10-01'
  AND o.modified < '2021-11-01'
GROUP BY c.model_name, o.brand


SELECT o.brand, c.model_name
FROM configuration c
         LEFT JOIN configuration_group cg
                   ON c.configuration_group_id = cg.id
         LEFT JOIN offer o ON cg.offer_id = o.id
WHERE c.is_deleted = 0
  AND cg.is_deleted = 0
  AND o.is_closed = 1
  AND ((o.modified >= '2021-01-01' AND o.modified <= '2021-10-31 23:59:59.999')
    OR (o.modified >= '2020-01-01' AND o.modified <= '2020-10-31 23:59:59.999')
    OR (o.modified >= '2021-10-01' AND o.modified <= '2021-10-31 23:59:59.999')
    OR (o.modified >= '2020-10-01' AND o.modified <= '2020-10-31 23:59:59.999'))
GROUP BY o.brand, c.model_name


SELECT model_name
FROM configuration
GROUP BY model_name
