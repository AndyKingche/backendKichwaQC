PGDMP     &    )            	    z            quichuashimi    12.12    12.12                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16393    quichuashimi    DATABASE     �   CREATE DATABASE quichuashimi WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';
    DROP DATABASE quichuashimi;
                postgres    false                        2615    16394    palabras    SCHEMA        CREATE SCHEMA palabras;
    DROP SCHEMA palabras;
                postgres    false            �            1259    16414    palabras    TABLE     f   CREATE TABLE public.palabras (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);
    DROP TABLE public.palabras;
       public         heap    postgres    false            �            1259    16412    palabras_id_seq    SEQUENCE     �   CREATE SEQUENCE public.palabras_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.palabras_id_seq;
       public          postgres    false    204                       0    0    palabras_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.palabras_id_seq OWNED BY public.palabras.id;
          public          postgres    false    203            �            1259    16436 	   traductor    TABLE     v   CREATE TABLE public.traductor (
    id_traductor integer NOT NULL,
    palabraespanol text,
    palabra_id integer
);
    DROP TABLE public.traductor;
       public         heap    postgres    false            �            1259    16434    traductor_id_traductor_seq    SEQUENCE     �   CREATE SEQUENCE public.traductor_id_traductor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.traductor_id_traductor_seq;
       public          postgres    false    208                        0    0    traductor_id_traductor_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.traductor_id_traductor_seq OWNED BY public.traductor.id_traductor;
          public          postgres    false    207            �            1259    16422    voice_recognition    TABLE     x   CREATE TABLE public.voice_recognition (
    id_voice integer NOT NULL,
    palabra_voice text,
    palabraid integer
);
 %   DROP TABLE public.voice_recognition;
       public         heap    postgres    false            �            1259    16420    voice_recognition_id_voice_seq    SEQUENCE     �   CREATE SEQUENCE public.voice_recognition_id_voice_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.voice_recognition_id_voice_seq;
       public          postgres    false    206            !           0    0    voice_recognition_id_voice_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.voice_recognition_id_voice_seq OWNED BY public.voice_recognition.id_voice;
          public          postgres    false    205            �
           2604    16417    palabras id    DEFAULT     j   ALTER TABLE ONLY public.palabras ALTER COLUMN id SET DEFAULT nextval('public.palabras_id_seq'::regclass);
 :   ALTER TABLE public.palabras ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    203    204            �
           2604    16439    traductor id_traductor    DEFAULT     �   ALTER TABLE ONLY public.traductor ALTER COLUMN id_traductor SET DEFAULT nextval('public.traductor_id_traductor_seq'::regclass);
 E   ALTER TABLE public.traductor ALTER COLUMN id_traductor DROP DEFAULT;
       public          postgres    false    208    207    208            �
           2604    16425    voice_recognition id_voice    DEFAULT     �   ALTER TABLE ONLY public.voice_recognition ALTER COLUMN id_voice SET DEFAULT nextval('public.voice_recognition_id_voice_seq'::regclass);
 I   ALTER TABLE public.voice_recognition ALTER COLUMN id_voice DROP DEFAULT;
       public          postgres    false    206    205    206                      0    16414    palabras 
   TABLE DATA           .   COPY public.palabras (id, nombre) FROM stdin;
    public          postgres    false    204                    0    16436 	   traductor 
   TABLE DATA           M   COPY public.traductor (id_traductor, palabraespanol, palabra_id) FROM stdin;
    public          postgres    false    208   G                 0    16422    voice_recognition 
   TABLE DATA           O   COPY public.voice_recognition (id_voice, palabra_voice, palabraid) FROM stdin;
    public          postgres    false    206   �       "           0    0    palabras_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.palabras_id_seq', 4, true);
          public          postgres    false    203            #           0    0    traductor_id_traductor_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.traductor_id_traductor_seq', 4, true);
          public          postgres    false    207            $           0    0    voice_recognition_id_voice_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.voice_recognition_id_voice_seq', 8, true);
          public          postgres    false    205            �
           2606    16419    palabras palabras_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.palabras
    ADD CONSTRAINT palabras_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.palabras DROP CONSTRAINT palabras_pkey;
       public            postgres    false    204            �
           2606    16443 #   traductor traductor_palabra_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.traductor
    ADD CONSTRAINT traductor_palabra_id_fkey FOREIGN KEY (palabra_id) REFERENCES public.palabras(id);
 M   ALTER TABLE ONLY public.traductor DROP CONSTRAINT traductor_palabra_id_fkey;
       public          postgres    false    204    2706    208            �
           2606    16429 2   voice_recognition voice_recognition_palabraid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.voice_recognition
    ADD CONSTRAINT voice_recognition_palabraid_fkey FOREIGN KEY (palabraid) REFERENCES public.palabras(id);
 \   ALTER TABLE ONLY public.voice_recognition DROP CONSTRAINT voice_recognition_palabraid_fkey;
       public          postgres    false    2706    204    206               ,   x�3��M��M��2�,N,J�2��.-��2�,O�,I����� ��	�         6   x�3�LTH��KI��4�2��M̬�4�2��/��4�2�L�I,K��4����� �
�         L   x�3��M��M��4�22+!Lc��J���3M9}a�f�ΥE����\�Q�E��F\�饉�%��&\1z\\\  �8     