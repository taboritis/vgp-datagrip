use AUDI_CCWS

SELECT *
FROM cis_car


SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME like '%cis%'


SELECT count(*) from cis_car_equipment



SELECT count(*)
FROM cis_car_equipment
-- 5 081 227 - wszystkich rekordów

SELECT count(cc.id)
FROM cis_car cc
left join cis_car_equipment cce ON cc.id = cce.cis_car_id
WHERE cc.deleted = 1 or cce.id is null
-- 4 760 904 - podpiętych do rekordów gdzie cc.deleted = 1


SELECT *
FROM equipment;

SELECT count(*)
FROM configuration c
WHERE is_active = 0

