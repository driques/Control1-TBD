--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

-- Started on 2022-09-04 17:05:19

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
-- TOC entry 220 (class 1259 OID 28700)
-- Name: avion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.avion (
    id bigint NOT NULL,
    id_modelo integer NOT NULL,
    id_compania integer NOT NULL,
    capacidad integer NOT NULL,
    dia integer NOT NULL,
    mes integer NOT NULL,
    anno integer NOT NULL
);


ALTER TABLE public.avion OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 28699)
-- Name: avion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.avion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.avion_id_seq OWNER TO postgres;

--
-- TOC entry 3445 (class 0 OID 0)
-- Dependencies: 219
-- Name: avion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.avion_id_seq OWNED BY public.avion.id;


--
-- TOC entry 228 (class 1259 OID 28763)
-- Name: cargo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cargo (
    id integer NOT NULL,
    nombre character(100) NOT NULL
);


ALTER TABLE public.cargo OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 28762)
-- Name: cargo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cargo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cargo_id_seq OWNER TO postgres;

--
-- TOC entry 3446 (class 0 OID 0)
-- Dependencies: 227
-- Name: cargo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cargo_id_seq OWNED BY public.cargo.id;


--
-- TOC entry 214 (class 1259 OID 28677)
-- Name: clase; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clase (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE public.clase OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 28676)
-- Name: clase_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clase_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clase_id_seq OWNER TO postgres;

--
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 213
-- Name: clase_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clase_id_seq OWNED BY public.clase.id;


--
-- TOC entry 212 (class 1259 OID 28665)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    id bigint NOT NULL,
    nombre character varying(100) NOT NULL,
    id_pais integer NOT NULL,
    dni character varying(100) NOT NULL
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 28664)
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_id_seq OWNER TO postgres;

--
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 211
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.id;


--
-- TOC entry 218 (class 1259 OID 28693)
-- Name: compania; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compania (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE public.compania OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 28692)
-- Name: compania_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.compania_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compania_id_seq OWNER TO postgres;

--
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 217
-- Name: compania_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compania_id_seq OWNED BY public.compania.id;


--
-- TOC entry 230 (class 1259 OID 28770)
-- Name: compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compra (
    id bigint NOT NULL,
    monto integer NOT NULL,
    id_cliente integer NOT NULL,
    id_pasaje integer NOT NULL,
    dia integer NOT NULL,
    mes integer NOT NULL,
    anno integer NOT NULL
);


ALTER TABLE public.compra OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 28769)
-- Name: compra_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.compra_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compra_id_seq OWNER TO postgres;

--
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 229
-- Name: compra_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compra_id_seq OWNED BY public.compra.id;


--
-- TOC entry 222 (class 1259 OID 28717)
-- Name: empleado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empleado (
    id bigint NOT NULL,
    dni character varying(100) NOT NULL,
    nombre character varying(100) NOT NULL,
    sueldo integer NOT NULL,
    id_compania integer NOT NULL,
    dia integer NOT NULL,
    mes integer NOT NULL,
    anno integer NOT NULL
);


ALTER TABLE public.empleado OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 28822)
-- Name: empleado_cargo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empleado_cargo (
    id bigint NOT NULL,
    id_empleado integer NOT NULL,
    id_cargo integer NOT NULL
);


ALTER TABLE public.empleado_cargo OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 28821)
-- Name: empleado_cargo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.empleado_cargo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.empleado_cargo_id_seq OWNER TO postgres;

--
-- TOC entry 3451 (class 0 OID 0)
-- Dependencies: 235
-- Name: empleado_cargo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.empleado_cargo_id_seq OWNED BY public.empleado_cargo.id;


--
-- TOC entry 221 (class 1259 OID 28716)
-- Name: empleado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.empleado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.empleado_id_seq OWNER TO postgres;

--
-- TOC entry 3452 (class 0 OID 0)
-- Dependencies: 221
-- Name: empleado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.empleado_id_seq OWNED BY public.empleado.id;


--
-- TOC entry 216 (class 1259 OID 28684)
-- Name: modelo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modelo (
    id integer NOT NULL,
    nombre character varying
);


ALTER TABLE public.modelo OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 28683)
-- Name: modelo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.modelo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modelo_id_seq OWNER TO postgres;

--
-- TOC entry 3453 (class 0 OID 0)
-- Dependencies: 215
-- Name: modelo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.modelo_id_seq OWNED BY public.modelo.id;


