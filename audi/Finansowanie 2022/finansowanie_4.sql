USE audi_go;  

-- Q4 e-tron, Q4 SB e-tron, e-tron GT --
DECLARE @FinancialProductGroupId int;
DECLARE @FinancialProduc24tId int;
DECLARE @FinancialProduc36tId int;
DECLARE @FinancialProduc48tId int;
  
BEGIN TRAN Transaction1
		--FINANCIAL PRODUCT GROUP
	   SET @FinancialProductGroupId = (select financial_product_group_id from financial_product where name = 'Audi Perfect Lease Poziom 2e dla przedsiębiorców (36m)' and deleted = 0);

	   --ADD FINANCIAL PRODUCTS
	   --own_payment_options -> lista wartości z Initial payment
	   --bank_commission -> zawsze 0
	   --rate -> Nominal interest rate
	   --start_date -> od kiedy ma obowiązywać
	   SET @FinancialProduc24tId = (select id from financial_product where name = 'Audi Perfect Lease Poziom 2e dla przedsiębiorców (24m)' and deleted = 0);
	   UPDATE financial_product set rate = 2.21 where id = @FinancialProduc24tId;

	   SET @FinancialProduc36tId = (select id from financial_product where name = 'Audi Perfect Lease Poziom 2e dla przedsiębiorców (36m)' and deleted = 0);
	   UPDATE financial_product set rate = 3.64 where id = @FinancialProduc36tId;

	   SET @FinancialProduc48tId = (select id from financial_product where name = 'Audi Perfect Lease Poziom 2e dla przedsiębiorców (48m)' and deleted = 0);
	   UPDATE financial_product set rate = 4.22 where id = @FinancialProduc48tId;

		--ADD FINANCIAL PRODUCT RESIDUAL VALUE
		delete from financial_product_residual_value where financial_product_id = @FinancialProduc24tId;

		insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc24tId, 10000, 57.6, CURRENT_TIMESTAMP);
		insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc24tId, 15000, 56.1, CURRENT_TIMESTAMP);
		insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc24tId, 20000, 55.1, CURRENT_TIMESTAMP);
		insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc24tId, 25000, 54.1, CURRENT_TIMESTAMP);
		insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc24tId, 30000, 53.1, CURRENT_TIMESTAMP);
		insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc24tId, 35000, 52.4, CURRENT_TIMESTAMP);
		insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc24tId, 40000, 51.7, CURRENT_TIMESTAMP);
		insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc24tId, 45000, 51.0, CURRENT_TIMESTAMP);
		insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc24tId, 50000, 50.0, CURRENT_TIMESTAMP);

		delete from financial_product_residual_value where financial_product_id = @FinancialProduc36tId;

		insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc36tId, 10000, 52.1, CURRENT_TIMESTAMP);
		insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc36tId, 15000, 50.6, CURRENT_TIMESTAMP);
		insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc36tId, 20000, 49.1, CURRENT_TIMESTAMP);
		insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc36tId, 25000, 48.0, CURRENT_TIMESTAMP);
		insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc36tId, 30000, 47.0, CURRENT_TIMESTAMP);
		insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc36tId, 35000, 46.0, CURRENT_TIMESTAMP);
		insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc36tId, 40000, 45.0, CURRENT_TIMESTAMP);

		delete from financial_product_residual_value where financial_product_id = @FinancialProduc48tId;

		insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc48tId, 10000, 46.6, CURRENT_TIMESTAMP);
		insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc48tId, 15000, 44.6, CURRENT_TIMESTAMP);
		insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc48tId, 20000, 43.2, CURRENT_TIMESTAMP);
		insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc48tId, 25000, 41.9, CURRENT_TIMESTAMP);
		insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc48tId, 30000, 40.5, CURRENT_TIMESTAMP);

		--ADD FINANCIAL PRODUCT YEARLY LIMIT
		delete from financial_product_yearly_limit where financial_product_id = @FinancialProduc24tId;

		insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc24tId, 10000, CURRENT_TIMESTAMP);
		insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc24tId, 15000, CURRENT_TIMESTAMP);
		insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc24tId, 20000, CURRENT_TIMESTAMP);
		insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc24tId, 25000, CURRENT_TIMESTAMP);
		insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc24tId, 30000, CURRENT_TIMESTAMP);
		insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc24tId, 35000, CURRENT_TIMESTAMP);
		insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc24tId, 40000, CURRENT_TIMESTAMP);
		insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc24tId, 45000, CURRENT_TIMESTAMP);
		insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc24tId, 50000, CURRENT_TIMESTAMP);

		delete from financial_product_yearly_limit where financial_product_id = @FinancialProduc36tId;

		insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc36tId, 10000, CURRENT_TIMESTAMP);
		insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc36tId, 15000, CURRENT_TIMESTAMP);
		insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc36tId, 20000, CURRENT_TIMESTAMP);
		insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc36tId, 25000, CURRENT_TIMESTAMP);
		insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc36tId, 30000, CURRENT_TIMESTAMP);
		insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc36tId, 35000, CURRENT_TIMESTAMP);
		insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc36tId, 40000, CURRENT_TIMESTAMP);

		delete from financial_product_yearly_limit where financial_product_id = @FinancialProduc48tId;

		insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc48tId, 10000, CURRENT_TIMESTAMP);
		insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc48tId, 15000, CURRENT_TIMESTAMP);
		insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc48tId, 20000, CURRENT_TIMESTAMP);
		insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc48tId, 25000, CURRENT_TIMESTAMP);
		insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc48tId, 30000, CURRENT_TIMESTAMP);

		--ADD FINANCIAL PRODUCT MODEL
		delete from financial_product_model where financial_product_group_id = @FinancialProductGroupId and model_year = 2022;

		insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F83RJ', 2022, CURRENT_TIMESTAMP);
		insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F4B', 2022, CURRENT_TIMESTAMP);
		insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F4N', 2022, CURRENT_TIMESTAMP);

ROLLBACK TRAN Transaction1;  

COMMIT TRAN Transaction1; 