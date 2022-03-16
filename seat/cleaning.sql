USE SEAT_GO_DEV

/** Delete records related with 5 last "duplicated" users */
DELETE
FROM motor_configuration_equipment
WHERE created < '2019-01-01'
  AND motor_configuration_id IN (
                                 72362, 72391, 72398, 72413, 79141, 80324, 81436, 81667, 81668, 81669, 81699, 89651,
                                 89658, 89661, 90700, 93363, 94371, 125714
    )

DELETE
FROM motor_configuration_financing
WHERE created < '2019-01-01'
  AND motor_configuration_id IN (
                                 72362, 72391, 72398, 72413, 79141, 80324, 81436, 81667, 81668, 81669, 81699, 89651,
                                 89658, 89661, 90700, 93363, 94371, 125714
    )

DELETE
FROM motor_configuration
WHERE created < '2019-01-01'
  AND configuration_id IN (
                           40, 15068, 79592, 79676, 79683, 79698, 86888, 88173, 89403, 89657, 89658, 89659, 89691,
                           90810, 91393, 98134, 98141, 98145, 98168, 98172, 99243, 102011, 103056, 135853
    )

DELETE
FROM configuration
WHERE created < '2019-01-01'
  AND configuration_group_id IN
      (
       11744, 72851, 72877, 74301, 82957, 83817, 80735, 79839, 79835, 79805, 73818, 72629, 71561, 70489, 64450, 64435,
       64430, 64353, 36, 110409
          )

DELETE
FROM configuration_group
WHERE created < '2019-01-01'
  AND offer_id IN (
                   36, 110294, 83704, 82844, 80624, 79728, 79724, 79694, 74192, 73709, 72768, 72742, 72520, 71452,
                   70381, 64342, 64327, 64322, 64245, 11679
    )

DELETE
FROM offer
WHERE created < '2019-01-01'
  AND user_account_id IN (6, 119, 233, 110, 344)

DELETE
FROM brand_user_access
WHERE user_account_id IN (6, 119, 233, 110, 344)

DELETE
FROM user_account_access_right
WHERE user_account_id IN (6, 119, 233, 110, 344)

DELETE
FROM user_account_role
WHERE userAccountId IN (6, 119, 233, 110, 344)

DELETE
FROM user_account
WHERE id IN (6, 119, 233, 110, 344)

/** update next 5 users */
UPDATE user_account
SET is_active   = 0,
    external_id = CONCAT('9', external_id)
WHERE id IN (361, 515, 553, 607, 620)
