-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;


-- ************************************** treatment

CREATE TABLE treatment
(
 "id"            int NOT NULL,
 "date"          date NOT NULL,
 type          varchar NOT NULL,
 result_status varchar NOT NULL,
 description   varchar NOT NULL,
 TBL_LAST_DATE timestamp NOT NULL DEFAULT current_timestamp,
 CONSTRAINT PK_374 PRIMARY KEY ( "id" )
);



-- ************************************** treatment - history
CREATE TABLE treatment_history
(
 "id"            int NOT NULL,
 "timestamp" timestamp NOT NULL DEFAULT clock_timestamp(),
 "date"          date NOT NULL,
 type          varchar NOT NULL,
 result_status varchar NOT NULL,
 description   varchar NOT NULL
);

CREATE OR REPLACE FUNCTION treatment_history_trigger()
  RETURNS trigger AS
$BODY$
  DECLARE
    table_name text;
  BEGIN
    table_name := 'treatment_history_' || to_char(CURRENT_DATE, 'yyyy_mm');
    IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = table_name)
    THEN
      EXECUTE 'CREATE TABLE IF NOT EXISTS ' || table_name ||
              ' () INHERITS (treatment_history);';
    END IF;
    EXECUTE 'INSERT INTO ' || table_name ||
            '(id, date, type, result_status, description) VALUES ($1.id, $1.date, $1.type, $1.result_status, $1.description);' USING NEW;
    RETURN NEW;
  END
$BODY$
  LANGUAGE plpgsql;

CREATE TRIGGER treatment_history_trigger
AFTER INSERT OR UPDATE ON treatment FOR EACH ROW
EXECUTE PROCEDURE treatment_history_trigger();




-- ************************************** registration

CREATE TABLE registration
(
 "id"                int NOT NULL,
 registration_date date NOT NULL,
 TBL_LAST_DATE     timestamp NOT NULL DEFAULT current_timestamp,
 CONSTRAINT PK_347 PRIMARY KEY ( "id" )
);






-- ************************************** patient with history table

CREATE TABLE patient
(
 "id"             int NOT NULL,
 name           varchar NOT NULL,
 address        varchar NOT NULL,
 phone          varchar NOT NULL,
 birth_date     date NOT NULL,
 race           varchar NOT NULL,
 martial_status varchar NOT NULL,
 gender         varchar NOT NULL,
 blood_group    varchar NOT NULL,
 TBL_LAST_DATE  timestamp NOT NULL DEFAULT current_timestamp,
 CONSTRAINT PK_322 PRIMARY KEY ( "id" )
);








-- ************************************** invoice

CREATE TABLE invoice
(
 "id"            int NOT NULL,
 "date"          date NOT NULL,
 amount        float NOT NULL,
 payment_type  varchar NOT NULL,
 TBL_LAST_DATE timestamp NOT NULL DEFAULT current_timestamp,
 CONSTRAINT PK_350 PRIMARY KEY ( "id" )
);








-- ************************************** insurance

CREATE TABLE insurance
(
 "id"                int NOT NULL,
 insurance_company varchar(50) NOT NULL,
 insurance_number  int NOT NULL,
 TBL_LAST_DATE     timestamp NOT NULL,
 CONSTRAINT PK_430 PRIMARY KEY ( "id" )
);








-- ************************************** hospital

CREATE TABLE hospital
(
 "id"                 int NOT NULL,
 name               varchar NOT NULL,
 address            varchar NOT NULL,
 specialty          varchar NOT NULL,
 emergency_phone    varchar NOT NULL,
 general_phone      varchar NOT NULL,
 registration_phone varchar NOT NULL,
 admin_phone        varchar NOT NULL,
 TBL_LAST_DATE      timestamp NOT NULL DEFAULT current_timestamp,
 CONSTRAINT PK_hospital PRIMARY KEY ( "id" )
);








-- ************************************** emergency_contact

CREATE TABLE emergency_contact
(
 "id"            int NOT NULL,
 name          varchar NOT NULL,
 address       varchar NOT NULL,
 phone         varchar NOT NULL,
 relationship  varchar NOT NULL,
 TBL_LAST_DATE timestamp NOT NULL DEFAULT current_timestamp,
 CONSTRAINT PK_365 PRIMARY KEY ( "id" )
);








-- ************************************** doctor

