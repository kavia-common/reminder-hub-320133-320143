--
-- PostgreSQL database dump
--

\restrict ehx7U7GpRZJtwUHpZGEWTWGeDscNPvHPpRgGV2bYbxmLkDNdWPX8ZtNsuYctaJF

-- Dumped from database version 16.11 (Ubuntu 16.11-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.11 (Ubuntu 16.11-0ubuntu0.24.04.1)

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

DROP DATABASE IF EXISTS myapp;
--
-- Name: myapp; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE myapp WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


ALTER DATABASE myapp OWNER TO postgres;

\unrestrict ehx7U7GpRZJtwUHpZGEWTWGeDscNPvHPpRgGV2bYbxmLkDNdWPX8ZtNsuYctaJF
\connect myapp
\restrict ehx7U7GpRZJtwUHpZGEWTWGeDscNPvHPpRgGV2bYbxmLkDNdWPX8ZtNsuYctaJF

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
-- Name: set_updated_at(); Type: FUNCTION; Schema: public; Owner: appuser
--

CREATE FUNCTION public.set_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ BEGIN NEW.updated_at = NOW(); RETURN NEW; END; $$;


ALTER FUNCTION public.set_updated_at() OWNER TO appuser;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: reminders; Type: TABLE; Schema: public; Owner: appuser
--

CREATE TABLE public.reminders (
    id bigint NOT NULL,
    title text NOT NULL,
    description text,
    due_date timestamp with time zone NOT NULL,
    notification_at timestamp with time zone,
    completed boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.reminders OWNER TO appuser;

--
-- Name: reminders_id_seq; Type: SEQUENCE; Schema: public; Owner: appuser
--

CREATE SEQUENCE public.reminders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reminders_id_seq OWNER TO appuser;

--
-- Name: reminders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appuser
--

ALTER SEQUENCE public.reminders_id_seq OWNED BY public.reminders.id;


--
-- Name: reminders id; Type: DEFAULT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.reminders ALTER COLUMN id SET DEFAULT nextval('public.reminders_id_seq'::regclass);


--
-- Data for Name: reminders; Type: TABLE DATA; Schema: public; Owner: appuser
--

COPY public.reminders (id, title, description, due_date, notification_at, completed, created_at, updated_at) FROM stdin;
1	Buy groceries	Milk, eggs, bread	2026-02-13 12:59:27.527333+00	2026-02-13 11:59:27.527333+00	f	2026-02-12 12:59:27.527333+00	2026-02-12 12:59:27.527333+00
2	Pay rent	Schedule bank transfer	2026-02-15 00:00:00+00	\N	f	2026-02-12 12:59:30.122727+00	2026-02-12 12:59:30.122727+00
3	Call mom	\N	2026-02-12 14:59:33.352925+00	2026-02-12 14:29:33.352925+00	f	2026-02-12 12:59:33.352925+00	2026-02-12 12:59:33.352925+00
\.


--
-- Name: reminders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appuser
--

SELECT pg_catalog.setval('public.reminders_id_seq', 3, true);


--
-- Name: reminders reminders_pkey; Type: CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.reminders
    ADD CONSTRAINT reminders_pkey PRIMARY KEY (id);


--
-- Name: idx_reminders_completed_due_date; Type: INDEX; Schema: public; Owner: appuser
--

CREATE INDEX idx_reminders_completed_due_date ON public.reminders USING btree (completed, due_date);


--
-- Name: idx_reminders_due_date; Type: INDEX; Schema: public; Owner: appuser
--

CREATE INDEX idx_reminders_due_date ON public.reminders USING btree (due_date);


--
-- Name: idx_reminders_notification_at; Type: INDEX; Schema: public; Owner: appuser
--

CREATE INDEX idx_reminders_notification_at ON public.reminders USING btree (notification_at) WHERE ((notification_at IS NOT NULL) AND (completed = false));


--
-- Name: reminders trg_reminders_set_updated_at; Type: TRIGGER; Schema: public; Owner: appuser
--

CREATE TRIGGER trg_reminders_set_updated_at BEFORE UPDATE ON public.reminders FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();


--
-- Name: DATABASE myapp; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON DATABASE myapp TO appuser;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT ALL ON SCHEMA public TO appuser;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO appuser;


--
-- Name: DEFAULT PRIVILEGES FOR TYPES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TYPES TO appuser;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO appuser;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO appuser;


--
-- PostgreSQL database dump complete
--

\unrestrict ehx7U7GpRZJtwUHpZGEWTWGeDscNPvHPpRgGV2bYbxmLkDNdWPX8ZtNsuYctaJF

