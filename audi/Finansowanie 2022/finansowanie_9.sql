USE audi_go;  

-- RS e-tron GT --
DECLARE @FinancialProductGroupId int;
DECLARE @FinancialProduc24tId int;
DECLARE @FinancialProduc36tId int;
DECLARE @FinancialProduc48tId int;
  
BEGIN TRAN Transaction1
--ADD FINANCIAL PRODUCT GROUP
insert into financial_product_group([marketing_name], [created]) values ('Audi Perfect Lease dla klientów prywatnych', CURRENT_TIMESTAMP);
SET @FinancialProductGroupId = SCOPE_IDENTITY();

--ADD FINANCIAL PRODUCTS
--own_payment_options -> lista wartości z Initial payment
--bank_commission -> zawsze 0
--rate -> Nominal interest rate
--start_date -> od kiedy ma obowiązywać
insert into financial_product([name], [description], [code], [default_finacial_time], [defualt_own_payment], default_yearly_limit, financial_time_options, own_payment_options, bank_commission, rate, deleted, created, type, required_importer, start_date, financial_product_group_id)
values ('Audi Perfect Lease Poziom 1e dla klientów prywatnych (24m)', '<b>Opcje zakończenia</b><br>2 opcje zakończenia leasingu:<br>1) jednorazowa spłata wartości końcowej<br>2) przekazanie pojazdu do Dealera<br><br>Jest to oferta dla klientów prywatnych, przygotowana przez Volkswagen Leasing GmbH Sp. z o.o. Oddział w Polsce. Prezentowane miesięczne raty to wartość netto rat dla oferty leasingowej Audi Perfect Lease. Warunki produktu określa umowa.', 'NEW_PERFECT_LEASE_LVL_1_E_NETTO_24', 24, 15, 15000, 24, '0,5,10,15,20,25,30', 0, 7.27, 0, current_timestamp,0,0,'2022-01-01', @FinancialProductGroupId );
SET @FinancialProduc24tId = SCOPE_IDENTITY();

insert into financial_product([name], [description], [code], [default_finacial_time], [defualt_own_payment], default_yearly_limit, financial_time_options, own_payment_options, bank_commission, rate, deleted, created, type, required_importer, start_date, financial_product_group_id)
values ('Audi Perfect Lease Poziom 1e dla klientów prywatnych (36m)', '<b>Opcje zakończenia</b><br>2 opcje zakończenia leasingu:<br>1) jednorazowa spłata wartości końcowej<br>2) przekazanie pojazdu do Dealera<br><br>Jest to oferta dla klientów prywatnych, przygotowana przez Volkswagen Leasing GmbH Sp. z o.o. Oddział w Polsce. Prezentowane miesięczne raty to wartość netto rat dla oferty leasingowej Audi Perfect Lease. Warunki produktu określa umowa.', 'NEW_PERFECT_LEASE_LVL_1_E_NETTO_36', 36, 10, 15000, 36, '0,5,10,15,20,25,30', 0, 7.06, 0, current_timestamp,0,0,'2022-01-01', @FinancialProductGroupId );
SET @FinancialProduc36tId = SCOPE_IDENTITY();

insert into financial_product([name], [description], [code], [default_finacial_time], [defualt_own_payment], default_yearly_limit, financial_time_options, own_payment_options, bank_commission, rate, deleted, created, type, required_importer, start_date, financial_product_group_id)
values ('Audi Perfect Lease Poziom 1e dla klientów prywatnych (48m)', '<b>Opcje zakończenia</b><br>2 opcje zakończenia leasingu:<br>1) jednorazowa spłata wartości końcowej<br>2) przekazanie pojazdu do Dealera<br><br>Jest to oferta dla klientów prywatnych, przygotowana przez Volkswagen Leasing GmbH Sp. z o.o. Oddział w Polsce. Prezentowane miesięczne raty to wartość netto rat dla oferty leasingowej Audi Perfect Lease. Warunki produktu określa umowa.', 'NEW_PERFECT_LEASE_LVL_1_E_NETTO_48', 48, 5, 15000, 48, '0,5,10,15,20,25,30', 0, 6.82, 0, current_timestamp,0,0,'2022-01-01', @FinancialProductGroupId );
SET @FinancialProduc48tId = SCOPE_IDENTITY();

