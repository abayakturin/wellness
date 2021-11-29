# Generated by Django 3.0.7 on 2021-11-29 20:09

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='AuthGroup',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=150, unique=True)),
            ],
            options={
                'db_table': 'auth_group',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='AuthGroupPermissions',
            fields=[
                ('id', models.BigAutoField(primary_key=True, serialize=False)),
            ],
            options={
                'db_table': 'auth_group_permissions',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='AuthPermission',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('codename', models.CharField(max_length=100)),
            ],
            options={
                'db_table': 'auth_permission',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='AuthUser',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('password', models.CharField(max_length=128)),
                ('last_login', models.DateTimeField(blank=True, null=True)),
                ('is_superuser', models.BooleanField()),
                ('username', models.CharField(max_length=150, unique=True)),
                ('first_name', models.CharField(max_length=150)),
                ('last_name', models.CharField(max_length=150)),
                ('email', models.CharField(max_length=254)),
                ('is_staff', models.BooleanField()),
                ('is_active', models.BooleanField()),
                ('date_joined', models.DateTimeField()),
            ],
            options={
                'db_table': 'auth_user',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='AuthUserGroups',
            fields=[
                ('id', models.BigAutoField(primary_key=True, serialize=False)),
            ],
            options={
                'db_table': 'auth_user_groups',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='AuthUserUserPermissions',
            fields=[
                ('id', models.BigAutoField(primary_key=True, serialize=False)),
            ],
            options={
                'db_table': 'auth_user_user_permissions',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='ConsultingDoctorHistory',
            fields=[
                ('name', models.CharField(max_length=150)),
                ('timestamp', models.DateTimeField()),
                ('contract_date', models.DateField()),
                ('contract_phone', models.CharField(max_length=150)),
                ('weekly_pay', models.IntegerField()),
                ('min_weekly_hours', models.IntegerField()),
                ('overtime_hourly_pay', models.IntegerField()),
                ('id', models.IntegerField(primary_key=True, serialize=False)),
            ],
            options={
                'db_table': 'consulting_doctor_history',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='ConsultingDoctorHistory202110',
            fields=[
                ('name', models.CharField(max_length=150)),
                ('timestamp', models.DateTimeField()),
                ('contract_date', models.DateField()),
                ('contract_phone', models.CharField(max_length=150)),
                ('weekly_pay', models.IntegerField()),
                ('min_weekly_hours', models.IntegerField()),
                ('overtime_hourly_pay', models.IntegerField()),
                ('id', models.IntegerField(primary_key=True, serialize=False)),
            ],
            options={
                'db_table': 'consulting_doctor_history_2021_10',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Department',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=150)),
                ('phone', models.CharField(max_length=150)),
                ('location', models.CharField(max_length=150)),
                ('tbl_last_date', models.DateTimeField()),
            ],
            options={
                'db_table': 'department',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='DepartmentDoctor',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tbl_last_date', models.DateTimeField()),
            ],
            options={
                'db_table': 'department_doctor',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='DepartmentPatient',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tbl_last_date', models.DateTimeField()),
            ],
            options={
                'db_table': 'department_patient',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Disease',
            fields=[
                ('icd', models.IntegerField(primary_key=True, serialize=False)),
                ('description', models.CharField(max_length=150)),
                ('type', models.CharField(max_length=150)),
                ('tbl_last_date', models.DateTimeField()),
            ],
            options={
                'db_table': 'disease',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='DjangoAdminLog',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('action_time', models.DateTimeField()),
                ('object_id', models.TextField(blank=True, null=True)),
                ('object_repr', models.CharField(max_length=200)),
                ('action_flag', models.SmallIntegerField()),
                ('change_message', models.TextField()),
            ],
            options={
                'db_table': 'django_admin_log',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='DjangoContentType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('app_label', models.CharField(max_length=100)),
                ('model', models.CharField(max_length=100)),
            ],
            options={
                'db_table': 'django_content_type',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='DjangoMigrations',
            fields=[
                ('id', models.BigAutoField(primary_key=True, serialize=False)),
                ('app', models.CharField(max_length=255)),
                ('name', models.CharField(max_length=255)),
                ('applied', models.DateTimeField()),
            ],
            options={
                'db_table': 'django_migrations',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='DjangoSession',
            fields=[
                ('session_key', models.CharField(max_length=40, primary_key=True, serialize=False)),
                ('session_data', models.TextField()),
                ('expire_date', models.DateTimeField()),
            ],
            options={
                'db_table': 'django_session',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Doctor',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=150)),
                ('office_phone', models.CharField(max_length=150)),
                ('personal_phone', models.CharField(max_length=150)),
                ('specialty', models.CharField(max_length=150)),
                ('tbl_last_date', models.DateTimeField()),
            ],
            options={
                'db_table': 'doctor',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='DoctorDisease',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tbl_last_date', models.DateTimeField()),
            ],
            options={
                'db_table': 'doctor_disease',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='DoctorPatient',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tbl_last_date', models.DateTimeField()),
            ],
            options={
                'db_table': 'doctor_patient',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='EmergencyContact',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=150)),
                ('address', models.CharField(max_length=150)),
                ('phone', models.CharField(max_length=150)),
                ('relationship', models.CharField(max_length=150)),
                ('tbl_last_date', models.DateTimeField()),
            ],
            options={
                'db_table': 'emergency_contact',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='FulltimeDoctorHistory',
            fields=[
                ('name', models.CharField(max_length=150)),
                ('timestamp', models.DateTimeField()),
                ('hire_date', models.DateField()),
                ('annual_pay', models.IntegerField()),
                ('id', models.IntegerField(primary_key=True, serialize=False)),
            ],
            options={
                'db_table': 'fulltime_doctor_history',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='FulltimeDoctorHistory202110',
            fields=[
                ('name', models.CharField(max_length=150)),
                ('timestamp', models.DateTimeField()),
                ('hire_date', models.DateField()),
                ('annual_pay', models.IntegerField()),
                ('id', models.IntegerField(primary_key=True, serialize=False)),
            ],
            options={
                'db_table': 'fulltime_doctor_history_2021_10',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Hospital',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=150)),
                ('address', models.CharField(max_length=150)),
                ('specialty', models.CharField(max_length=150)),
                ('emergency_phone', models.CharField(max_length=150)),
                ('general_phone', models.CharField(max_length=150)),
                ('registration_phone', models.CharField(max_length=150)),
                ('admin_phone', models.CharField(max_length=150)),
                ('tbl_last_date', models.DateTimeField()),
            ],
            options={
                'db_table': 'hospital',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='HospitalDepartment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tbl_last_date', models.DateTimeField()),
            ],
            options={
                'db_table': 'hospital_department',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='InPatientHistory',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('timestamp', models.DateTimeField()),
                ('bed_number', models.IntegerField()),
                ('floor', models.IntegerField()),
                ('discharge_date', models.DateField()),
            ],
            options={
                'db_table': 'in_patient_history',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='InPatientHistory202110',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('timestamp', models.DateTimeField()),
                ('bed_number', models.IntegerField()),
                ('floor', models.IntegerField()),
                ('discharge_date', models.DateField()),
            ],
            options={
                'db_table': 'in_patient_history_2021_10',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Insurance',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('insurance_company', models.CharField(max_length=50)),
                ('insurance_number', models.IntegerField()),
                ('tbl_last_date', models.DateTimeField()),
            ],
            options={
                'db_table': 'insurance',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='InsuranceInvoice',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tbl_last_date', models.DateTimeField()),
            ],
            options={
                'db_table': 'insurance_invoice',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Invoice',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('date', models.DateField()),
                ('amount', models.FloatField()),
                ('payment_type', models.CharField(max_length=150)),
                ('tbl_last_date', models.DateTimeField()),
            ],
            options={
                'db_table': 'invoice',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='OutPatientHistory',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('timestamp', models.DateTimeField()),
                ('follow_up_date', models.DateField()),
            ],
            options={
                'db_table': 'out_patient_history',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='OutPatientHistory202110',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('timestamp', models.DateTimeField()),
                ('follow_up_date', models.DateField()),
            ],
            options={
                'db_table': 'out_patient_history_2021_10',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Patient',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=150)),
                ('address', models.CharField(max_length=150)),
                ('phone', models.CharField(max_length=150)),
                ('birth_date', models.DateField()),
                ('race', models.CharField(max_length=150)),
                ('martial_status', models.CharField(max_length=150)),
                ('gender', models.CharField(max_length=150)),
                ('blood_group', models.CharField(max_length=150)),
                ('tbl_last_date', models.DateTimeField()),
            ],
            options={
                'db_table': 'patient',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='PatientEmergencyContact',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tbl_last_date', models.DateTimeField()),
            ],
            options={
                'db_table': 'patient_emergency_contact',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='PatientInsurance',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tbl_last_date', models.DateTimeField()),
            ],
            options={
                'db_table': 'patient_insurance',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='PatientInvoice',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tbl_last_date', models.DateTimeField()),
            ],
            options={
                'db_table': 'patient_invoice',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='PatientRegistration',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tbl_last_date', models.DateTimeField()),
            ],
            options={
                'db_table': 'patient_registration',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='PatientTreatment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tbl_last_date', models.DateTimeField()),
            ],
            options={
                'db_table': 'patient_treatment',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Registration',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('registration_date', models.DateField()),
                ('tbl_last_date', models.DateTimeField()),
            ],
            options={
                'db_table': 'registration',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RegistrationTreatment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tbl_last_date', models.DateTimeField()),
            ],
            options={
                'db_table': 'registration_treatment',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Treatment',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('date', models.DateField()),
                ('type', models.CharField(max_length=150)),
                ('result_status', models.CharField(max_length=150)),
                ('description', models.CharField(max_length=150)),
                ('tbl_last_date', models.DateTimeField()),
            ],
            options={
                'db_table': 'treatment',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='TreatmentHistory',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('timestamp', models.DateTimeField()),
                ('date', models.DateField()),
                ('type', models.CharField(max_length=150)),
                ('result_status', models.CharField(max_length=150)),
                ('description', models.CharField(max_length=150)),
            ],
            options={
                'db_table': 'treatment_history',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='TreatmentHistory202110',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('timestamp', models.DateTimeField()),
                ('date', models.DateField()),
                ('type', models.CharField(max_length=150)),
                ('result_status', models.CharField(max_length=150)),
                ('description', models.CharField(max_length=150)),
            ],
            options={
                'db_table': 'treatment_history_2021_10',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='ConsultingDoctor',
            fields=[
                ('name', models.CharField(max_length=150)),
                ('contract_date', models.DateField()),
                ('contract_phone', models.CharField(max_length=150)),
                ('weekly_pay', models.IntegerField()),
                ('min_weekly_hours', models.IntegerField()),
                ('overtime_hourly_pay', models.IntegerField()),
                ('tbl_last_date', models.DateTimeField()),
                ('id', models.OneToOneField(db_column='id', on_delete=django.db.models.deletion.DO_NOTHING, primary_key=True, serialize=False, to='wellness.Doctor')),
            ],
            options={
                'db_table': 'consulting_doctor',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='DrugTreatment',
            fields=[
                ('id', models.OneToOneField(db_column='id', on_delete=django.db.models.deletion.DO_NOTHING, primary_key=True, serialize=False, to='wellness.Treatment')),
                ('drug', models.CharField(max_length=150)),
                ('dose', models.CharField(max_length=150)),
                ('tbl_last_date', models.DateTimeField()),
            ],
            options={
                'db_table': 'drug_treatment',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='FulltimeDoctor',
            fields=[
                ('name', models.CharField(max_length=150)),
                ('hire_date', models.DateField()),
                ('annual_pay', models.IntegerField()),
                ('tbl_last_date', models.DateTimeField()),
                ('id', models.OneToOneField(db_column='id', on_delete=django.db.models.deletion.DO_NOTHING, primary_key=True, serialize=False, to='wellness.Doctor')),
            ],
            options={
                'db_table': 'fulltime_doctor',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='InPatient',
            fields=[
                ('id', models.OneToOneField(db_column='id', on_delete=django.db.models.deletion.DO_NOTHING, primary_key=True, serialize=False, to='wellness.Patient')),
                ('bed_number', models.IntegerField()),
                ('floor', models.IntegerField()),
                ('discharge_date', models.DateField()),
                ('tbl_last_date', models.DateTimeField()),
            ],
            options={
                'db_table': 'in_patient',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='LaboratoryTreatment',
            fields=[
                ('laboratory', models.CharField(max_length=150)),
                ('test_type', models.CharField(max_length=150)),
                ('test_date', models.DateField()),
                ('test_result', models.CharField(max_length=150)),
                ('tbl_last_date', models.DateTimeField()),
                ('id', models.OneToOneField(db_column='id', on_delete=django.db.models.deletion.DO_NOTHING, primary_key=True, serialize=False, to='wellness.Treatment')),
            ],
            options={
                'db_table': 'laboratory_treatment',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='OutPatient',
            fields=[
                ('id', models.OneToOneField(db_column='id', on_delete=django.db.models.deletion.DO_NOTHING, primary_key=True, serialize=False, to='wellness.Patient')),
                ('follow_up_date', models.DateField()),
                ('tbl_last_date', models.DateTimeField()),
            ],
            options={
                'db_table': 'out_patient',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='SurgeryTreatment',
            fields=[
                ('id', models.OneToOneField(db_column='id', on_delete=django.db.models.deletion.DO_NOTHING, primary_key=True, serialize=False, to='wellness.Treatment')),
                ('surgery', models.CharField(max_length=150)),
                ('description', models.CharField(max_length=150)),
                ('date', models.DateField()),
                ('result', models.CharField(max_length=150)),
                ('tbl_last_date', models.DateTimeField()),
            ],
            options={
                'db_table': 'surgery_treatment',
                'managed': False,
            },
        ),
    ]