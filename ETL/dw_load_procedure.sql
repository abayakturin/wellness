-- FULL LOAD

create or replace PROCEDURE  load_dw_insurance_invoice
()
language plpgsql
as $$
DECLARE 
	dcnt integer := 0;
	icnt integer := 0;
	err_code int;
	err_msg text;
	c record;
BEGIN
for c in execute 'select * from stg_dw_insurance_invoice'
loop
    delete from dw_insurance_invoice where invoice_id=c.invoice_id and insurance_id=c.insurance_id;
    dcnt := dcnt+1;
     INSERT INTO dw_insurance_invoice
     VALUES (c.invoice_id, c.insurance_company, c.insurance_number, c.invoice_date, c.invoice_amount, c.invoice_payment_type, c.insurance_id, NOW());
     icnt := icnt+1;
     raise notice
     'Total Deleted Record: % Total Inserted Records: %', dcnt, icnt;
end loop;
     raise notice
     'Total Deleted Record: % Total Inserted Records: %', dcnt, icnt;
EXCEPTION
    WHEN OTHERS THEN
         err_code := SQLSTATE;
         err_msg  := SQLERRM;
		 raise notice
         'Error code %: %', err_code, err_msg;
END;$$

-- INCREMENTAL LOAD 
create or replace PROCEDURE  load_merge_dw_insurance_invoice
()
language plpgsql
as $$
DECLARE 
	err_code int;
	err_msg text;
BEGIN
    INSERT INTO dw_insurance_invoice(
		invoice_id, insurance_company, insurance_number, invoice_date,
		invoice_amount, invoice_payment_type, insurance_id, tbl_last_date)
    SELECT * 
	FROM stg_dw_insurance_invoice
    ON CONFLICT(invoice_id)
	DO UPDATE 
		SET invoice_id=dw_insurance_invoice.invoice_id,
         insurance_company =dw_insurance_invoice.insurance_company,
         insurance_number=dw_insurance_invoice.insurance_number,
         invoice_date=dw_insurance_invoice.invoice_date,
         invoice_amount=dw_insurance_invoice.invoice_amount,
         invoice_payment_type=dw_insurance_invoice.invoice_payment_type,
         insurance_id=dw_insurance_invoice.insurance_id,
		 tbl_last_date = NOW();
EXCEPTION
    WHEN OTHERS THEN
         err_code := SQLSTATE;
         err_msg  := SQLERRM;
		 RAISE NOTICE
         'Error code %: %', err_code, err_msg;
END;$$