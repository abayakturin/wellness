-- SQLINES DEMO *** qlDBM: PostgreSQL ****************;
-- SQLINES DEMO *** **********************************;


-- SQLINES DEMO *** ********************* treatment

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE treatment
(
 "id"            number(10) NOT NULL,
 "date"          date NOT NULL,
 type          varchar2(4000) NOT NULL,
 result_status varchar2(4000) NOT NULL,
 description   varchar2(4000) NOT NULL,
 TBL_LAST_DATE timestamp DEFAULT systimestamp NOT NULL,
 CONSTRAINT PK_374 PRIMARY KEY ( "id" )
);



-- SQLINES DEMO *** ********************* treatment - history
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE treatment_history
(
 "id"            number(10) NOT NULL,
 "timestamp" timestamp DEFAULT clock_timestamp() NOT NULL ,
 "date"          date NOT NULL,
 type          varchar2(4000) NOT NULL,
 result_status varchar2(4000) NOT NULL,
 description   varchar2(4000) NOT NULL
);


-- SQLINES DEMO *** ********************* registration

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE registration
(
 "id"                number(10) NOT NULL,
 registration_date date NOT NULL,
 TBL_LAST_DATE     timestamp DEFAULT systimestamp NOT NULL,
 CONSTRAINT PK_347 PRIMARY KEY ( "id" )
);






-- SQLINES DEMO *** ********************* patient with history table

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE patient
(
 "id"             number(10) NOT NULL,
 name           varchar2(4000) NOT NULL,
 address        varchar2(4000) NOT NULL,
 phone          varchar2(4000) NOT NULL,
 birth_date     date NOT NULL,
 race           varchar2(4000) NOT NULL,
 martial_status varchar2(4000) NOT NULL,
 gender         varchar2(4000) NOT NULL,
 blood_group    varchar2(4000) NOT NULL,
 TBL_LAST_DATE  timestamp DEFAULT systimestamp NOT NULL,
 CONSTRAINT PK_322 PRIMARY KEY ( "id" )
);








-- SQLINES DEMO *** ********************* invoice

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE invoice
(
 "id"            number(10) NOT NULL,
 "date"          date NOT NULL,
 amount        binary_double NOT NULL,
 payment_type  varchar2(4000) NOT NULL,
 TBL_LAST_DATE timestamp DEFAULT systimestamp NOT NULL,
 CONSTRAINT PK_350 PRIMARY KEY ( "id" )
);








-- SQLINES DEMO *** ********************* insurance

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE insurance
(
 "id"                number(10) NOT NULL,
 insurance_company varchar2(50) NOT NULL,
 insurance_number  number(10) NOT NULL,
 TBL_LAST_DATE     timestamp NOT NULL,
 CONSTRAINT PK_430 PRIMARY KEY ( "id" )
);








-- SQLINES DEMO *** ********************* hospital

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE hospital
(
 "id"                 number(10) NOT NULL,
 name               varchar2(4000) NOT NULL,
 address            varchar2(4000) NOT NULL,
 specialty          varchar2(4000) NOT NULL,
 emergency_phone    varchar2(4000) NOT NULL,
 general_phone      varchar2(4000) NOT NULL,
 registration_phone varchar2(4000) NOT NULL,
 admin_phone        varchar2(4000) NOT NULL,
 TBL_LAST_DATE      timestamp DEFAULT systimestamp NOT NULL,
 CONSTRAINT PK_hospital PRIMARY KEY ( "id" )
);








-- SQLINES DEMO *** ********************* emergency_contact

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE emergency_contact
(
 "id"            number(10) NOT NULL,
 name          varchar2(4000) NOT NULL,
 address       varchar2(4000) NOT NULL,
 phone         varchar2(4000) NOT NULL,
 relationship  varchar2(4000) NOT NULL,
 TBL_LAST_DATE timestamp DEFAULT systimestamp NOT NULL,
 CONSTRAINT PK_365 PRIMARY KEY ( "id" )
);








