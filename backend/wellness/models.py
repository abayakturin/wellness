# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.BooleanField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.BooleanField()
    is_active = models.BooleanField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class ConsultingDoctor(models.Model):
    name = models.CharField(max_length=150)
    contract_date = models.DateField()
    contract_phone = models.CharField(max_length=150)
    weekly_pay = models.IntegerField()
    min_weekly_hours = models.IntegerField()
    overtime_hourly_pay = models.IntegerField()
    tbl_last_date = models.DateTimeField()
    id = models.OneToOneField('Doctor', models.DO_NOTHING, db_column='id', primary_key=True)

    class Meta:
        managed = False
        db_table = 'consulting_doctor'


class ConsultingDoctorHistory(models.Model):
    name = models.CharField(max_length=150)
    timestamp = models.DateTimeField()
    contract_date = models.DateField()
    contract_phone = models.CharField(max_length=150)
    weekly_pay = models.IntegerField()
    min_weekly_hours = models.IntegerField()
    overtime_hourly_pay = models.IntegerField()
    id = models.IntegerField(primary_key=True)

    class Meta:
        managed = False
        db_table = 'consulting_doctor_history'


class ConsultingDoctorHistory202110(models.Model):
    name = models.CharField(max_length=150)
    timestamp = models.DateTimeField()
    contract_date = models.DateField()
    contract_phone = models.CharField(max_length=150)
    weekly_pay = models.IntegerField()
    min_weekly_hours = models.IntegerField()
    overtime_hourly_pay = models.IntegerField()
    id = models.IntegerField(primary_key=True)

    class Meta:
        managed = False
        db_table = 'consulting_doctor_history_2021_10'


class Department(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=150)
    phone = models.CharField(max_length=150)
    location = models.CharField(max_length=150)
    tbl_last_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'department'


class DepartmentDoctor(models.Model):
    doctor = models.ForeignKey('Doctor', models.DO_NOTHING)
    department = models.ForeignKey(Department, models.DO_NOTHING)
    tbl_last_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'department_doctor'


class DepartmentPatient(models.Model):
    department = models.ForeignKey(Department, models.DO_NOTHING)
    patient = models.ForeignKey('Patient', models.DO_NOTHING)
    tbl_last_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'department_patient'


class Disease(models.Model):
    icd = models.IntegerField(primary_key=True)
    description = models.CharField(max_length=150)
    type = models.CharField(max_length=150)
    tbl_last_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'disease'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.SmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Doctor(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=150)
    office_phone = models.CharField(max_length=150)
    personal_phone = models.CharField(max_length=150)
    specialty = models.CharField(max_length=150)
    tbl_last_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'doctor'


class DoctorDisease(models.Model):
    doctor = models.ForeignKey(Doctor, models.DO_NOTHING)
    disease = models.ForeignKey(Disease, models.DO_NOTHING)
    tbl_last_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'doctor_disease'


class DoctorPatient(models.Model):
    doctor = models.ForeignKey(Doctor, models.DO_NOTHING)
    patient = models.ForeignKey('Patient', models.DO_NOTHING)
    tbl_last_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'doctor_patient'


class DrugTreatment(models.Model):
    id = models.OneToOneField('Treatment', models.DO_NOTHING, db_column='id', primary_key=True)
    drug = models.CharField(max_length=150)
    dose = models.CharField(max_length=150)
    tbl_last_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'drug_treatment'


class EmergencyContact(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=150)
    address = models.CharField(max_length=150)
    phone = models.CharField(max_length=150)
    relationship = models.CharField(max_length=150)
    tbl_last_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'emergency_contact'


class FulltimeDoctor(models.Model):
    name = models.CharField(max_length=150)
    hire_date = models.DateField()
    annual_pay = models.IntegerField()
    tbl_last_date = models.DateTimeField()
    id = models.OneToOneField(Doctor, models.DO_NOTHING, db_column='id', primary_key=True)

    class Meta:
        managed = False
        db_table = 'fulltime_doctor'


class FulltimeDoctorHistory(models.Model):
    name = models.CharField(max_length=150)
    timestamp = models.DateTimeField()
    hire_date = models.DateField()
    annual_pay = models.IntegerField()
    id = models.IntegerField(primary_key=True)

    class Meta:
        managed = False
        db_table = 'fulltime_doctor_history'


class FulltimeDoctorHistory202110(models.Model):
    name = models.CharField(max_length=150)
    timestamp = models.DateTimeField()
    hire_date = models.DateField()
    annual_pay = models.IntegerField()
    id = models.IntegerField(primary_key=True)

    class Meta:
        managed = False
        db_table = 'fulltime_doctor_history_2021_10'


class Hospital(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=150)
    address = models.CharField(max_length=150)
    specialty = models.CharField(max_length=150)
    emergency_phone = models.CharField(max_length=150)
    general_phone = models.CharField(max_length=150)
    registration_phone = models.CharField(max_length=150)
    admin_phone = models.CharField(max_length=150)
    tbl_last_date = models.DateTimeField(auto_now_add=True)

    class Meta:
        managed = False
        db_table = 'hospital'


class HospitalDepartment(models.Model):
    hospital = models.ForeignKey(Hospital, models.DO_NOTHING)
    department = models.ForeignKey(Department, models.DO_NOTHING)
    tbl_last_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'hospital_department'


class InPatient(models.Model):
    id = models.OneToOneField('Patient', models.DO_NOTHING, db_column='id', primary_key=True)
    bed_number = models.IntegerField()
    floor = models.IntegerField()
    discharge_date = models.DateField()
    tbl_last_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'in_patient'


