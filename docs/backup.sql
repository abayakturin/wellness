PGDMP          1            	    y           postgres    13.3    13.4 Q    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    14301    postgres    DATABASE     ]   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';
    DROP DATABASE postgres;
                aa8381    false            ?           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   aa8381    false    4019            ?            1255    26209    update_tbl_last_date_column()    FUNCTION     ?   CREATE FUNCTION public.update_tbl_last_date_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.TBL_LAST_DATE = now();
    RETURN NEW; 
END;
$$;
 4   DROP FUNCTION public.update_tbl_last_date_column();
       public          aa8381    false            ?            1259    26047    consulting_doctor    TABLE     u  CREATE TABLE public.consulting_doctor (
    id integer NOT NULL,
    name character varying NOT NULL,
    contract_date date NOT NULL,
    contract_phone character varying NOT NULL,
    weekly_pay integer NOT NULL,
    min_weekly_hours integer NOT NULL,
    overtime_hourly_pay integer NOT NULL,
    "TBL_LAST_DATE" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 %   DROP TABLE public.consulting_doctor;
       public         heap    aa8381    false            ?            1259    25968 
   department    TABLE       CREATE TABLE public.department (
    id integer NOT NULL,
    hospital_id integer,
    name character varying NOT NULL,
    phone character varying NOT NULL,
    location character varying NOT NULL,
    "TBL_LAST_DATE" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.department;
       public         heap    aa8381    false            ?            1259    26111    disease    TABLE     ?   CREATE TABLE public.disease (
    icd integer NOT NULL,
    description character varying NOT NULL,
    type character varying NOT NULL,
    "TBL_LAST_DATE" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.disease;
       public         heap    aa8381    false            ?            1259    25987    doctor    TABLE     ?  CREATE TABLE public.doctor (
    id integer NOT NULL,
    name character varying NOT NULL,
    office_phone character varying NOT NULL,
    personal_phone character varying NOT NULL,
    specialty character varying NOT NULL,
    patient_id integer NOT NULL,
    disease_id integer NOT NULL,
    department_id integer NOT NULL,
    "TBL_LAST_DATE" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.doctor;
       public         heap    aa8381    false            ?            1259    26167    drug_treatment    TABLE     ?   CREATE TABLE public.drug_treatment (
    id integer NOT NULL,
    drug character varying NOT NULL,
    dose character varying NOT NULL,
    "TBL_LAST_DATE" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 "   DROP TABLE public.drug_treatment;
       public         heap    aa8381    false            ?            1259    26061    emergency_contact    TABLE     .  CREATE TABLE public.emergency_contact (
    id integer NOT NULL,
    name character varying NOT NULL,
    address character varying NOT NULL,
    phone character varying NOT NULL,
    relationship character varying NOT NULL,
    "TBL_LAST_DATE" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 %   DROP TABLE public.emergency_contact;
       public         heap    aa8381    false            ?            1259    26033    fulltime_doctor    TABLE     ?   CREATE TABLE public.fulltime_doctor (
    id integer NOT NULL,
    name character varying NOT NULL,
    hire_date date NOT NULL,
    annual_pay integer NOT NULL,
    "TBL_LAST_DATE" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 #   DROP TABLE public.fulltime_doctor;
       public         heap    aa8381    false            ?            1259    25957    hospital    TABLE     ?  CREATE TABLE public.hospital (
    id integer NOT NULL,
    name character varying NOT NULL,
    address character varying NOT NULL,
    specialty character varying NOT NULL,
    emergency_phone character varying[] NOT NULL,
    general_phone character varying[] NOT NULL,
    registration_phone character varying[] NOT NULL,
    admin_phone character varying[] NOT NULL,
    department_id integer NOT NULL,
    "TBL_LAST_DATE" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.hospital;
       public         heap    aa8381    false            ?            1259    26075 
   in_patient    TABLE     ?   CREATE TABLE public.in_patient (
    id integer NOT NULL,
    bed_number integer NOT NULL,
    floor integer NOT NULL,
    discharge_date date NOT NULL,
    "TBL_LAST_DATE" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.in_patient;
       public         heap    aa8381    false            ?            1259    26195    invoice    TABLE     :  CREATE TABLE public.invoice (
    id integer NOT NULL,
    patient_id integer NOT NULL,
    insurance_company character varying NOT NULL,
    date date NOT NULL,
    amount double precision NOT NULL,
    type character varying NOT NULL,
    "TBL_LAST_DATE" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.invoice;
       public         heap    aa8381    false            ?            1259    26153    laboratory_treatment    TABLE     /  CREATE TABLE public.laboratory_treatment (
    id integer NOT NULL,
    laboratory character varying NOT NULL,
    test_type character varying NOT NULL,
    test_date date NOT NULL,
    test_result character varying NOT NULL,
    "TBL_LAST_DATE" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 (   DROP TABLE public.laboratory_treatment;
       public         heap    aa8381    false            ?            1259    26086    out_patient    TABLE     ?   CREATE TABLE public.out_patient (
    id integer NOT NULL,
    follow_up_date date NOT NULL,
    "TBL_LAST_DATE" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.out_patient;
       public         heap    aa8381    false            ?            1259    26005    patient    TABLE     ?  CREATE TABLE public.patient (
    id integer NOT NULL,
    hospital_id integer,
    department_id integer,
    name character varying NOT NULL,
    address character varying NOT NULL,
    phone character varying NOT NULL,
    birth_date date NOT NULL,
    race character varying NOT NULL,
    martial_status character varying NOT NULL,
    gender character varying NOT NULL,
    insurance_company character varying NOT NULL,
    insurance_phone character varying NOT NULL,
    blood_group character varying NOT NULL,
    emergency_contact_id integer NOT NULL,
    doctor_id integer NOT NULL,
    treatment_id integer NOT NULL,
    "TBL_LAST_DATE" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.patient;
       public         heap    aa8381    false            ?            1259    26097    registration    TABLE       CREATE TABLE public.registration (
    registration_id integer NOT NULL,
    treatment character varying NOT NULL,
    patient_id integer NOT NULL,
    registration_date date NOT NULL,
    "TBL_LAST_DATE" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
     DROP TABLE public.registration;
       public         heap    aa8381    false            ?            1259    26181    surgery_treatment    TABLE     !  CREATE TABLE public.surgery_treatment (
    id integer NOT NULL,
    surgery character varying NOT NULL,
    description character varying NOT NULL,
    date date NOT NULL,
    result character varying NOT NULL,
    "TBL_LAST_DATE" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 %   DROP TABLE public.surgery_treatment;
       public         heap    aa8381    false            ?            1259    26125 	   treatment    TABLE       CREATE TABLE public.treatment (
    id integer NOT NULL,
    date date NOT NULL,
    type character varying NOT NULL,
    result_status character varying NOT NULL,
    description character varying NOT NULL,
    "TBL_LAST_DATE" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.treatment;
       public         heap    aa8381    false            ?            1259    26139    treatment_type    TABLE     ?   CREATE TABLE public.treatment_type (
    id integer NOT NULL,
    treatment_type character varying NOT NULL,
    "TBL_LAST_DATE" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 "   DROP TABLE public.treatment_type;
       public         heap    aa8381    false            ?           2606    26055 (   consulting_doctor consulting_doctor_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.consulting_doctor
    ADD CONSTRAINT consulting_doctor_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.consulting_doctor DROP CONSTRAINT consulting_doctor_pkey;
       public            aa8381    false    205            ?           2606    25976    department department_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.department DROP CONSTRAINT department_pkey;
       public            aa8381    false    201            ?           2606    26119    disease disease_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.disease
    ADD CONSTRAINT disease_pkey PRIMARY KEY (icd);
 >   ALTER TABLE ONLY public.disease DROP CONSTRAINT disease_pkey;
       public            aa8381    false    210            ?           2606    25999    doctor doctor_disease_id_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_disease_id_key UNIQUE (disease_id);
 F   ALTER TABLE ONLY public.doctor DROP CONSTRAINT doctor_disease_id_key;
       public            aa8381    false    202            ?           2606    25997    doctor doctor_patient_id_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_patient_id_key UNIQUE (patient_id);
 F   ALTER TABLE ONLY public.doctor DROP CONSTRAINT doctor_patient_id_key;
       public            aa8381    false    202            ?           2606    25995    doctor doctor_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.doctor DROP CONSTRAINT doctor_pkey;
       public            aa8381    false    202                       2606    26175 "   drug_treatment drug_treatment_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.drug_treatment
    ADD CONSTRAINT drug_treatment_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.drug_treatment DROP CONSTRAINT drug_treatment_pkey;
       public            aa8381    false    214            ?           2606    26069 (   emergency_contact emergency_contact_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.emergency_contact
    ADD CONSTRAINT emergency_contact_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.emergency_contact DROP CONSTRAINT emergency_contact_pkey;
       public            aa8381    false    206            ?           2606    26041 $   fulltime_doctor fulltime_doctor_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.fulltime_doctor
    ADD CONSTRAINT fulltime_doctor_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.fulltime_doctor DROP CONSTRAINT fulltime_doctor_pkey;
       public            aa8381    false    204            ?           2606    25967 #   hospital hospital_department_id_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.hospital
    ADD CONSTRAINT hospital_department_id_key UNIQUE (department_id);
 M   ALTER TABLE ONLY public.hospital DROP CONSTRAINT hospital_department_id_key;
       public            aa8381    false    200            ?           2606    25965    hospital hospital_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.hospital
    ADD CONSTRAINT hospital_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.hospital DROP CONSTRAINT hospital_pkey;
       public            aa8381    false    200            ?           2606    26080    in_patient in_patient_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.in_patient
    ADD CONSTRAINT in_patient_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.in_patient DROP CONSTRAINT in_patient_pkey;
       public            aa8381    false    207                       2606    26203    invoice invoice_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.invoice DROP CONSTRAINT invoice_pkey;
       public            aa8381    false    216                       2606    26161 .   laboratory_treatment laboratory_treatment_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.laboratory_treatment
    ADD CONSTRAINT laboratory_treatment_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.laboratory_treatment DROP CONSTRAINT laboratory_treatment_pkey;
       public            aa8381    false    213            ?           2606    26091    out_patient out_patient_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.out_patient
    ADD CONSTRAINT out_patient_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.out_patient DROP CONSTRAINT out_patient_pkey;
       public            aa8381    false    208            ?           2606    26015 (   patient patient_emergency_contact_id_key 
   CONSTRAINT     s   ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_emergency_contact_id_key UNIQUE (emergency_contact_id);
 R   ALTER TABLE ONLY public.patient DROP CONSTRAINT patient_emergency_contact_id_key;
       public            aa8381    false    203            ?           2606    26013    patient patient_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.patient DROP CONSTRAINT patient_pkey;
       public            aa8381    false    203            ?           2606    26017     patient patient_treatment_id_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_treatment_id_key UNIQUE (treatment_id);
 J   ALTER TABLE ONLY public.patient DROP CONSTRAINT patient_treatment_id_key;
       public            aa8381    false    203            ?           2606    26105    registration registration_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.registration
    ADD CONSTRAINT registration_pkey PRIMARY KEY (registration_id);
 H   ALTER TABLE ONLY public.registration DROP CONSTRAINT registration_pkey;
       public            aa8381    false    209                       2606    26189 (   surgery_treatment surgery_treatment_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.surgery_treatment
    ADD CONSTRAINT surgery_treatment_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.surgery_treatment DROP CONSTRAINT surgery_treatment_pkey;
       public            aa8381    false    215            ?           2606    26133    treatment treatment_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.treatment
    ADD CONSTRAINT treatment_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.treatment DROP CONSTRAINT treatment_pkey;
       public            aa8381    false    211            ?           2606    26147 "   treatment_type treatment_type_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.treatment_type
    ADD CONSTRAINT treatment_type_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.treatment_type DROP CONSTRAINT treatment_type_pkey;
       public            aa8381    false    212                        2620    26214 .   consulting_doctor update_tbl_last_date_modtime    TRIGGER     ?   CREATE TRIGGER update_tbl_last_date_modtime BEFORE UPDATE ON public.consulting_doctor FOR EACH ROW EXECUTE FUNCTION public.update_tbl_last_date_column();
 G   DROP TRIGGER update_tbl_last_date_modtime ON public.consulting_doctor;
       public          aa8381    false    205    217                       2620    26211 '   department update_tbl_last_date_modtime    TRIGGER     ?   CREATE TRIGGER update_tbl_last_date_modtime BEFORE UPDATE ON public.department FOR EACH ROW EXECUTE FUNCTION public.update_tbl_last_date_column();
 @   DROP TRIGGER update_tbl_last_date_modtime ON public.department;
       public          aa8381    false    217    201            %           2620    26220 $   disease update_tbl_last_date_modtime    TRIGGER     ?   CREATE TRIGGER update_tbl_last_date_modtime BEFORE UPDATE ON public.disease FOR EACH ROW EXECUTE FUNCTION public.update_tbl_last_date_column();
 =   DROP TRIGGER update_tbl_last_date_modtime ON public.disease;
       public          aa8381    false    210    217                       2620    26212 #   doctor update_tbl_last_date_modtime    TRIGGER     ?   CREATE TRIGGER update_tbl_last_date_modtime BEFORE UPDATE ON public.doctor FOR EACH ROW EXECUTE FUNCTION public.update_tbl_last_date_column();
 <   DROP TRIGGER update_tbl_last_date_modtime ON public.doctor;
       public          aa8381    false    202    217            )           2620    26224 +   drug_treatment update_tbl_last_date_modtime    TRIGGER     ?   CREATE TRIGGER update_tbl_last_date_modtime BEFORE UPDATE ON public.drug_treatment FOR EACH ROW EXECUTE FUNCTION public.update_tbl_last_date_column();
 D   DROP TRIGGER update_tbl_last_date_modtime ON public.drug_treatment;
       public          aa8381    false    214    217            !           2620    26216 .   emergency_contact update_tbl_last_date_modtime    TRIGGER     ?   CREATE TRIGGER update_tbl_last_date_modtime BEFORE UPDATE ON public.emergency_contact FOR EACH ROW EXECUTE FUNCTION public.update_tbl_last_date_column();
 G   DROP TRIGGER update_tbl_last_date_modtime ON public.emergency_contact;
       public          aa8381    false    217    206                       2620    26213 ,   fulltime_doctor update_tbl_last_date_modtime    TRIGGER     ?   CREATE TRIGGER update_tbl_last_date_modtime BEFORE UPDATE ON public.fulltime_doctor FOR EACH ROW EXECUTE FUNCTION public.update_tbl_last_date_column();
 E   DROP TRIGGER update_tbl_last_date_modtime ON public.fulltime_doctor;
       public          aa8381    false    217    204                       2620    26210 %   hospital update_tbl_last_date_modtime    TRIGGER     ?   CREATE TRIGGER update_tbl_last_date_modtime BEFORE UPDATE ON public.hospital FOR EACH ROW EXECUTE FUNCTION public.update_tbl_last_date_column();
 >   DROP TRIGGER update_tbl_last_date_modtime ON public.hospital;
       public          aa8381    false    217    200            "           2620    26217 '   in_patient update_tbl_last_date_modtime    TRIGGER     ?   CREATE TRIGGER update_tbl_last_date_modtime BEFORE UPDATE ON public.in_patient FOR EACH ROW EXECUTE FUNCTION public.update_tbl_last_date_column();
 @   DROP TRIGGER update_tbl_last_date_modtime ON public.in_patient;
       public          aa8381    false    217    207            +           2620    26226 $   invoice update_tbl_last_date_modtime    TRIGGER     ?   CREATE TRIGGER update_tbl_last_date_modtime BEFORE UPDATE ON public.invoice FOR EACH ROW EXECUTE FUNCTION public.update_tbl_last_date_column();
 =   DROP TRIGGER update_tbl_last_date_modtime ON public.invoice;
       public          aa8381    false    217    216            (           2620    26223 1   laboratory_treatment update_tbl_last_date_modtime    TRIGGER     ?   CREATE TRIGGER update_tbl_last_date_modtime BEFORE UPDATE ON public.laboratory_treatment FOR EACH ROW EXECUTE FUNCTION public.update_tbl_last_date_column();
 J   DROP TRIGGER update_tbl_last_date_modtime ON public.laboratory_treatment;
       public          aa8381    false    217    213            #           2620    26218 (   out_patient update_tbl_last_date_modtime    TRIGGER     ?   CREATE TRIGGER update_tbl_last_date_modtime BEFORE UPDATE ON public.out_patient FOR EACH ROW EXECUTE FUNCTION public.update_tbl_last_date_column();
 A   DROP TRIGGER update_tbl_last_date_modtime ON public.out_patient;
       public          aa8381    false    208    217                       2620    26215 $   patient update_tbl_last_date_modtime    TRIGGER     ?   CREATE TRIGGER update_tbl_last_date_modtime BEFORE UPDATE ON public.patient FOR EACH ROW EXECUTE FUNCTION public.update_tbl_last_date_column();
 =   DROP TRIGGER update_tbl_last_date_modtime ON public.patient;
       public          aa8381    false    217    203            $           2620    26219 )   registration update_tbl_last_date_modtime    TRIGGER     ?   CREATE TRIGGER update_tbl_last_date_modtime BEFORE UPDATE ON public.registration FOR EACH ROW EXECUTE FUNCTION public.update_tbl_last_date_column();
 B   DROP TRIGGER update_tbl_last_date_modtime ON public.registration;
       public          aa8381    false    217    209            *           2620    26225 .   surgery_treatment update_tbl_last_date_modtime    TRIGGER     ?   CREATE TRIGGER update_tbl_last_date_modtime BEFORE UPDATE ON public.surgery_treatment FOR EACH ROW EXECUTE FUNCTION public.update_tbl_last_date_column();
 G   DROP TRIGGER update_tbl_last_date_modtime ON public.surgery_treatment;
       public          aa8381    false    215    217            &           2620    26221 &   treatment update_tbl_last_date_modtime    TRIGGER     ?   CREATE TRIGGER update_tbl_last_date_modtime BEFORE UPDATE ON public.treatment FOR EACH ROW EXECUTE FUNCTION public.update_tbl_last_date_column();
 ?   DROP TRIGGER update_tbl_last_date_modtime ON public.treatment;
       public          aa8381    false    217    211            '           2620    26222 +   treatment_type update_tbl_last_date_modtime    TRIGGER     ?   CREATE TRIGGER update_tbl_last_date_modtime BEFORE UPDATE ON public.treatment_type FOR EACH ROW EXECUTE FUNCTION public.update_tbl_last_date_column();
 D   DROP TRIGGER update_tbl_last_date_modtime ON public.treatment_type;
       public          aa8381    false    217    212                       2606    26056 +   consulting_doctor consulting_doctor_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.consulting_doctor
    ADD CONSTRAINT consulting_doctor_id_fkey FOREIGN KEY (id) REFERENCES public.doctor(id);
 U   ALTER TABLE ONLY public.consulting_doctor DROP CONSTRAINT consulting_doctor_id_fkey;
       public          aa8381    false    202    205    3815            	           2606    25982 &   department department_hospital_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_hospital_id_fkey FOREIGN KEY (hospital_id) REFERENCES public.hospital(id);
 P   ALTER TABLE ONLY public.department DROP CONSTRAINT department_hospital_id_fkey;
       public          aa8381    false    3807    200    201                       2606    25977    department department_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_id_fkey FOREIGN KEY (id) REFERENCES public.hospital(department_id);
 G   ALTER TABLE ONLY public.department DROP CONSTRAINT department_id_fkey;
       public          aa8381    false    3805    201    200                       2606    26120    disease disease_icd_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.disease
    ADD CONSTRAINT disease_icd_fkey FOREIGN KEY (icd) REFERENCES public.doctor(disease_id);
 B   ALTER TABLE ONLY public.disease DROP CONSTRAINT disease_icd_fkey;
       public          aa8381    false    210    202    3811            
           2606    26000     doctor doctor_department_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.department(id);
 J   ALTER TABLE ONLY public.doctor DROP CONSTRAINT doctor_department_id_fkey;
       public          aa8381    false    3809    201    202                       2606    26176 %   drug_treatment drug_treatment_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.drug_treatment
    ADD CONSTRAINT drug_treatment_id_fkey FOREIGN KEY (id) REFERENCES public.treatment_type(id);
 O   ALTER TABLE ONLY public.drug_treatment DROP CONSTRAINT drug_treatment_id_fkey;
       public          aa8381    false    214    3839    212                       2606    26070 +   emergency_contact emergency_contact_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.emergency_contact
    ADD CONSTRAINT emergency_contact_id_fkey FOREIGN KEY (id) REFERENCES public.patient(emergency_contact_id);
 U   ALTER TABLE ONLY public.emergency_contact DROP CONSTRAINT emergency_contact_id_fkey;
       public          aa8381    false    3817    206    203                       2606    26042 '   fulltime_doctor fulltime_doctor_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.fulltime_doctor
    ADD CONSTRAINT fulltime_doctor_id_fkey FOREIGN KEY (id) REFERENCES public.doctor(id);
 Q   ALTER TABLE ONLY public.fulltime_doctor DROP CONSTRAINT fulltime_doctor_id_fkey;
       public          aa8381    false    202    3815    204                       2606    26081    in_patient in_patient_id_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public.in_patient
    ADD CONSTRAINT in_patient_id_fkey FOREIGN KEY (id) REFERENCES public.patient(id);
 G   ALTER TABLE ONLY public.in_patient DROP CONSTRAINT in_patient_id_fkey;
       public          aa8381    false    207    203    3819                       2606    26204    invoice invoice_patient_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patient(id);
 I   ALTER TABLE ONLY public.invoice DROP CONSTRAINT invoice_patient_id_fkey;
       public          aa8381    false    216    3819    203                       2606    26162 1   laboratory_treatment laboratory_treatment_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.laboratory_treatment
    ADD CONSTRAINT laboratory_treatment_id_fkey FOREIGN KEY (id) REFERENCES public.treatment_type(id);
 [   ALTER TABLE ONLY public.laboratory_treatment DROP CONSTRAINT laboratory_treatment_id_fkey;
       public          aa8381    false    3839    212    213                       2606    26092    out_patient out_patient_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.out_patient
    ADD CONSTRAINT out_patient_id_fkey FOREIGN KEY (id) REFERENCES public.patient(id);
 I   ALTER TABLE ONLY public.out_patient DROP CONSTRAINT out_patient_id_fkey;
       public          aa8381    false    203    3819    208                       2606    26023 "   patient patient_department_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.department(id);
 L   ALTER TABLE ONLY public.patient DROP CONSTRAINT patient_department_id_fkey;
       public          aa8381    false    3809    203    201                       2606    26028    patient patient_doctor_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_doctor_id_fkey FOREIGN KEY (doctor_id) REFERENCES public.doctor(id);
 H   ALTER TABLE ONLY public.patient DROP CONSTRAINT patient_doctor_id_fkey;
       public          aa8381    false    3815    203    202                       2606    26018     patient patient_hospital_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_hospital_id_fkey FOREIGN KEY (hospital_id) REFERENCES public.hospital(id);
 J   ALTER TABLE ONLY public.patient DROP CONSTRAINT patient_hospital_id_fkey;
       public          aa8381    false    3807    200    203                       2606    26106 )   registration registration_patient_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.registration
    ADD CONSTRAINT registration_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patient(id);
 S   ALTER TABLE ONLY public.registration DROP CONSTRAINT registration_patient_id_fkey;
       public          aa8381    false    203    209    3819                       2606    26190 +   surgery_treatment surgery_treatment_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.surgery_treatment
    ADD CONSTRAINT surgery_treatment_id_fkey FOREIGN KEY (id) REFERENCES public.treatment_type(id);
 U   ALTER TABLE ONLY public.surgery_treatment DROP CONSTRAINT surgery_treatment_id_fkey;
       public          aa8381    false    3839    215    212                       2606    26134    treatment treatment_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.treatment
    ADD CONSTRAINT treatment_id_fkey FOREIGN KEY (id) REFERENCES public.patient(treatment_id);
 E   ALTER TABLE ONLY public.treatment DROP CONSTRAINT treatment_id_fkey;
       public          aa8381    false    203    3821    211                       2606    26148 %   treatment_type treatment_type_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.treatment_type
    ADD CONSTRAINT treatment_type_id_fkey FOREIGN KEY (id) REFERENCES public.treatment(id);
 O   ALTER TABLE ONLY public.treatment_type DROP CONSTRAINT treatment_type_id_fkey;
       public          aa8381    false    211    3837    212           