-- SQLINES DEMO *** ********************* doctor

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE doctor
(
 "id"             number(10) NOT NULL,
 name           varchar2(4000) NOT NULL,
 office_phone   varchar2(4000) NOT NULL,
 personal_phone varchar2(4000) NOT NULL,
 specialty      varchar2(4000) NOT NULL,
 TBL_LAST_DATE  timestamp DEFAULT systimestamp NOT NULL,
 CONSTRAINT PK_291 PRIMARY KEY ( "id" )
);








-- SQLINES DEMO *** ********************* disease

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE disease
(
 icd           number(10) NOT NULL,
 description   varchar2(4000) NOT NULL,
 type          varchar2(4000) NOT NULL,
 TBL_LAST_DATE timestamp DEFAULT systimestamp NOT NULL,
 CONSTRAINT PK_248 PRIMARY KEY ( icd )
);








-- SQLINES DEMO *** ********************* department

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE department
(
 "id"            number(10) NOT NULL,
 name          varchar2(4000) NOT NULL,
 phone         varchar2(4000) NOT NULL,
 location      varchar2(4000) NOT NULL,
 TBL_LAST_DATE timestamp DEFAULT systimestamp NOT NULL,
 CONSTRAINT PK_286 PRIMARY KEY ( "id" )
);





