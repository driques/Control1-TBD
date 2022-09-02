--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2022-09-02 15:24:55

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 24577)
-- Name: avion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.avion (
    id_avion integer NOT NULL,
    id_modelo integer NOT NULL,
    id_compania integer NOT NULL,
    capacidad integer NOT NULL
);


ALTER TABLE public.avion OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 24580)
-- Name: clase; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clase (
    id_clase integer NOT NULL,
    nombre character varying(30) NOT NULL
);


ALTER TABLE public.clase OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 24583)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    id_cliente integer NOT NULL,
    nombre character varying(50) NOT NULL,
    dni character varying(30) NOT NULL,
    id_pais integer NOT NULL
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 24586)
-- Name: compania; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compania (
    id_compania integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.compania OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 24589)
-- Name: compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compra (
    monto numeric NOT NULL,
    fecha date NOT NULL,
    id_compra integer NOT NULL,
    id_cliente integer NOT NULL,
    id_pasaje integer NOT NULL
);


ALTER TABLE public.compra OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 24594)
-- Name: empleado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empleado (
    id_empleado integer NOT NULL,
    dni character varying(30) NOT NULL,
    nombre character varying(80) NOT NULL,
    sueldo numeric NOT NULL,
    id_compania integer NOT NULL
);


ALTER TABLE public.empleado OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24599)
-- Name: log_vuelo_avion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.log_vuelo_avion (
    id_vuelo bigint NOT NULL,
    id_avion bigint NOT NULL,
    id_avion_vuelo bigint NOT NULL
);


ALTER TABLE public.log_vuelo_avion OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24602)
-- Name: log_vuelo_empleado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.log_vuelo_empleado (
    id_log_vuelo_empleado bigint NOT NULL,
    id_vuelo bigint NOT NULL,
    id_empleado bigint NOT NULL
);


ALTER TABLE public.log_vuelo_empleado OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24605)
-- Name: log_vuelo_empleado_id_log_vuelo_empleado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.log_vuelo_empleado_id_log_vuelo_empleado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.log_vuelo_empleado_id_log_vuelo_empleado_seq OWNER TO postgres;

--
-- TOC entry 3402 (class 0 OID 0)
-- Dependencies: 217
-- Name: log_vuelo_empleado_id_log_vuelo_empleado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.log_vuelo_empleado_id_log_vuelo_empleado_seq OWNED BY public.log_vuelo_empleado.id_log_vuelo_empleado;


--
-- TOC entry 218 (class 1259 OID 24606)
-- Name: log_vuelo_id_avion_vuelo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.log_vuelo_id_avion_vuelo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.log_vuelo_id_avion_vuelo_seq OWNER TO postgres;

--
-- TOC entry 3403 (class 0 OID 0)
-- Dependencies: 218
-- Name: log_vuelo_id_avion_vuelo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.log_vuelo_id_avion_vuelo_seq OWNED BY public.log_vuelo_avion.id_avion_vuelo;


--
-- TOC entry 219 (class 1259 OID 24607)
-- Name: modelo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modelo (
    id_modelo integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.modelo OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24610)
-- Name: pais; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pais (
    nombre character varying(70) NOT NULL,
    id_pais integer NOT NULL
);


ALTER TABLE public.pais OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24613)
-- Name: pasaje; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pasaje (
    id_pasaje integer NOT NULL,
    id_clase integer NOT NULL
);


ALTER TABLE public.pasaje OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 24616)
-- Name: viaje; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.viaje (
    id_viaje bigint NOT NULL,
    id_pasaje bigint NOT NULL,
    id_vuelo bigint NOT NULL
);


ALTER TABLE public.viaje OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24619)
-- Name: viaje_id_viaje_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.viaje_id_viaje_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.viaje_id_viaje_seq OWNER TO postgres;

--
-- TOC entry 3404 (class 0 OID 0)
-- Dependencies: 223
-- Name: viaje_id_viaje_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.viaje_id_viaje_seq OWNED BY public.viaje.id_viaje;


--
-- TOC entry 224 (class 1259 OID 24620)
-- Name: vuelo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vuelo (
    id_vuelo integer NOT NULL,
    embarque date NOT NULL,
    id_origen integer NOT NULL,
    id_destino integer NOT NULL
);


ALTER TABLE public.vuelo OWNER TO postgres;

--
-- TOC entry 3214 (class 2604 OID 24623)
-- Name: log_vuelo_avion id_avion_vuelo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_vuelo_avion ALTER COLUMN id_avion_vuelo SET DEFAULT nextval('public.log_vuelo_id_avion_vuelo_seq'::regclass);


--
-- TOC entry 3215 (class 2604 OID 24624)
-- Name: log_vuelo_empleado id_log_vuelo_empleado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_vuelo_empleado ALTER COLUMN id_log_vuelo_empleado SET DEFAULT nextval('public.log_vuelo_empleado_id_log_vuelo_empleado_seq'::regclass);


--
-- TOC entry 3216 (class 2604 OID 24625)
-- Name: viaje id_viaje; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viaje ALTER COLUMN id_viaje SET DEFAULT nextval('public.viaje_id_viaje_seq'::regclass);


--
-- TOC entry 3218 (class 2606 OID 24627)
-- Name: avion avion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avion
    ADD CONSTRAINT avion_pkey PRIMARY KEY (id_avion);


--
-- TOC entry 3220 (class 2606 OID 24629)
-- Name: clase clase_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clase
    ADD CONSTRAINT clase_pkey PRIMARY KEY (id_clase);


--
-- TOC entry 3222 (class 2606 OID 24631)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);


--
-- TOC entry 3224 (class 2606 OID 24633)
-- Name: compania compania_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compania
    ADD CONSTRAINT compania_pkey PRIMARY KEY (id_compania);


