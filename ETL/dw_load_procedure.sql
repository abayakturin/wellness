-- FULL LOAD

create or replace PROCEDURE  load_dw_insurance_invoice
(dcnt int,
icnt int,
err_code int,
err_msg text)
language plpgsql
as $$
DECLARE 
	dcnt integer := 0;
	icnt integer := 0;
	c record;
BEGIN
for c in execute 'select * from stg_dw_insurance_invoice'
loop
    delete from dw_insurance_invoice where invoice_id=c.invoice_id and insurance_id=c.insurance_id;
    dcnt := dcnt+1;
     INSERT INTO dw_insurance_invoice  (invoice_id, insurance_company, insurance_number, invoice_date, invoice_amount, invoice_payment_type, insurance_id)
     VALUES (c.invoice_id, c.insurance_company, c.insurance_number, c.invoice_date, c.invoice_amount, c.invoice_payment_type, c.insurance_id);
     icnt := icnt+1;
     raise notice
     'Total Deleted Record: % Total Inserted Records: %', dcnt, icnt;
end loop;
     raise notice
     'Total Deleted Record: % Total Inserted Records: %', dcnt, icnt;
EXCEPTION
    WHEN OTHERS THEN
         err_code := SQLCODE;
         err_msg  := SQLERRM;
		 raise notice
         'Error code %: %', err_code, err_msg;
END;$$

-- INCREMENTAL LOAD 
