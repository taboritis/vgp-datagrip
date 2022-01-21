USE audi_go;  

-- "Wszytskie modele (w tym modele S/RS) Nie dotyczy modelu R8 107%"--

DECLARE @FinancialProductGroupId int;
DECLARE @FinancialProduc24tId int;
DECLARE @FinancialProduc36tId int;
DECLARE @FinancialProduc48tId int;
  
BEGIN TRAN Transaction1
		--ADD FINANCIAL PRODUCT GROUP
		insert into financial_product_group([marketing_name], [created]) values ('Audi Classic Leasing 107%', CURRENT_TIMESTAMP);
		SET @FinancialProductGroupId = SCOPE_IDENTITY();

	   --ADD FINANCIAL PRODUCTS
	   --own_payment_options -> lista wartości z Initial payment
	   --bank_commission -> zawsze 0
	   --rate -> Nominal interest rate
	   --start_date -> od kiedy ma obowiązywać
	   insert into financial_product([name], [description], [code], [default_finacial_time], [defualt_own_payment], financial_time_options, own_payment_options, bank_commission, rate, deleted, created, type, required_importer, start_date, financial_product_group_id)
	   values ('Audi Classic Leasing 107%', 'Jest to oferta dla przedsiębiorców, przygotowana przez Volkswagen Leasing GmbH Sp. z o.o. Oddział w Polsce. Prezentowane miesięczne raty to wartość netto rat dla oferty leasingowej Audi Leasing.Warunki produktu określa umowa.', 'CLASSIC_LEASING_107', 36, 25, 36, '25', 0, 5.98, 0, current_timestamp,1,0,'2022-01-01', @FinancialProductGroupId );
	   SET @FinancialProduc36tId = SCOPE_IDENTITY();

		--ADD FINANCIAL PRODUCT RESIDUAL VALUE
		delete from financial_product_residual_value where financial_product_id = @FinancialProduc36tId;

		insert into financial_product_residual_value (financial_product_id, residual_value, created) values(@FinancialProduc36tId, 57.9, CURRENT_TIMESTAMP);
		insert into financial_product_residual_value (financial_product_id, residual_value, created) values(@FinancialProduc36tId, 57.9, CURRENT_TIMESTAMP);
		insert into financial_product_residual_value (financial_product_id, residual_value, created) values(@FinancialProduc36tId, 57.9, CURRENT_TIMESTAMP);
		insert into financial_product_residual_value (financial_product_id, residual_value, created) values(@FinancialProduc36tId, 57.9, CURRENT_TIMESTAMP);
		insert into financial_product_residual_value (financial_product_id, residual_value, created) values(@FinancialProduc36tId, 57.9, CURRENT_TIMESTAMP);
		insert into financial_product_residual_value (financial_product_id, residual_value, created) values(@FinancialProduc36tId, 57.9, CURRENT_TIMESTAMP);
		insert into financial_product_residual_value (financial_product_id, residual_value, created) values(@FinancialProduc36tId, 57.9, CURRENT_TIMESTAMP);

		--ADD FINANCIAL PRODUCT YEARLY LIMIT
		delete from financial_product_yearly_limit where financial_product_id = @FinancialProduc36tId;

		insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc36tId, 10000, CURRENT_TIMESTAMP);
		insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc36tId, 15000, CURRENT_TIMESTAMP);
		insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc36tId, 20000, CURRENT_TIMESTAMP);
		insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc36tId, 25000, CURRENT_TIMESTAMP);
		insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc36tId, 30000, CURRENT_TIMESTAMP);
		insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc36tId, 35000, CURRENT_TIMESTAMP);
		insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc36tId, 40000, CURRENT_TIMESTAMP);
		insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc36tId, 45000, CURRENT_TIMESTAMP);

		--ADD FINANCIAL PRODUCT MODEL
		delete from financial_product_model where financial_product_group_id = @FinancialProductGroupId and model_year = 2022;

insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'GBAB', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'GBAC', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8YAB', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8YAC', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8YSB', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8YSC', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8YSA', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8YAA', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8YAS', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8YSS', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8WDB', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8WCC', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8WCB', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8WDA', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8WCA', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8WJ0', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8WDC', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8WCS', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8WDS', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F5FC', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F5FA', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F5PB', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F5PC', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F5PA', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F5FB', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F5PS', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F5FS', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4A5B', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4A5A', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4A2A', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4A2B', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4AH0', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4A2S', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4A5S', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4KA0', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4KAS', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'GAGA', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'GAGB', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'GAGC', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F3NC', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F3BA', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F3BC', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F3BB', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F3NA', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'FYTS', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'FYGB', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'FYTC', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'FYGA', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'FYTB', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'FYGC', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'FYGS', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4MGA', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4MGS', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4MGC', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4MNS', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4MNR', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4MN0', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'GENA', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'GENB', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'GRNC', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'GENS', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'GEAA', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'GEAB', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'GRAC', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'GEAS', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F3NR', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8YAR', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8YSR', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '8WDR', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F5PR', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F5FR', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F3BR', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4A5R', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4KAR', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'GENC', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'GEAC', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4N2S', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'GBAA', 2022, CURRENT_TIMESTAMP);
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, '4N20', 2022, CURRENT_TIMESTAMP);


ROLLBACK TRAN Transaction1;  

COMMIT TRAN Transaction1; 