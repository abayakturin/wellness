-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;


-- ************************************** treatment

CREATE TABLE stg_dw_treatment
(
 treatment_id         int NOT NULL,
 "date"                 date NOT NULL,
 type                 varchar(50) NOT NULL,
 result_status        varchar(50) NOT NULL,
 description          varchar(50) NOT NULL,
 laboratory_treatment varchar(50) NULL,
 lab_test_type        varchar(50) NULL,
 lab_test_date        date NULL,
 lab_test_result      varchar(50) NULL,
 drug                 varchar(50) NULL,
 drug_dose            varchar(50) NULL,
 surgery              varchar(50) NULL,
 surgery_description  varchar(50) NULL,
 surgery_date         date NULL,
 surgery_result       varchar(50) NULL,
 CONSTRAINT PK_362 PRIMARY KEY ( treatment_id )
);








-- ************************************** insurance_invoice

CREATE TABLE stg_dw_insurance_invoice
(
 invoice_id           int NOT NULL,
 insrurance_company   varchar(50) NOT NULL,
 insurance_number     int NOT NULL,
 invoice_date         date NULL,
 invoice_amount       float NULL,
 invoice_payment_type varchar(50) NULL,
 insurance_id         int NOT NULL,
 CONSTRAINT PK_379 PRIMARY KEY ( invoice_id )
);








-- ************************************** hospital

CREATE TABLE stg_dw_hospital
(
 name                varchar(50) NOT NULL,
 address             varchar(50) NOT NULL,
 specialty           varchar(50) NOT NULL,
 emergency_phone     varchar(50) NOT NULL,
 registration_phone  varchar(50) NOT NULL,
 admin_phone         varchar(50) NOT NULL,
 department_name     varchar(50) NOT NULL,
 department_location varchar(50) NOT NULL,
 hospital_id         int NOT NULL,
 department_id       int NOT NULL,
 CONSTRAINT PK_309 PRIMARY KEY ( hospital_id, department_id )
);








-- ************************************** patient

CREATE TABLE stg_dw_patient
(
 name                        varchar(50) NOT NULL,
 treatment_id                int NOT NULL,
 invoice_id                  int NOT NULL,
 address                     varchar(50) NOT NULL,
 phone                       varchar(50) NOT NULL,
 birth_date                  date NOT NULL,
 race                        varchar(50) NOT NULL,
 martial_status              varchar(50) NOT NULL,
 gender                      varchar(50) NOT NULL,
 blood_group                 varchar(50) NOT NULL,
 bed_number                  int NULL,
 "floor"                       int NULL,
 discharge_date              date NULL,
 follow_up_date              date NULL,
 type                        varchar(50) NULL,
 treatment_registration_date date NOT NULL,
 emergency_name              varchar(50) NOT NULL,
 emergency_address           varchar(50) NOT NULL,
 emergency_phone             varchar(50) NOT NULL,
 emergency_relationship      varchar(50) NOT NULL,
 emergency_id                int NOT NULL,
 hospital_id                 int NOT NULL,
 department_id               int NOT NULL,
 patient_id                  int NOT NULL,
 CONSTRAINT PK_339 PRIMARY KEY ( patient_id, birth_date),
 CONSTRAINT FK_435 FOREIGN KEY ( treatment_id ) REFERENCES stg_dw_treatment ( treatment_id ),
 CONSTRAINT FK_440 FOREIGN KEY ( invoice_id ) REFERENCES stg_dw_insurance_invoice ( invoice_id ),
 CONSTRAINT FK_446 FOREIGN KEY ( hospital_id, department_id ) REFERENCES stg_dw_hospital ( hospital_id, department_id )
);

CREATE INDEX FK_437 ON stg_dw_patient
(
 treatment_id
);

CREATE INDEX FK_443 ON stg_dw_patient
(
 invoice_id
);

CREATE INDEX FK_449 ON stg_dw_patient
(
 hospital_id,
 department_id
);








-- ************************************** doctor

CREATE TABLE stg_dw_doctor
(
 name                varchar(50) NOT NULL,
 office_phone        varchar(50) NOT NULL,
 personal_phone      varchar(50) NOT NULL,
 specialty           varchar(50) NOT NULL,
 hire_date           date NULL,
 annual_pay          int NULL,
 contract_date       date NULL,
 contract_phone       varchar(50) NULL,
 weekly_pay          decimal NULL,
 min_weekly_hours    int NULL,
 overtime_hourly_pay decimal NULL,
 disease_description varchar(50) NOT NULL,
 disease_type        varchar(50) NOT NULL,
 hospital_id         int NOT NULL,
 department_id       int NOT NULL,
 disease_id          int NOT NULL,
 patient_id          int NOT NULL,
 patient_dob         date NOT NULL,
 doctor_id           int NOT NULL,
 CONSTRAINT PK_321 PRIMARY KEY ( doctor_id ),
 CONSTRAINT FK_421 FOREIGN KEY ( hospital_id, department_id ) REFERENCES stg_dw_hospital ( hospital_id, department_id ),
 CONSTRAINT FK_450 FOREIGN KEY ( patient_id, patient_dob) REFERENCES stg_dw_patient ( patient_id, birth_date )
);

CREATE INDEX FK_424 ON stg_dw_doctor
(
 hospital_id,
 department_id
);

CREATE INDEX FK_452 ON stg_dw_doctor
(
 patient_id
);