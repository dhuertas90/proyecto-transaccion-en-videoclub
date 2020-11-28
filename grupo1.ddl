--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.19
-- Dumped by pg_dump version 9.5.19

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: d_forma_pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.d_forma_pago (
    forma_pago_pk bigint NOT NULL,
    forma_pago_id integer,
    descripcion character varying(250),
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone
);


ALTER TABLE public.d_forma_pago OWNER TO postgres;

--
-- Name: d_forma_pago_forma_pago_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.d_forma_pago_forma_pago_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.d_forma_pago_forma_pago_pk_seq OWNER TO postgres;

--
-- Name: d_forma_pago_forma_pago_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.d_forma_pago_forma_pago_pk_seq OWNED BY public.d_forma_pago.forma_pago_pk;


--
-- Name: d_pelicula; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.d_pelicula (
    pelicula_pk bigint NOT NULL,
    categoria character varying(25),
    categoria_por_duracion text,
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    film_id integer
);


ALTER TABLE public.d_pelicula OWNER TO postgres;

--
-- Name: d_pelicula_pelicula_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.d_pelicula_pelicula_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.d_pelicula_pelicula_pk_seq OWNER TO postgres;

--
-- Name: d_pelicula_pelicula_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.d_pelicula_pelicula_pk_seq OWNED BY public.d_pelicula.pelicula_pk;


--
-- Name: d_tiempo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.d_tiempo (
    anio smallint,
    mes smallint,
    dia smallint,
    tiempo_id integer,
    semestre smallint,
    trimestre smallint
);


ALTER TABLE public.d_tiempo OWNER TO postgres;

--
-- Name: d_ubicacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.d_ubicacion (
    ubicacion_pk bigint NOT NULL,
    city_id integer,
    ciudad character varying(50),
    pais character varying(50),
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    country_id smallint
);


ALTER TABLE public.d_ubicacion OWNER TO postgres;

--
-- Name: d_ubicacion_ubicacion_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.d_ubicacion_ubicacion_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.d_ubicacion_ubicacion_pk_seq OWNER TO postgres;

--
-- Name: d_ubicacion_ubicacion_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.d_ubicacion_ubicacion_pk_seq OWNED BY public.d_ubicacion.ubicacion_pk;


--
-- Name: h_alquiler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.h_alquiler (
    pelicula_pk integer,
    tiempo_pk integer,
    ubicacion_pk integer,
    forma_pago_pk integer,
    monto numeric(7,2)
);


ALTER TABLE public.h_alquiler OWNER TO postgres;

--
-- Name: forma_pago_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d_forma_pago ALTER COLUMN forma_pago_pk SET DEFAULT nextval('public.d_forma_pago_forma_pago_pk_seq'::regclass);


--
-- Name: pelicula_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d_pelicula ALTER COLUMN pelicula_pk SET DEFAULT nextval('public.d_pelicula_pelicula_pk_seq'::regclass);


--
-- Name: ubicacion_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d_ubicacion ALTER COLUMN ubicacion_pk SET DEFAULT nextval('public.d_ubicacion_ubicacion_pk_seq'::regclass);


--
-- Name: idx_d_forma_pago_lookup; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_d_forma_pago_lookup ON public.d_forma_pago USING btree (forma_pago_id);


--
-- Name: idx_d_forma_pago_tk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_d_forma_pago_tk ON public.d_forma_pago USING btree (forma_pago_pk);


--
-- Name: idx_d_pelicula_lookup; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_d_pelicula_lookup ON public.d_pelicula USING btree (film_id);


--
-- Name: idx_d_pelicula_tk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_d_pelicula_tk ON public.d_pelicula USING btree (pelicula_pk);


--
-- Name: idx_d_ubicacion_lookup; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_d_ubicacion_lookup ON public.d_ubicacion USING btree (city_id, country_id);


--
-- Name: idx_d_ubicacion_tk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_d_ubicacion_tk ON public.d_ubicacion USING btree (ubicacion_pk);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

