USE audi_go;  

-- "A1, A3, A4 PI, A5 PI, A6, A7, A8, A8 PI, Q2 PI, Q3, Q3 SB, Q5 PI, Q5 PI SB, Q7 PI, Q8 W tym modele S Bez modeli PHEV"		
 --
DECLARE @FinancialProductGroupId int;
DECLARE @FinancialProduc24tId int;
DECLARE @FinancialProduc36tId int;
DECLARE @FinancialProduc48tId int;
  
BEGIN TRAN Transaction1
		--FINANCIAL PRODUCT GROUP
	   SET @FinancialProductGroupId = (select financial_product_group_id from financial_product where name = 'Audi Perfect Lease Poziom 3 dla przedsiębiorców (36m)' and deleted = 0);

	   --ADD FINANCIAL PRODUCTS
	   --own_payment_options -> lista wartości z Initial payment
	   --bank_commission -> zawsze 0
	   --rate -> Nominal interest rate
	   --start_date -> od kiedy ma obowiązywać
	   SET @FinancialProduc24tId = (select id from financial_product where name = 'Audi Perfect Lease Poziom 3 dla przedsiębiorców (24m)' and deleted = 0);
	   UPDATE financial_product set rate = 2.92 where id = @FinancialProduc24tId;

	   SET @FinancialProduc36tId = (select id from financial_product where name = 'Audi Perfect Lease Poziom 3 dla przedsiębiorców (36m)' and deleted = 0);
	   UPDATE financial_product set rate = 2.94 where id = @FinancialProduc36tId;

	   SET @FinancialProduc48tId = (select id from financial_product where name = 'Audi Perfect Lease Poziom 3 dla przedsiębiorców (48m)' and deleted = 0);
	   UPDATE financial_product set rate = 3.10 where id = @FinancialProduc48tId;

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

insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'GBA', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8YAA', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8YAB', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8YACK', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8YACZ', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8YACD', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8YACR', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8YACG', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8YSA', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8YSB', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8YSC', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8YAS', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8YSS', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8WC', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8WDA', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8WDB', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8WDC', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8WJ', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8WDS', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F5PA', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F5PB', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F5PC', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F5FA', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F5FB', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F5FC', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4A2AD', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4A2AI', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4A2A3', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4A2AL', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4A2A2', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4A2BD', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4A2BI', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4A2B3', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4A2BL', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4A2B2', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4A5AD', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4A5AI', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4A5A3', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4A5AL', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4A5A2', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4A5BD', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4A5BI', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4A5B3', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4A5BL', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4A5B2', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4AH', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4A2S', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4A5S', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4KA0I', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4KA03', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4KA0L', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4KA02', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4KAS', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4NC04', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4NC0D', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4NC0E', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4NL04', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4NL0D', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4NL0E', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4NCS', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'GAG', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F3BA', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F3BB', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F3BCZ', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F3BCR', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F3BCH', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F3BCL', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F3BCK', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F3NA', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F3NCZ', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F3NCR', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F3NCH', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F3NCL', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F3NCK', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'FYGAJ', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'FYGAU', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'FYGAA', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'FYGBJ', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'FYGBU', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'FYGBA', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'FYGCJ', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'FYGCU', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'FYGCA', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'FYTBJ', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'FYTBU', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'FYTBA', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'FYTCJ', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'FYTCU', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'FYTCA', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'FYGS', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'FYTS', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4MGAN', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4MGAX', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4MGCB', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4MGCN', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4MGCX', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4MGS', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4MN0B', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4MN0N', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4MN0X', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4MNS', 2022, CURRENT_TIMESTAMP);


ROLLBACK TRAN Transaction1;  

COMMIT TRAN Transaction1; 