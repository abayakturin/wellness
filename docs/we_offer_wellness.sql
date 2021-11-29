CREATE TABLE "hospital" (
  "id" int PRIMARY KEY,
  "name" varchar NOT NULL,
  "address" varchar NOT NULL,
  "specialty" varchar NOT NULL,
  "emergency_phone" varchar[] NOT NULL,
  "general_phone" varchar[] NOT NULL,
  "registration_phone" varchar[] NOT NULL,
  "admin_phone" varchar[] NOT NULL,
  "department_id" int NOT NULL,
  "TBL_LAST_DATE" timestamp default current_timestamp,
	unique(department_id)
);

CREATE TABLE department (
  "id" int PRIMARY KEY references hospital(department_id),
  "hospital_id" int REFERENCES hospital(id),
  "name" varchar NOT NULL,
  "phone" varchar NOT NULL,
  "location" varchar NOT NULL,
  "TBL_LAST_DATE" timestamp default current_timestamp
);

CREATE TABLE "doctor" (
  "id" int PRIMARY KEY,
  "name" varchar NOT NULL,
  "office_phone" varchar NOT NULL,
  "personal_phone" varchar NOT NULL,
  "specialty" varchar NOT NULL,
  patient_id int NOT NULL,
	disease_id int NOT NULL,
	department_id int NOT null references department(id),
  "TBL_LAST_DATE" timestamp default current_timestamp,
	unique(patient_id),
	unique(disease_id)
);

CREATE TABLE "patient" (
  "id" int PRIMARY KEY,
  hospital_id int REFERENCES hospital(id),
  department_id int REFERENCES department(id),
  "name" varchar NOT NULL,
  "address" varchar NOT NULL,
  "phone" varchar NOT NULL,
  "birth_date" date NOT NULL,
  "race" varchar NOT NULL,
  "martial_status" varchar NOT NULL,
  "gender" varchar NOT NULL,
  "insurance_company" varchar NOT NULL,
  "insurance_phone" varchar NOT NULL,
  "blood_group" varchar NOT NULL,
  "emergency_contact_id" int NOT NULL,
   doctor_id int NOT NULL REFERENCES doctor(id),
	treatment_id int NOT NULL,
  "TBL_LAST_DATE" timestamp default current_timestamp,
	unique(emergency_contact_id),
	unique(treatment_id)
);

-- CREATE TABLE patient_history (LIKE patient);

-- CREATE TRIGGER patient_versioning_trigger
-- BEFORE INSERT OR UPDATE OR DELETE ON patient
-- FOR EACH ROW EXECUTE PROCEDURE versioning(
--   'TBL_LAST_DATE', 'patient_history', true
-- );

CREATE TABLE "fulltime_doctor" (
  "id" int PRIMARY KEY references doctor(id),
  "name" varchar NOT NULL,
  "hire_date" date NOT NULL,
  "annual_pay" int NOT NULL,
  "TBL_LAST_DATE" timestamp default current_timestamp
);

-- CREATE TABLE fulltime_doctor_history (LIKE fulltime_doctor);

-- CREATE TRIGGER fulltime_doctor_versioning_trigger
-- BEFORE INSERT OR UPDATE OR DELETE ON fulltime_doctor
-- FOR EACH ROW EXECUTE PROCEDURE versioning(
--   'TBL_LAST_DATE', 'fulltime_doctor_history', true
-- );

CREATE TABLE "consulting_doctor" (
  "id" int PRIMARY KEY references doctor(id),
  "name" varchar NOT NULL,
  "contract_date" date NOT NULL,
  "contract_phone" varchar NOT NULL,
  "weekly_pay" int NOT NULL,
  "min_weekly_hours" int NOT NULL,
  "overtime_hourly_pay" int NOT NULL,
  "TBL_LAST_DATE" timestamp default current_timestamp
);

-- CREATE TABLE consulting_doctor_history (LIKE consulting_doctor);

-- CREATE TRIGGER consulting_doctor_versioning_trigger
-- BEFORE INSERT OR UPDATE OR DELETE ON consulting_doctor
-- FOR EACH ROW EXECUTE PROCEDURE versioning(
--   'TBL_LAST_DATE', 'consulting_doctor_history', true
-- );

