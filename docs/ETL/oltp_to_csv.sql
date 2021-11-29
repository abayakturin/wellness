-- FULL
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
),
doctor6 as (
SELECT distinct a.*, b.birth_date as "patient_dob"
FROM doctor5 a join patient b on a.patient_id = b.id
)
SELECT a.name, a.office_phone, a.personal_phone, a.specialty, a.hire_date,
a.annual_pay, a.contract_date, a.contract_phone, a.weekly_pay, a.min_weekly_hours,
a.overtime_hourly_pay, a.disease_description, a.disease_type, a.hospital_id,
a.department_id, a.disease_id, a.patient_id, a.patient_dob, a.id as "doctor_id"
FROM doctor6 a
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

-- patient with dates later that one month ago from now
COPY (
with tbl1 as (
select a.id as "patient_id", a.name, a.address, a.phone, a.birth_date, a.race, a.martial_status, a.gender, 
	a.blood_group, b.bed_number, b.floor, b.discharge_date
	FROM patient a left join in_patient b 
	on a.id = b.id
	WHERE a.tbl_last_date > date_trunc('day', NOW() - interval '1 month')
),
tbl2 as (
select distinct a.*, b.follow_up_date
	from tbl1 a left join out_patient b
	on a.patient_id = b.id
),
tbl3 as (
select distinct a.name, b.treatment_id, c.invoice_id, a.address, a.phone, a.birth_date, a.race, a.martial_status,
	a.gender, a.blood_group, a.bed_number, a.floor, a.discharge_date, a.follow_up_date, a.patient_id
	from tbl2 a left join patient_treatment b on a.patient_id = b.patient_id
	left join patient_invoice c on a.patient_id = c.patient_id
),
tbl4 as (
select distinct a.*, b.registration_id
	from tbl3 a left join patient_registration b on a.patient_id = b.patient_id
),
tbl5 as (
select distinct a.*, b.registration_date as "treatment_registration_date", c.emergency_contact_id 
	from tbl4 a left join registration b on a.registration_id = b.id 
	left join patient_emergency_contact c on a.patient_id = c.patient_id 
),
tbl6 as (
select distinct a.*, b.type, c.name as "emergency_name", c.address as "emergency_address", c.phone as "emergency_phone",
	c.relationship as "emergency_relationship", c.id as "emergency_id"
	from tbl5 a left join treatment b on a.treatment_id = b.id
	left join emergency_contact c on a.emergency_contact_id = c.id
),
tbl7 as (
select distinct a.*, b.department_id
	from tbl6 a left join department_patient b on a.patient_id = b.patient_id
),
tbl8 as (
select distinct a.*, b.hospital_id
	from tbl7 a left join hospital_department b on a.department_id = b.department_id
)
select a.name, a.treatment_id, a.invoice_id, a.address, a.phone, a.birth_date, a.race,
a.martial_status, a.gender, a.blood_group, a.bed_number, a.floor, a.discharge_date,
a.follow_up_Date, a.type, a.treatment_registration_date, a.emergency_name, a.emergency_address,
a.emergency_phone, a.emergency_relationship, a.emergency_id, a.hospital_id, a.department_id,
a.patient_id
from tbl8 a
) TO '/tmp/patient.csv' WITH (FORMAT CSV, HEADER);

-- treatment with dates later that one month ago from now
COPY (
select distinct a.id as "treatment_id", a.date, a.type, a.result_status, a.description,
b.laboratory as "laboratory_treatment", b.test_type as "lab_test_type", b.test_date as "lab_test_date",
b.test_result as "lab_test_result", c.drug, c.dose as "drug_dose",
d.surgery, d.description as "surgery_description", d.date as "surgery_date",
d.result as "surgery_result"
from treatment a left join laboratory_treatment b on a.id = b.id
left join drug_Treatment c on a.id = c.id
left join surgery_treatment d on a.id = d.id
) TO '/tmp/treatment.csv' WITH (FORMAT CSV, HEADER);
-- FULL

-- INCREMENTAL DAILY
COPY (
WITH doctor as (
SELECT distinct a.id, a.name, a.office_phone, a.personal_phone, a.specialty, 
b.hire_date, b.annual_pay, c.contract_date, c.contract_phone, c.weekly_pay, c.min_weekly_hours
,c.overtime_hourly_pay, d.disease_id
FROM doctor a 
LEFT JOIN fulltime_doctor b on a.id = b.id 
LEFT JOIN consulting_doctor c on a.id = c.id 
JOIN doctor_disease d on a.id = d.doctor_id
WHERE a.tbl_last_date > date_trunc('day', NOW() - interval '1 day')
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
),
doctor6 as (
SELECT distinct a.*, b.birth_date as "patient_dob"
FROM doctor5 a join patient b on a.patient_id = b.id
)
SELECT a.name, a.office_phone, a.personal_phone, a.specialty, a.hire_date,
a.annual_pay, a.contract_date, a.contract_phone, a.weekly_pay, a.min_weekly_hours,
a.overtime_hourly_pay, a.disease_description, a.disease_type, a.hospital_id,
a.department_id, a.disease_id, a.patient_id, a.patient_dob, a.id as "doctor_id"
FROM doctor6 a
) TO '/tmp/doctor.csv' WITH (FORMAT CSV, HEADER);

