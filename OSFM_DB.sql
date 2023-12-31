PGDMP     ,    4                {            OSFM_BD    15.3    15.3      4           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            5           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            6           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            7           1262    16729    OSFM_BD    DATABASE     �   CREATE DATABASE "OSFM_BD" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Latin America.1252';
    DROP DATABASE "OSFM_BD";
                postgres    false                        2615    16730    OSFM    SCHEMA        CREATE SCHEMA "OSFM";
    DROP SCHEMA "OSFM";
                postgres    false            T           1247    32783    dom_cargo_a    DOMAIN       CREATE DOMAIN public.dom_cargo_a AS character varying NOT NULL
	CONSTRAINT dom_cargo_a_check CHECK (((VALUE)::text = ANY ((ARRAY['Coordinador'::character varying, 'Asistente'::character varying, 'Supervisor'::character varying, 'Secretario'::character varying])::text[])));
     DROP DOMAIN public.dom_cargo_a;
       public          postgres    false            J           1247    16732    dom_cargo_m    DOMAIN     �   CREATE DOMAIN public.dom_cargo_m AS character varying NOT NULL
	CONSTRAINT dom_cargo_m_check CHECK (((VALUE)::text = ANY ((ARRAY['Titular'::character varying, 'Invitado'::character varying])::text[])));
     DROP DOMAIN public.dom_cargo_m;
       public          postgres    false            i           1247    32881    dom_correo_ins    DOMAIN     �   CREATE DOMAIN public.dom_correo_ins AS character varying(255)
	CONSTRAINT dom_correo_ins_check CHECK (((VALUE)::text ~* '^[A-Za-z0-9._%+-]+@elsistema\.org\.ve$'::text));
 #   DROP DOMAIN public.dom_correo_ins;
       public          postgres    false            [           1247    32795    dom_tipo_instrumento    DOMAIN       CREATE DOMAIN public.dom_tipo_instrumento AS character varying NOT NULL
	CONSTRAINT dom_tipo_instrumento_check CHECK (((VALUE)::text = ANY ((ARRAY['Violín'::character varying, 'Viola'::character varying, 'Violoncello'::character varying, 'Contrabajo'::character varying, 'Flauta'::character varying, 'Oboe'::character varying, 'Clarinete'::character varying, 'Fagot'::character varying, 'Trompeta'::character varying, 'Trombón'::character varying, 'Corno Francés'::character varying, 'Tuba'::character varying])::text[])));
 )   DROP DOMAIN public.dom_tipo_instrumento;
       public          postgres    false            e           1247    32855    email_domain    DOMAIN     �   CREATE DOMAIN public.email_domain AS character varying(255)
	CONSTRAINT email_domain_check CHECK (((VALUE)::text ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'::text));
 !   DROP DOMAIN public.email_domain;
       public          postgres    false            �            1259    32785    administrativo    TABLE     y  CREATE TABLE "OSFM".administrativo (
    dni integer NOT NULL,
    nombre character varying(45) NOT NULL,
    fecha_nac date NOT NULL,
    fecha_ingreso date,
    correo_p public.email_domain NOT NULL,
    correo_ins public.dom_correo_ins,
    tlf character varying(11),
    cargo public.dom_cargo_a,
    ciudad character varying(25) NOT NULL,
    urb character varying(25)
);
 "   DROP TABLE "OSFM".administrativo;
       OSFM         heap    postgres    false    852    6    869    873            �            1259    32818    asignado    TABLE     �   CREATE TABLE "OSFM".asignado (
    ci_musico integer NOT NULL,
    serial_instrumento integer NOT NULL,
    fecha_e date NOT NULL,
    fecha_r date
);
    DROP TABLE "OSFM".asignado;
       OSFM         heap    postgres    false    6            �            1259    32797    instrumento    TABLE     �   CREATE TABLE "OSFM".instrumento (
    num_serial integer NOT NULL,
    tipo public.dom_tipo_instrumento NOT NULL,
    marca character varying(20) NOT NULL
);
    DROP TABLE "OSFM".instrumento;
       OSFM         heap    postgres    false    859    6            �            1259    16737    musico    TABLE     q  CREATE TABLE "OSFM".musico (
    dni integer NOT NULL,
    nombre character varying(45) NOT NULL,
    fecha_nac date NOT NULL,
    fecha_ingreso date,
    correo_p public.email_domain NOT NULL,
    correo_ins public.dom_correo_ins,
    tlf character varying(11),
    cargo public.dom_cargo_m,
    ciudad character varying(25) NOT NULL,
    urb character varying(25)
);
    DROP TABLE "OSFM".musico;
       OSFM         heap    postgres    false    873    842    6    869            �            1259    24595    tecnico    TABLE     T  CREATE TABLE "OSFM".tecnico (
    dni integer NOT NULL,
    nombre character varying(45) NOT NULL,
    fecha_nac date NOT NULL,
    fecha_ingreso date,
    correo_p public.email_domain NOT NULL,
    correo_ins public.dom_correo_ins,
    tlf character varying(11),
    ciudad character varying(25) NOT NULL,
    urb character varying(25)
);
    DROP TABLE "OSFM".tecnico;
       OSFM         heap    postgres    false    873    869    6            /          0    32785    administrativo 
   TABLE DATA           ~   COPY "OSFM".administrativo (dni, nombre, fecha_nac, fecha_ingreso, correo_p, correo_ins, tlf, cargo, ciudad, urb) FROM stdin;
    OSFM          postgres    false    217   x)       1          0    32818    asignado 
   TABLE DATA           S   COPY "OSFM".asignado (ci_musico, serial_instrumento, fecha_e, fecha_r) FROM stdin;
    OSFM          postgres    false    219   &*       0          0    32797    instrumento 
   TABLE DATA           >   COPY "OSFM".instrumento (num_serial, tipo, marca) FROM stdin;
    OSFM          postgres    false    218   C*       -          0    16737    musico 
   TABLE DATA           v   COPY "OSFM".musico (dni, nombre, fecha_nac, fecha_ingreso, correo_p, correo_ins, tlf, cargo, ciudad, urb) FROM stdin;
    OSFM          postgres    false    215   `*       .          0    24595    tecnico 
   TABLE DATA           p   COPY "OSFM".tecnico (dni, nombre, fecha_nac, fecha_ingreso, correo_p, correo_ins, tlf, ciudad, urb) FROM stdin;
    OSFM          postgres    false    216   6+       �           2606    32793    administrativo admin_pk 
   CONSTRAINT     V   ALTER TABLE ONLY "OSFM".administrativo
    ADD CONSTRAINT admin_pk PRIMARY KEY (dni);
 A   ALTER TABLE ONLY "OSFM".administrativo DROP CONSTRAINT admin_pk;
       OSFM            postgres    false    217            �           2606    32791 %   administrativo administrativo_dni_key 
   CONSTRAINT     _   ALTER TABLE ONLY "OSFM".administrativo
    ADD CONSTRAINT administrativo_dni_key UNIQUE (dni);
 O   ALTER TABLE ONLY "OSFM".administrativo DROP CONSTRAINT administrativo_dni_key;
       OSFM            postgres    false    217            �           2606    32822    asignado asigna_pk 
   CONSTRAINT     W   ALTER TABLE ONLY "OSFM".asignado
    ADD CONSTRAINT asigna_pk PRIMARY KEY (ci_musico);
 <   ALTER TABLE ONLY "OSFM".asignado DROP CONSTRAINT asigna_pk;
       OSFM            postgres    false    219            �           2606    32824 (   asignado asignado_serial_instrumento_key 
   CONSTRAINT     q   ALTER TABLE ONLY "OSFM".asignado
    ADD CONSTRAINT asignado_serial_instrumento_key UNIQUE (serial_instrumento);
 R   ALTER TABLE ONLY "OSFM".asignado DROP CONSTRAINT asignado_serial_instrumento_key;
       OSFM            postgres    false    219            �           2606    32803 &   instrumento instrumento_num_serial_key 
   CONSTRAINT     g   ALTER TABLE ONLY "OSFM".instrumento
    ADD CONSTRAINT instrumento_num_serial_key UNIQUE (num_serial);
 P   ALTER TABLE ONLY "OSFM".instrumento DROP CONSTRAINT instrumento_num_serial_key;
       OSFM            postgres    false    218            �           2606    32805    instrumento instrumento_pk 
   CONSTRAINT     `   ALTER TABLE ONLY "OSFM".instrumento
    ADD CONSTRAINT instrumento_pk PRIMARY KEY (num_serial);
 D   ALTER TABLE ONLY "OSFM".instrumento DROP CONSTRAINT instrumento_pk;
       OSFM            postgres    false    218            �           2606    16743    musico musico_dni_key 
   CONSTRAINT     O   ALTER TABLE ONLY "OSFM".musico
    ADD CONSTRAINT musico_dni_key UNIQUE (dni);
 ?   ALTER TABLE ONLY "OSFM".musico DROP CONSTRAINT musico_dni_key;
       OSFM            postgres    false    215            �           2606    16745    musico musico_pk 
   CONSTRAINT     O   ALTER TABLE ONLY "OSFM".musico
    ADD CONSTRAINT musico_pk PRIMARY KEY (dni);
 :   ALTER TABLE ONLY "OSFM".musico DROP CONSTRAINT musico_pk;
       OSFM            postgres    false    215            �           2606    24599    tecnico tecnico_dni_key 
   CONSTRAINT     Q   ALTER TABLE ONLY "OSFM".tecnico
    ADD CONSTRAINT tecnico_dni_key UNIQUE (dni);
 A   ALTER TABLE ONLY "OSFM".tecnico DROP CONSTRAINT tecnico_dni_key;
       OSFM            postgres    false    216            �           2606    24601    tecnico tecnico_pk 
   CONSTRAINT     Q   ALTER TABLE ONLY "OSFM".tecnico
    ADD CONSTRAINT tecnico_pk PRIMARY KEY (dni);
 <   ALTER TABLE ONLY "OSFM".tecnico DROP CONSTRAINT tecnico_pk;
       OSFM            postgres    false    216            �           2606    32830    asignado instrumento_fk    FK CONSTRAINT     �   ALTER TABLE ONLY "OSFM".asignado
    ADD CONSTRAINT instrumento_fk FOREIGN KEY (serial_instrumento) REFERENCES "OSFM".instrumento(num_serial);
 A   ALTER TABLE ONLY "OSFM".asignado DROP CONSTRAINT instrumento_fk;
       OSFM          postgres    false    218    3222    219            �           2606    32825    asignado musico_fk    FK CONSTRAINT     u   ALTER TABLE ONLY "OSFM".asignado
    ADD CONSTRAINT musico_fk FOREIGN KEY (ci_musico) REFERENCES "OSFM".musico(dni);
 <   ALTER TABLE ONLY "OSFM".asignado DROP CONSTRAINT musico_fk;
       OSFM          postgres    false    3210    215    219            /   �   x�mͱ
�0���}C.����.�ڱ�!AgS.��Wm)����C[3XcLap�%Z��̧~�ȺK�Z��0�N��9��p�tn�+�s�L$�IZN�B�\�G�0�.��$6��LSh7�3��?��]���W����|h�g���C+��4IGG      1      x������ � �      0      x������ � �      -   �   x�m�Aj�0EףS�2��"ɻ@-��,�+�H��Q�ыՐ.���y�.8��Q��C�/u�sB4
�"�MB����q��3��e┻�Lp��>��'�J�tk��PkO��)�K�
o�x��X+߹�s��y�����Kj�0.q(t��J���kHސ�I8���clp)�1�,�W����N���U      .   r   x�-�A
1 ��+����Fۛ���O�$,�Բ�������a�3�p��ж��C?0'�\�C���.Sa5��l+bM[�¾.��
����S��஋��[W3yW��ι�A%8     