--
-- TOC entry 239 (class 1259 OID 29869)
-- Name: pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pago (
    id bigint NOT NULL,
    id_empleado integer NOT NULL,
    monto integer NOT NULL,
    dia integer NOT NULL,
    mes integer NOT NULL,
    anno integer NOT NULL
);


ALTER TABLE public.pago OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 29868)
-- Name: pago_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pago_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pago_id_seq OWNER TO postgres;

--
-- TOC entry 3454 (class 0 OID 0)
-- Dependencies: 238
-- Name: pago_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pago_id_seq OWNED BY public.pago.id;


--
-- TOC entry 210 (class 1259 OID 28634)
-- Name: pais; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pais (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE public.pais OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 28633)
-- Name: pais_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pais_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pais_id_seq OWNER TO postgres;

--
-- TOC entry 3455 (class 0 OID 0)
-- Dependencies: 209
-- Name: pais_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pais_id_seq OWNED BY public.pais.id;


--
-- TOC entry 226 (class 1259 OID 28746)
-- Name: pasaje; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pasaje (
    id bigint NOT NULL,
    id_vuelo integer,
    id_clase integer
);


ALTER TABLE public.pasaje OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 28745)
-- Name: pasaje_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pasaje_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pasaje_id_seq OWNER TO postgres;

--
-- TOC entry 3456 (class 0 OID 0)
-- Dependencies: 225
-- Name: pasaje_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pasaje_id_seq OWNED BY public.pasaje.id;


--
-- TOC entry 237 (class 1259 OID 29864)
-- Name: solo_chilenos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.solo_chilenos AS
 SELECT cliente.id
   FROM public.cliente,
    public.pais
  WHERE (((pais.nombre)::text = 'Chile'::text) AND (pais.id = cliente.id_pais));


ALTER TABLE public.solo_chilenos OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 28729)
-- Name: vuelo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vuelo (
    id bigint NOT NULL,
    id_origen integer NOT NULL,
    id_destino integer NOT NULL,
    dia integer NOT NULL,
    mes integer NOT NULL,
    anno integer NOT NULL
);


ALTER TABLE public.vuelo OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 28787)
-- Name: vuelo_avion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vuelo_avion (
    id bigint NOT NULL,
    id_vuelo integer NOT NULL,
    id_avion integer NOT NULL
);


ALTER TABLE public.vuelo_avion OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 28786)
-- Name: vuelo_avion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vuelo_avion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vuelo_avion_id_seq OWNER TO postgres;

--
-- TOC entry 3457 (class 0 OID 0)
-- Dependencies: 231
-- Name: vuelo_avion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vuelo_avion_id_seq OWNED BY public.vuelo_avion.id;


--
-- TOC entry 234 (class 1259 OID 28805)
-- Name: vuelo_empleado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vuelo_empleado (
    id bigint NOT NULL,
    id_vuelo integer NOT NULL,
    id_empleado integer NOT NULL
);


ALTER TABLE public.vuelo_empleado OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 28804)
-- Name: vuelo_empleado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vuelo_empleado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vuelo_empleado_id_seq OWNER TO postgres;

--
-- TOC entry 3458 (class 0 OID 0)
-- Dependencies: 233
-- Name: vuelo_empleado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vuelo_empleado_id_seq OWNED BY public.vuelo_empleado.id;


--
-- TOC entry 223 (class 1259 OID 28728)
-- Name: vuelo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vuelo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vuelo_id_seq OWNER TO postgres;

--
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 223
-- Name: vuelo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vuelo_id_seq OWNED BY public.vuelo.id;


--
-- TOC entry 3243 (class 2604 OID 28703)
-- Name: avion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avion ALTER COLUMN id SET DEFAULT nextval('public.avion_id_seq'::regclass);


--
-- TOC entry 3247 (class 2604 OID 28766)
-- Name: cargo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cargo ALTER COLUMN id SET DEFAULT nextval('public.cargo_id_seq'::regclass);


--
-- TOC entry 3240 (class 2604 OID 28680)
-- Name: clase id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clase ALTER COLUMN id SET DEFAULT nextval('public.clase_id_seq'::regclass);


--
-- TOC entry 3239 (class 2604 OID 28668)
-- Name: cliente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);


--
-- TOC entry 3242 (class 2604 OID 28696)
-- Name: compania id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compania ALTER COLUMN id SET DEFAULT nextval('public.compania_id_seq'::regclass);


--
-- TOC entry 3248 (class 2604 OID 28773)
-- Name: compra id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra ALTER COLUMN id SET DEFAULT nextval('public.compra_id_seq'::regclass);


