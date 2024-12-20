PGDMP  	                    |            proyecto    17.0    17.0 '               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                       1262    24668    proyecto    DATABASE     }   CREATE DATABASE proyecto WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Ecuador.1252';
    DROP DATABASE proyecto;
                     postgres    false            �            1255    24698    notify_messenger_messages()    FUNCTION     �   CREATE FUNCTION public.notify_messenger_messages() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
            BEGIN
                PERFORM pg_notify('messenger_messages', NEW.queue_name::text);
                RETURN NEW;
            END;
        $$;
 2   DROP FUNCTION public.notify_messenger_messages();
       public               postgres    false            �            1259    24669    doctrine_migration_versions    TABLE     �   CREATE TABLE public.doctrine_migration_versions (
    version character varying(191) NOT NULL,
    executed_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    execution_time integer
);
 /   DROP TABLE public.doctrine_migration_versions;
       public         heap r       postgres    false            �            1259    24686    messenger_messages    TABLE     s  CREATE TABLE public.messenger_messages (
    id bigint NOT NULL,
    body text NOT NULL,
    headers text NOT NULL,
    queue_name character varying(190) NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    available_at timestamp(0) without time zone NOT NULL,
    delivered_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);
 &   DROP TABLE public.messenger_messages;
       public         heap r       postgres    false                       0    0 $   COLUMN messenger_messages.created_at    COMMENT     Z   COMMENT ON COLUMN public.messenger_messages.created_at IS '(DC2Type:datetime_immutable)';
          public               postgres    false    221                       0    0 &   COLUMN messenger_messages.available_at    COMMENT     \   COMMENT ON COLUMN public.messenger_messages.available_at IS '(DC2Type:datetime_immutable)';
          public               postgres    false    221                       0    0 &   COLUMN messenger_messages.delivered_at    COMMENT     \   COMMENT ON COLUMN public.messenger_messages.delivered_at IS '(DC2Type:datetime_immutable)';
          public               postgres    false    221            �            1259    24685    messenger_messages_id_seq    SEQUENCE     �   CREATE SEQUENCE public.messenger_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.messenger_messages_id_seq;
       public               postgres    false    221                       0    0    messenger_messages_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.messenger_messages_id_seq OWNED BY public.messenger_messages.id;
          public               postgres    false    220            �            1259    24701    persona    TABLE     '  CREATE TABLE public.persona (
    id integer NOT NULL,
    nombres character varying(255) NOT NULL,
    apellidos character varying(255) NOT NULL,
    edad integer NOT NULL,
    genero character varying(15) NOT NULL,
    direccion character varying(255) NOT NULL,
    cedula integer NOT NULL
);
    DROP TABLE public.persona;
       public         heap r       postgres    false            �            1259    24700    persona_id_seq    SEQUENCE     �   CREATE SEQUENCE public.persona_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.persona_id_seq;
       public               postgres    false    223                       0    0    persona_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.persona_id_seq OWNED BY public.persona.id;
          public               postgres    false    222            �            1259    24676    usuario    TABLE     �   CREATE TABLE public.usuario (
    id integer NOT NULL,
    email character varying(180) NOT NULL,
    roles json NOT NULL,
    password character varying(255) NOT NULL,
    persona_id integer
);
    DROP TABLE public.usuario;
       public         heap r       postgres    false            �            1259    24675    usuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.usuario_id_seq;
       public               postgres    false    219                       0    0    usuario_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;
          public               postgres    false    218            h           2604    24689    messenger_messages id    DEFAULT     ~   ALTER TABLE ONLY public.messenger_messages ALTER COLUMN id SET DEFAULT nextval('public.messenger_messages_id_seq'::regclass);
 D   ALTER TABLE public.messenger_messages ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    221    220    221            j           2604    24704 
   persona id    DEFAULT     h   ALTER TABLE ONLY public.persona ALTER COLUMN id SET DEFAULT nextval('public.persona_id_seq'::regclass);
 9   ALTER TABLE public.persona ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    222    223    223            g           2604    24679 
   usuario id    DEFAULT     h   ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);
 9   ALTER TABLE public.usuario ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    218    219    219                      0    24669    doctrine_migration_versions 
   TABLE DATA           [   COPY public.doctrine_migration_versions (version, executed_at, execution_time) FROM stdin;
    public               postgres    false    217   .                 0    24686    messenger_messages 
   TABLE DATA           s   COPY public.messenger_messages (id, body, headers, queue_name, created_at, available_at, delivered_at) FROM stdin;
    public               postgres    false    221   �.                 0    24701    persona 
   TABLE DATA           Z   COPY public.persona (id, nombres, apellidos, edad, genero, direccion, cedula) FROM stdin;
    public               postgres    false    223   �.                 0    24676    usuario 
   TABLE DATA           I   COPY public.usuario (id, email, roles, password, persona_id) FROM stdin;
    public               postgres    false    219   �/                  0    0    messenger_messages_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.messenger_messages_id_seq', 1, false);
          public               postgres    false    220                       0    0    persona_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.persona_id_seq', 10, true);
          public               postgres    false    222                        0    0    usuario_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.usuario_id_seq', 8, true);
          public               postgres    false    218            l           2606    24674 <   doctrine_migration_versions doctrine_migration_versions_pkey 
   CONSTRAINT        ALTER TABLE ONLY public.doctrine_migration_versions
    ADD CONSTRAINT doctrine_migration_versions_pkey PRIMARY KEY (version);
 f   ALTER TABLE ONLY public.doctrine_migration_versions DROP CONSTRAINT doctrine_migration_versions_pkey;
       public                 postgres    false    217            u           2606    24694 *   messenger_messages messenger_messages_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.messenger_messages
    ADD CONSTRAINT messenger_messages_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.messenger_messages DROP CONSTRAINT messenger_messages_pkey;
       public                 postgres    false    221            w           2606    24708    persona persona_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.persona DROP CONSTRAINT persona_pkey;
       public                 postgres    false    223            p           2606    24683    usuario usuario_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public                 postgres    false    219            q           1259    24697    idx_75ea56e016ba31db    INDEX     [   CREATE INDEX idx_75ea56e016ba31db ON public.messenger_messages USING btree (delivered_at);
 (   DROP INDEX public.idx_75ea56e016ba31db;
       public                 postgres    false    221            r           1259    24696    idx_75ea56e0e3bd61ce    INDEX     [   CREATE INDEX idx_75ea56e0e3bd61ce ON public.messenger_messages USING btree (available_at);
 (   DROP INDEX public.idx_75ea56e0e3bd61ce;
       public                 postgres    false    221            s           1259    24695    idx_75ea56e0fb7336f0    INDEX     Y   CREATE INDEX idx_75ea56e0fb7336f0 ON public.messenger_messages USING btree (queue_name);
 (   DROP INDEX public.idx_75ea56e0fb7336f0;
       public                 postgres    false    221            m           1259    24714    uniq_2265b05df5f88db9    INDEX     V   CREATE UNIQUE INDEX uniq_2265b05df5f88db9 ON public.usuario USING btree (persona_id);
 )   DROP INDEX public.uniq_2265b05df5f88db9;
       public                 postgres    false    219            n           1259    24684    uniq_identifier_email    INDEX     Q   CREATE UNIQUE INDEX uniq_identifier_email ON public.usuario USING btree (email);
 )   DROP INDEX public.uniq_identifier_email;
       public                 postgres    false    219            y           2620    24699 !   messenger_messages notify_trigger    TRIGGER     �   CREATE TRIGGER notify_trigger AFTER INSERT OR UPDATE ON public.messenger_messages FOR EACH ROW EXECUTE FUNCTION public.notify_messenger_messages();
 :   DROP TRIGGER notify_trigger ON public.messenger_messages;
       public               postgres    false    221    224            x           2606    24709    usuario fk_2265b05df5f88db9    FK CONSTRAINT        ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fk_2265b05df5f88db9 FOREIGN KEY (persona_id) REFERENCES public.persona(id);
 E   ALTER TABLE ONLY public.usuario DROP CONSTRAINT fk_2265b05df5f88db9;
       public               postgres    false    4727    219    223               h   x�s�O.)��K��L/J,���+��	K-*���L��L�-9A\]C# R00�24�20�447�r!�#Cc4��LL�bD`�i������!W� #6~            x������ � �         "  x����n�0���S���B��Llb놘��.�5%Rp���6�hϱ��qB;Ŏ����*_�B��!"���S����-T�]=�Q�#C�ہ4/��r-�D��|��I��?E���u�s��N�}�
w^@K�0Q��&\0�R���0��P���Yn��t���x@�!�W<aO�Js��qI�;:{�a4�l��F�j�-�oX�#���G��D��ˊ����,�(��&rM#���Ό�֨gb�a�M�����0p��D�ƟejE?˯���Dd���(J�y�����]         &  x�]�KbC@  ��8G֣D;��'m����w��Q�Z�=Z��v�������<"�[G���F�h����Nn[�/�(�A�xJ�"����PR!�\��ŗ�o(k��~R��*$����EO1�zPU�8r��[�:��(�rsUF"��ep}��F�4�Nl�~܇'W�UO��؜RI[:g�D �	���:X<�6����w�������HW��εt�G��4�!�OT@���@#4����y��検�#�c�rk��G���r�/�� >S��y��B�� �!A���ru     