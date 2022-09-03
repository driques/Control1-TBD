--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2022-09-03 15:34:25

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
-- TOC entry 209 (class 1259 OID 25322)
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
-- TOC entry 210 (class 1259 OID 25325)
-- Name: cargo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cargo (
    id_cargo integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.cargo OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 25328)
-- Name: clase; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clase (
    id_clase integer NOT NULL,
    nombre character varying(30) NOT NULL
);


ALTER TABLE public.clase OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 25331)
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
-- TOC entry 213 (class 1259 OID 25334)
-- Name: compania; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compania (
    id_compania integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.compania OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 25337)
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
-- TOC entry 215 (class 1259 OID 25342)
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
-- TOC entry 216 (class 1259 OID 25347)
-- Name: log_empleado_cargo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.log_empleado_cargo (
    id_log_emp_car integer NOT NULL,
    id_empleado integer NOT NULL,
    id_cargo integer NOT NULL
);


ALTER TABLE public.log_empleado_cargo OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 25350)
-- Name: log_vuelo_avion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.log_vuelo_avion (
    id_vuelo bigint NOT NULL,
    id_avion bigint NOT NULL,
    id_avion_vuelo bigint NOT NULL
);


ALTER TABLE public.log_vuelo_avion OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 25353)
-- Name: log_vuelo_empleado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.log_vuelo_empleado (
    id_log_vuelo_empleado bigint NOT NULL,
    id_vuelo bigint NOT NULL,
    id_empleado bigint NOT NULL
);


ALTER TABLE public.log_vuelo_empleado OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 25356)
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
-- TOC entry 3407 (class 0 OID 0)
-- Dependencies: 219
-- Name: log_vuelo_empleado_id_log_vuelo_empleado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.log_vuelo_empleado_id_log_vuelo_empleado_seq OWNED BY public.log_vuelo_empleado.id_log_vuelo_empleado;


--
-- TOC entry 220 (class 1259 OID 25357)
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
-- TOC entry 3408 (class 0 OID 0)
-- Dependencies: 220
-- Name: log_vuelo_id_avion_vuelo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.log_vuelo_id_avion_vuelo_seq OWNED BY public.log_vuelo_avion.id_avion_vuelo;


--
-- TOC entry 221 (class 1259 OID 25358)
-- Name: modelo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modelo (
    id_modelo integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.modelo OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 25361)
-- Name: pais; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pais (
    nombre character varying(70) NOT NULL,
    id_pais integer NOT NULL
);


ALTER TABLE public.pais OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 25364)
-- Name: pasaje; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pasaje (
    id_pasaje integer NOT NULL,
    id_clase integer NOT NULL,
    id_vuelo integer NOT NULL,
    precio numeric NOT NULL
);


ALTER TABLE public.pasaje OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 25369)
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
-- TOC entry 3217 (class 2604 OID 25372)
-- Name: log_vuelo_avion id_avion_vuelo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_vuelo_avion ALTER COLUMN id_avion_vuelo SET DEFAULT nextval('public.log_vuelo_id_avion_vuelo_seq'::regclass);


--
-- TOC entry 3218 (class 2604 OID 25373)
-- Name: log_vuelo_empleado id_log_vuelo_empleado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_vuelo_empleado ALTER COLUMN id_log_vuelo_empleado SET DEFAULT nextval('public.log_vuelo_empleado_id_log_vuelo_empleado_seq'::regclass);


--
-- TOC entry 3220 (class 2606 OID 25375)
-- Name: avion avion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avion
    ADD CONSTRAINT avion_pkey PRIMARY KEY (id_avion);


--
-- TOC entry 3222 (class 2606 OID 25377)
-- Name: cargo cargo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cargo
    ADD CONSTRAINT cargo_pkey PRIMARY KEY (id_cargo);


--
-- TOC entry 3224 (class 2606 OID 25379)
-- Name: clase clase_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clase
    ADD CONSTRAINT clase_pkey PRIMARY KEY (id_clase);


--
-- TOC entry 3226 (class 2606 OID 25381)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);


--
-- TOC entry 3228 (class 2606 OID 25383)
-- Name: compania compania_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compania
    ADD CONSTRAINT compania_pkey PRIMARY KEY (id_compania);


--
-- TOC entry 3230 (class 2606 OID 25385)
-- Name: compra compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_pkey PRIMARY KEY (id_compra);


--
-- TOC entry 3232 (class 2606 OID 25387)
-- Name: empleado empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (id_empleado);


--
-- TOC entry 3238 (class 2606 OID 25389)
-- Name: log_vuelo_empleado id_log_vuelo_empleado; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_vuelo_empleado
    ADD CONSTRAINT id_log_vuelo_empleado PRIMARY KEY (id_log_vuelo_empleado);


--
-- TOC entry 3234 (class 2606 OID 25481)
-- Name: log_empleado_cargo log_empleado_cargo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_empleado_cargo
    ADD CONSTRAINT log_empleado_cargo_pkey PRIMARY KEY (id_log_emp_car);


