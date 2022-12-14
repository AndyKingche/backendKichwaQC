--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12
-- Dumped by pg_dump version 12.12

-- Started on 2022-10-14 23:47:19

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 16394)
-- Name: palabras; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA palabras;


ALTER SCHEMA palabras OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 204 (class 1259 OID 16414)
-- Name: palabras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.palabras (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE public.palabras OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16412)
-- Name: palabras_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.palabras_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.palabras_id_seq OWNER TO postgres;

--
-- TOC entry 2846 (class 0 OID 0)
-- Dependencies: 203
-- Name: palabras_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.palabras_id_seq OWNED BY public.palabras.id;


--
-- TOC entry 208 (class 1259 OID 16436)
-- Name: traductor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.traductor (
    id_traductor integer NOT NULL,
    palabraespanol text,
    palabra_id integer
);


ALTER TABLE public.traductor OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16434)
-- Name: traductor_id_traductor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.traductor_id_traductor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.traductor_id_traductor_seq OWNER TO postgres;

--
-- TOC entry 2847 (class 0 OID 0)
-- Dependencies: 207
-- Name: traductor_id_traductor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.traductor_id_traductor_seq OWNED BY public.traductor.id_traductor;


--
-- TOC entry 206 (class 1259 OID 16422)
-- Name: voice_recognition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.voice_recognition (
    id_voice integer NOT NULL,
    palabra_voice text,
    palabraid integer
);


ALTER TABLE public.voice_recognition OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16420)
-- Name: voice_recognition_id_voice_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.voice_recognition_id_voice_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.voice_recognition_id_voice_seq OWNER TO postgres;

--
-- TOC entry 2848 (class 0 OID 0)
-- Dependencies: 205
-- Name: voice_recognition_id_voice_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.voice_recognition_id_voice_seq OWNED BY public.voice_recognition.id_voice;


--
-- TOC entry 2702 (class 2604 OID 16417)
-- Name: palabras id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.palabras ALTER COLUMN id SET DEFAULT nextval('public.palabras_id_seq'::regclass);


--
-- TOC entry 2704 (class 2604 OID 16439)
-- Name: traductor id_traductor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.traductor ALTER COLUMN id_traductor SET DEFAULT nextval('public.traductor_id_traductor_seq'::regclass);


--
-- TOC entry 2703 (class 2604 OID 16425)
-- Name: voice_recognition id_voice; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voice_recognition ALTER COLUMN id_voice SET DEFAULT nextval('public.voice_recognition_id_voice_seq'::regclass);


--
-- TOC entry 2836 (class 0 OID 16414)
-- Dependencies: 204
-- Data for Name: palabras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.palabras (id, nombre) FROM stdin;
1	mayman
2	sara
3	kuri
4	wayta
\.


--
-- TOC entry 2840 (class 0 OID 16436)
-- Dependencies: 208
-- Data for Name: traductor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.traductor (id_traductor, palabraespanol, palabra_id) FROM stdin;
1	a donde?	1
2	maiz	2
3	oro	3
4	clavel	4
\.


--
-- TOC entry 2838 (class 0 OID 16422)
-- Dependencies: 206
-- Data for Name: voice_recognition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.voice_recognition (id_voice, palabra_voice, palabraid) FROM stdin;
1	maiman	1
2	mayman	1
3	my man	1
4	my Man	1
5	My man	1
6	Curie	3
7	Zara	2
8	guaita	4
\.


--
-- TOC entry 2849 (class 0 OID 0)
-- Dependencies: 203
-- Name: palabras_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.palabras_id_seq', 4, true);


--
-- TOC entry 2850 (class 0 OID 0)
-- Dependencies: 207
-- Name: traductor_id_traductor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.traductor_id_traductor_seq', 4, true);


--
-- TOC entry 2851 (class 0 OID 0)
-- Dependencies: 205
-- Name: voice_recognition_id_voice_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.voice_recognition_id_voice_seq', 8, true);


--
-- TOC entry 2706 (class 2606 OID 16419)
-- Name: palabras palabras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.palabras
    ADD CONSTRAINT palabras_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 16443)
-- Name: traductor traductor_palabra_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.traductor
    ADD CONSTRAINT traductor_palabra_id_fkey FOREIGN KEY (palabra_id) REFERENCES public.palabras(id);


--
-- TOC entry 2707 (class 2606 OID 16429)
-- Name: voice_recognition voice_recognition_palabraid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voice_recognition
    ADD CONSTRAINT voice_recognition_palabraid_fkey FOREIGN KEY (palabraid) REFERENCES public.palabras(id);


-- Completed on 2022-10-14 23:47:20

--
-- PostgreSQL database dump complete
--