--ADD FINANCIAL PRODUCT RESIDUAL VALUE
insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc24tId, 10000, 57.6, CURRENT_TIMESTAMP);
insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc24tId, 15000, 56.1, CURRENT_TIMESTAMP);
insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc24tId, 20000, 55.1, CURRENT_TIMESTAMP);
insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc24tId, 25000, 54.1, CURRENT_TIMESTAMP);
insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc24tId, 30000, 53.1, CURRENT_TIMESTAMP);
insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc24tId, 35000, 52.4, CURRENT_TIMESTAMP);
insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc24tId, 40000, 51.7, CURRENT_TIMESTAMP);
insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc24tId, 45000, 51.0, CURRENT_TIMESTAMP);
insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc24tId, 50000, 50.0, CURRENT_TIMESTAMP);

insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc36tId, 10000, 52.1, CURRENT_TIMESTAMP);
insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc36tId, 15000, 50.6, CURRENT_TIMESTAMP);
insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc36tId, 20000, 49.1, CURRENT_TIMESTAMP);
insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc36tId, 25000, 48.0, CURRENT_TIMESTAMP);
insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc36tId, 30000, 47.0, CURRENT_TIMESTAMP);
insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc36tId, 35000, 46.0, CURRENT_TIMESTAMP);
insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc36tId, 40000, 45.0, CURRENT_TIMESTAMP);

insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc48tId, 10000, 46.6, CURRENT_TIMESTAMP);
insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc48tId, 15000, 44.6, CURRENT_TIMESTAMP);
insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc48tId, 20000, 43.2, CURRENT_TIMESTAMP);
insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc48tId, 25000, 41.9, CURRENT_TIMESTAMP);
insert into financial_product_residual_value (financial_product_id, yearly_limit, residual_value, created) values(@FinancialProduc48tId, 30000, 40.5, CURRENT_TIMESTAMP);

--ADD FINANCIAL PRODUCT YEARLY LIMIT
insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc24tId, 10000, CURRENT_TIMESTAMP);
insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc24tId, 15000, CURRENT_TIMESTAMP);
insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc24tId, 20000, CURRENT_TIMESTAMP);
insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc24tId, 25000, CURRENT_TIMESTAMP);
insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc24tId, 30000, CURRENT_TIMESTAMP);
insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc24tId, 35000, CURRENT_TIMESTAMP);
insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc24tId, 40000, CURRENT_TIMESTAMP);
insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc24tId, 45000, CURRENT_TIMESTAMP);
insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc24tId, 50000, CURRENT_TIMESTAMP);

insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc36tId, 10000, CURRENT_TIMESTAMP);
insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc36tId, 15000, CURRENT_TIMESTAMP);
insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc36tId, 20000, CURRENT_TIMESTAMP);
insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc36tId, 25000, CURRENT_TIMESTAMP);
insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc36tId, 30000, CURRENT_TIMESTAMP);
insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc36tId, 35000, CURRENT_TIMESTAMP);
insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc36tId, 40000, CURRENT_TIMESTAMP);

insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc48tId, 10000, CURRENT_TIMESTAMP);
insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc48tId, 15000, CURRENT_TIMESTAMP);
insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc48tId, 20000, CURRENT_TIMESTAMP);
insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc48tId, 25000, CURRENT_TIMESTAMP);
insert into financial_product_yearly_limit (financial_product_id, mileage_limit, created) values(@FinancialProduc48tId, 30000, CURRENT_TIMESTAMP);

--ADD FINANCIAL PRODUCT MODEL
insert into financial_product_model (financial_product_group_id, model_code, model_year, created) VALUES (@FinancialProductGroupId, 'F83RH', 2022, CURRENT_TIMESTAMP);

--ROLLBACK LUB COMMIT
ROLLBACK TRAN Transaction1;  

COMMIT TRAN Transaction1; 