--
-- TOC entry 3236 (class 2606 OID 25391)
-- Name: log_vuelo_avion log_vuelo_avion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_vuelo_avion
    ADD CONSTRAINT log_vuelo_avion_pkey PRIMARY KEY (id_avion_vuelo);


--
-- TOC entry 3240 (class 2606 OID 25393)
-- Name: modelo modelo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modelo
    ADD CONSTRAINT modelo_pkey PRIMARY KEY (id_modelo);


--
-- TOC entry 3242 (class 2606 OID 25395)
-- Name: pais pais_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pais
    ADD CONSTRAINT pais_pkey PRIMARY KEY (id_pais);


--
-- TOC entry 3244 (class 2606 OID 25397)
-- Name: pasaje pasaje_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pasaje
    ADD CONSTRAINT pasaje_pkey PRIMARY KEY (id_pasaje);


--
-- TOC entry 3246 (class 2606 OID 25399)
-- Name: vuelo vuelo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelo
    ADD CONSTRAINT vuelo_pkey PRIMARY KEY (id_vuelo);


--
-- TOC entry 3255 (class 2606 OID 25400)
-- Name: log_vuelo_avion id_avion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_vuelo_avion
    ADD CONSTRAINT id_avion FOREIGN KEY (id_avion) REFERENCES public.avion(id_avion);


--
-- TOC entry 3253 (class 2606 OID 25405)
-- Name: log_empleado_cargo id_cargo_pk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_empleado_cargo
    ADD CONSTRAINT id_cargo_pk FOREIGN KEY (id_cargo) REFERENCES public.cargo(id_cargo);


--
-- TOC entry 3259 (class 2606 OID 25410)
-- Name: pasaje id_clase_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pasaje
    ADD CONSTRAINT id_clase_fk FOREIGN KEY (id_clase) REFERENCES public.clase(id_clase) NOT VALID;


--
-- TOC entry 3250 (class 2606 OID 25415)
-- Name: compra id_cliente_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT id_cliente_fk FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente) NOT VALID;


--
-- TOC entry 3252 (class 2606 OID 25420)
-- Name: empleado id_compania_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT id_compania_fk FOREIGN KEY (id_compania) REFERENCES public.compania(id_compania) NOT VALID;


--
-- TOC entry 3247 (class 2606 OID 25425)
-- Name: avion id_compania_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avion
    ADD CONSTRAINT id_compania_fk FOREIGN KEY (id_compania) REFERENCES public.compania(id_compania) NOT VALID;


--
-- TOC entry 3261 (class 2606 OID 25430)
-- Name: vuelo id_destino; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelo
    ADD CONSTRAINT id_destino FOREIGN KEY (id_destino) REFERENCES public.pais(id_pais) NOT VALID;


--
-- TOC entry 3257 (class 2606 OID 25435)
-- Name: log_vuelo_empleado id_empleado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_vuelo_empleado
    ADD CONSTRAINT id_empleado FOREIGN KEY (id_empleado) REFERENCES public.empleado(id_empleado);


--
-- TOC entry 3254 (class 2606 OID 25440)
-- Name: log_empleado_cargo id_empleado_pk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_empleado_cargo
    ADD CONSTRAINT id_empleado_pk FOREIGN KEY (id_empleado) REFERENCES public.empleado(id_empleado);


--
-- TOC entry 3248 (class 2606 OID 25445)
-- Name: avion id_modelo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avion
    ADD CONSTRAINT id_modelo_fk FOREIGN KEY (id_modelo) REFERENCES public.modelo(id_modelo) NOT VALID;


--
-- TOC entry 3262 (class 2606 OID 25450)
-- Name: vuelo id_origen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelo
    ADD CONSTRAINT id_origen FOREIGN KEY (id_origen) REFERENCES public.pais(id_pais) NOT VALID;


--
-- TOC entry 3249 (class 2606 OID 25455)
-- Name: cliente id_pais_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT id_pais_fk FOREIGN KEY (id_pais) REFERENCES public.pais(id_pais) NOT VALID;


--
-- TOC entry 3251 (class 2606 OID 25460)
-- Name: compra id_pasaje_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT id_pasaje_fk FOREIGN KEY (id_pasaje) REFERENCES public.pasaje(id_pasaje) NOT VALID;


--
-- TOC entry 3256 (class 2606 OID 25465)
-- Name: log_vuelo_avion id_vuelo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_vuelo_avion
    ADD CONSTRAINT id_vuelo FOREIGN KEY (id_vuelo) REFERENCES public.vuelo(id_vuelo);


--
-- TOC entry 3258 (class 2606 OID 25470)
-- Name: log_vuelo_empleado id_vuelo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_vuelo_empleado
    ADD CONSTRAINT id_vuelo FOREIGN KEY (id_vuelo) REFERENCES public.vuelo(id_vuelo);


--
-- TOC entry 3260 (class 2606 OID 25475)
-- Name: pasaje id_vuelo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pasaje
    ADD CONSTRAINT id_vuelo_fk FOREIGN KEY (id_vuelo) REFERENCES public.vuelo(id_vuelo) NOT VALID;


-- Completed on 2022-09-03 15:34:25

--
-- PostgreSQL database dump complete
--

