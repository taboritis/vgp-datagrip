USE AUDI_CCWS

BEGIN TRANSACTION

DELETE
FROM cis_model
WHERE id IN (
    SELECT cm.id
    FROM cis_model cm
             LEFT JOIN cis c ON cm.cis_id = c.id
    WHERE c.id IS NULL
)

ALTER TABLE cis_model ADD CONSTRAINT cis_model_cis_id_fk FOREIGN KEY (cis_id) REFERENCES cis (id) ON UPDATE CASCADE ON DELETE CASCADE


DELETE
FROM cis_model
WHERE model_year < 2019

/*
DELETE cce FROM cis_car_equipment cce INNER JOIN cis_car cc ON cce.cis_car_id = cc.id AND cc.created < '2019-01-10'


DELETE
FROM cis_car
WHERE created < '2019-01-01'
*/

ROLLBACK TRANSACTION


SELECT *
FROM cis