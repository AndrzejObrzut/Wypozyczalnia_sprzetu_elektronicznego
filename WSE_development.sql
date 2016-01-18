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
-- Name: announcement_categories; Type: TABLE; Schema: public; Owner: piotrpawlus; Tablespace: 
--

CREATE TABLE announcement_categories (
    id integer NOT NULL,
    name character varying NOT NULL,
    image bytea NOT NULL,
    filename character varying,
    mime_type character varying,
    size integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE announcement_categories OWNER TO piotrpawlus;

--
-- Name: announcement_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: piotrpawlus
--

CREATE SEQUENCE announcement_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE announcement_categories_id_seq OWNER TO piotrpawlus;

--
-- Name: announcement_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: piotrpawlus
--

ALTER SEQUENCE announcement_categories_id_seq OWNED BY announcement_categories.id;


--
-- Name: announcements; Type: TABLE; Schema: public; Owner: piotrpawlus; Tablespace: 
--

CREATE TABLE announcements (
    id integer NOT NULL,
    announcement_category_id integer NOT NULL,
    user_id integer NOT NULL,
    title character varying(100) NOT NULL,
    description text NOT NULL,
    price_per_hour integer NOT NULL,
    price_per_day integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE announcements OWNER TO piotrpawlus;

--
-- Name: announcements_id_seq; Type: SEQUENCE; Schema: public; Owner: piotrpawlus
--

CREATE SEQUENCE announcements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE announcements_id_seq OWNER TO piotrpawlus;

--
-- Name: announcements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: piotrpawlus
--

ALTER SEQUENCE announcements_id_seq OWNED BY announcements.id;


--
-- Name: photos; Type: TABLE; Schema: public; Owner: piotrpawlus; Tablespace: 
--

CREATE TABLE photos (
    id integer NOT NULL,
    announcement_id integer NOT NULL,
    image_file_name character varying NOT NULL,
    image_content_type character varying NOT NULL,
    image_file_size integer NOT NULL,
    image_updated_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE photos OWNER TO piotrpawlus;

--
-- Name: photos_id_seq; Type: SEQUENCE; Schema: public; Owner: piotrpawlus
--

CREATE SEQUENCE photos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE photos_id_seq OWNER TO piotrpawlus;

--
-- Name: photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: piotrpawlus
--

ALTER SEQUENCE photos_id_seq OWNED BY photos.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: piotrpawlus; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO piotrpawlus;

--
-- Name: users; Type: TABLE; Schema: public; Owner: piotrpawlus; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    user_name character varying(30) NOT NULL,
    password_digest character varying NOT NULL,
    first_name character varying(40) NOT NULL,
    last_name character varying(40) NOT NULL,
    email character varying(60) NOT NULL,
    phone character varying NOT NULL,
    birth_date date NOT NULL,
    is_admin boolean DEFAULT false NOT NULL,
    regulations_accepted boolean NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE users OWNER TO piotrpawlus;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: piotrpawlus
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO piotrpawlus;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: piotrpawlus
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: piotrpawlus
--

ALTER TABLE ONLY announcement_categories ALTER COLUMN id SET DEFAULT nextval('announcement_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: piotrpawlus
--

ALTER TABLE ONLY announcements ALTER COLUMN id SET DEFAULT nextval('announcements_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: piotrpawlus
--

ALTER TABLE ONLY photos ALTER COLUMN id SET DEFAULT nextval('photos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: piotrpawlus
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: announcement_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: piotrpawlus; Tablespace: 
--

ALTER TABLE ONLY announcement_categories
    ADD CONSTRAINT announcement_categories_pkey PRIMARY KEY (id);


--
-- Name: announcements_pkey; Type: CONSTRAINT; Schema: public; Owner: piotrpawlus; Tablespace: 
--

ALTER TABLE ONLY announcements
    ADD CONSTRAINT announcements_pkey PRIMARY KEY (id);


--
-- Name: photos_pkey; Type: CONSTRAINT; Schema: public; Owner: piotrpawlus; Tablespace: 
--

ALTER TABLE ONLY photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: piotrpawlus; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_announcements_on_announcement_category_id; Type: INDEX; Schema: public; Owner: piotrpawlus; Tablespace: 
--

CREATE INDEX index_announcements_on_announcement_category_id ON announcements USING btree (announcement_category_id);


--
-- Name: index_announcements_on_user_id; Type: INDEX; Schema: public; Owner: piotrpawlus; Tablespace: 
--

CREATE INDEX index_announcements_on_user_id ON announcements USING btree (user_id);


--
-- Name: index_photos_on_announcement_id; Type: INDEX; Schema: public; Owner: piotrpawlus; Tablespace: 
--

CREATE INDEX index_photos_on_announcement_id ON photos USING btree (announcement_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: piotrpawlus; Tablespace: 
--

CREATE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_user_name; Type: INDEX; Schema: public; Owner: piotrpawlus; Tablespace: 
--

CREATE INDEX index_users_on_user_name ON users USING btree (user_name);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: piotrpawlus; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_9281ffc5d6; Type: FK CONSTRAINT; Schema: public; Owner: piotrpawlus
--

ALTER TABLE ONLY announcements
    ADD CONSTRAINT fk_rails_9281ffc5d6 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_acd046e845; Type: FK CONSTRAINT; Schema: public; Owner: piotrpawlus
--

ALTER TABLE ONLY photos
    ADD CONSTRAINT fk_rails_acd046e845 FOREIGN KEY (announcement_id) REFERENCES announcements(id);


--
-- Name: fk_rails_f8ad7992a5; Type: FK CONSTRAINT; Schema: public; Owner: piotrpawlus
--

ALTER TABLE ONLY announcements
    ADD CONSTRAINT fk_rails_f8ad7992a5 FOREIGN KEY (announcement_category_id) REFERENCES announcement_categories(id);


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

