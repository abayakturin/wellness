-- SQLINES DEMO *** qlDBM: PostgreSQL ****************;
-- SQLINES DEMO *** **********************************;


-- SQLINES DEMO *** ********************* treatment

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE treatment
(
 treatment_id         number(10) NOT NULL,
 "date"                 date NOT NULL,
 type                 varchar2(50) NOT NULL,
 result_status        varchar2(50) NOT NULL,
 description          varchar2(50) NOT NULL,
 laboratory_treatment varchar2(50) NULL,
 lab_test_type        varchar2(50) NULL,
 lab_test_date        date NULL,
 lab_test_result      varchar2(50) NULL,
 drug                 varchar2(50) NULL,
 drug_dose            varchar2(50) NULL,
 surgery              varchar2(50) NULL,
 surgery_description  varchar2(50) NULL,
 surgery_date         date NULL,
 surgery_result       varchar2(50) NULL,
 CONSTRAINT PK_62 PRIMARY KEY ( treatment_id )
);








-- SQLINES DEMO *** ********************* insurance_invoice

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE insurance_invoice
(
 invoice_id           number(10) NOT NULL,
 insrurance_company   varchar2(50) NOT NULL,
 insurance_number     number(10) NOT NULL,
 invoice_date         date NULL,
 invoice_amount       binary_double NULL,
 invoice_payment_type varchar2(50) NULL,
 insurance_id         number(10) NOT NULL,
 CONSTRAINT PK_79 PRIMARY KEY ( invoice_id )
);








-- SQLINES DEMO *** ********************* hospital

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE hospital
(
 name                varchar2(50) NOT NULL,
 address             varchar2(50) NOT NULL,
 specialty           varchar2(50) NOT NULL,
 emergency_phone     varchar2(50) NOT NULL,
 registration_phone  varchar2(50) NOT NULL,
 admin_phone         varchar2(50) NOT NULL,
 department_name     varchar2(50) NOT NULL,
 department_location varchar2(50) NOT NULL,
 hospital_id         number(10) NOT NULL,
 department_id       number(10) NOT NULL,
 CONSTRAINT PK_9 PRIMARY KEY ( hospital_id, department_id )
);








-- SQLINES DEMO *** ********************* patient

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE patient
(
 name                        varchar2(50) NOT NULL,
 treatment_id                number(10) NOT NULL,
 invoice_id                  number(10) NOT NULL,
 address                     varchar2(50) NOT NULL,
 phone                       varchar2(50) NOT NULL,
 birth_date                  date NOT NULL,
 race                        varchar2(50) NOT NULL,
 martial_status              varchar2(50) NOT NULL,
 gender                      varchar2(50) NOT NULL,
 blood_group                 varchar2(50) NOT NULL,
 bed_number                  number(10) NULL,
 "floor"                       number(10) NULL,
 discharge_date              date NULL,
 follow_up_date              date NULL,
 type                        varchar2(50) NULL,
 treatment_registration_date date NOT NULL,
 emergency_name              varchar2(50) NOT NULL,
 emergency_address           varchar2(50) NOT NULL,
 emergency_phone             varchar2(50) NOT NULL,
 emergency_relationship      varchar2(50) NOT NULL,
 emergency_id                number(10) NOT NULL,
 hospital_id                 number(10) NOT NULL,
 department_id               number(10) NOT NULL,
 patient_id                  number(10) NOT NULL,
 CONSTRAINT PK_39 PRIMARY KEY ( patient_id, birth_date),
 CONSTRAINT FK_135 FOREIGN KEY ( treatment_id ) REFERENCES treatment ( treatment_id ),
 CONSTRAINT FK_140 FOREIGN KEY ( invoice_id ) REFERENCES insurance_invoice ( invoice_id ),
 CONSTRAINT FK_146 FOREIGN KEY ( hospital_id, department_id ) REFERENCES hospital ( hospital_id, department_id )
)PARTITION BY RANGE (birth_date);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE INDEX FK_137 ON patient
(
 treatment_id
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE INDEX FK_143 ON patient
(
 invoice_id
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE INDEX FK_149 ON patient
(
 hospital_id,
 department_id
);








-- SQLINES DEMO *** ********************* doctor

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE doctor
(
 name                varchar2(50) NOT NULL,
 office_phone        varchar2(50) NOT NULL,
 personal_phone      varchar2(50) NOT NULL,
 specialty           varchar2(50) NOT NULL,
 hire_date           date NULL,
 annual_pay          number(10) NULL,
 contract_date       date NULL,
 contract_phone       varchar2(50) NULL,
 weekly_pay          number NULL,
 min_weekly_hours    number(10) NULL,
 overtime_hourly_pay number NULL,
 disease_description varchar2(50) NOT NULL,
 disease_type        varchar2(50) NOT NULL,
 hospital_id         number(10) NOT NULL,
 department_id       number(10) NOT NULL,
 disease_id          number(10) NOT NULL,
 doctor_id           number(10) NOT NULL,
 CONSTRAINT PK_21 PRIMARY KEY ( doctor_id ),
 CONSTRAINT FK_121 FOREIGN KEY ( hospital_id, department_id ) REFERENCES hospital ( hospital_id, department_id ),
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE INDEX FK_124 ON doctor
(
 hospital_id,
 department_id
);