--
-- TOC entry 3244 (class 2604 OID 28720)
-- Name: empleado id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado ALTER COLUMN id SET DEFAULT nextval('public.empleado_id_seq'::regclass);


--
-- TOC entry 3251 (class 2604 OID 28825)
-- Name: empleado_cargo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado_cargo ALTER COLUMN id SET DEFAULT nextval('public.empleado_cargo_id_seq'::regclass);


--
-- TOC entry 3241 (class 2604 OID 28687)
-- Name: modelo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modelo ALTER COLUMN id SET DEFAULT nextval('public.modelo_id_seq'::regclass);


--
-- TOC entry 3252 (class 2604 OID 29872)
-- Name: pago id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago ALTER COLUMN id SET DEFAULT nextval('public.pago_id_seq'::regclass);


--
-- TOC entry 3238 (class 2604 OID 28637)
-- Name: pais id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pais ALTER COLUMN id SET DEFAULT nextval('public.pais_id_seq'::regclass);


--
-- TOC entry 3246 (class 2604 OID 28749)
-- Name: pasaje id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pasaje ALTER COLUMN id SET DEFAULT nextval('public.pasaje_id_seq'::regclass);


--
-- TOC entry 3245 (class 2604 OID 28732)
-- Name: vuelo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelo ALTER COLUMN id SET DEFAULT nextval('public.vuelo_id_seq'::regclass);


--
-- TOC entry 3249 (class 2604 OID 28790)
-- Name: vuelo_avion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelo_avion ALTER COLUMN id SET DEFAULT nextval('public.vuelo_avion_id_seq'::regclass);


--
-- TOC entry 3250 (class 2604 OID 28808)
-- Name: vuelo_empleado id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelo_empleado ALTER COLUMN id SET DEFAULT nextval('public.vuelo_empleado_id_seq'::regclass);


--
-- TOC entry 3262 (class 2606 OID 28698)
-- Name: compania compania_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compania
    ADD CONSTRAINT compania_pkey PRIMARY KEY (id) INCLUDE (id);


--
-- TOC entry 3264 (class 2606 OID 28705)
-- Name: avion id_avion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avion
    ADD CONSTRAINT id_avion PRIMARY KEY (id) INCLUDE (id);


--
-- TOC entry 3272 (class 2606 OID 28768)
-- Name: cargo id_cargo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cargo
    ADD CONSTRAINT id_cargo PRIMARY KEY (id) INCLUDE (id);


--
-- TOC entry 3258 (class 2606 OID 28682)
-- Name: clase id_clase; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clase
    ADD CONSTRAINT id_clase PRIMARY KEY (id) INCLUDE (id);


--
-- TOC entry 3256 (class 2606 OID 28670)
-- Name: cliente id_cliente; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT id_cliente PRIMARY KEY (id) INCLUDE (id);


--
-- TOC entry 3274 (class 2606 OID 28775)
-- Name: compra id_compra; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT id_compra PRIMARY KEY (id) INCLUDE (id);


--
-- TOC entry 3266 (class 2606 OID 28722)
-- Name: empleado id_empleado; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT id_empleado PRIMARY KEY (id) INCLUDE (id);


--
-- TOC entry 3280 (class 2606 OID 28827)
-- Name: empleado_cargo id_empleado_cargo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado_cargo
    ADD CONSTRAINT id_empleado_cargo PRIMARY KEY (id) INCLUDE (id);


--
-- TOC entry 3260 (class 2606 OID 28691)
-- Name: modelo id_modelo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modelo
    ADD CONSTRAINT id_modelo PRIMARY KEY (id) INCLUDE (id);


--
-- TOC entry 3270 (class 2606 OID 28751)
-- Name: pasaje id_paasje; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pasaje
    ADD CONSTRAINT id_paasje PRIMARY KEY (id) INCLUDE (id);


--
-- TOC entry 3282 (class 2606 OID 29874)
-- Name: pago id_pago; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago
    ADD CONSTRAINT id_pago PRIMARY KEY (id) INCLUDE (id);


--
-- TOC entry 3268 (class 2606 OID 28734)
-- Name: vuelo id_vuelo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelo
    ADD CONSTRAINT id_vuelo PRIMARY KEY (id) INCLUDE (id);


--
-- TOC entry 3276 (class 2606 OID 28792)
-- Name: vuelo_avion id_vuelo_avion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelo_avion
    ADD CONSTRAINT id_vuelo_avion PRIMARY KEY (id) INCLUDE (id);


