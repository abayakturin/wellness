-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;


-- ************************************** treatment

CREATE TABLE treatment
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
 CONSTRAINT PK_62 PRIMARY KEY ( treatment_id )
);








-- ************************************** insurance_invoice

CREATE TABLE insurance_invoice
(
 invoice_id           int NOT NULL,
 insrurance_company   varchar(50) NOT NULL,
 insurance_number     int NOT NULL,
 invoice_date         date NULL,
 invoice_amount       float NULL,
 invoice_payment_type varchar(50) NULL,
 insurance_id         int NOT NULL,
 CONSTRAINT PK_79 PRIMARY KEY ( invoice_id )
);








-- ************************************** hospital

CREATE TABLE hospital
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
 CONSTRAINT PK_9 PRIMARY KEY ( hospital_id, department_id )
);








-- ************************************** patient

CREATE TABLE patient
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
 emergency_id                int NOT NULL DEFAULT unique,
 hospital_id                 int NOT NULL,
 department_id               int NOT NULL,
 patient_id                  int NOT NULL,
 CONSTRAINT PK_39 PRIMARY KEY ( patient_id ),
 CONSTRAINT FK_135 FOREIGN KEY ( treatment_id ) REFERENCES treatment ( treatment_id ),
 CONSTRAINT FK_140 FOREIGN KEY ( invoice_id ) REFERENCES insurance_invoice ( invoice_id ),
 CONSTRAINT FK_146 FOREIGN KEY ( hospital_id, department_id ) REFERENCES hospital ( hospital_id, department_id )
);

CREATE INDEX FK_137 ON patient
(
 treatment_id
);

CREATE INDEX FK_143 ON patient
(
 invoice_id
);

CREATE INDEX FK_149 ON patient
(
 hospital_id,
 department_id
);








-- ************************************** doctor

CREATE TABLE doctor
(
 name                varchar(50) NOT NULL,
 office_phone        varchar(50) NOT NULL,
 personal_phone      varchar(50) NOT NULL,
 specialty           varchar(50) NOT NULL,
 employment_type     varchar(50) NULL,
 hire_date           date NULL,
 annual_pay          int NULL,
 contract_date       date NULL,
 conract_phone       varchar(50) NULL,
 weekly_pay          decimal NULL,
 min_weekly_hours    int NULL,
 overtime_hourly_pay decimal NULL,
 disease_description varchar(50) NOT NULL,
 disease_type        varchar(50) NOT NULL,
 hospital_id         int NOT NULL,
 department_id       int NOT NULL,
 disease_id          int NOT NULL,
 patient_id          int NOT NULL,
 doctor_id           int NOT NULL,
 CONSTRAINT PK_21 PRIMARY KEY ( doctor_id ),
 CONSTRAINT FK_121 FOREIGN KEY ( hospital_id, department_id ) REFERENCES hospital ( hospital_id, department_id ),
 CONSTRAINT FK_150 FOREIGN KEY ( patient_id ) REFERENCES patient ( patient_id )
);

CREATE INDEX FK_124 ON doctor
(
 hospital_id,
 department_id
);

CREATE INDEX FK_152 ON doctor
(
 patient_id
);