CREATE TABLE doctor
(
 "id"             int NOT NULL,
 name           varchar NOT NULL,
 office_phone   varchar NOT NULL,
 personal_phone varchar NOT NULL,
 specialty      varchar NOT NULL,
 TBL_LAST_DATE  timestamp NOT NULL DEFAULT current_timestamp,
 CONSTRAINT PK_291 PRIMARY KEY ( "id" )
);








-- ************************************** disease

CREATE TABLE disease
(
 icd           int NOT NULL,
 description   varchar NOT NULL,
 type          varchar NOT NULL,
 TBL_LAST_DATE timestamp NOT NULL DEFAULT current_timestamp,
 CONSTRAINT PK_248 PRIMARY KEY ( icd )
);








-- ************************************** department

CREATE TABLE department
(
 "id"            int NOT NULL,
 name          varchar NOT NULL,
 phone         varchar NOT NULL,
 location      varchar NOT NULL,
 TBL_LAST_DATE timestamp NOT NULL DEFAULT current_timestamp,
 CONSTRAINT PK_286 PRIMARY KEY ( "id" )
);





-- ************************************** registration_treatment

CREATE TABLE registration_treatment
(
 registration_id int NOT NULL,
 treatment_id    int NOT NULL,
 TBL_LAST_DATE   timestamp NOT NULL,
 CONSTRAINT FK_415 FOREIGN KEY ( registration_id ) REFERENCES registration ( "id" ),
 CONSTRAINT FK_418 FOREIGN KEY ( treatment_id ) REFERENCES treatment ( "id" )
);

CREATE INDEX fkIdx_417 ON registration_treatment
(
 registration_id
);

CREATE INDEX fkIdx_420 ON registration_treatment
(
 treatment_id
);








-- ************************************** patient_treatment

CREATE TABLE patient_treatment
(
 patient_id    int NOT NULL,
 treatment_id  int NOT NULL,
 TBL_LAST_DATE timestamp NOT NULL,
 CONSTRAINT FK_370 FOREIGN KEY ( patient_id ) REFERENCES patient ( "id" ),
 CONSTRAINT FK_387 FOREIGN KEY ( treatment_id ) REFERENCES treatment ( "id" )
);

CREATE INDEX fkIdx_372 ON patient_treatment
(
 patient_id
);

CREATE INDEX fkIdx_389 ON patient_treatment
(
 treatment_id
);








-- ************************************** patient_registration

CREATE TABLE patient_registration
(
 patient_id      int NOT NULL,
 registration_id int NOT NULL,
 TBL_LAST_DATE   timestamp NOT NULL,
 CONSTRAINT FK_407 FOREIGN KEY ( patient_id ) REFERENCES patient ( "id" ),
 CONSTRAINT FK_410 FOREIGN KEY ( registration_id ) REFERENCES registration ( "id" )
);

CREATE INDEX fkIdx_409 ON patient_registration
(
 patient_id
);

CREATE INDEX fkIdx_412 ON patient_registration
(
 registration_id
);








-- ************************************** patient_invoice

CREATE TABLE patient_invoice
(
 patient_id    int NOT NULL,
 invoice_id    int NOT NULL,
 TBL_LAST_DATE timestamp NOT NULL,
 CONSTRAINT FK_397 FOREIGN KEY ( patient_id ) REFERENCES patient ( "id" ),
 CONSTRAINT FK_400 FOREIGN KEY ( invoice_id ) REFERENCES invoice ( "id" )
);

CREATE INDEX fkIdx_399 ON patient_invoice
(
 patient_id
);

CREATE INDEX fkIdx_402 ON patient_invoice
(
 invoice_id
);








-- ************************************** patient_insurance

CREATE TABLE patient_insurance
(
 patient_id    int NOT NULL,
 insurance_id  int NOT NULL,
 TBL_LAST_DATE timestamp NOT NULL,
 CONSTRAINT FK_439 FOREIGN KEY ( patient_id ) REFERENCES patient ( "id" ),
 CONSTRAINT FK_442 FOREIGN KEY ( insurance_id ) REFERENCES insurance ( "id" )
);

CREATE INDEX fkIdx_441 ON patient_insurance
(
 patient_id
);

CREATE INDEX fkIdx_444 ON patient_insurance
(
 insurance_id
);








-- ************************************** patient_emergency_contact

