-- FULL
-- copy from external tables to stage dw tables
COPY stg_dw_hospital FROM '/tmp/hospital.csv' DELIMITER ',' CSV HEADER QUOTE '"' NULL '';
COPY stg_dw_insurance_invoice FROM '/tmp/insurance_invoice.csv' DELIMITER ',' CSV HEADER QUOTE '"' NULL '';
COPY stg_dw_treatment FROM '/tmp/treatment.csv' DELIMITER ',' CSV HEADER QUOTE '"' NULL '';
COPY stg_dw_doctor FROM '/tmp/doctor.csv' DELIMITER ',' CSV HEADER QUOTE '"' NULL '';
COPY stg_dw_patient FROM '/tmp/patient.csv' DELIMITER ',' CSV HEADER QUOTE '"' NULL '';

-- INCREMENTAL
-- copy from external tables to stage dw incremental tables
COPY stg_dw_doctor FROM '/tmp/doctor_inc.csv' DELIMITER ',' CSV HEADER QUOTE '"' NULL '';