-- hospital dw table with dates later that one month ago from now
COPY (
WITH hospital1 as (
SELECT distinct name, address, specialty, emergency_phone, registration_phone,
	admin_phone, hospital_id, department_id, a.tbl_last_date
FROM hospital a join hospital_department b
ON a.id = b.hospital_id 
WHERE a.tbl_last_date > date_trunc('day', NOW() - interval '1 day')
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
WHERE a.tbl_last_date > date_trunc('day', NOW() - interval '1 day')
)
SELECT distinct a.invoice_id, b.insurance_company, b.insurance_number, a.date as "invoice_date",
a.amount as "invoice_amount", a.payment_type as "invoice_payment_type", b.id as "insurance_id"
FROM invoice1 a join insurance b
on a.insurance_id = b.id 
) TO '/tmp/insurance_invoice.csv' WITH (FORMAT CSV, HEADER);

-- patient with dates later that one month ago from now
COPY (
with tbl1 as (
select a.id as "patient_id", a.name, a.address, a.phone, a.birth_date, a.race, a.martial_status, a.gender, 
	a.blood_group, b.bed_number, b.floor, b.discharge_date
	FROM patient a left join in_patient b 
	on a.id = b.id
	WHERE a.tbl_last_date > date_trunc('day', NOW() - interval '1 day')
),
tbl2 as (
select distinct a.*, b.follow_up_date
	from tbl1 a left join out_patient b
	on a.patient_id = b.id
),
tbl3 as (
select distinct a.name, b.treatment_id, c.invoice_id, a.address, a.phone, a.birth_date, a.race, a.martial_status,
	a.gender, a.blood_group, a.bed_number, a.floor, a.discharge_date, a.follow_up_date, a.patient_id
	from tbl2 a left join patient_treatment b on a.patient_id = b.patient_id
	left join patient_invoice c on a.patient_id = c.patient_id
),
tbl4 as (
select distinct a.*, b.registration_id
	from tbl3 a left join patient_registration b on a.patient_id = b.patient_id
),
tbl5 as (
select distinct a.*, b.registration_date as "treatment_registration_date", c.emergency_contact_id 
	from tbl4 a left join registration b on a.registration_id = b.id 
	left join patient_emergency_contact c on a.patient_id = c.patient_id 
),
tbl6 as (
select distinct a.*, b.type, c.name as "emergency_name", c.address as "emergency_address", c.phone as "emergency_phone",
	c.relationship as "emergency_relationship", c.id as "emergency_id"
	from tbl5 a left join treatment b on a.treatment_id = b.id
	left join emergency_contact c on a.emergency_contact_id = c.id
),
tbl7 as (
select distinct a.*, b.department_id
	from tbl6 a left join department_patient b on a.patient_id = b.patient_id
),
tbl8 as (
select distinct a.*, b.hospital_id
	from tbl7 a left join hospital_department b on a.department_id = b.department_id
)
select a.name, a.treatment_id, a.invoice_id, a.address, a.phone, a.birth_date, a.race,
a.martial_status, a.gender, a.blood_group, a.bed_number, a.floor, a.discharge_date,
a.follow_up_Date, a.type, a.treatment_registration_date, a.emergency_name, a.emergency_address,
a.emergency_phone, a.emergency_relationship, a.emergency_id, a.hospital_id, a.department_id,
a.patient_id
from tbl8 a
) TO '/tmp/patient.csv' WITH (FORMAT CSV, HEADER);

-- treatment with dates later that one month ago from now
COPY (
select distinct a.id as "treatment_id", a.date, a.type, a.result_status, a.description,
b.laboratory as "laboratory_treatment", b.test_type as "lab_test_type", b.test_date as "lab_test_date",
b.test_result as "lab_test_result", c.drug, c.dose as "drug_dose",
d.surgery, d.description as "surgery_description", d.date as "surgery_date",
d.result as "surgery_result"
from treatment a left join laboratory_treatment b on a.id = b.id
left join drug_Treatment c on a.id = c.id
left join surgery_treatment d on a.id = d.id
) TO '/tmp/treatment.csv' WITH (FORMAT CSV, HEADER);

