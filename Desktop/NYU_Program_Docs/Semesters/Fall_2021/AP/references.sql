ALTER TABLE "hospital" ADD FOREIGN KEY ("department_id") REFERENCES "departments" ("id");

ALTER TABLE "hospitals" ADD FOREIGN KEY ("id") REFERENCES "doctors" ("hospital_id");

ALTER TABLE "departments" ADD FOREIGN KEY ("id") REFERENCES "doctors" ("department_id");

ALTER TABLE "doctors" ADD FOREIGN KEY ("id") REFERENCES "fulltime_doctors" ("id");

ALTER TABLE "doctors" ADD FOREIGN KEY ("name") REFERENCES "fulltime_doctors" ("name");

ALTER TABLE "doctors" ADD FOREIGN KEY ("id") REFERENCES "consulting_doctors" ("id");

ALTER TABLE "doctors" ADD FOREIGN KEY ("name") REFERENCES "consulting_doctors" ("name");

ALTER TABLE "hospital" ADD FOREIGN KEY ("id") REFERENCES "patients" ("hospital_id");

ALTER TABLE "departments" ADD FOREIGN KEY ("id") REFERENCES "patients" ("department_id");

ALTER TABLE "patients" ADD FOREIGN KEY ("id") REFERENCES "in_patients" ("id");

ALTER TABLE "patients" ADD FOREIGN KEY ("id") REFERENCES "out_patients" ("id");

ALTER TABLE "patients" ADD FOREIGN KEY ("id") REFERENCES "registrations" ("patient_id");

ALTER TABLE "doctors" ADD FOREIGN KEY ("id") REFERENCES "doctors_patients_link" ("doctor_id");

ALTER TABLE "patients" ADD FOREIGN KEY ("id") REFERENCES "doctors_patients_link" ("patient_id");

ALTER TABLE "doctors" ADD FOREIGN KEY ("id") REFERENCES "doctors_diseases_link" ("doctor_id");

ALTER TABLE "patients" ADD FOREIGN KEY ("id") REFERENCES "patients_emergency_contacts_link" ("patient_id");

ALTER TABLE "patients_emergency_contacts_link" ADD FOREIGN KEY ("emergency_contact_id") REFERENCES "emergency_contacts" ("id");

ALTER TABLE "doctors_diseases_link" ADD FOREIGN KEY ("disease_id") REFERENCES "diseases" ("icd");

ALTER TABLE "treatments" ADD FOREIGN KEY ("id") REFERENCES "treatment_types" ("id");

ALTER TABLE "treatment_types" ADD FOREIGN KEY ("id") REFERENCES "drug_treatment" ("id");

ALTER TABLE "treatment_types" ADD FOREIGN KEY ("id") REFERENCES "surgery_treatment" ("id");

ALTER TABLE "treatment_types" ADD FOREIGN KEY ("id") REFERENCES "laboratory_treatment" ("id");

ALTER TABLE "patients" ADD FOREIGN KEY ("id") REFERENCES "patients_treatments_link" ("patient_id");

ALTER TABLE "patients_treatments_link" ADD FOREIGN KEY ("treatment_id") REFERENCES "treatments" ("id");

ALTER TABLE "invoices" ADD FOREIGN KEY ("patient_id") REFERENCES "patients" ("id");

ALTER TABLE "invoices" ADD FOREIGN KEY ("insurance_company") REFERENCES "patients" ("insurance_company");