CREATE TABLE "emergency_contact" (
  "id" int PRIMARY KEY references patient(emergency_contact_id),
  "name" varchar NOT NULL,
  "address" varchar NOT NULL,
  "phone" varchar NOT NULL,
  "relationship" varchar NOT NULL,
  "TBL_LAST_DATE" timestamp default current_timestamp
);

CREATE TABLE "in_patient" (
  "id" int PRIMARY KEY references patient(id),
  "bed_number" int NOT NULL,
  "floor" int NOT NULL,
  "discharge_date" date NOT NULL,
  "TBL_LAST_DATE" timestamp default current_timestamp
);

CREATE TABLE "out_patient" (
  "id" int PRIMARY KEY references patient(id),
  "follow_up_date" date NOT NULL,
  "TBL_LAST_DATE" timestamp default current_timestamp
);

CREATE TABLE "registration" (
  "registration_id" int PRIMARY KEY,
  "treatment" varchar NOT NULL,
  "patient_id" int references patient(id) NOT NULL,
  "registration_date" date NOT NULL,
  "TBL_LAST_DATE" timestamp default current_timestamp
);

CREATE TABLE "disease" (
  "icd" int PRIMARY KEY references doctor(disease_id),
  "description" varchar NOT NULL,
  "type" varchar NOT NULL,
  "TBL_LAST_DATE" timestamp default current_timestamp
);

CREATE TABLE "treatment" (
  "id" int PRIMARY KEY references patient(treatment_id),
  "date" date NOT NULL,
  "type" varchar NOT NULL,
  "result_status" varchar NOT NULL,
  "description" varchar NOT NULL,
  "TBL_LAST_DATE" timestamp default current_timestamp
);

CREATE TABLE "treatment_type" (
  "id" int PRIMARY KEY REFERENCES treatment(id),
  "treatment_type" varchar NOT NULL,
  "TBL_LAST_DATE" timestamp default current_timestamp
);

CREATE TABLE "laboratory_treatment" (
  "id" int PRIMARY KEY references treatment_type(id),
  "laboratory" varchar NOT NULL,
  "test_type" varchar NOT NULL,
  "test_date" date NOT NULL,
  "test_result" varchar NOT NULL,
  "TBL_LAST_DATE" timestamp default current_timestamp
);

CREATE TABLE "drug_treatment" (
  "id" int PRIMARY KEY references treatment_type(id),
  "drug" varchar NOT NULL,
  "dose" varchar NOT NULL,
  "TBL_LAST_DATE" timestamp default current_timestamp
);

CREATE TABLE "surgery_treatment" (
  "id" int PRIMARY KEY references treatment_type(id),
  "surgery" varchar NOT NULL,
  "description" varchar NOT NULL,
  "date" date NOT NULL,
  "result" varchar NOT NULL,
  "TBL_LAST_DATE" timestamp default current_timestamp
);

CREATE TABLE "invoice" (
  "id" int PRIMARY KEY,
  "patient_id" int references patient(id) NOT NULL,
  "insurance_company" varchar NOT NULL,
  "date" date NOT NULL,
  "amount" float NOT NULL,
  "type" varchar NOT NULL,
  "TBL_LAST_DATE" timestamp default current_timestamp
);

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
CREATE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON treatment_type FOR EACH ROW EXECUTE PROCEDURE update_TBL_LAST_DATE_column();
CREATE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON laboratory_treatment FOR EACH ROW EXECUTE PROCEDURE update_TBL_LAST_DATE_column();
CREATE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON drug_treatment FOR EACH ROW EXECUTE PROCEDURE update_TBL_LAST_DATE_column();
CREATE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON surgery_treatment FOR EACH ROW EXECUTE PROCEDURE update_TBL_LAST_DATE_column();
CREATE TRIGGER update_TBL_LAST_DATE_modtime BEFORE UPDATE ON invoice FOR EACH ROW EXECUTE PROCEDURE update_TBL_LAST_DATE_column();