--
-- TOC entry 3278 (class 2606 OID 28810)
-- Name: vuelo_empleado id_vuelo_empleado; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelo_empleado
    ADD CONSTRAINT id_vuelo_empleado PRIMARY KEY (id) INCLUDE (id);


--
-- TOC entry 3254 (class 2606 OID 28639)
-- Name: pais pais_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pais
    ADD CONSTRAINT pais_pkey PRIMARY KEY (id);


--
-- TOC entry 3294 (class 2606 OID 28798)
-- Name: vuelo_avion id_avion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelo_avion
    ADD CONSTRAINT id_avion FOREIGN KEY (id_avion) REFERENCES public.avion(id);


--
-- TOC entry 3298 (class 2606 OID 28833)
-- Name: empleado_cargo id_cargo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado_cargo
    ADD CONSTRAINT id_cargo FOREIGN KEY (id_cargo) REFERENCES public.cargo(id);


--
-- TOC entry 3290 (class 2606 OID 28757)
-- Name: pasaje id_clase; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pasaje
    ADD CONSTRAINT id_clase FOREIGN KEY (id_clase) REFERENCES public.clase(id);


--
-- TOC entry 3291 (class 2606 OID 28776)
-- Name: compra id_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT id_cliente FOREIGN KEY (id_cliente) REFERENCES public.cliente(id);


--
-- TOC entry 3284 (class 2606 OID 28706)
-- Name: avion id_compania; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avion
    ADD CONSTRAINT id_compania FOREIGN KEY (id_compania) REFERENCES public.compania(id);


--
-- TOC entry 3286 (class 2606 OID 28723)
-- Name: empleado id_compania; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT id_compania FOREIGN KEY (id_compania) REFERENCES public.compania(id);


--
-- TOC entry 3296 (class 2606 OID 28816)
-- Name: vuelo_empleado id_empleado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelo_empleado
    ADD CONSTRAINT id_empleado FOREIGN KEY (id_empleado) REFERENCES public.empleado(id);


--
-- TOC entry 3297 (class 2606 OID 28828)
-- Name: empleado_cargo id_empleado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado_cargo
    ADD CONSTRAINT id_empleado FOREIGN KEY (id_empleado) REFERENCES public.empleado(id);


--
-- TOC entry 3299 (class 2606 OID 29875)
-- Name: pago id_empleado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago
    ADD CONSTRAINT id_empleado FOREIGN KEY (id_empleado) REFERENCES public.empleado(id);


--
-- TOC entry 3285 (class 2606 OID 28711)
-- Name: avion id_modelo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avion
    ADD CONSTRAINT id_modelo FOREIGN KEY (id_modelo) REFERENCES public.modelo(id);


--
-- TOC entry 3283 (class 2606 OID 28671)
-- Name: cliente id_pais; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT id_pais FOREIGN KEY (id_pais) REFERENCES public.pais(id) NOT VALID;


--
-- TOC entry 3288 (class 2606 OID 28740)
-- Name: vuelo id_pais_destino; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelo
    ADD CONSTRAINT id_pais_destino FOREIGN KEY (id_destino) REFERENCES public.pais(id);


--
-- TOC entry 3287 (class 2606 OID 28735)
-- Name: vuelo id_pais_origen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelo
    ADD CONSTRAINT id_pais_origen FOREIGN KEY (id_origen) REFERENCES public.pais(id);


--
-- TOC entry 3292 (class 2606 OID 28781)
-- Name: compra id_pasaje; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT id_pasaje FOREIGN KEY (id_pasaje) REFERENCES public.pasaje(id);


--
-- TOC entry 3289 (class 2606 OID 28752)
-- Name: pasaje id_vuelo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pasaje
    ADD CONSTRAINT id_vuelo FOREIGN KEY (id_vuelo) REFERENCES public.vuelo(id);


--
-- TOC entry 3293 (class 2606 OID 28793)
-- Name: vuelo_avion id_vuelo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelo_avion
    ADD CONSTRAINT id_vuelo FOREIGN KEY (id_vuelo) REFERENCES public.vuelo(id);


--
-- TOC entry 3295 (class 2606 OID 28811)
-- Name: vuelo_empleado id_vuelo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelo_empleado
    ADD CONSTRAINT id_vuelo FOREIGN KEY (id_vuelo) REFERENCES public.vuelo(id);


-- Completed on 2022-09-04 17:05:19

--
-- PostgreSQL database dump complete
--

