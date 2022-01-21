USE audi_go;

-- Wszystkie modele RS (oprócz RS e-tron GT) Modele PHEV --
DECLARE @FinancialProductGroupId INT;
DECLARE @FinancialProduc24tId INT;
DECLARE @FinancialProduc36tId INT;
DECLARE @FinancialProduc48tId INT;

BEGIN TRAN Transaction1
--FINANCIAL PRODUCT GROUP
SET @FinancialProductGroupId = (SELECT financial_product_group_id
                                FROM financial_product
                                WHERE name = 'Audi Perfect Lease Poziom 1 dla przedsiębiorców (36m)'
                                  AND deleted = 0);

--ADD FINANCIAL PRODUCTS
--own_payment_options -> lista wartości z Initial payment
--bank_commission -> zawsze 0
--rate -> Nominal interest rate
--start_date -> od kiedy ma obowiązywać
SET @FinancialProduc24tId = (SELECT id
                             FROM financial_product
                             WHERE name = 'Audi Perfect Lease Poziom 1 dla przedsiębiorców (24m)'
                               AND deleted = 0);
UPDATE financial_product
SET rate = 3.32
WHERE id = @FinancialProduc24tId;

SET @FinancialProduc36tId = (SELECT id
                             FROM financial_product
                             WHERE name = 'Audi Perfect Lease Poziom 1 dla przedsiębiorców (36m)'
                               AND deleted = 0);
UPDATE financial_product
SET rate = 3.59
WHERE id = @FinancialProduc36tId;

SET @FinancialProduc48tId = (SELECT id
                             FROM financial_product
                             WHERE name = 'Audi Perfect Lease Poziom 1 dla przedsiębiorców (48m)'
                               AND deleted = 0);
UPDATE financial_product
SET rate = 4.00
WHERE id = @FinancialProduc48tId;

--ADD FINANCIAL PRODUCT RESIDUAL VALUE
DELETE
FROM financial_product_residual_value
WHERE financial_product_id = @FinancialProduc24tId;

INSERT INTO financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created)
VALUES (@FinancialProduc24tId, 10000, 57.6, CURRENT_TIMESTAMP);
INSERT INTO financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created)
VALUES (@FinancialProduc24tId, 15000, 56.1, CURRENT_TIMESTAMP);
INSERT INTO financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created)
VALUES (@FinancialProduc24tId, 20000, 55.1, CURRENT_TIMESTAMP);
INSERT INTO financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created)
VALUES (@FinancialProduc24tId, 25000, 54.1, CURRENT_TIMESTAMP);
INSERT INTO financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created)
VALUES (@FinancialProduc24tId, 30000, 53.1, CURRENT_TIMESTAMP);
INSERT INTO financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created)
VALUES (@FinancialProduc24tId, 35000, 52.4, CURRENT_TIMESTAMP);
INSERT INTO financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created)
VALUES (@FinancialProduc24tId, 40000, 51.7, CURRENT_TIMESTAMP);
INSERT INTO financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created)
VALUES (@FinancialProduc24tId, 45000, 51.0, CURRENT_TIMESTAMP);
INSERT INTO financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created)
VALUES (@FinancialProduc24tId, 50000, 50.0, CURRENT_TIMESTAMP);

DELETE
FROM financial_product_residual_value
WHERE financial_product_id = @FinancialProduc36tId;

INSERT INTO financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created)
VALUES (@FinancialProduc36tId, 10000, 52.1, CURRENT_TIMESTAMP);
INSERT INTO financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created)
VALUES (@FinancialProduc36tId, 15000, 50.6, CURRENT_TIMESTAMP);
INSERT INTO financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created)
VALUES (@FinancialProduc36tId, 20000, 49.1, CURRENT_TIMESTAMP);
INSERT INTO financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created)
VALUES (@FinancialProduc36tId, 25000, 48.0, CURRENT_TIMESTAMP);
INSERT INTO financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created)
VALUES (@FinancialProduc36tId, 30000, 47.0, CURRENT_TIMESTAMP);
INSERT INTO financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created)
VALUES (@FinancialProduc36tId, 35000, 46.0, CURRENT_TIMESTAMP);
INSERT INTO financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created)
VALUES (@FinancialProduc36tId, 40000, 45.0, CURRENT_TIMESTAMP);

