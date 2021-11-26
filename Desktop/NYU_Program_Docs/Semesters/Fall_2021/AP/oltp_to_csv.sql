-- doctor dw table with dates later that one month ago from now
COPY (
WITH doctor as (
SELECT distinct a.id, a.name, a.office_phone, a.personal_phone, a.specialty, 
b.hire_date, b.annual_pay, c.contract_date, c.contract_phone, c.weekly_pay, c.min_weekly_hours
,c.overtime_hourly_pay, d.disease_id
FROM doctor a 
LEFT JOIN fulltime_doctor b on a.id = b.id 
LEFT JOIN consulting_doctor c on a.id = c.id 
JOIN doctor_disease d on a.id = d.doctor_id
WHERE a.tbl_last_date > date_trunc('day', NOW() - interval '1 month')
),
doctor2 as (
SELECT a.id, a.name, a.office_phone, a.personal_phone, a.specialty, a.hire_date, a.annual_pay, a.contract_date, a.contract_phone, a.weekly_pay, a.min_weekly_hours, a.overtime_hourly_pay, e.description as "disease_description", e.type as "disease_type", e.icd as "disease_id"
FROM doctor a join disease e on a.disease_id = e.icd
),
doctor3 as (
SELECT a.*, b.department_id
FROM doctor2 a join department_doctor b on a.id = b.doctor_id
),
doctor4 as (
SELECT distinct a.*, b.hospital_id
FROM doctor3 a join hospital_department b on a.department_id = b.department_id
),
doctor5 as (
SELECT distinct a.*, b.patient_id
FROM doctor4 a join doctor_patient b on a.id = b.doctor_id
)
SELECT a.name, a.office_phone, a.personal_phone, a.specialty, a.hire_date,
a.annual_pay, a.contract_date, a.contract_phone, a.weekly_pay, a.min_weekly_hours,
a.overtime_hourly_pay, a.disease_description, a.disease_type, a.hospital_id,
a.department_id, a.disease_id, a.patient_id, a.id as "doctor_id"
FROM doctor5 a
) TO '/tmp/doctor.csv' WITH (FORMAT CSV, HEADER);

-- hospital dw table with dates later that one month ago from now
COPY (
WITH hospital1 as (
SELECT distinct name, address, specialty, emergency_phone, registration_phone,
	admin_phone, hospital_id, department_id, a.tbl_last_date
FROM hospital a join hospital_department b
ON a.id = b.hospital_id 
WHERE a.tbl_last_date > date_trunc('day', NOW() - interval '1 month')
)
SELECT distinct a.name, a.address, a.specialty, a.emergency_phone, a.registration_phone,
a.admin_phone, b.name as "department_name", b.location as "department_location",
a.hospital_id, b.id as "department_id"
FROM hospital1 a join department b
ON a.department_id = b.id 
) TO '/tmp/hospital.csv' WITH (FORMAT CSV, HEADER);

-- insurance_invoice table with dates later that one month ago from now
COPY (
WITH invoice1 as (
SELECT distinct *
FROM invoice a join insurance_invoice b
on a.id = b.invoice_id
WHERE a.tbl_last_date > date_trunc('day', NOW() - interval '1 month')
)
SELECT distinct a.invoice_id, b.insurance_company, b.insurance_number, a.date as "invoice_date",
a.amount as "invoice_amount", a.payment_type as "invoice_payment_type", b.id as "insurance_id"
FROM invoice1 a join insurance b
on a.insurance_id = b.id 
) TO '/tmp/insurance_invoice.csv' WITH (FORMAT CSV, HEADER);