CREATE TABLE patient_emergency_contact
(
 patient_id           int NOT NULL,
 emergency_contact_id int NOT NULL,
 TBL_LAST_DATE        timestamp NOT NULL,
 CONSTRAINT FK_360 FOREIGN KEY ( patient_id ) REFERENCES patient ( "id" ),
 CONSTRAINT FK_366 FOREIGN KEY ( emergency_contact_id ) REFERENCES emergency_contact ( "id" )
);

CREATE INDEX fkIdx_362 ON patient_emergency_contact
(
 patient_id
);

CREATE INDEX fkIdx_368 ON patient_emergency_contact
(
 emergency_contact_id
);


-- ************************************** in_patient

CREATE TABLE in_patient
(
 "id"             int NOT NULL,
 bed_number     int NOT NULL,
 "floor"          int NOT NULL,
 discharge_date date NOT NULL,
 TBL_LAST_DATE  timestamp NOT NULL DEFAULT current_timestamp,
 CONSTRAINT PK_467 PRIMARY KEY ( "id" ),
 CONSTRAINT FK_in_patient_171 FOREIGN KEY ( "id" ) REFERENCES patient ( "id" )
);


-- ************************************** in_patient - history
CREATE TABLE in_patient_history (
 "id"             int NOT NULL,
 "timestamp" timestamp NOT NULL DEFAULT clock_timestamp(),
 bed_number     int NOT NULL,
 "floor"          int NOT NULL,
 discharge_date date NOT NULL
);

CREATE OR REPLACE FUNCTION in_patient_history_trigger()
  RETURNS trigger AS
$BODY$
  DECLARE
    table_name text;
  BEGIN
    table_name := 'in_patient_history_' || to_char(CURRENT_DATE, 'yyyy_mm');
    IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = table_name)
    THEN
      EXECUTE 'CREATE TABLE IF NOT EXISTS ' || table_name ||
              ' () INHERITS (in_patient_history);';
    END IF;
    EXECUTE 'INSERT INTO ' || table_name ||
            '(id, bed_number, floor, discharge_date) VALUES ($1.id, $1.bed_number, $1.floor, $1.discharge_date);' USING NEW;
    RETURN NEW;
  END
$BODY$
  LANGUAGE plpgsql;

CREATE TRIGGER in_patient_history_trigger
AFTER INSERT OR UPDATE ON in_patient FOR EACH ROW
EXECUTE PROCEDURE in_patient_history_trigger();


-- ************************************** out_patient

CREATE TABLE out_patient
(
 "id"             int NOT NULL,
 follow_up_date date NOT NULL,
 TBL_LAST_DATE  timestamp NOT NULL DEFAULT current_timestamp,
 CONSTRAINT PK_468 PRIMARY KEY ( "id" ),
 CONSTRAINT FK_out_patient_173 FOREIGN KEY ( "id" ) REFERENCES patient ( "id" )
);

-- ************************************** out_patient - history
CREATE TABLE out_patient_history
(
 "id"             int NOT NULL,
  "timestamp" timestamp NOT NULL DEFAULT clock_timestamp(),
 follow_up_date date NOT NULL
);

CREATE OR REPLACE FUNCTION out_patient_history_trigger()
  RETURNS trigger AS
$BODY$
  DECLARE
    table_name text;
  BEGIN
    table_name := 'out_patient_history_' || to_char(CURRENT_DATE, 'yyyy_mm');
    IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = table_name)
    THEN
      EXECUTE 'CREATE TABLE IF NOT EXISTS ' || table_name ||
              ' () INHERITS (out_patient_history);';
    END IF;
    EXECUTE 'INSERT INTO ' || table_name ||
            '(id, follow_up_date) VALUES ($1.id, $1.follow_up_date);' USING NEW;
    RETURN NEW;
  END
$BODY$
  LANGUAGE plpgsql;

CREATE TRIGGER out_patient_history_trigger
AFTER INSERT OR UPDATE ON out_patient FOR EACH ROW
EXECUTE PROCEDURE out_patient_history_trigger();

-- ************************************** insurance_invoice

CREATE TABLE insurance_invoice
(
 insurance_id  int NOT NULL,
 invoice_id    int NOT NULL,
 TBL_LAST_DATE timestamp NOT NULL,
 CONSTRAINT FK_447 FOREIGN KEY ( insurance_id ) REFERENCES insurance ( "id" ),
 CONSTRAINT FK_450 FOREIGN KEY ( invoice_id ) REFERENCES invoice ( "id" )
);

