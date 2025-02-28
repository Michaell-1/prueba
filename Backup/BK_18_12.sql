PGDMP  (        	            }            proyecto    17.0    17.0 @    6           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            7           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            8           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            9           1262    24689    proyecto    DATABASE     }   CREATE DATABASE proyecto WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Ecuador.1252';
    DROP DATABASE proyecto;
                     postgres    false            �            1255    24690    notify_messenger_messages()    FUNCTION     �   CREATE FUNCTION public.notify_messenger_messages() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
            BEGIN
                PERFORM pg_notify('messenger_messages', NEW.queue_name::text);
                RETURN NEW;
            END;
        $$;
 2   DROP FUNCTION public.notify_messenger_messages();
       public               postgres    false            �            1259    24691    doctrine_migration_versions    TABLE     �   CREATE TABLE public.doctrine_migration_versions (
    version character varying(191) NOT NULL,
    executed_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    execution_time integer
);
 /   DROP TABLE public.doctrine_migration_versions;
       public         heap r       postgres    false            �            1259    24737    empresa    TABLE     �   CREATE TABLE public.empresa (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    ruc integer NOT NULL,
    "dueño" character varying(200) NOT NULL,
    contacto integer NOT NULL,
    ubicacion character varying(255) NOT NULL
);
    DROP TABLE public.empresa;
       public         heap r       postgres    false            �            1259    24736    empresa_id_seq    SEQUENCE     �   CREATE SEQUENCE public.empresa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.empresa_id_seq;
       public               postgres    false    225            :           0    0    empresa_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.empresa_id_seq OWNED BY public.empresa.id;
          public               postgres    false    224            �            1259    24695    messenger_messages    TABLE     s  CREATE TABLE public.messenger_messages (
    id bigint NOT NULL,
    body text NOT NULL,
    headers text NOT NULL,
    queue_name character varying(190) NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    available_at timestamp(0) without time zone NOT NULL,
    delivered_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);
 &   DROP TABLE public.messenger_messages;
       public         heap r       postgres    false            ;           0    0 $   COLUMN messenger_messages.created_at    COMMENT     Z   COMMENT ON COLUMN public.messenger_messages.created_at IS '(DC2Type:datetime_immutable)';
          public               postgres    false    218            <           0    0 &   COLUMN messenger_messages.available_at    COMMENT     \   COMMENT ON COLUMN public.messenger_messages.available_at IS '(DC2Type:datetime_immutable)';
          public               postgres    false    218            =           0    0 &   COLUMN messenger_messages.delivered_at    COMMENT     \   COMMENT ON COLUMN public.messenger_messages.delivered_at IS '(DC2Type:datetime_immutable)';
          public               postgres    false    218            �            1259    24701    messenger_messages_id_seq    SEQUENCE     �   CREATE SEQUENCE public.messenger_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.messenger_messages_id_seq;
       public               postgres    false    218            >           0    0    messenger_messages_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.messenger_messages_id_seq OWNED BY public.messenger_messages.id;
          public               postgres    false    219            �            1259    24702    persona    TABLE     E  CREATE TABLE public.persona (
    id integer NOT NULL,
    nombres character varying(255) NOT NULL,
    apellidos character varying(255) NOT NULL,
    edad integer NOT NULL,
    genero character varying(15) NOT NULL,
    direccion character varying(255) NOT NULL,
    cedula integer NOT NULL,
    celular integer NOT NULL
);
    DROP TABLE public.persona;
       public         heap r       postgres    false            �            1259    24707    persona_id_seq    SEQUENCE     �   CREATE SEQUENCE public.persona_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.persona_id_seq;
       public               postgres    false    220            ?           0    0    persona_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.persona_id_seq OWNED BY public.persona.id;
          public               postgres    false    221            �            1259    24772 	   provincia    TABLE     g   CREATE TABLE public.provincia (
    id integer NOT NULL,
    canton character varying(100) NOT NULL
);
    DROP TABLE public.provincia;
       public         heap r       postgres    false            �            1259    24771    provincia_id_seq    SEQUENCE     �   CREATE SEQUENCE public.provincia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.provincia_id_seq;
       public               postgres    false    229            @           0    0    provincia_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.provincia_id_seq OWNED BY public.provincia.id;
          public               postgres    false    228            �            1259    24708    usuario    TABLE     �   CREATE TABLE public.usuario (
    id integer NOT NULL,
    email character varying(180) NOT NULL,
    roles json NOT NULL,
    password character varying(255) NOT NULL,
    persona_id integer
);
    DROP TABLE public.usuario;
       public         heap r       postgres    false            �            1259    24753    usuario_empresa    TABLE     �   CREATE TABLE public.usuario_empresa (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    empresa_id integer NOT NULL
);
 #   DROP TABLE public.usuario_empresa;
       public         heap r       postgres    false            �            1259    24752    usuario_empresa_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_empresa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.usuario_empresa_id_seq;
       public               postgres    false    227            A           0    0    usuario_empresa_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.usuario_empresa_id_seq OWNED BY public.usuario_empresa.id;
          public               postgres    false    226            �            1259    24713    usuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.usuario_id_seq;
       public               postgres    false    222            B           0    0    usuario_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;
          public               postgres    false    223            z           2604    24740 
   empresa id    DEFAULT     h   ALTER TABLE ONLY public.empresa ALTER COLUMN id SET DEFAULT nextval('public.empresa_id_seq'::regclass);
 9   ALTER TABLE public.empresa ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    224    225    225            v           2604    24714    messenger_messages id    DEFAULT     ~   ALTER TABLE ONLY public.messenger_messages ALTER COLUMN id SET DEFAULT nextval('public.messenger_messages_id_seq'::regclass);
 D   ALTER TABLE public.messenger_messages ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    219    218            x           2604    24715 
   persona id    DEFAULT     h   ALTER TABLE ONLY public.persona ALTER COLUMN id SET DEFAULT nextval('public.persona_id_seq'::regclass);
 9   ALTER TABLE public.persona ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    221    220            |           2604    24775    provincia id    DEFAULT     l   ALTER TABLE ONLY public.provincia ALTER COLUMN id SET DEFAULT nextval('public.provincia_id_seq'::regclass);
 ;   ALTER TABLE public.provincia ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    229    228    229            y           2604    24716 
   usuario id    DEFAULT     h   ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);
 9   ALTER TABLE public.usuario ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    223    222            {           2604    24756    usuario_empresa id    DEFAULT     x   ALTER TABLE ONLY public.usuario_empresa ALTER COLUMN id SET DEFAULT nextval('public.usuario_empresa_id_seq'::regclass);
 A   ALTER TABLE public.usuario_empresa ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    227    226    227            '          0    24691    doctrine_migration_versions 
   TABLE DATA           [   COPY public.doctrine_migration_versions (version, executed_at, execution_time) FROM stdin;
    public               postgres    false    217   �J       /          0    24737    empresa 
   TABLE DATA           Q   COPY public.empresa (id, nombre, ruc, "dueño", contacto, ubicacion) FROM stdin;
    public               postgres    false    225   �K       (          0    24695    messenger_messages 
   TABLE DATA           s   COPY public.messenger_messages (id, body, headers, queue_name, created_at, available_at, delivered_at) FROM stdin;
    public               postgres    false    218   @L       *          0    24702    persona 
   TABLE DATA           c   COPY public.persona (id, nombres, apellidos, edad, genero, direccion, cedula, celular) FROM stdin;
    public               postgres    false    220   ]L       3          0    24772 	   provincia 
   TABLE DATA           /   COPY public.provincia (id, canton) FROM stdin;
    public               postgres    false    229   �L       ,          0    24708    usuario 
   TABLE DATA           I   COPY public.usuario (id, email, roles, password, persona_id) FROM stdin;
    public               postgres    false    222   ?M       1          0    24753    usuario_empresa 
   TABLE DATA           E   COPY public.usuario_empresa (id, usuario_id, empresa_id) FROM stdin;
    public               postgres    false    227   �N       C           0    0    empresa_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.empresa_id_seq', 6, true);
          public               postgres    false    224            D           0    0    messenger_messages_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.messenger_messages_id_seq', 1, false);
          public               postgres    false    219            E           0    0    persona_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.persona_id_seq', 16, true);
          public               postgres    false    221            F           0    0    provincia_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.provincia_id_seq', 1, false);
          public               postgres    false    228            G           0    0    usuario_empresa_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.usuario_empresa_id_seq', 5, true);
          public               postgres    false    226            H           0    0    usuario_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.usuario_id_seq', 19, true);
          public               postgres    false    223            ~           2606    24718 <   doctrine_migration_versions doctrine_migration_versions_pkey 
   CONSTRAINT        ALTER TABLE ONLY public.doctrine_migration_versions
    ADD CONSTRAINT doctrine_migration_versions_pkey PRIMARY KEY (version);
 f   ALTER TABLE ONLY public.doctrine_migration_versions DROP CONSTRAINT doctrine_migration_versions_pkey;
       public                 postgres    false    217            �           2606    24742    empresa empresa_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.empresa DROP CONSTRAINT empresa_pkey;
       public                 postgres    false    225            �           2606    24720 *   messenger_messages messenger_messages_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.messenger_messages
    ADD CONSTRAINT messenger_messages_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.messenger_messages DROP CONSTRAINT messenger_messages_pkey;
       public                 postgres    false    218            �           2606    24722    persona persona_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.persona DROP CONSTRAINT persona_pkey;
       public                 postgres    false    220            �           2606    24777    provincia provincia_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.provincia
    ADD CONSTRAINT provincia_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.provincia DROP CONSTRAINT provincia_pkey;
       public                 postgres    false    229            �           2606    24758 $   usuario_empresa usuario_empresa_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.usuario_empresa
    ADD CONSTRAINT usuario_empresa_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.usuario_empresa DROP CONSTRAINT usuario_empresa_pkey;
       public                 postgres    false    227            �           2606    24724    usuario usuario_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public                 postgres    false    222                       1259    24725    idx_75ea56e016ba31db    INDEX     [   CREATE INDEX idx_75ea56e016ba31db ON public.messenger_messages USING btree (delivered_at);
 (   DROP INDEX public.idx_75ea56e016ba31db;
       public                 postgres    false    218            �           1259    24726    idx_75ea56e0e3bd61ce    INDEX     [   CREATE INDEX idx_75ea56e0e3bd61ce ON public.messenger_messages USING btree (available_at);
 (   DROP INDEX public.idx_75ea56e0e3bd61ce;
       public                 postgres    false    218            �           1259    24727    idx_75ea56e0fb7336f0    INDEX     Y   CREATE INDEX idx_75ea56e0fb7336f0 ON public.messenger_messages USING btree (queue_name);
 (   DROP INDEX public.idx_75ea56e0fb7336f0;
       public                 postgres    false    218            �           1259    24760    idx_c1f1f017521e1991    INDEX     V   CREATE INDEX idx_c1f1f017521e1991 ON public.usuario_empresa USING btree (empresa_id);
 (   DROP INDEX public.idx_c1f1f017521e1991;
       public                 postgres    false    227            �           1259    24759    idx_c1f1f017db38439e    INDEX     V   CREATE INDEX idx_c1f1f017db38439e ON public.usuario_empresa USING btree (usuario_id);
 (   DROP INDEX public.idx_c1f1f017db38439e;
       public                 postgres    false    227            �           1259    24728    uniq_2265b05df5f88db9    INDEX     V   CREATE UNIQUE INDEX uniq_2265b05df5f88db9 ON public.usuario USING btree (persona_id);
 )   DROP INDEX public.uniq_2265b05df5f88db9;
       public                 postgres    false    222            �           1259    24729    uniq_identifier_email    INDEX     Q   CREATE UNIQUE INDEX uniq_identifier_email ON public.usuario USING btree (email);
 )   DROP INDEX public.uniq_identifier_email;
       public                 postgres    false    222            �           2620    24730 !   messenger_messages notify_trigger    TRIGGER     �   CREATE TRIGGER notify_trigger AFTER INSERT OR UPDATE ON public.messenger_messages FOR EACH ROW EXECUTE FUNCTION public.notify_messenger_messages();
 :   DROP TRIGGER notify_trigger ON public.messenger_messages;
       public               postgres    false    230    218            �           2606    24731    usuario fk_2265b05df5f88db9    FK CONSTRAINT        ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fk_2265b05df5f88db9 FOREIGN KEY (persona_id) REFERENCES public.persona(id);
 E   ALTER TABLE ONLY public.usuario DROP CONSTRAINT fk_2265b05df5f88db9;
       public               postgres    false    220    222    4741            �           2606    24766 #   usuario_empresa fk_c1f1f017521e1991    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario_empresa
    ADD CONSTRAINT fk_c1f1f017521e1991 FOREIGN KEY (empresa_id) REFERENCES public.empresa(id);
 M   ALTER TABLE ONLY public.usuario_empresa DROP CONSTRAINT fk_c1f1f017521e1991;
       public               postgres    false    227    4747    225            �           2606    24761 #   usuario_empresa fk_c1f1f017db38439e    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario_empresa
    ADD CONSTRAINT fk_c1f1f017db38439e FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);
 M   ALTER TABLE ONLY public.usuario_empresa DROP CONSTRAINT fk_c1f1f017db38439e;
       public               postgres    false    222    227    4745            '   �   x����j�0��y�}�c;:��kO��QF.-�}&3��tP��A�|�r�|޶�|z_����z9_��xڮ���
��dN�uG��8�R�C���	W��N�>ՕR���I�:5�&�d����$��7�ۏ� F��0�ꖓv����}q27� =#�=j1�t�V�9�^��Gж�!����>@���h�j��	,n�&��AX��l���� #2���%������0߶M�      /   f   x�3�t�-(J-NTpt��4426153���JLK䴴0735162��M�2��ϮL���4475437���L�HL��Q�/*IM�7�04345��7#Q}� �\%�      (      x������ � �      *   r   x�m�A
�0F��?��ũ�$�BA��L%U!0�����>x�����G [���3.[B^�%�'{qM�X�R�e�����t�g?¤U��Ɛo+��]c
���AD��#�      3   P   x��K
�0�us�wA�A�����Mh�J��ߙ=�lH�[� ������#d��xjQ���M�X�ΐ���V�N�FD?m�2      ,   B  x�}��n�P ����1��ev��<�1`mF�H�p���ؤ�&��l��� +;�kd�w���w-��x궀��кYhJ�Z���b�"�rN��֨n��9��t7��x,�Ξ;������Ѷs���M�'�&�H��x6��1�o�^�&F����
�t��� d	ȃN�'�.��_���F�{��T�<L:	:�ePY��$ƞK�`h�XIC��g
 ��o��d�I�q�t#���aN�X2��<WkU�W�#V.�w���g��5�����լ�A;�P�}��o:&ɫ�a�`��.Q+ŭo���ˡ�$@= G�H� >�P�l      1   "   x�3�44�4�2�44�4�2�4��4����� /�o     