class InPatientHistory(models.Model):
    id = models.IntegerField(primary_key=True)
    timestamp = models.DateTimeField()
    bed_number = models.IntegerField()
    floor = models.IntegerField()
    discharge_date = models.DateField()

    class Meta:
        managed = False
        db_table = 'in_patient_history'


class InPatientHistory202110(models.Model):
    id = models.IntegerField(primary_key=True)
    timestamp = models.DateTimeField()
    bed_number = models.IntegerField()
    floor = models.IntegerField()
    discharge_date = models.DateField()

    class Meta:
        managed = False
        db_table = 'in_patient_history_2021_10'


class Insurance(models.Model):
    id = models.IntegerField(primary_key=True)
    insurance_company = models.CharField(max_length=50)
    insurance_number = models.IntegerField()
    tbl_last_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'insurance'


class InsuranceInvoice(models.Model):
    insurance = models.ForeignKey(Insurance, models.DO_NOTHING)
    invoice = models.ForeignKey('Invoice', models.DO_NOTHING)
    tbl_last_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'insurance_invoice'


class Invoice(models.Model):
    id = models.IntegerField(primary_key=True)
    date = models.DateField()
    amount = models.FloatField()
    payment_type = models.CharField(max_length=150)
    tbl_last_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'invoice'


class LaboratoryTreatment(models.Model):
    laboratory = models.CharField(max_length=150)
    test_type = models.CharField(max_length=150)
    test_date = models.DateField()
    test_result = models.CharField(max_length=150)
    tbl_last_date = models.DateTimeField()
    id = models.OneToOneField('Treatment', models.DO_NOTHING, db_column='id', primary_key=True)

    class Meta:
        managed = False
        db_table = 'laboratory_treatment'


class OutPatient(models.Model):
    id = models.OneToOneField('Patient', models.DO_NOTHING, db_column='id', primary_key=True)
    follow_up_date = models.DateField()
    tbl_last_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'out_patient'


class OutPatientHistory(models.Model):
    id = models.IntegerField(primary_key=True)
    timestamp = models.DateTimeField()
    follow_up_date = models.DateField()

    class Meta:
        managed = False
        db_table = 'out_patient_history'


class OutPatientHistory202110(models.Model):
    id = models.IntegerField(primary_key=True)
    timestamp = models.DateTimeField()
    follow_up_date = models.DateField()

    class Meta:
        managed = False
        db_table = 'out_patient_history_2021_10'


class Patient(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=150)
    address = models.CharField(max_length=150)
    phone = models.CharField(max_length=150)
    birth_date = models.DateField()
    race = models.CharField(max_length=150)
    martial_status = models.CharField(max_length=150)
    gender = models.CharField(max_length=150)
    blood_group = models.CharField(max_length=150)
    tbl_last_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'patient'


class PatientEmergencyContact(models.Model):
    patient = models.ForeignKey(Patient, models.DO_NOTHING)
    emergency_contact = models.ForeignKey(EmergencyContact, models.DO_NOTHING)
    tbl_last_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'patient_emergency_contact'


class PatientInsurance(models.Model):
    patient = models.ForeignKey(Patient, models.DO_NOTHING)
    insurance = models.ForeignKey(Insurance, models.DO_NOTHING)
    tbl_last_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'patient_insurance'


class PatientInvoice(models.Model):
    patient = models.ForeignKey(Patient, models.DO_NOTHING)
    invoice = models.ForeignKey(Invoice, models.DO_NOTHING)
    tbl_last_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'patient_invoice'


class PatientRegistration(models.Model):
    patient = models.ForeignKey(Patient, models.DO_NOTHING)
    registration = models.ForeignKey('Registration', models.DO_NOTHING)
    tbl_last_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'patient_registration'


class PatientTreatment(models.Model):
    patient = models.ForeignKey(Patient, models.DO_NOTHING)
    treatment = models.ForeignKey('Treatment', models.DO_NOTHING)
    tbl_last_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'patient_treatment'


class Registration(models.Model):
    id = models.IntegerField(primary_key=True)
    registration_date = models.DateField()
    tbl_last_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'registration'


class RegistrationTreatment(models.Model):
    registration = models.ForeignKey(Registration, models.DO_NOTHING)
    treatment = models.ForeignKey('Treatment', models.DO_NOTHING)
    tbl_last_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'registration_treatment'


class SurgeryTreatment(models.Model):
    id = models.OneToOneField('Treatment', models.DO_NOTHING, db_column='id', primary_key=True)
    surgery = models.CharField(max_length=150)
    description = models.CharField(max_length=150)
    date = models.DateField()
    result = models.CharField(max_length=150)
    tbl_last_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'surgery_treatment'


class Treatment(models.Model):
    id = models.IntegerField(primary_key=True)
    date = models.DateField()
    type = models.CharField(max_length=150)
    result_status = models.CharField(max_length=150)
    description = models.CharField(max_length=150)
    tbl_last_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'treatment'


class TreatmentHistory(models.Model):
    id = models.IntegerField(primary_key=True)
    timestamp = models.DateTimeField()
    date = models.DateField()
    type = models.CharField(max_length=150)
    result_status = models.CharField(max_length=150)
    description = models.CharField(max_length=150)

    class Meta:
        managed = False
        db_table = 'treatment_history'


class TreatmentHistory202110(models.Model):
    id = models.IntegerField(primary_key=True)
    timestamp = models.DateTimeField()
    date = models.DateField()
    type = models.CharField(max_length=150)
    result_status = models.CharField(max_length=150)
    description = models.CharField(max_length=150)

    class Meta:
        managed = False
        db_table = 'treatment_history_2021_10'