CREATE INDEX fkIdx_449 ON insurance_invoice
(
 insurance_id
);

CREATE INDEX fkIdx_452 ON insurance_invoice
(
 invoice_id
);










-- ************************************** hospital_department

CREATE TABLE hospital_department
(
 hospital_id   int NOT NULL,
 department_id int NOT NULL,
 TBL_LAST_DATE timestamp NOT NULL,
 CONSTRAINT FK_293 FOREIGN KEY ( hospital_id ) REFERENCES hospital ( "id" ),
 CONSTRAINT FK_299 FOREIGN KEY ( department_id ) REFERENCES department ( "id" )
);

CREATE INDEX fkIdx_295 ON hospital_department
(
 hospital_id
);

CREATE INDEX fkIdx_301 ON hospital_department
(
 department_id
);








-- ************************************** fulltime_doctor

CREATE TABLE fulltime_doctor
(
 name          varchar NOT NULL,
 hire_date     date NOT NULL,
 annual_pay    int NOT NULL,
 TBL_LAST_DATE timestamp NOT NULL DEFAULT current_timestamp,
 "id"            int NOT NULL,
 CONSTRAINT PK_465 PRIMARY KEY ( "id" ),
 CONSTRAINT FK_fulltime_doctor_165 FOREIGN KEY ( "id" ) REFERENCES doctor ( "id" )
);


-- ************************************** fulltime_doctor - history
CREATE TABLE fulltime_doctor_history
(
 name          varchar NOT NULL,
 "timestamp" timestamp NOT NULL DEFAULT clock_timestamp(),
 hire_date     date NOT NULL,
 annual_pay    int NOT NULL,
 "id"          int primary key
);

CREATE OR REPLACE FUNCTION fulltime_doctor_history_trigger()
  RETURNS trigger AS
$BODY$
  DECLARE
    table_name text;
  BEGIN
    table_name := 'fulltime_doctor_history_' || to_char(CURRENT_DATE, 'yyyy_mm');
    IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = table_name)
    THEN
      EXECUTE 'CREATE TABLE IF NOT EXISTS ' || table_name ||
              ' () INHERITS (fulltime_doctor_history);';
    END IF;
    EXECUTE 'INSERT INTO ' || table_name ||
            '(id, name, hire_date, annual_pay) VALUES ($1.id, $1.name, $1.hire_date, $1.annual_pay);' USING NEW;
    RETURN NEW;
  END
$BODY$
  LANGUAGE plpgsql;

CREATE TRIGGER fulltime_doctor_history_trigger
AFTER INSERT OR UPDATE ON fulltime_doctor FOR EACH ROW
EXECUTE PROCEDURE fulltime_doctor_history_trigger();






-- ************************************** doctor_patient

CREATE TABLE doctor_patient
(
 doctor_id     int NOT NULL,
 patient_id    int NOT NULL,
 TBL_LAST_DATE timestamp NOT NULL,
 CONSTRAINT FK_332 FOREIGN KEY ( doctor_id ) REFERENCES doctor ( "id" ),
 CONSTRAINT FK_335 FOREIGN KEY ( patient_id ) REFERENCES patient ( "id" )
);

CREATE INDEX fkIdx_334 ON doctor_patient
(
 doctor_id
);

CREATE INDEX fkIdx_337 ON doctor_patient
(
 patient_id
);








-- ************************************** doctor_disease

CREATE TABLE doctor_disease
(
 doctor_id     int NOT NULL,
 disease_id    int NOT NULL,
 TBL_LAST_DATE timestamp NOT NULL,
 CONSTRAINT FK_243 FOREIGN KEY ( doctor_id ) REFERENCES doctor ( "id" ),
 CONSTRAINT FK_246 FOREIGN KEY ( disease_id ) REFERENCES disease ( icd )
);

CREATE INDEX fkIdx_245 ON doctor_disease
(
 doctor_id
);

CREATE INDEX fkIdx_249 ON doctor_disease
(
 disease_id
);








-- ************************************** department_patient

CREATE TABLE department_patient
(
 department_id int NOT NULL,
 patient_id    int NOT NULL,
 TBL_LAST_DATE timestamp NOT NULL,
 CONSTRAINT FK_315 FOREIGN KEY ( department_id ) REFERENCES department ( "id" ),
 CONSTRAINT FK_319 FOREIGN KEY ( patient_id ) REFERENCES patient ( "id" )
);

CREATE INDEX fkIdx_317 ON department_patient
(
 department_id
);