--
-- TOC entry 3226 (class 2606 OID 24635)
-- Name: compra compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_pkey PRIMARY KEY (id_compra);


--
-- TOC entry 3228 (class 2606 OID 24637)
-- Name: empleado empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (id_empleado);


--
-- TOC entry 3232 (class 2606 OID 24639)
-- Name: log_vuelo_empleado id_log_vuelo_empleado; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_vuelo_empleado
    ADD CONSTRAINT id_log_vuelo_empleado PRIMARY KEY (id_log_vuelo_empleado);


--
-- TOC entry 3230 (class 2606 OID 24641)
-- Name: log_vuelo_avion log_vuelo_avion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_vuelo_avion
    ADD CONSTRAINT log_vuelo_avion_pkey PRIMARY KEY (id_avion_vuelo);


--
-- TOC entry 3234 (class 2606 OID 24643)
-- Name: modelo modelo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modelo
    ADD CONSTRAINT modelo_pkey PRIMARY KEY (id_modelo);


--
-- TOC entry 3236 (class 2606 OID 24645)
-- Name: pais pais_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pais
    ADD CONSTRAINT pais_pkey PRIMARY KEY (id_pais);


--
-- TOC entry 3238 (class 2606 OID 24647)
-- Name: pasaje pasaje_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pasaje
    ADD CONSTRAINT pasaje_pkey PRIMARY KEY (id_pasaje);


--
-- TOC entry 3240 (class 2606 OID 24649)
-- Name: viaje vpkey_viaje; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viaje
    ADD CONSTRAINT vpkey_viaje PRIMARY KEY (id_viaje);


--
-- TOC entry 3242 (class 2606 OID 24651)
-- Name: vuelo vuelo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelo
    ADD CONSTRAINT vuelo_pkey PRIMARY KEY (id_vuelo);


--
-- TOC entry 3249 (class 2606 OID 24652)
-- Name: log_vuelo_avion id_avion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_vuelo_avion
    ADD CONSTRAINT id_avion FOREIGN KEY (id_avion) REFERENCES public.avion(id_avion);


--
-- TOC entry 3253 (class 2606 OID 24657)
-- Name: pasaje id_clase_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pasaje
    ADD CONSTRAINT id_clase_fk FOREIGN KEY (id_clase) REFERENCES public.clase(id_clase) NOT VALID;


--
-- TOC entry 3246 (class 2606 OID 24662)
-- Name: compra id_cliente_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT id_cliente_fk FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente) NOT VALID;


--
-- TOC entry 3248 (class 2606 OID 24667)
-- Name: empleado id_compania_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT id_compania_fk FOREIGN KEY (id_compania) REFERENCES public.compania(id_compania) NOT VALID;


--
-- TOC entry 3243 (class 2606 OID 24672)
-- Name: avion id_compania_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avion
    ADD CONSTRAINT id_compania_fk FOREIGN KEY (id_compania) REFERENCES public.compania(id_compania) NOT VALID;


--
-- TOC entry 3256 (class 2606 OID 24677)
-- Name: vuelo id_destino; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelo
    ADD CONSTRAINT id_destino FOREIGN KEY (id_destino) REFERENCES public.pais(id_pais) NOT VALID;


--
-- TOC entry 3251 (class 2606 OID 24682)
-- Name: log_vuelo_empleado id_empleado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_vuelo_empleado
    ADD CONSTRAINT id_empleado FOREIGN KEY (id_empleado) REFERENCES public.empleado(id_empleado);


--
-- TOC entry 3244 (class 2606 OID 24687)
-- Name: avion id_modelo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avion
    ADD CONSTRAINT id_modelo_fk FOREIGN KEY (id_modelo) REFERENCES public.modelo(id_modelo) NOT VALID;


--
-- TOC entry 3257 (class 2606 OID 24692)
-- Name: vuelo id_origen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelo
    ADD CONSTRAINT id_origen FOREIGN KEY (id_origen) REFERENCES public.pais(id_pais) NOT VALID;


--
-- TOC entry 3245 (class 2606 OID 24697)
-- Name: cliente id_pais_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT id_pais_fk FOREIGN KEY (id_pais) REFERENCES public.pais(id_pais) NOT VALID;


--
-- TOC entry 3254 (class 2606 OID 24702)
-- Name: viaje id_pasaje; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viaje
    ADD CONSTRAINT id_pasaje FOREIGN KEY (id_pasaje) REFERENCES public.pasaje(id_pasaje);


--
-- TOC entry 3247 (class 2606 OID 24707)
-- Name: compra id_pasaje_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT id_pasaje_fk FOREIGN KEY (id_pasaje) REFERENCES public.pasaje(id_pasaje) NOT VALID;


--
-- TOC entry 3250 (class 2606 OID 24712)
-- Name: log_vuelo_avion id_vuelo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_vuelo_avion
    ADD CONSTRAINT id_vuelo FOREIGN KEY (id_vuelo) REFERENCES public.vuelo(id_vuelo);


--
-- TOC entry 3252 (class 2606 OID 24717)
-- Name: log_vuelo_empleado id_vuelo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_vuelo_empleado
    ADD CONSTRAINT id_vuelo FOREIGN KEY (id_vuelo) REFERENCES public.vuelo(id_vuelo);


--
-- TOC entry 3255 (class 2606 OID 24722)
-- Name: viaje id_vuelo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viaje
    ADD CONSTRAINT id_vuelo FOREIGN KEY (id_vuelo) REFERENCES public.vuelo(id_vuelo);


-- Completed on 2022-09-02 15:24:55

--
-- PostgreSQL database dump complete
--