-- SQLINES DEMO *** ********************* registration_treatment

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE registration_treatment
(
 registration_id number(10) NOT NULL,
 treatment_id    number(10) NOT NULL,
 TBL_LAST_DATE   timestamp NOT NULL,
 CONSTRAINT FK_415 FOREIGN KEY ( registration_id ) REFERENCES registration ( "id" ),
 CONSTRAINT FK_418 FOREIGN KEY ( treatment_id ) REFERENCES treatment ( "id" )
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE INDEX fkIdx_417 ON registration_treatment
(
 registration_id
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE INDEX fkIdx_420 ON registration_treatment
(
 treatment_id
);








-- SQLINES DEMO *** ********************* patient_treatment

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE patient_treatment
(
 patient_id    number(10) NOT NULL,
 treatment_id  number(10) NOT NULL,
 TBL_LAST_DATE timestamp NOT NULL,
 CONSTRAINT FK_370 FOREIGN KEY ( patient_id ) REFERENCES patient ( "id" ),
 CONSTRAINT FK_387 FOREIGN KEY ( treatment_id ) REFERENCES treatment ( "id" )
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE INDEX fkIdx_372 ON patient_treatment
(
 patient_id
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE INDEX fkIdx_389 ON patient_treatment
(
 treatment_id
);








-- SQLINES DEMO *** ********************* patient_registration

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE patient_registration
(
 patient_id      number(10) NOT NULL,
 registration_id number(10) NOT NULL,
 TBL_LAST_DATE   timestamp NOT NULL,
 CONSTRAINT FK_407 FOREIGN KEY ( patient_id ) REFERENCES patient ( "id" ),
 CONSTRAINT FK_410 FOREIGN KEY ( registration_id ) REFERENCES registration ( "id" )
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE INDEX fkIdx_409 ON patient_registration
(
 patient_id
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE INDEX fkIdx_412 ON patient_registration
(
 registration_id
);








-- SQLINES DEMO *** ********************* patient_invoice

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE patient_invoice
(
 patient_id    number(10) NOT NULL,
 invoice_id    number(10) NOT NULL,
 TBL_LAST_DATE timestamp NOT NULL,
 CONSTRAINT FK_397 FOREIGN KEY ( patient_id ) REFERENCES patient ( "id" ),
 CONSTRAINT FK_400 FOREIGN KEY ( invoice_id ) REFERENCES invoice ( "id" )
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE INDEX fkIdx_399 ON patient_invoice
(
 patient_id
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE INDEX fkIdx_402 ON patient_invoice
(
 invoice_id
);








-- SQLINES DEMO *** ********************* patient_insurance

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE patient_insurance
(
 patient_id    number(10) NOT NULL,
 insurance_id  number(10) NOT NULL,
 TBL_LAST_DATE timestamp NOT NULL,
 CONSTRAINT FK_439 FOREIGN KEY ( patient_id ) REFERENCES patient ( "id" ),
 CONSTRAINT FK_442 FOREIGN KEY ( insurance_id ) REFERENCES insurance ( "id" )
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE INDEX fkIdx_441 ON patient_insurance
(
 patient_id
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE INDEX fkIdx_444 ON patient_insurance
(
 insurance_id
);








-- SQLINES DEMO *** ********************* patient_emergency_contact

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE patient_emergency_contact
(
 patient_id           number(10) NOT NULL,
 emergency_contact_id number(10) NOT NULL,
 TBL_LAST_DATE        timestamp NOT NULL,
 CONSTRAINT FK_360 FOREIGN KEY ( patient_id ) REFERENCES patient ( "id" ),
 CONSTRAINT FK_366 FOREIGN KEY ( emergency_contact_id ) REFERENCES emergency_contact ( "id" )
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE INDEX fkIdx_362 ON patient_emergency_contact
(
 patient_id
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE INDEX fkIdx_368 ON patient_emergency_contact
(
 emergency_contact_id
);


-- SQLINES DEMO *** ********************* in_patient

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE in_patient
(
 "id"             number(10) NOT NULL,
 bed_number     number(10) NOT NULL,
 "floor"          number(10) NOT NULL,
 discharge_date date NOT NULL,
 TBL_LAST_DATE  timestamp DEFAULT systimestamp NOT NULL,
 CONSTRAINT PK_467 PRIMARY KEY ( "id" ),
 CONSTRAINT FK_in_patient_171 FOREIGN KEY ( "id" ) REFERENCES patient ( "id" )
);


-- SQLINES DEMO *** ********************* in_patient - history
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE in_patient_history (
 "id"             number(10) NOT NULL,
 "timestamp" timestamp DEFAULT clock_timestamp() NOT NULL ,
 bed_number     number(10) NOT NULL,
 "floor"          number(10) NOT NULL,
 discharge_date date NOT NULL
);


-- SQLINES DEMO *** ********************* out_patient

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE out_patient
(
 "id"             number(10) NOT NULL,
 follow_up_date date NOT NULL,
 TBL_LAST_DATE  timestamp DEFAULT systimestamp NOT NULL,
 CONSTRAINT PK_468 PRIMARY KEY ( "id" ),
 CONSTRAINT FK_out_patient_173 FOREIGN KEY ( "id" ) REFERENCES patient ( "id" )
);

-- SQLINES DEMO *** ********************* out_patient - history
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE out_patient_history
(
 "id"             number(10) NOT NULL,
  "timestamp" timestamp DEFAULT clock_timestamp() NOT NULL ,
 follow_up_date date NOT NULL
);


-- SQLINES DEMO *** ********************* insurance_invoice

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE insurance_invoice
(
 insurance_id  number(10) NOT NULL,
 invoice_id    number(10) NOT NULL,
 TBL_LAST_DATE timestamp NOT NULL,
 CONSTRAINT FK_447 FOREIGN KEY ( insurance_id ) REFERENCES insurance ( "id" ),
 CONSTRAINT FK_450 FOREIGN KEY ( invoice_id ) REFERENCES invoice ( "id" )
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE INDEX fkIdx_449 ON insurance_invoice
(
 insurance_id
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE INDEX fkIdx_452 ON insurance_invoice
(
 invoice_id
);










-- SQLINES DEMO *** ********************* hospital_department

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE hospital_department
(
 hospital_id   number(10) NOT NULL,
 department_id number(10) NOT NULL,
 TBL_LAST_DATE timestamp NOT NULL,
 CONSTRAINT FK_293 FOREIGN KEY ( hospital_id ) REFERENCES hospital ( "id" ),
 CONSTRAINT FK_299 FOREIGN KEY ( department_id ) REFERENCES department ( "id" )
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE INDEX fkIdx_295 ON hospital_department
(
 hospital_id
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE INDEX fkIdx_301 ON hospital_department
(
 department_id
);








-- SQLINES DEMO *** ********************* fulltime_doctor

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE fulltime_doctor
(
 name          varchar2(4000) NOT NULL,
 hire_date     date NOT NULL,
 annual_pay    number(10) NOT NULL,
 TBL_LAST_DATE timestamp DEFAULT systimestamp NOT NULL,
 "id"            number(10) NOT NULL,
 CONSTRAINT PK_465 PRIMARY KEY ( "id" ),
 CONSTRAINT FK_fulltime_doctor_165 FOREIGN KEY ( "id" ) REFERENCES doctor ( "id" )
);


-- SQLINES DEMO *** ********************* fulltime_doctor - history
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE fulltime_doctor_history
(
 name          varchar2(4000) NOT NULL,
 "timestamp" timestamp DEFAULT clock_timestamp() NOT NULL ,
 hire_date     date NOT NULL,
 annual_pay    number(10) NOT NULL,
 "id"          number(10) primary key
);





-- SQLINES DEMO *** ********************* doctor_patient

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE doctor_patient
(
 doctor_id     number(10) NOT NULL,
 patient_id    number(10) NOT NULL,
 TBL_LAST_DATE timestamp NOT NULL,
 CONSTRAINT FK_332 FOREIGN KEY ( doctor_id ) REFERENCES doctor ( "id" ),
 CONSTRAINT FK_335 FOREIGN KEY ( patient_id ) REFERENCES patient ( "id" )
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE INDEX fkIdx_334 ON doctor_patient
(
 doctor_id
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE INDEX fkIdx_337 ON doctor_patient
(
 patient_id
);








-- SQLINES DEMO *** ********************* doctor_disease

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE doctor_disease
(
 doctor_id     number(10) NOT NULL,
 disease_id    number(10) NOT NULL,
 TBL_LAST_DATE timestamp NOT NULL,
 CONSTRAINT FK_243 FOREIGN KEY ( doctor_id ) REFERENCES doctor ( "id" ),
 CONSTRAINT FK_246 FOREIGN KEY ( disease_id ) REFERENCES disease ( icd )
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE INDEX fkIdx_245 ON doctor_disease
(
 doctor_id
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE INDEX fkIdx_249 ON doctor_disease
(
 disease_id
);








-- SQLINES DEMO *** ********************* department_patient

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE department_patient
(
 department_id number(10) NOT NULL,
 patient_id    number(10) NOT NULL,
 TBL_LAST_DATE timestamp NOT NULL,
 CONSTRAINT FK_315 FOREIGN KEY ( department_id ) REFERENCES department ( "id" ),
 CONSTRAINT FK_319 FOREIGN KEY ( patient_id ) REFERENCES patient ( "id" )
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE INDEX fkIdx_317 ON department_patient
(
 department_id
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE INDEX fkIdx_321 ON department_patient
(
 patient_id
);








-- SQLINES DEMO *** ********************* department_doctor

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE department_doctor
(
 doctor_id     number(10) NOT NULL,
 department_id number(10) NOT NULL,
 TBL_LAST_DATE timestamp NOT NULL,
 CONSTRAINT FK_339 FOREIGN KEY ( doctor_id ) REFERENCES doctor ( "id" ),
 CONSTRAINT FK_342 FOREIGN KEY ( department_id ) REFERENCES department ( "id" )
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE INDEX fkIdx_341 ON department_doctor
(
 doctor_id
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE INDEX fkIdx_344 ON department_doctor
(
 department_id
);








-- SQLINES DEMO *** ********************* consulting_doctor

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE consulting_doctor
(
 name                varchar2(4000) NOT NULL,
 contract_date       date NOT NULL,
 contract_phone      varchar2(4000) NOT NULL,
 weekly_pay          number(10) NOT NULL,
 min_weekly_hours    number(10) NOT NULL,
 overtime_hourly_pay number(10) NOT NULL,
 TBL_LAST_DATE       timestamp DEFAULT systimestamp NOT NULL,
 "id"                  number(10) NOT NULL,
 CONSTRAINT PK_466 PRIMARY KEY ( "id" ),
 CONSTRAINT FK_consulting_doctor_167 FOREIGN KEY ( "id" ) REFERENCES doctor ( "id" )
);




-- SQLINES DEMO *** ********************* consulting_doctor - history
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE consulting_doctor_history
(
 name                varchar2(4000) NOT NULL,
 "timestamp" timestamp DEFAULT clock_timestamp() NOT NULL ,
 contract_date       date NOT NULL,
 contract_phone      varchar2(4000) NOT NULL,
 weekly_pay          number(10) NOT NULL,
 min_weekly_hours    number(10) NOT NULL,
 overtime_hourly_pay number(10) NOT NULL,
 "id"                  number(10) primary key
);



-- SQLINES DEMO *** ********************* surgery_treatment

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE surgery_treatment
(
 "id"            number(10) NOT NULL,
 surgery       varchar2(4000) NOT NULL,
 description   varchar2(4000) NOT NULL,
 "date"          date NOT NULL,
 "result"        varchar2(4000) NOT NULL,
 TBL_LAST_DATE timestamp DEFAULT systimestamp NOT NULL,
 CONSTRAINT PK_471 PRIMARY KEY ( "id" ),
 CONSTRAINT FK_surgery_treatment_187 FOREIGN KEY ( "id" ) REFERENCES treatment ( "id" )
);








-- SQLINES DEMO *** ********************* laboratory_treatment

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE laboratory_treatment
(
 laboratory    varchar2(4000) NOT NULL,
 test_type     varchar2(4000) NOT NULL,
 test_date     date NOT NULL,
 test_result   varchar2(4000) NOT NULL,
 TBL_LAST_DATE timestamp DEFAULT systimestamp NOT NULL,
 "id"            number(10) NOT NULL,
 CONSTRAINT PK_469 PRIMARY KEY ( "id" ),
 CONSTRAINT FK_laboratory_treatment_183 FOREIGN KEY ( "id" ) REFERENCES treatment ( "id" ),
 PARTITION BY RANGE(test_date)
);








-- SQLINES DEMO *** ********************* drug_treatment

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE drug_treatment
(
 "id"            number(10) NOT NULL,
 drug          varchar2(4000) NOT NULL,
 dose          varchar2(4000) NOT NULL,
 TBL_LAST_DATE timestamp DEFAULT systimestamp NOT NULL,
 CONSTRAINT PK_470 PRIMARY KEY ( "id" ),
 CONSTRAINT FK_drug_treatment_185 FOREIGN KEY ( "id" ) REFERENCES treatment ( "id" )
);

-- SQLINES DEMO *** ********************* triggers (30)
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE OR REPLACE FUNCTION update_TBL_LAST_DATE_column() 
RETURN TRIGGER AS $$
BEGIN
    BEGIN
NEW.TBL_LAST_DATE := systimestamp;
END;
    RETURN NEW; 
END;
$$ language 'plpgsql';

CREATE OR REPLACE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON hospital FOR EACH ROW EXECUTE IMMEDIATE  PROCEDURE
END; update_TBL_LAST_DATE_column();
CREATE OR REPLACE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON department FOR EACH ROW EXECUTE IMMEDIATE  PROCEDURE
END; update_TBL_LAST_DATE_column();
CREATE OR REPLACE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON doctor FOR EACH ROW EXECUTE IMMEDIATE  PROCEDURE
END; update_TBL_LAST_DATE_column();
CREATE OR REPLACE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON fulltime_doctor FOR EACH ROW EXECUTE IMMEDIATE  PROCEDURE
END; update_TBL_LAST_DATE_column();
CREATE OR REPLACE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON consulting_doctor FOR EACH ROW EXECUTE IMMEDIATE  PROCEDURE
END; update_TBL_LAST_DATE_column();
CREATE OR REPLACE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON patient FOR EACH ROW EXECUTE IMMEDIATE  PROCEDURE
END; update_TBL_LAST_DATE_column();
CREATE OR REPLACE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON emergency_contact FOR EACH ROW EXECUTE IMMEDIATE  PROCEDURE
END; update_TBL_LAST_DATE_column();
CREATE OR REPLACE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON in_patient FOR EACH ROW EXECUTE IMMEDIATE  PROCEDURE
END; update_TBL_LAST_DATE_column();
CREATE OR REPLACE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON out_patient FOR EACH ROW EXECUTE IMMEDIATE  PROCEDURE
END; update_TBL_LAST_DATE_column();
CREATE OR REPLACE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON registration FOR EACH ROW EXECUTE IMMEDIATE  PROCEDURE
END; update_TBL_LAST_DATE_column();
CREATE OR REPLACE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON disease FOR EACH ROW EXECUTE IMMEDIATE  PROCEDURE
END; update_TBL_LAST_DATE_column();
CREATE OR REPLACE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON treatment FOR EACH ROW EXECUTE IMMEDIATE  PROCEDURE
END; update_TBL_LAST_DATE_column();
CREATE OR REPLACE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON laboratory_treatment FOR EACH ROW EXECUTE IMMEDIATE  PROCEDURE
END; update_TBL_LAST_DATE_column();
CREATE OR REPLACE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON drug_treatment FOR EACH ROW EXECUTE IMMEDIATE  PROCEDURE
END; update_TBL_LAST_DATE_column();
CREATE OR REPLACE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON surgery_treatment FOR EACH ROW EXECUTE IMMEDIATE  PROCEDURE
END; update_TBL_LAST_DATE_column();
CREATE OR REPLACE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON invoice FOR EACH ROW EXECUTE IMMEDIATE  PROCEDURE
END; update_TBL_LAST_DATE_column();
CREATE OR REPLACE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON department_doctor FOR EACH ROW EXECUTE IMMEDIATE  PROCEDURE
END; update_TBL_LAST_DATE_column();
CREATE OR REPLACE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON department_patient FOR EACH ROW EXECUTE IMMEDIATE  PROCEDURE
END; update_TBL_LAST_DATE_column();
CREATE OR REPLACE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON doctor_disease FOR EACH ROW EXECUTE IMMEDIATE  PROCEDURE
END; update_TBL_LAST_DATE_column();
CREATE OR REPLACE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON doctor_patient FOR EACH ROW EXECUTE IMMEDIATE  PROCEDURE
END; update_TBL_LAST_DATE_column();
CREATE OR REPLACE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON hospital_department FOR EACH ROW EXECUTE IMMEDIATE  PROCEDURE
END; update_TBL_LAST_DATE_column();
CREATE OR REPLACE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON insurance FOR EACH ROW EXECUTE IMMEDIATE  PROCEDURE
END; update_TBL_LAST_DATE_column();
CREATE OR REPLACE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON insurance_invoice FOR EACH ROW EXECUTE IMMEDIATE  PROCEDURE
END; update_TBL_LAST_DATE_column();
CREATE OR REPLACE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON patient_emergency_contact FOR EACH ROW EXECUTE IMMEDIATE  PROCEDURE
END; update_TBL_LAST_DATE_column();
CREATE OR REPLACE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON patient_insurance FOR EACH ROW EXECUTE IMMEDIATE  PROCEDURE
END; update_TBL_LAST_DATE_column();
CREATE OR REPLACE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON patient_invoice FOR EACH ROW EXECUTE IMMEDIATE  PROCEDURE
END; update_TBL_LAST_DATE_column();
CREATE OR REPLACE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON patient_registration FOR EACH ROW EXECUTE IMMEDIATE  PROCEDURE
END; update_TBL_LAST_DATE_column();
CREATE OR REPLACE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON patient_treatment FOR EACH ROW EXECUTE IMMEDIATE  PROCEDURE
END; update_TBL_LAST_DATE_column();
CREATE OR REPLACE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON registration_treatment FOR EACH ROW EXECUTE IMMEDIATE  PROCEDURE
END; update_TBL_LAST_DATE_column();