CREATE INDEX fkIdx_321 ON department_patient
(
 patient_id
);








-- ************************************** department_doctor

CREATE TABLE department_doctor
(
 doctor_id     int NOT NULL,
 department_id int NOT NULL,
 TBL_LAST_DATE timestamp NOT NULL,
 CONSTRAINT FK_339 FOREIGN KEY ( doctor_id ) REFERENCES doctor ( "id" ),
 CONSTRAINT FK_342 FOREIGN KEY ( department_id ) REFERENCES department ( "id" )
);

CREATE INDEX fkIdx_341 ON department_doctor
(
 doctor_id
);

CREATE INDEX fkIdx_344 ON department_doctor
(
 department_id
);








-- ************************************** consulting_doctor

CREATE TABLE consulting_doctor
(
 name                varchar NOT NULL,
 contract_date       date NOT NULL,
 contract_phone      varchar NOT NULL,
 weekly_pay          int NOT NULL,
 min_weekly_hours    int NOT NULL,
 overtime_hourly_pay int NOT NULL,
 TBL_LAST_DATE       timestamp NOT NULL DEFAULT current_timestamp,
 "id"                  int NOT NULL,
 CONSTRAINT PK_466 PRIMARY KEY ( "id" ),
 CONSTRAINT FK_consulting_doctor_167 FOREIGN KEY ( "id" ) REFERENCES doctor ( "id" )
);




-- ************************************** consulting_doctor - history
CREATE TABLE consulting_doctor_history
(
 name                varchar NOT NULL,
 "timestamp" timestamp NOT NULL DEFAULT clock_timestamp(),
 contract_date       date NOT NULL,
 contract_phone      varchar NOT NULL,
 weekly_pay          int NOT NULL,
 min_weekly_hours    int NOT NULL,
 overtime_hourly_pay int NOT NULL,
 "id"                  int primary key
);

CREATE OR REPLACE FUNCTION consulting_doctor_history_trigger()
  RETURNS trigger AS
$BODY$
  DECLARE
    table_name text;
  BEGIN
    table_name := 'consulting_doctor_history_' || to_char(CURRENT_DATE, 'yyyy_mm');
    IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = table_name)
    THEN
      EXECUTE 'CREATE TABLE IF NOT EXISTS ' || table_name ||
              ' () INHERITS (consulting_doctor_history);';
    END IF;
    EXECUTE 'INSERT INTO ' || table_name ||
            '(id, name, contract_date, contract_phone, weekly_pay, min_weekly_hours, overtime_hourly_pay) VALUES ($1.id, $1.name, $1.contract_date, $1.contract_phone, $1.weekly_pay, $1.min_weekly_hours, $1.overtime_hourly_pay);' USING NEW;
    RETURN NEW;
  END
$BODY$
  LANGUAGE plpgsql;

CREATE TRIGGER consulting_doctor_history_trigger
AFTER INSERT OR UPDATE ON consulting_doctor FOR EACH ROW
EXECUTE PROCEDURE consulting_doctor_history_trigger();



-- ************************************** surgery_treatment

CREATE TABLE surgery_treatment
(
 "id"            int NOT NULL,
 surgery       varchar NOT NULL,
 description   varchar NOT NULL,
 "date"          date NOT NULL,
 "result"        varchar NOT NULL,
 TBL_LAST_DATE timestamp NOT NULL DEFAULT current_timestamp,
 CONSTRAINT PK_471 PRIMARY KEY ( "id" ),
 CONSTRAINT FK_surgery_treatment_187 FOREIGN KEY ( "id" ) REFERENCES treatment ( "id" )
);








-- ************************************** laboratory_treatment

CREATE TABLE laboratory_treatment
(
 laboratory    varchar NOT NULL,
 test_type     varchar NOT NULL,
 test_date     date NOT NULL,
 test_result   varchar NOT NULL,
 TBL_LAST_DATE timestamp NOT NULL DEFAULT current_timestamp,
 "id"            int NOT NULL,
 CONSTRAINT PK_469 PRIMARY KEY ( "id" ),
 CONSTRAINT FK_laboratory_treatment_183 FOREIGN KEY ( "id" ) REFERENCES treatment ( "id" ),
 PARTITION BY RANGE(test_date)
);








-- ************************************** drug_treatment