DELETE
FROM financial_product_residual_value
WHERE financial_product_id = @FinancialProduc48tId;

INSERT INTO financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created)
VALUES (@FinancialProduc48tId, 10000, 46.6, CURRENT_TIMESTAMP);
INSERT INTO financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created)
VALUES (@FinancialProduc48tId, 15000, 44.6, CURRENT_TIMESTAMP);
INSERT INTO financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created)
VALUES (@FinancialProduc48tId, 20000, 43.2, CURRENT_TIMESTAMP);
INSERT INTO financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created)
VALUES (@FinancialProduc48tId, 25000, 41.9, CURRENT_TIMESTAMP);
INSERT INTO financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created)
VALUES (@FinancialProduc48tId, 30000, 40.5, CURRENT_TIMESTAMP);

--ADD FINANCIAL PRODUCT YEARLY LIMIT
DELETE
FROM financial_product_yearly_limit
WHERE financial_product_id = @FinancialProduc24tId;

INSERT INTO financial_product_yearly_limit (financial_product_id, mileage_limit, created)
VALUES (@FinancialProduc24tId, 10000, CURRENT_TIMESTAMP);
INSERT INTO financial_product_yearly_limit (financial_product_id, mileage_limit, created)
VALUES (@FinancialProduc24tId, 15000, CURRENT_TIMESTAMP);
INSERT INTO financial_product_yearly_limit (financial_product_id, mileage_limit, created)
VALUES (@FinancialProduc24tId, 20000, CURRENT_TIMESTAMP);
INSERT INTO financial_product_yearly_limit (financial_product_id, mileage_limit, created)
VALUES (@FinancialProduc24tId, 25000, CURRENT_TIMESTAMP);
INSERT INTO financial_product_yearly_limit (financial_product_id, mileage_limit, created)
VALUES (@FinancialProduc24tId, 30000, CURRENT_TIMESTAMP);
INSERT INTO financial_product_yearly_limit (financial_product_id, mileage_limit, created)
VALUES (@FinancialProduc24tId, 35000, CURRENT_TIMESTAMP);
INSERT INTO financial_product_yearly_limit (financial_product_id, mileage_limit, created)
VALUES (@FinancialProduc24tId, 40000, CURRENT_TIMESTAMP);
INSERT INTO financial_product_yearly_limit (financial_product_id, mileage_limit, created)
VALUES (@FinancialProduc24tId, 45000, CURRENT_TIMESTAMP);
INSERT INTO financial_product_yearly_limit (financial_product_id, mileage_limit, created)
VALUES (@FinancialProduc24tId, 50000, CURRENT_TIMESTAMP);

DELETE
FROM financial_product_yearly_limit
WHERE financial_product_id = @FinancialProduc36tId;

INSERT INTO financial_product_yearly_limit (financial_product_id, mileage_limit, created)
VALUES (@FinancialProduc36tId, 10000, CURRENT_TIMESTAMP);
INSERT INTO financial_product_yearly_limit (financial_product_id, mileage_limit, created)
VALUES (@FinancialProduc36tId, 15000, CURRENT_TIMESTAMP);
INSERT INTO financial_product_yearly_limit (financial_product_id, mileage_limit, created)
VALUES (@FinancialProduc36tId, 20000, CURRENT_TIMESTAMP);
INSERT INTO financial_product_yearly_limit (financial_product_id, mileage_limit, created)
VALUES (@FinancialProduc36tId, 25000, CURRENT_TIMESTAMP);
INSERT INTO financial_product_yearly_limit (financial_product_id, mileage_limit, created)
VALUES (@FinancialProduc36tId, 30000, CURRENT_TIMESTAMP);
INSERT INTO financial_product_yearly_limit (financial_product_id, mileage_limit, created)
VALUES (@FinancialProduc36tId, 35000, CURRENT_TIMESTAMP);
INSERT INTO financial_product_yearly_limit (financial_product_id, mileage_limit, created)
VALUES (@FinancialProduc36tId, 40000, CURRENT_TIMESTAMP);

