--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: users; Type: TABLE; Schema: public; Owner: WSE; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    username character(40) NOT NULL,
    password character(30) NOT NULL,
    name character(40) NOT NULL,
    surname character(50) NOT NULL,
    email character(60) NOT NULL,
    company bit(1) NOT NULL,
    phone character varying(15) NOT NULL
);


ALTER TABLE users OWNER TO "WSE";

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: WSE
--

COPY users (id, username, password, name, surname, email, company, phone) FROM stdin;
\.


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: WSE; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: piotrpawlus
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM piotrpawlus;
GRANT ALL ON SCHEMA public TO piotrpawlus;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