CREATE TABLE drug_treatment
(
 "id"            int NOT NULL,
 drug          varchar NOT NULL,
 dose          varchar NOT NULL,
 TBL_LAST_DATE timestamp NOT NULL DEFAULT current_timestamp,
 CONSTRAINT PK_470 PRIMARY KEY ( "id" ),
 CONSTRAINT FK_drug_treatment_185 FOREIGN KEY ( "id" ) REFERENCES treatment ( "id" )
);

-- ************************************** triggers (30)
CREATE OR REPLACE FUNCTION update_TBL_LAST_DATE_column() 
RETURNS TRIGGER AS $$
BEGIN
    NEW.TBL_LAST_DATE = now();
    RETURN NEW; 
END;
$$ language 'plpgsql';

CREATE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON hospital FOR EACH ROW EXECUTE PROCEDURE update_TBL_LAST_DATE_column();
CREATE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON department FOR EACH ROW EXECUTE PROCEDURE update_TBL_LAST_DATE_column();
CREATE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON doctor FOR EACH ROW EXECUTE PROCEDURE update_TBL_LAST_DATE_column();
CREATE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON fulltime_doctor FOR EACH ROW EXECUTE PROCEDURE update_TBL_LAST_DATE_column();
CREATE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON consulting_doctor FOR EACH ROW EXECUTE PROCEDURE update_TBL_LAST_DATE_column();
CREATE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON patient FOR EACH ROW EXECUTE PROCEDURE update_TBL_LAST_DATE_column();
CREATE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON emergency_contact FOR EACH ROW EXECUTE PROCEDURE update_TBL_LAST_DATE_column();
CREATE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON in_patient FOR EACH ROW EXECUTE PROCEDURE update_TBL_LAST_DATE_column();
CREATE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON out_patient FOR EACH ROW EXECUTE PROCEDURE update_TBL_LAST_DATE_column();
CREATE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON registration FOR EACH ROW EXECUTE PROCEDURE update_TBL_LAST_DATE_column();
CREATE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON disease FOR EACH ROW EXECUTE PROCEDURE update_TBL_LAST_DATE_column();
CREATE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON treatment FOR EACH ROW EXECUTE PROCEDURE update_TBL_LAST_DATE_column();
CREATE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON laboratory_treatment FOR EACH ROW EXECUTE PROCEDURE update_TBL_LAST_DATE_column();
CREATE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON drug_treatment FOR EACH ROW EXECUTE PROCEDURE update_TBL_LAST_DATE_column();
CREATE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON surgery_treatment FOR EACH ROW EXECUTE PROCEDURE update_TBL_LAST_DATE_column();
CREATE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON invoice FOR EACH ROW EXECUTE PROCEDURE update_TBL_LAST_DATE_column();
CREATE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON department_doctor FOR EACH ROW EXECUTE PROCEDURE update_TBL_LAST_DATE_column();
CREATE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON department_patient FOR EACH ROW EXECUTE PROCEDURE update_TBL_LAST_DATE_column();
CREATE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON doctor_disease FOR EACH ROW EXECUTE PROCEDURE update_TBL_LAST_DATE_column();
CREATE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON doctor_patient FOR EACH ROW EXECUTE PROCEDURE update_TBL_LAST_DATE_column();
CREATE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON hospital_department FOR EACH ROW EXECUTE PROCEDURE update_TBL_LAST_DATE_column();
CREATE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON insurance FOR EACH ROW EXECUTE PROCEDURE update_TBL_LAST_DATE_column();
CREATE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON insurance_invoice FOR EACH ROW EXECUTE PROCEDURE update_TBL_LAST_DATE_column();
CREATE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON patient_emergency_contact FOR EACH ROW EXECUTE PROCEDURE update_TBL_LAST_DATE_column();
CREATE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON patient_insurance FOR EACH ROW EXECUTE PROCEDURE update_TBL_LAST_DATE_column();
CREATE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON patient_invoice FOR EACH ROW EXECUTE PROCEDURE update_TBL_LAST_DATE_column();
CREATE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON patient_registration FOR EACH ROW EXECUTE PROCEDURE update_TBL_LAST_DATE_column();
CREATE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON patient_treatment FOR EACH ROW EXECUTE PROCEDURE update_TBL_LAST_DATE_column();
CREATE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON registration_treatment FOR EACH ROW EXECUTE PROCEDURE update_TBL_LAST_DATE_column();