DELETE
FROM financial_product_yearly_limit
WHERE financial_product_id = @FinancialProduc48tId;

INSERT INTO financial_product_yearly_limit (financial_product_id, mileage_limit, created)
VALUES (@FinancialProduc48tId, 10000, CURRENT_TIMESTAMP);
INSERT INTO financial_product_yearly_limit (financial_product_id, mileage_limit, created)
VALUES (@FinancialProduc48tId, 15000, CURRENT_TIMESTAMP);
INSERT INTO financial_product_yearly_limit (financial_product_id, mileage_limit, created)
VALUES (@FinancialProduc48tId, 20000, CURRENT_TIMESTAMP);
INSERT INTO financial_product_yearly_limit (financial_product_id, mileage_limit, created)
VALUES (@FinancialProduc48tId, 25000, CURRENT_TIMESTAMP);
INSERT INTO financial_product_yearly_limit (financial_product_id, mileage_limit, created)
VALUES (@FinancialProduc48tId, 30000, CURRENT_TIMESTAMP);

--ADD FINANCIAL PRODUCT MODEL
DELETE
FROM financial_product_model
WHERE financial_product_group_id = @FinancialProductGroupId
  AND model_year = 2022;

INSERT INTO financial_product_model (financial_product_group_id, model_code, model_year, created)
VALUES (@FinancialProductGroupId, '8YAR', 2022, CURRENT_TIMESTAMP);
INSERT INTO financial_product_model (financial_product_group_id, model_code, model_year, created)
VALUES (@FinancialProductGroupId, '8YSR', 2022, CURRENT_TIMESTAMP);
INSERT INTO financial_product_model (financial_product_group_id, model_code, model_year, created)
VALUES (@FinancialProductGroupId, '8YACQX', 2022, CURRENT_TIMESTAMP);
INSERT INTO financial_product_model (financial_product_group_id, model_code, model_year, created)
VALUES (@FinancialProductGroupId, '8WDR', 2022, CURRENT_TIMESTAMP);
INSERT INTO financial_product_model (financial_product_group_id, model_code, model_year, created)
VALUES (@FinancialProductGroupId, 'F5FR', 2022, CURRENT_TIMESTAMP);
INSERT INTO financial_product_model (financial_product_group_id, model_code, model_year, created)
VALUES (@FinancialProductGroupId, 'F5PR', 2022, CURRENT_TIMESTAMP);
INSERT INTO financial_product_model (financial_product_group_id, model_code, model_year, created)
VALUES (@FinancialProductGroupId, '4A2AM', 2022, CURRENT_TIMESTAMP);
INSERT INTO financial_product_model (financial_product_group_id, model_code, model_year, created)
VALUES (@FinancialProductGroupId, '4A2BM', 2022, CURRENT_TIMESTAMP);
INSERT INTO financial_product_model (financial_product_group_id, model_code, model_year, created)
VALUES (@FinancialProductGroupId, '4A2BN', 2022, CURRENT_TIMESTAMP);
INSERT INTO financial_product_model (financial_product_group_id, model_code, model_year, created)
VALUES (@FinancialProductGroupId, '4A5AM', 2022, CURRENT_TIMESTAMP);
INSERT INTO financial_product_model (financial_product_group_id, model_code, model_year, created)
VALUES (@FinancialProductGroupId, '4A5BM', 2022, CURRENT_TIMESTAMP);
INSERT INTO financial_product_model (financial_product_group_id, model_code, model_year, created)
VALUES (@FinancialProductGroupId, '4A5BN', 2022, CURRENT_TIMESTAMP);
INSERT INTO financial_product_model (financial_product_group_id, model_code, model_year, created)
VALUES (@FinancialProductGroupId, '4A5R', 2022, CURRENT_TIMESTAMP);
INSERT INTO financial_product_model (financial_product_group_id, model_code, model_year, created)
VALUES (@FinancialProductGroupId, '4KA0M', 2022, CURRENT_TIMESTAMP);
INSERT INTO financial_product_model (financial_product_group_id, model_code, model_year, created)
VALUES (@FinancialProductGroupId, '4KA0N', 2022, CURRENT_TIMESTAMP);
INSERT INTO financial_product_model (financial_product_group_id, model_code, model_year, created)
VALUES (@FinancialProductGroupId, '4KAR', 2022, CURRENT_TIMESTAMP);
INSERT INTO financial_product_model (financial_product_group_id, model_code, model_year, created)
VALUES (@FinancialProductGroupId, 'F3BCP', 2022, CURRENT_TIMESTAMP);
INSERT INTO financial_product_model (financial_product_group_id, model_code, model_year, created)
VALUES (@FinancialProductGroupId, 'F3NCP', 2022, CURRENT_TIMESTAMP);
INSERT INTO financial_product_model (financial_product_group_id, model_code, model_year, created)
VALUES (@FinancialProductGroupId, 'F3BR', 2022, CURRENT_TIMESTAMP);
INSERT INTO financial_product_model (financial_product_group_id, model_code, model_year, created)
VALUES (@FinancialProductGroupId, 'F3NR', 2022, CURRENT_TIMESTAMP);
INSERT INTO financial_product_model (financial_product_group_id, model_code, model_year, created)
VALUES (@FinancialProductGroupId, 'FYGA9', 2022, CURRENT_TIMESTAMP);
INSERT INTO financial_product_model (financial_product_group_id, model_code, model_year, created)
VALUES (@FinancialProductGroupId, 'FYGB9', 2022, CURRENT_TIMESTAMP);
INSERT INTO financial_product_model (financial_product_group_id, model_code, model_year, created)
VALUES (@FinancialProductGroupId, 'FYGC9', 2022, CURRENT_TIMESTAMP);
INSERT INTO financial_product_model (financial_product_group_id, model_code, model_year, created)
VALUES (@FinancialProductGroupId, 'FYGC1', 2022, CURRENT_TIMESTAMP);
INSERT INTO financial_product_model (financial_product_group_id, model_code, model_year, created)
VALUES (@FinancialProductGroupId, 'FYTB9', 2022, CURRENT_TIMESTAMP);
INSERT INTO financial_product_model (financial_product_group_id, model_code, model_year, created)
VALUES (@FinancialProductGroupId, 'FYTC9', 2022, CURRENT_TIMESTAMP);
INSERT INTO financial_product_model (financial_product_group_id, model_code, model_year, created)
VALUES (@FinancialProductGroupId, 'FYTC1', 2022, CURRENT_TIMESTAMP);
INSERT INTO financial_product_model (financial_product_group_id, model_code, model_year, created)
VALUES (@FinancialProductGroupId, '4MGAY', 2022, CURRENT_TIMESTAMP);
INSERT INTO financial_product_model (financial_product_group_id, model_code, model_year, created)
VALUES (@FinancialProductGroupId, '4MGCY', 2022, CURRENT_TIMESTAMP);
INSERT INTO financial_product_model (financial_product_group_id, model_code, model_year, created)
VALUES (@FinancialProductGroupId, '4MGCZ', 2022, CURRENT_TIMESTAMP);
INSERT INTO financial_product_model (financial_product_group_id, model_code, model_year, created)
VALUES (@FinancialProductGroupId, '4MN0Y', 2022, CURRENT_TIMESTAMP);
INSERT INTO financial_product_model (financial_product_group_id, model_code, model_year, created)
VALUES (@FinancialProductGroupId, '4MN0Z', 2022, CURRENT_TIMESTAMP);
INSERT INTO financial_product_model (financial_product_group_id, model_code, model_year, created)
VALUES (@FinancialProductGroupId, '4MNR', 2022, CURRENT_TIMESTAMP);

ROLLBACK TRAN Transaction1;

COMMIT TRAN Transaction1; 
