--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.2
-- Dumped by pg_dump version 9.3.2
-- Started on 2014-04-18 07:28:06

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'WIN1254';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 230 (class 3079 OID 11750)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2354 (class 0 OID 0)
-- Dependencies: 230
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 171 (class 1259 OID 41603)
-- Name: aduana_comprobante; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE aduana_comprobante (
    codigo integer NOT NULL,
    codigo_comprobante integer NOT NULL,
    motivo character varying(254),
    destino character varying(254),
    documento_aduanero character varying(254),
    ruta character varying(254),
    codigo_establecimeinto_destino character varying(32),
    punto_partida character varying(254)
);


ALTER TABLE public.aduana_comprobante OWNER TO postgres;

--
-- TOC entry 2355 (class 0 OID 0)
-- Dependencies: 171
-- Name: TABLE aduana_comprobante; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE aduana_comprobante IS 'Datos aduaneros para guia de remisión';


--
-- TOC entry 2356 (class 0 OID 0)
-- Dependencies: 171
-- Name: COLUMN aduana_comprobante.codigo_comprobante; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN aduana_comprobante.codigo_comprobante IS 'Campo para identificación única del comprobante';


--
-- TOC entry 170 (class 1259 OID 41601)
-- Name: aduana_comprobante_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE aduana_comprobante_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aduana_comprobante_codigo_seq OWNER TO postgres;

--
-- TOC entry 2357 (class 0 OID 0)
-- Dependencies: 170
-- Name: aduana_comprobante_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE aduana_comprobante_codigo_seq OWNED BY aduana_comprobante.codigo;


--
-- TOC entry 173 (class 1259 OID 41616)
-- Name: clave_contingencia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE clave_contingencia (
    codigo integer NOT NULL,
    codigo_emisor integer,
    clave character(64),
    utilizada character(1),
    codigo_comprobante integer,
    fecha_ingreso timestamp without time zone,
    fecha_uso timestamp without time zone
);


ALTER TABLE public.clave_contingencia OWNER TO postgres;

--
-- TOC entry 2358 (class 0 OID 0)
-- Dependencies: 173
-- Name: TABLE clave_contingencia; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE clave_contingencia IS 'Entidad para claves de contingencia.

La longitud de las claves debe ser de 37 caracteres.
';


--
-- TOC entry 2359 (class 0 OID 0)
-- Dependencies: 173
-- Name: COLUMN clave_contingencia.codigo_emisor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN clave_contingencia.codigo_emisor IS 'Es el identificador único del emisor';


--
-- TOC entry 172 (class 1259 OID 41614)
-- Name: clave_contingencia_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE clave_contingencia_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clave_contingencia_codigo_seq OWNER TO postgres;

--
-- TOC entry 2360 (class 0 OID 0)
-- Dependencies: 172
-- Name: clave_contingencia_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE clave_contingencia_codigo_seq OWNED BY clave_contingencia.codigo;


--
-- TOC entry 174 (class 1259 OID 41624)
-- Name: comprobante; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE comprobante (
    codigo integer NOT NULL,
    codigo_tipo_comprobante integer NOT NULL,
    codigo_emisor integer,
    codigo_tipo_emision integer,
    codigo_establecimiento integer,
    secuencial character varying(64),
    numero_factura integer,
    fecha_emision timestamp without time zone,
    codigo_tipo_comprador integer,
    comprador character varying(128),
    identificacion_comprador character varying(32),
    direccion_comprador character varying(128),
    telefono_comprador character varying(32),
    movil_comprador character varying(32),
    correo_comprador character varying(128),
    subtotal_iva numeric,
    subtotal_no_iva numeric,
    subtotal_no_impuesto numeric,
    subtotal numeric,
    descuento numeric,
    iva numeric,
    ice numeric,
    propina numeric,
    total numeric,
    moneda character varying(64),
    guia_remision character varying(254),
    xml character varying(254),
    pdf character varying(254),
    numero_autorizacion character varying(254),
    fecha_autorizacion timestamp without time zone
);


ALTER TABLE public.comprobante OWNER TO postgres;

--
-- TOC entry 2361 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN comprobante.codigo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comprobante.codigo IS 'Campo para identificación única del comprobante';


--
-- TOC entry 2362 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN comprobante.codigo_emisor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comprobante.codigo_emisor IS 'Es el identificador único del emisor';


--
-- TOC entry 2363 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN comprobante.codigo_establecimiento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comprobante.codigo_establecimiento IS 'Numero del establecimiento del emisor';


--
-- TOC entry 2364 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN comprobante.secuencial; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comprobante.secuencial IS 'Numero secuencial generado por el sistema Anyway Invoice de la tabla de secuenciales.';


--
-- TOC entry 2365 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN comprobante.numero_factura; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comprobante.numero_factura IS 'Número de referencia de número de comprobante en el sistema de facturación del emisor.
';


--
-- TOC entry 2366 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN comprobante.fecha_emision; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comprobante.fecha_emision IS 'Fecha de emisión del comprobante
';


--
-- TOC entry 2367 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN comprobante.comprador; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comprobante.comprador IS 'Razón social del comprador';


--
-- TOC entry 2368 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN comprobante.identificacion_comprador; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comprobante.identificacion_comprador IS 'Identificación del comprador';


--
-- TOC entry 2369 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN comprobante.direccion_comprador; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comprobante.direccion_comprador IS 'Dirección del comprador';


--
-- TOC entry 2370 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN comprobante.telefono_comprador; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comprobante.telefono_comprador IS 'Teléfono del comprador';


--
-- TOC entry 2371 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN comprobante.correo_comprador; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comprobante.correo_comprador IS 'Correo electrónico del comprador';


--
-- TOC entry 2372 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN comprobante.subtotal_no_iva; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comprobante.subtotal_no_iva IS 'Total de la factura sin impuestos';


--
-- TOC entry 2373 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN comprobante.descuento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comprobante.descuento IS 'Total de descuentos de la factura';


--
-- TOC entry 2374 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN comprobante.ice; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comprobante.ice IS 'Valor del ICE';


--
-- TOC entry 2375 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN comprobante.propina; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comprobante.propina IS 'Valor  de la propina';


--
-- TOC entry 2376 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN comprobante.total; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comprobante.total IS 'Valor Total de la factura';


--
-- TOC entry 2377 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN comprobante.moneda; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comprobante.moneda IS 'Moneda de la transacción';


--
-- TOC entry 2378 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN comprobante.guia_remision; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comprobante.guia_remision IS 'Numero de guía de remisión';


--
-- TOC entry 2379 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN comprobante.xml; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comprobante.xml IS 'Es el nombre del archivo firmado y enviado al SRI. Solo debe tener datos en el caso de que se envío correctamente.';


--
-- TOC entry 178 (class 1259 OID 41646)
-- Name: comprobante_detalle; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE comprobante_detalle (
    codigo integer NOT NULL,
    codigo_comprobante integer NOT NULL,
    codigo_principal character varying(64),
    codigo_auxiliar character varying(64),
    cantidad numeric,
    precio_unitario numeric,
    detalle character varying(96),
    detalle_adicional1 character varying(96),
    detalle_adicional2 character varying(69),
    descuento numeric,
    precio_total numeric
);


ALTER TABLE public.comprobante_detalle OWNER TO postgres;

--
-- TOC entry 2380 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN comprobante_detalle.codigo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comprobante_detalle.codigo IS 'Es el código identificador del detalle de la factura';


--
-- TOC entry 2381 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN comprobante_detalle.codigo_comprobante; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comprobante_detalle.codigo_comprobante IS 'Campo para identificación única del comprobante';


--
-- TOC entry 2382 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN comprobante_detalle.codigo_principal; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comprobante_detalle.codigo_principal IS 'Es el código principal del producto';


--
-- TOC entry 2383 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN comprobante_detalle.codigo_auxiliar; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comprobante_detalle.codigo_auxiliar IS 'Es el códio auxiliar del producto';


--
-- TOC entry 2384 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN comprobante_detalle.cantidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comprobante_detalle.cantidad IS 'Es la cantidad del producto';


--
-- TOC entry 2385 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN comprobante_detalle.precio_unitario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comprobante_detalle.precio_unitario IS 'Es el precio unitario del producto';


--
-- TOC entry 2386 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN comprobante_detalle.detalle; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comprobante_detalle.detalle IS 'Es una información adicional del producto';


--
-- TOC entry 2387 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN comprobante_detalle.detalle_adicional1; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comprobante_detalle.detalle_adicional1 IS 'Es una información adicional del producto';


--
-- TOC entry 2388 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN comprobante_detalle.detalle_adicional2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comprobante_detalle.detalle_adicional2 IS 'Es una información adicional del producto';


--
-- TOC entry 2389 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN comprobante_detalle.descuento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comprobante_detalle.descuento IS 'Es el descuento del producto';


--
-- TOC entry 2390 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN comprobante_detalle.precio_total; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comprobante_detalle.precio_total IS 'Es el precio total del producto (Cantidad * PrecioUnitario)- Descuento';


--
-- TOC entry 177 (class 1259 OID 41644)
-- Name: comprobante_detalle_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comprobante_detalle_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comprobante_detalle_codigo_seq OWNER TO postgres;

--
-- TOC entry 2391 (class 0 OID 0)
-- Dependencies: 177
-- Name: comprobante_detalle_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comprobante_detalle_codigo_seq OWNED BY comprobante_detalle.codigo;


--
-- TOC entry 176 (class 1259 OID 41636)
-- Name: comprobante_lote; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE comprobante_lote (
    codigo integer NOT NULL,
    codigo_lote integer,
    mensajes character varying(254)
);


ALTER TABLE public.comprobante_lote OWNER TO postgres;

--
-- TOC entry 2392 (class 0 OID 0)
-- Dependencies: 176
-- Name: TABLE comprobante_lote; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE comprobante_lote IS 'Se incluyen los comprobantes que fueron enviados en el lote respectivo.';


--
-- TOC entry 2393 (class 0 OID 0)
-- Dependencies: 176
-- Name: COLUMN comprobante_lote.codigo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comprobante_lote.codigo IS 'Código único para identificación del comprobante por lote';


--
-- TOC entry 2394 (class 0 OID 0)
-- Dependencies: 176
-- Name: COLUMN comprobante_lote.codigo_lote; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comprobante_lote.codigo_lote IS 'Es el código único que representa al lote';


--
-- TOC entry 2395 (class 0 OID 0)
-- Dependencies: 176
-- Name: COLUMN comprobante_lote.mensajes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comprobante_lote.mensajes IS 'Campo que almacena los mensajes de cada comprobante enviados por el SRI.';


--
-- TOC entry 175 (class 1259 OID 41634)
-- Name: comprobante_lote_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comprobante_lote_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comprobante_lote_codigo_seq OWNER TO postgres;

--
-- TOC entry 2396 (class 0 OID 0)
-- Dependencies: 175
-- Name: comprobante_lote_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comprobante_lote_codigo_seq OWNED BY comprobante_lote.codigo;


--
-- TOC entry 216 (class 1259 OID 41861)
-- Name: comprobante_modifica; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE comprobante_modifica (
    codigo integer NOT NULL,
    codigo_comprobante integer NOT NULL,
    nombre_comprobante character varying(64),
    numero_comprobante character varying(64),
    fecha_emision timestamp without time zone,
    codigo_tipo_comprobante integer
);


ALTER TABLE public.comprobante_modifica OWNER TO postgres;

--
-- TOC entry 2397 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN comprobante_modifica.codigo_comprobante; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comprobante_modifica.codigo_comprobante IS 'Campo para identificación única del comprobante';


--
-- TOC entry 215 (class 1259 OID 41859)
-- Name: comprobante_modifica_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comprobante_modifica_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comprobante_modifica_codigo_seq OWNER TO postgres;

--
-- TOC entry 2398 (class 0 OID 0)
-- Dependencies: 215
-- Name: comprobante_modifica_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comprobante_modifica_codigo_seq OWNED BY comprobante_modifica.codigo;


--
-- TOC entry 180 (class 1259 OID 41659)
-- Name: emisor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE emisor (
    codigo integer NOT NULL,
    codigo_tipo_ambiente integer NOT NULL,
    codigo_proveedor_certificado integer NOT NULL,
    razon_social character varying(254),
    ruc character varying(254),
    nombre_comercial character varying(254),
    numero_resolucion character varying(254),
    es_contribuyente_especial character(2),
    lleva_contabilidad character(2),
    logo_imagen character varying(254),
    tiempo_espera integer,
    clave_interna character varying(254),
    direccion_matriz character varying(254),
    clave_firma character varying(254),
    correo_electronico character varying(254),
    correo_alternativo character varying(254),
    directorios character varying(254),
    nombre_certificado character varying(254),
    url_produccion character varying(254),
    url_pruebas character varying(254)
);


ALTER TABLE public.emisor OWNER TO postgres;

--
-- TOC entry 2399 (class 0 OID 0)
-- Dependencies: 180
-- Name: TABLE emisor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE emisor IS 'Clase emisor que almacenará la información necesaria para el SRI y el sistema Anyway Invoice.';


--
-- TOC entry 2400 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN emisor.codigo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN emisor.codigo IS 'Es el identificador único del emisor';


--
-- TOC entry 2401 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN emisor.razon_social; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN emisor.razon_social IS 'Es la razón social del emisor';


--
-- TOC entry 2402 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN emisor.ruc; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN emisor.ruc IS 'Es el Ruc del emisor';


--
-- TOC entry 2403 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN emisor.nombre_comercial; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN emisor.nombre_comercial IS 'Es el nombre comecial del emisor';


--
-- TOC entry 2404 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN emisor.numero_resolucion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN emisor.numero_resolucion IS 'Es el numero de resolución de contribuyente especial,l si es el caso. Es obligatorio si el indicador de Contribuyente Especial es S';


--
-- TOC entry 2405 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN emisor.es_contribuyente_especial; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN emisor.es_contribuyente_especial IS 'Es el indicador de si el emisor es contribuyente especial. Si es "S" el numero de resolución es obligatorio.';


--
-- TOC entry 2406 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN emisor.lleva_contabilidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN emisor.lleva_contabilidad IS 'Es el indicador de si el emisor lleva contabilidad.';


--
-- TOC entry 2407 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN emisor.logo_imagen; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN emisor.logo_imagen IS 'Es el campo que contendrá el logo en formato gráfico para impresión.';


--
-- TOC entry 2408 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN emisor.tiempo_espera; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN emisor.tiempo_espera IS 'Tiempo de espera para envío de comprobantes.';


--
-- TOC entry 2409 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN emisor.nombre_certificado; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN emisor.nombre_certificado IS 'Nombre del certificado';


--
-- TOC entry 179 (class 1259 OID 41657)
-- Name: emisor_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE emisor_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.emisor_codigo_seq OWNER TO postgres;

--
-- TOC entry 2410 (class 0 OID 0)
-- Dependencies: 179
-- Name: emisor_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE emisor_codigo_seq OWNED BY emisor.codigo;


--
-- TOC entry 182 (class 1259 OID 41673)
-- Name: establecimiento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE establecimiento (
    codigo integer NOT NULL,
    codigo_emisor integer NOT NULL,
    numero_establecimiento character varying(8),
    direccion character varying(254),
    punto_emision character varying(8)
);


ALTER TABLE public.establecimiento OWNER TO postgres;

--
-- TOC entry 2411 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN establecimiento.codigo_emisor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN establecimiento.codigo_emisor IS 'Es el identificador único del emisor';


--
-- TOC entry 181 (class 1259 OID 41671)
-- Name: establecimiento_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE establecimiento_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.establecimiento_codigo_seq OWNER TO postgres;

--
-- TOC entry 2412 (class 0 OID 0)
-- Dependencies: 181
-- Name: establecimiento_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE establecimiento_codigo_seq OWNED BY establecimiento.codigo;


--
-- TOC entry 184 (class 1259 OID 41683)
-- Name: estado; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estado (
    codigo_estado integer NOT NULL,
    codigo_tipo_estado integer NOT NULL,
    codigo_comprobante integer,
    descripcion character varying(254),
    documento character varying(32),
    xml character varying(254),
    pdf character varying(254),
    error text
);


ALTER TABLE public.estado OWNER TO postgres;

--
-- TOC entry 2413 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN estado.codigo_comprobante; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estado.codigo_comprobante IS 'Campo para identificación única del comprobante';


--
-- TOC entry 183 (class 1259 OID 41681)
-- Name: estado_codigo_estado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estado_codigo_estado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estado_codigo_estado_seq OWNER TO postgres;

--
-- TOC entry 2414 (class 0 OID 0)
-- Dependencies: 183
-- Name: estado_codigo_estado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estado_codigo_estado_seq OWNED BY estado.codigo_estado;


--
-- TOC entry 186 (class 1259 OID 41697)
-- Name: estado_cuenta; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estado_cuenta (
    codigo_estado_cuenta integer NOT NULL,
    codigo_emisor integer NOT NULL,
    codigo_estado integer NOT NULL,
    fecha_inicial timestamp without time zone,
    fecha_final timestamp without time zone
);


ALTER TABLE public.estado_cuenta OWNER TO postgres;

--
-- TOC entry 2415 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN estado_cuenta.codigo_emisor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estado_cuenta.codigo_emisor IS 'Es el identificador único del emisor';


--
-- TOC entry 185 (class 1259 OID 41695)
-- Name: estado_cuenta_codigo_estado_cuenta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estado_cuenta_codigo_estado_cuenta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estado_cuenta_codigo_estado_cuenta_seq OWNER TO postgres;

--
-- TOC entry 2416 (class 0 OID 0)
-- Dependencies: 185
-- Name: estado_cuenta_codigo_estado_cuenta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estado_cuenta_codigo_estado_cuenta_seq OWNED BY estado_cuenta.codigo_estado_cuenta;


--
-- TOC entry 188 (class 1259 OID 41708)
-- Name: impuesto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE impuesto (
    codigo_impuesto integer NOT NULL,
    codigo_tipo_impuesto integer NOT NULL,
    porcentaje numeric,
    descripcion character varying(254),
    codigo_sri character varying(8)
);


ALTER TABLE public.impuesto OWNER TO postgres;

--
-- TOC entry 2417 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN impuesto.porcentaje; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN impuesto.porcentaje IS 'Valor del porcentaje del impuesto o retención dependiendo del tipo de impuesto';


--
-- TOC entry 187 (class 1259 OID 41706)
-- Name: impuesto_codigo_impuesto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE impuesto_codigo_impuesto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.impuesto_codigo_impuesto_seq OWNER TO postgres;

--
-- TOC entry 2418 (class 0 OID 0)
-- Dependencies: 187
-- Name: impuesto_codigo_impuesto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE impuesto_codigo_impuesto_seq OWNED BY impuesto.codigo_impuesto;


--
-- TOC entry 190 (class 1259 OID 41721)
-- Name: impuestos_comprobante; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE impuestos_comprobante (
    codigo integer NOT NULL,
    codigo_comprobante_detalle integer,
    codigo_impuesto integer,
    base_impobible numeric,
    valor_impuesto numeric
);


ALTER TABLE public.impuestos_comprobante OWNER TO postgres;

--
-- TOC entry 2419 (class 0 OID 0)
-- Dependencies: 190
-- Name: TABLE impuestos_comprobante; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE impuestos_comprobante IS 'Entidad que contiene todas los impuestos del comprobante';


--
-- TOC entry 2420 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN impuestos_comprobante.codigo_comprobante_detalle; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN impuestos_comprobante.codigo_comprobante_detalle IS 'Es el código identificador del detalle de la factura';


--
-- TOC entry 189 (class 1259 OID 41719)
-- Name: impuestos_comprobante_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE impuestos_comprobante_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.impuestos_comprobante_codigo_seq OWNER TO postgres;

--
-- TOC entry 2421 (class 0 OID 0)
-- Dependencies: 189
-- Name: impuestos_comprobante_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE impuestos_comprobante_codigo_seq OWNED BY impuestos_comprobante.codigo;


--
-- TOC entry 192 (class 1259 OID 41733)
-- Name: lote; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE lote (
    codigo_lote integer NOT NULL,
    codigo_transaccion integer,
    nombre integer,
    fecha_creacion timestamp without time zone,
    fecha_envio timestamp without time zone,
    fecha_recepcion timestamp without time zone
);


ALTER TABLE public.lote OWNER TO postgres;

--
-- TOC entry 2422 (class 0 OID 0)
-- Dependencies: 192
-- Name: TABLE lote; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE lote IS 'Entidad para almancenar los lotes generados por cada subida de archivos';


--
-- TOC entry 2423 (class 0 OID 0)
-- Dependencies: 192
-- Name: COLUMN lote.codigo_lote; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN lote.codigo_lote IS 'Es el código único que representa al lote';


--
-- TOC entry 2424 (class 0 OID 0)
-- Dependencies: 192
-- Name: COLUMN lote.codigo_transaccion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN lote.codigo_transaccion IS 'Representa el código único de identificación de la transacción';


--
-- TOC entry 2425 (class 0 OID 0)
-- Dependencies: 192
-- Name: COLUMN lote.nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN lote.nombre IS 'Nombre del lote. ';


--
-- TOC entry 2426 (class 0 OID 0)
-- Dependencies: 192
-- Name: COLUMN lote.fecha_creacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN lote.fecha_creacion IS 'Fecha de creación del lote';


--
-- TOC entry 2427 (class 0 OID 0)
-- Dependencies: 192
-- Name: COLUMN lote.fecha_envio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN lote.fecha_envio IS 'Fecha de envío del lote';


--
-- TOC entry 2428 (class 0 OID 0)
-- Dependencies: 192
-- Name: COLUMN lote.fecha_recepcion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN lote.fecha_recepcion IS 'Fecha de recepción de la autorización del lote';


--
-- TOC entry 191 (class 1259 OID 41731)
-- Name: lote_codigo_lote_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE lote_codigo_lote_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lote_codigo_lote_seq OWNER TO postgres;

--
-- TOC entry 2429 (class 0 OID 0)
-- Dependencies: 191
-- Name: lote_codigo_lote_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE lote_codigo_lote_seq OWNED BY lote.codigo_lote;


--
-- TOC entry 223 (class 1259 OID 42039)
-- Name: pagina; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pagina (
    codigo integer NOT NULL,
    descripcion character varying(128),
    pagina character varying(128),
    activo integer DEFAULT 1,
    menu character varying(32),
    padre integer,
    codigo_padre integer,
    orden integer
);


ALTER TABLE public.pagina OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 42037)
-- Name: pagina_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pagina_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pagina_codigo_seq OWNER TO postgres;

--
-- TOC entry 2430 (class 0 OID 0)
-- Dependencies: 222
-- Name: pagina_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pagina_codigo_seq OWNED BY pagina.codigo;


--
-- TOC entry 224 (class 1259 OID 42046)
-- Name: pagina_perfil; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pagina_perfil (
    codigo_pagina integer,
    codigo_perfil integer,
    fecha timestamp without time zone DEFAULT now(),
    usuario integer
);


ALTER TABLE public.pagina_perfil OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 42061)
-- Name: perfil; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE perfil (
    codigo integer NOT NULL,
    descripcion character varying(64),
    activo integer DEFAULT 1
);


ALTER TABLE public.perfil OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 42059)
-- Name: perfil_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE perfil_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.perfil_codigo_seq OWNER TO postgres;

--
-- TOC entry 2431 (class 0 OID 0)
-- Dependencies: 225
-- Name: perfil_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE perfil_codigo_seq OWNED BY perfil.codigo;


--
-- TOC entry 194 (class 1259 OID 41743)
-- Name: perfil_usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE perfil_usuario (
    codigo_perfil_usuario integer NOT NULL,
    codigo_usuario integer,
    codigo_perfil integer
);


ALTER TABLE public.perfil_usuario OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 41741)
-- Name: perfil_usuario_codigo_perfil_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE perfil_usuario_codigo_perfil_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.perfil_usuario_codigo_perfil_usuario_seq OWNER TO postgres;

--
-- TOC entry 2432 (class 0 OID 0)
-- Dependencies: 193
-- Name: perfil_usuario_codigo_perfil_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE perfil_usuario_codigo_perfil_usuario_seq OWNED BY perfil_usuario.codigo_perfil_usuario;


--
-- TOC entry 221 (class 1259 OID 42029)
-- Name: permiso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE permiso (
    codigo integer NOT NULL,
    codigo_perfil integer,
    codigo_pagina integer,
    descripcion character varying(32),
    acceso_menu integer,
    acceso_consulta integer,
    acceso_guardar integer,
    acceso_actualizar integer,
    acceso_eliminar integer,
    fecha timestamp without time zone DEFAULT now(),
    activo integer DEFAULT 1,
    fecha_salida timestamp without time zone
);


ALTER TABLE public.permiso OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 42027)
-- Name: permiso_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE permiso_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permiso_codigo_seq OWNER TO postgres;

--
-- TOC entry 2433 (class 0 OID 0)
-- Dependencies: 220
-- Name: permiso_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE permiso_codigo_seq OWNED BY permiso.codigo;


--
-- TOC entry 228 (class 1259 OID 49154)
-- Name: producto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE producto (
    codigo integer NOT NULL,
    descripcion character varying(128),
    codigo_principal character varying(32),
    codigo_auxiliar character varying(32),
    precio_unitario numeric,
    descripcion_adicional character varying(128),
    aplica_iva character varying(1),
    aplica_ice character varying(1),
    activo integer
);


ALTER TABLE public.producto OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 49152)
-- Name: producto_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE producto_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.producto_codigo_seq OWNER TO postgres;

--
-- TOC entry 2434 (class 0 OID 0)
-- Dependencies: 227
-- Name: producto_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE producto_codigo_seq OWNED BY producto.codigo;


--
-- TOC entry 229 (class 1259 OID 49172)
-- Name: producto_impuesto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE producto_impuesto (
    codigo_producto integer,
    codigo_impuesto integer
);


ALTER TABLE public.producto_impuesto OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 41751)
-- Name: proveedor_certificado; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE proveedor_certificado (
    codigo integer NOT NULL,
    descripcion character varying(254)
);


ALTER TABLE public.proveedor_certificado OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 41759)
-- Name: saldo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE saldo (
    codigo integer NOT NULL,
    codigo_emisor integer NOT NULL,
    cantidad_adquirida integer,
    cantidad_utilizada integer,
    saldo numeric
);


ALTER TABLE public.saldo OWNER TO postgres;

--
-- TOC entry 2435 (class 0 OID 0)
-- Dependencies: 197
-- Name: TABLE saldo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE saldo IS 'Entidad para almacenar los saldos de los usuarios pos-pago';


--
-- TOC entry 2436 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN saldo.codigo_emisor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN saldo.codigo_emisor IS 'Es el identificador único del emisor';


--
-- TOC entry 2437 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN saldo.cantidad_adquirida; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN saldo.cantidad_adquirida IS 'cantidad original adquirida mediante el botón de pago';


--
-- TOC entry 2438 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN saldo.cantidad_utilizada; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN saldo.cantidad_utilizada IS 'Cantidad actual de transacciones utilizadas';


--
-- TOC entry 2439 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN saldo.saldo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN saldo.saldo IS 'Cantidad Adquirida - Cantidad Utilizada';


--
-- TOC entry 196 (class 1259 OID 41757)
-- Name: saldo_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE saldo_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saldo_codigo_seq OWNER TO postgres;

--
-- TOC entry 2440 (class 0 OID 0)
-- Dependencies: 196
-- Name: saldo_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE saldo_codigo_seq OWNED BY saldo.codigo;


--
-- TOC entry 198 (class 1259 OID 41770)
-- Name: secuencial_comprobante; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE secuencial_comprobante (
    codigo integer NOT NULL,
    codigo_tipo_comprobante integer,
    codigo_establecimiento integer,
    secuencial integer
);


ALTER TABLE public.secuencial_comprobante OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 41780)
-- Name: tipo_ambiente; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_ambiente (
    codigo integer NOT NULL,
    descripcion character varying(64),
    codigo_sri character varying(8)
);


ALTER TABLE public.tipo_ambiente OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 41778)
-- Name: tipo_ambiente_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_ambiente_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_ambiente_codigo_seq OWNER TO postgres;

--
-- TOC entry 2441 (class 0 OID 0)
-- Dependencies: 199
-- Name: tipo_ambiente_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_ambiente_codigo_seq OWNED BY tipo_ambiente.codigo;


--
-- TOC entry 218 (class 1259 OID 41869)
-- Name: tipo_comprador; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_comprador (
    codigo integer NOT NULL,
    descripcion character varying(64) NOT NULL,
    codigo_sri character varying(8) NOT NULL
);


ALTER TABLE public.tipo_comprador OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 41867)
-- Name: tipo_comprador_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_comprador_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_comprador_codigo_seq OWNER TO postgres;

--
-- TOC entry 2442 (class 0 OID 0)
-- Dependencies: 217
-- Name: tipo_comprador_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_comprador_codigo_seq OWNED BY tipo_comprador.codigo;


--
-- TOC entry 202 (class 1259 OID 41789)
-- Name: tipo_comprobante; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_comprobante (
    codigo integer NOT NULL,
    descripcion character varying(254),
    codigo_sri character varying(8)
);


ALTER TABLE public.tipo_comprobante OWNER TO postgres;

--
-- TOC entry 2443 (class 0 OID 0)
-- Dependencies: 202
-- Name: TABLE tipo_comprobante; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE tipo_comprobante IS 'Factura("01"),
NotaDeCredito("04"),
NotaDeDebito ("05"),
GuiaDeRemision ("06"),
ComprobanteDeRetencion("07");';


--
-- TOC entry 201 (class 1259 OID 41787)
-- Name: tipo_comprobante_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_comprobante_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_comprobante_codigo_seq OWNER TO postgres;

--
-- TOC entry 2444 (class 0 OID 0)
-- Dependencies: 201
-- Name: tipo_comprobante_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_comprobante_codigo_seq OWNED BY tipo_comprobante.codigo;


--
-- TOC entry 204 (class 1259 OID 41798)
-- Name: tipo_emision; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_emision (
    codigo_tipo_emision integer NOT NULL,
    descripcion character varying(64),
    codigo_sri character varying(8)
);


ALTER TABLE public.tipo_emision OWNER TO postgres;

--
-- TOC entry 2445 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE tipo_emision; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE tipo_emision IS 'Tabla que contiene los tipos de emisión de la factura: "Normal" e "Indisponibilidad del sistema"';


--
-- TOC entry 203 (class 1259 OID 41796)
-- Name: tipo_emision_codigo_tipo_emision_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_emision_codigo_tipo_emision_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_emision_codigo_tipo_emision_seq OWNER TO postgres;

--
-- TOC entry 2446 (class 0 OID 0)
-- Dependencies: 203
-- Name: tipo_emision_codigo_tipo_emision_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_emision_codigo_tipo_emision_seq OWNED BY tipo_emision.codigo_tipo_emision;


--
-- TOC entry 206 (class 1259 OID 41807)
-- Name: tipo_estado; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_estado (
    codigo integer NOT NULL,
    descripcion character varying(64),
    codigo_sri character varying(8)
);


ALTER TABLE public.tipo_estado OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 41805)
-- Name: tipo_estado_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_estado_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_estado_codigo_seq OWNER TO postgres;

--
-- TOC entry 2447 (class 0 OID 0)
-- Dependencies: 205
-- Name: tipo_estado_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_estado_codigo_seq OWNED BY tipo_estado.codigo;


--
-- TOC entry 208 (class 1259 OID 41816)
-- Name: tipo_impuesto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_impuesto (
    codigo integer NOT NULL,
    descripcion character varying(64),
    codigo_sri character varying(8)
);


ALTER TABLE public.tipo_impuesto OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 41814)
-- Name: tipo_impuesto_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_impuesto_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_impuesto_codigo_seq OWNER TO postgres;

--
-- TOC entry 2448 (class 0 OID 0)
-- Dependencies: 207
-- Name: tipo_impuesto_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_impuesto_codigo_seq OWNED BY tipo_impuesto.codigo;


--
-- TOC entry 210 (class 1259 OID 41825)
-- Name: transaccion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE transaccion (
    codigo_transaccion integer NOT NULL,
    codigo_emisor integer NOT NULL,
    fecha_transaccion timestamp without time zone,
    nombre_archivo character varying(254)
);


ALTER TABLE public.transaccion OWNER TO postgres;

--
-- TOC entry 2449 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE transaccion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE transaccion IS 'Entidad que almacena las transacciones realizadas por el emisor. Cada transacción puede contener varios lotes y cada lote máximo puede contener 50 comprobantes';


--
-- TOC entry 2450 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN transaccion.codigo_transaccion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN transaccion.codigo_transaccion IS 'Representa el código único de identificación de la transacción';


--
-- TOC entry 2451 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN transaccion.codigo_emisor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN transaccion.codigo_emisor IS 'Es el identificador único del emisor';


--
-- TOC entry 2452 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN transaccion.fecha_transaccion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN transaccion.fecha_transaccion IS 'Fecha en la que se realiza la transacción';


--
-- TOC entry 2453 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN transaccion.nombre_archivo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN transaccion.nombre_archivo IS 'Nombre del archivo subido por el usuario dessde la página web.';


--
-- TOC entry 209 (class 1259 OID 41823)
-- Name: transaccion_codigo_transaccion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE transaccion_codigo_transaccion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transaccion_codigo_transaccion_seq OWNER TO postgres;

--
-- TOC entry 2454 (class 0 OID 0)
-- Dependencies: 209
-- Name: transaccion_codigo_transaccion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE transaccion_codigo_transaccion_seq OWNED BY transaccion.codigo_transaccion;


--
-- TOC entry 212 (class 1259 OID 41835)
-- Name: transportista; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE transportista (
    codigo integer NOT NULL,
    codigo_comprobante integer NOT NULL,
    codigo_producto character varying(254),
    razon_social character varying(254),
    descripcion character varying(254),
    fecha_inicio timestamp without time zone,
    fecha_fin timestamp without time zone
);


ALTER TABLE public.transportista OWNER TO postgres;

--
-- TOC entry 2455 (class 0 OID 0)
-- Dependencies: 212
-- Name: TABLE transportista; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE transportista IS 'Almacena los productos que serán transportados para un guia de remisión';


--
-- TOC entry 2456 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN transportista.codigo_comprobante; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN transportista.codigo_comprobante IS 'Campo para identificación única del comprobante';


--
-- TOC entry 211 (class 1259 OID 41833)
-- Name: transportista_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE transportista_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transportista_codigo_seq OWNER TO postgres;

--
-- TOC entry 2457 (class 0 OID 0)
-- Dependencies: 211
-- Name: transportista_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE transportista_codigo_seq OWNED BY transportista.codigo;


--
-- TOC entry 214 (class 1259 OID 41848)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario (
    codigo integer NOT NULL,
    codigo_estado integer NOT NULL,
    identificador character varying(128) NOT NULL,
    nombre_completo character varying(128) NOT NULL,
    correo_electronico character varying(128) NOT NULL,
    correo_alternativo character varying(128),
    clave character varying(128)
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 2458 (class 0 OID 0)
-- Dependencies: 214
-- Name: TABLE usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE usuario IS 'Clase de usuario';


--
-- TOC entry 213 (class 1259 OID 41846)
-- Name: usuario_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuario_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_codigo_seq OWNER TO postgres;

--
-- TOC entry 2459 (class 0 OID 0)
-- Dependencies: 213
-- Name: usuario_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuario_codigo_seq OWNED BY usuario.codigo;


--
-- TOC entry 219 (class 1259 OID 41875)
-- Name: usuario_emisor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario_emisor (
    codigo_emisor integer NOT NULL,
    codigo_usuario integer NOT NULL
);


ALTER TABLE public.usuario_emisor OWNER TO postgres;

--
-- TOC entry 2460 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN usuario_emisor.codigo_emisor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuario_emisor.codigo_emisor IS 'Es el identificador único del emisor';


--
-- TOC entry 2014 (class 2604 OID 41606)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aduana_comprobante ALTER COLUMN codigo SET DEFAULT nextval('aduana_comprobante_codigo_seq'::regclass);


--
-- TOC entry 2015 (class 2604 OID 41619)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clave_contingencia ALTER COLUMN codigo SET DEFAULT nextval('clave_contingencia_codigo_seq'::regclass);


--
-- TOC entry 2017 (class 2604 OID 41649)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comprobante_detalle ALTER COLUMN codigo SET DEFAULT nextval('comprobante_detalle_codigo_seq'::regclass);


--
-- TOC entry 2016 (class 2604 OID 41639)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comprobante_lote ALTER COLUMN codigo SET DEFAULT nextval('comprobante_lote_codigo_seq'::regclass);


--
-- TOC entry 2035 (class 2604 OID 41864)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comprobante_modifica ALTER COLUMN codigo SET DEFAULT nextval('comprobante_modifica_codigo_seq'::regclass);


--
-- TOC entry 2018 (class 2604 OID 41662)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY emisor ALTER COLUMN codigo SET DEFAULT nextval('emisor_codigo_seq'::regclass);


--
-- TOC entry 2019 (class 2604 OID 41676)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY establecimiento ALTER COLUMN codigo SET DEFAULT nextval('establecimiento_codigo_seq'::regclass);


--
-- TOC entry 2020 (class 2604 OID 41686)
-- Name: codigo_estado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado ALTER COLUMN codigo_estado SET DEFAULT nextval('estado_codigo_estado_seq'::regclass);


--
-- TOC entry 2021 (class 2604 OID 41700)
-- Name: codigo_estado_cuenta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado_cuenta ALTER COLUMN codigo_estado_cuenta SET DEFAULT nextval('estado_cuenta_codigo_estado_cuenta_seq'::regclass);


--
-- TOC entry 2022 (class 2604 OID 41711)
-- Name: codigo_impuesto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY impuesto ALTER COLUMN codigo_impuesto SET DEFAULT nextval('impuesto_codigo_impuesto_seq'::regclass);


--
-- TOC entry 2023 (class 2604 OID 41724)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY impuestos_comprobante ALTER COLUMN codigo SET DEFAULT nextval('impuestos_comprobante_codigo_seq'::regclass);


--
-- TOC entry 2024 (class 2604 OID 41736)
-- Name: codigo_lote; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lote ALTER COLUMN codigo_lote SET DEFAULT nextval('lote_codigo_lote_seq'::regclass);


--
-- TOC entry 2040 (class 2604 OID 42042)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pagina ALTER COLUMN codigo SET DEFAULT nextval('pagina_codigo_seq'::regclass);


--
-- TOC entry 2043 (class 2604 OID 42064)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY perfil ALTER COLUMN codigo SET DEFAULT nextval('perfil_codigo_seq'::regclass);


--
-- TOC entry 2025 (class 2604 OID 41746)
-- Name: codigo_perfil_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY perfil_usuario ALTER COLUMN codigo_perfil_usuario SET DEFAULT nextval('perfil_usuario_codigo_perfil_usuario_seq'::regclass);


--
-- TOC entry 2037 (class 2604 OID 42032)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permiso ALTER COLUMN codigo SET DEFAULT nextval('permiso_codigo_seq'::regclass);


--
-- TOC entry 2045 (class 2604 OID 49157)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY producto ALTER COLUMN codigo SET DEFAULT nextval('producto_codigo_seq'::regclass);


--
-- TOC entry 2026 (class 2604 OID 41762)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY saldo ALTER COLUMN codigo SET DEFAULT nextval('saldo_codigo_seq'::regclass);


--
-- TOC entry 2027 (class 2604 OID 41783)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_ambiente ALTER COLUMN codigo SET DEFAULT nextval('tipo_ambiente_codigo_seq'::regclass);


--
-- TOC entry 2036 (class 2604 OID 41872)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_comprador ALTER COLUMN codigo SET DEFAULT nextval('tipo_comprador_codigo_seq'::regclass);


--
-- TOC entry 2028 (class 2604 OID 41792)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_comprobante ALTER COLUMN codigo SET DEFAULT nextval('tipo_comprobante_codigo_seq'::regclass);


--
-- TOC entry 2029 (class 2604 OID 41801)
-- Name: codigo_tipo_emision; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_emision ALTER COLUMN codigo_tipo_emision SET DEFAULT nextval('tipo_emision_codigo_tipo_emision_seq'::regclass);


--
-- TOC entry 2030 (class 2604 OID 41810)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_estado ALTER COLUMN codigo SET DEFAULT nextval('tipo_estado_codigo_seq'::regclass);


--
-- TOC entry 2031 (class 2604 OID 41819)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_impuesto ALTER COLUMN codigo SET DEFAULT nextval('tipo_impuesto_codigo_seq'::regclass);


--
-- TOC entry 2032 (class 2604 OID 41828)
-- Name: codigo_transaccion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transaccion ALTER COLUMN codigo_transaccion SET DEFAULT nextval('transaccion_codigo_transaccion_seq'::regclass);


--
-- TOC entry 2033 (class 2604 OID 41838)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transportista ALTER COLUMN codigo SET DEFAULT nextval('transportista_codigo_seq'::regclass);


--
-- TOC entry 2034 (class 2604 OID 41851)
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario ALTER COLUMN codigo SET DEFAULT nextval('usuario_codigo_seq'::regclass);


--
-- TOC entry 2288 (class 0 OID 41603)
-- Dependencies: 171
-- Data for Name: aduana_comprobante; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY aduana_comprobante (codigo, codigo_comprobante, motivo, destino, documento_aduanero, ruta, codigo_establecimeinto_destino, punto_partida) FROM stdin;
\.


--
-- TOC entry 2461 (class 0 OID 0)
-- Dependencies: 170
-- Name: aduana_comprobante_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('aduana_comprobante_codigo_seq', 1, false);


--
-- TOC entry 2290 (class 0 OID 41616)
-- Dependencies: 173
-- Data for Name: clave_contingencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY clave_contingencia (codigo, codigo_emisor, clave, utilizada, codigo_comprobante, fecha_ingreso, fecha_uso) FROM stdin;
\.


--
-- TOC entry 2462 (class 0 OID 0)
-- Dependencies: 172
-- Name: clave_contingencia_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('clave_contingencia_codigo_seq', 1, false);


--
-- TOC entry 2291 (class 0 OID 41624)
-- Dependencies: 174
-- Data for Name: comprobante; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comprobante (codigo, codigo_tipo_comprobante, codigo_emisor, codigo_tipo_emision, codigo_establecimiento, secuencial, numero_factura, fecha_emision, codigo_tipo_comprador, comprador, identificacion_comprador, direccion_comprador, telefono_comprador, movil_comprador, correo_comprador, subtotal_iva, subtotal_no_iva, subtotal_no_impuesto, subtotal, descuento, iva, ice, propina, total, moneda, guia_remision, xml, pdf, numero_autorizacion, fecha_autorizacion) FROM stdin;
\.


--
-- TOC entry 2295 (class 0 OID 41646)
-- Dependencies: 178
-- Data for Name: comprobante_detalle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comprobante_detalle (codigo, codigo_comprobante, codigo_principal, codigo_auxiliar, cantidad, precio_unitario, detalle, detalle_adicional1, detalle_adicional2, descuento, precio_total) FROM stdin;
\.


--
-- TOC entry 2463 (class 0 OID 0)
-- Dependencies: 177
-- Name: comprobante_detalle_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comprobante_detalle_codigo_seq', 1, false);


--
-- TOC entry 2293 (class 0 OID 41636)
-- Dependencies: 176
-- Data for Name: comprobante_lote; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comprobante_lote (codigo, codigo_lote, mensajes) FROM stdin;
\.


--
-- TOC entry 2464 (class 0 OID 0)
-- Dependencies: 175
-- Name: comprobante_lote_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comprobante_lote_codigo_seq', 1, false);


--
-- TOC entry 2333 (class 0 OID 41861)
-- Dependencies: 216
-- Data for Name: comprobante_modifica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comprobante_modifica (codigo, codigo_comprobante, nombre_comprobante, numero_comprobante, fecha_emision, codigo_tipo_comprobante) FROM stdin;
\.


--
-- TOC entry 2465 (class 0 OID 0)
-- Dependencies: 215
-- Name: comprobante_modifica_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comprobante_modifica_codigo_seq', 1, false);


--
-- TOC entry 2297 (class 0 OID 41659)
-- Dependencies: 180
-- Data for Name: emisor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY emisor (codigo, codigo_tipo_ambiente, codigo_proveedor_certificado, razon_social, ruc, nombre_comercial, numero_resolucion, es_contribuyente_especial, lleva_contabilidad, logo_imagen, tiempo_espera, clave_interna, direccion_matriz, clave_firma, correo_electronico, correo_alternativo, directorios, nombre_certificado, url_produccion, url_pruebas) FROM stdin;
\.


--
-- TOC entry 2466 (class 0 OID 0)
-- Dependencies: 179
-- Name: emisor_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('emisor_codigo_seq', 1, false);


--
-- TOC entry 2299 (class 0 OID 41673)
-- Dependencies: 182
-- Data for Name: establecimiento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY establecimiento (codigo, codigo_emisor, numero_establecimiento, direccion, punto_emision) FROM stdin;
\.


--
-- TOC entry 2467 (class 0 OID 0)
-- Dependencies: 181
-- Name: establecimiento_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('establecimiento_codigo_seq', 1, false);


--
-- TOC entry 2301 (class 0 OID 41683)
-- Dependencies: 184
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estado (codigo_estado, codigo_tipo_estado, codigo_comprobante, descripcion, documento, xml, pdf, error) FROM stdin;
\.


--
-- TOC entry 2468 (class 0 OID 0)
-- Dependencies: 183
-- Name: estado_codigo_estado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estado_codigo_estado_seq', 1, false);


--
-- TOC entry 2303 (class 0 OID 41697)
-- Dependencies: 186
-- Data for Name: estado_cuenta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estado_cuenta (codigo_estado_cuenta, codigo_emisor, codigo_estado, fecha_inicial, fecha_final) FROM stdin;
\.


--
-- TOC entry 2469 (class 0 OID 0)
-- Dependencies: 185
-- Name: estado_cuenta_codigo_estado_cuenta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estado_cuenta_codigo_estado_cuenta_seq', 1, false);


--
-- TOC entry 2305 (class 0 OID 41708)
-- Dependencies: 188
-- Data for Name: impuesto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY impuesto (codigo_impuesto, codigo_tipo_impuesto, porcentaje, descripcion, codigo_sri) FROM stdin;
1	1	12	Iva 12	01
\.


--
-- TOC entry 2470 (class 0 OID 0)
-- Dependencies: 187
-- Name: impuesto_codigo_impuesto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('impuesto_codigo_impuesto_seq', 1, true);


--
-- TOC entry 2307 (class 0 OID 41721)
-- Dependencies: 190
-- Data for Name: impuestos_comprobante; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY impuestos_comprobante (codigo, codigo_comprobante_detalle, codigo_impuesto, base_impobible, valor_impuesto) FROM stdin;
\.


--
-- TOC entry 2471 (class 0 OID 0)
-- Dependencies: 189
-- Name: impuestos_comprobante_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('impuestos_comprobante_codigo_seq', 1, false);


--
-- TOC entry 2309 (class 0 OID 41733)
-- Dependencies: 192
-- Data for Name: lote; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY lote (codigo_lote, codigo_transaccion, nombre, fecha_creacion, fecha_envio, fecha_recepcion) FROM stdin;
\.


--
-- TOC entry 2472 (class 0 OID 0)
-- Dependencies: 191
-- Name: lote_codigo_lote_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('lote_codigo_lote_seq', 1, false);


--
-- TOC entry 2340 (class 0 OID 42039)
-- Dependencies: 223
-- Data for Name: pagina; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pagina (codigo, descripcion, pagina, activo, menu, padre, codigo_padre, orden) FROM stdin;
1	Administracion	Administracion	1	Administracion	1	0	1
3	Gestion Permisos	Gestion Permisos	1	Gestion Permisos	1	1	4
5	Asignacion de paginas a perfil	paginaperfil.php	1	Asignar Paginas al Perfil	0	3	2
2	Salir	salir.php	1	Salir	0	1	5
4	Permisos	permiso.php	1	Permisos	0	3	3
6	Paginas	pagina.php	1	Paginas	0	3	1
7	Configuracion	Configuracion	1	Configuracion	1	1	3
8	Catalogos	Catalogos	1	Catalogos	1	7	7
9	Tipos de Impuesto	tipoimpuesto.php	1	Tipo de Impuesto	0	8	8
10	Tipo de comprobantes	tipocomprobante.php	1	Tipo de Comprobantes	0	8	9
11	Comprobantes	Comprobantes	1	Comprobantes	1	0	10
12	Facturas	factura.php	1	Facturas	0	11	11
\.


--
-- TOC entry 2473 (class 0 OID 0)
-- Dependencies: 222
-- Name: pagina_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pagina_codigo_seq', 12, true);


--
-- TOC entry 2341 (class 0 OID 42046)
-- Dependencies: 224
-- Data for Name: pagina_perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pagina_perfil (codigo_pagina, codigo_perfil, fecha, usuario) FROM stdin;
5	1	2014-03-31 21:14:11.218	\N
1	1	2014-03-31 21:14:11.3	\N
4	1	2014-03-31 21:14:11.302	\N
2	1	2014-03-31 21:14:11.303	\N
3	1	2014-03-31 21:14:11.304	\N
6	1	2014-03-31 21:14:11.306	\N
7	1	2014-04-05 07:34:08.511	\N
8	1	2014-04-05 07:34:08.516	\N
9	1	2014-04-05 07:34:08.516	\N
10	1	2014-04-05 07:51:38.3	\N
11	1	2014-04-05 12:08:43.817	\N
12	1	2014-04-05 12:10:48.067	\N
\.


--
-- TOC entry 2343 (class 0 OID 42061)
-- Dependencies: 226
-- Data for Name: perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY perfil (codigo, descripcion, activo) FROM stdin;
1	Administrador	1
\.


--
-- TOC entry 2474 (class 0 OID 0)
-- Dependencies: 225
-- Name: perfil_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('perfil_codigo_seq', 1, true);


--
-- TOC entry 2311 (class 0 OID 41743)
-- Dependencies: 194
-- Data for Name: perfil_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY perfil_usuario (codigo_perfil_usuario, codigo_usuario, codigo_perfil) FROM stdin;
\.


--
-- TOC entry 2475 (class 0 OID 0)
-- Dependencies: 193
-- Name: perfil_usuario_codigo_perfil_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('perfil_usuario_codigo_perfil_usuario_seq', 1, false);


--
-- TOC entry 2338 (class 0 OID 42029)
-- Dependencies: 221
-- Data for Name: permiso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY permiso (codigo, codigo_perfil, codigo_pagina, descripcion, acceso_menu, acceso_consulta, acceso_guardar, acceso_actualizar, acceso_eliminar, fecha, activo, fecha_salida) FROM stdin;
10	1	2	\N	1	1	\N	\N	\N	2014-03-31 21:14:11.304	1	\N
9	1	4	\N	1	1	0	0	0	2014-03-31 21:14:11.302	1	\N
12	1	6	\N	1	1	0	0	\N	2014-03-31 21:14:11.306	1	\N
13	1	7	\N	1	1	\N	\N	\N	2014-04-05 07:34:08.516	1	\N
14	1	8	\N	1	1	\N	\N	\N	2014-04-05 07:34:08.516	1	\N
15	1	9	\N	1	1	\N	\N	\N	2014-04-05 07:34:08.521	1	\N
3	1	1	\N	1	\N	\N	\N	\N	2014-03-27 22:30:25.4	0	2014-03-31 21:14:06.483
5	1	3	\N	1	\N	\N	\N	\N	2014-03-27 22:30:25.4	0	2014-03-31 21:14:06.497
2	1	5	\N	1	\N	\N	\N	\N	2014-03-27 22:30:25.4	0	2014-03-31 21:14:06.498
1	1	2	\N	1	\N	\N	\N	\N	2014-03-27 22:30:25.4	0	2014-03-31 21:14:06.5
4	1	4	\N	1	\N	\N	\N	\N	2014-03-27 22:30:25.4	0	2014-03-31 21:14:06.501
6	1	6	\N	1	\N	\N	\N	\N	2014-03-27 22:30:25.415	0	2014-03-31 21:14:06.503
16	1	10	\N	1	1	0	0	\N	2014-04-05 07:51:38.3	1	\N
17	1	11	\N	1	1	\N	\N	\N	2014-04-05 12:08:43.822	1	\N
18	1	12	\N	1	1	0	0	0	2014-04-05 12:10:48.097	1	\N
8	1	1	\N	1	1	\N	\N	\N	2014-03-31 21:14:11.301	1	\N
11	1	3	\N	1	1	\N	\N	\N	2014-03-31 21:14:11.305	1	\N
7	1	5	\N	1	1	0	0	0	2014-03-31 21:14:11.232	1	\N
\.


--
-- TOC entry 2476 (class 0 OID 0)
-- Dependencies: 220
-- Name: permiso_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('permiso_codigo_seq', 18, true);


--
-- TOC entry 2345 (class 0 OID 49154)
-- Dependencies: 228
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY producto (codigo, descripcion, codigo_principal, codigo_auxiliar, precio_unitario, descripcion_adicional, aplica_iva, aplica_ice, activo) FROM stdin;
1	CUADERNO 100h cuadros	CU001	CUADERNO	0.89	CUADERNO UNVERSITARIO	S	S	1
\.


--
-- TOC entry 2477 (class 0 OID 0)
-- Dependencies: 227
-- Name: producto_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('producto_codigo_seq', 1, true);


--
-- TOC entry 2346 (class 0 OID 49172)
-- Dependencies: 229
-- Data for Name: producto_impuesto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY producto_impuesto (codigo_producto, codigo_impuesto) FROM stdin;
1	1
\.


--
-- TOC entry 2312 (class 0 OID 41751)
-- Dependencies: 195
-- Data for Name: proveedor_certificado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY proveedor_certificado (codigo, descripcion) FROM stdin;
\.


--
-- TOC entry 2314 (class 0 OID 41759)
-- Dependencies: 197
-- Data for Name: saldo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY saldo (codigo, codigo_emisor, cantidad_adquirida, cantidad_utilizada, saldo) FROM stdin;
\.


--
-- TOC entry 2478 (class 0 OID 0)
-- Dependencies: 196
-- Name: saldo_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('saldo_codigo_seq', 1, false);


--
-- TOC entry 2315 (class 0 OID 41770)
-- Dependencies: 198
-- Data for Name: secuencial_comprobante; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY secuencial_comprobante (codigo, codigo_tipo_comprobante, codigo_establecimiento, secuencial) FROM stdin;
\.


--
-- TOC entry 2317 (class 0 OID 41780)
-- Dependencies: 200
-- Data for Name: tipo_ambiente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_ambiente (codigo, descripcion, codigo_sri) FROM stdin;
\.


--
-- TOC entry 2479 (class 0 OID 0)
-- Dependencies: 199
-- Name: tipo_ambiente_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_ambiente_codigo_seq', 1, false);


--
-- TOC entry 2335 (class 0 OID 41869)
-- Dependencies: 218
-- Data for Name: tipo_comprador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_comprador (codigo, descripcion, codigo_sri) FROM stdin;
\.


--
-- TOC entry 2480 (class 0 OID 0)
-- Dependencies: 217
-- Name: tipo_comprador_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_comprador_codigo_seq', 1, false);


--
-- TOC entry 2319 (class 0 OID 41789)
-- Dependencies: 202
-- Data for Name: tipo_comprobante; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_comprobante (codigo, descripcion, codigo_sri) FROM stdin;
1	FACTURA	01
2	NOTA DE CREDITO	04
3	NOTA DE DEBITO	05
4	GUIA DE REMISION	06
5	COMPROBANTE RETENCION	07
6	LOTE	00
\.


--
-- TOC entry 2481 (class 0 OID 0)
-- Dependencies: 201
-- Name: tipo_comprobante_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_comprobante_codigo_seq', 6, true);


--
-- TOC entry 2321 (class 0 OID 41798)
-- Dependencies: 204
-- Data for Name: tipo_emision; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_emision (codigo_tipo_emision, descripcion, codigo_sri) FROM stdin;
\.


--
-- TOC entry 2482 (class 0 OID 0)
-- Dependencies: 203
-- Name: tipo_emision_codigo_tipo_emision_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_emision_codigo_tipo_emision_seq', 1, false);


--
-- TOC entry 2323 (class 0 OID 41807)
-- Dependencies: 206
-- Data for Name: tipo_estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_estado (codigo, descripcion, codigo_sri) FROM stdin;
\.


--
-- TOC entry 2483 (class 0 OID 0)
-- Dependencies: 205
-- Name: tipo_estado_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_estado_codigo_seq', 1, false);


--
-- TOC entry 2325 (class 0 OID 41816)
-- Dependencies: 208
-- Data for Name: tipo_impuesto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_impuesto (codigo, descripcion, codigo_sri) FROM stdin;
1	FACTURA	01
2	NOTA DE CREDITO	04
3	NOTA DE DEBITO	05
4	GUIA  DE REMISION	06
5	COMPROBANTE RETENCION	07
6	LOTE	00
\.


--
-- TOC entry 2484 (class 0 OID 0)
-- Dependencies: 207
-- Name: tipo_impuesto_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_impuesto_codigo_seq', 6, true);


--
-- TOC entry 2327 (class 0 OID 41825)
-- Dependencies: 210
-- Data for Name: transaccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY transaccion (codigo_transaccion, codigo_emisor, fecha_transaccion, nombre_archivo) FROM stdin;
\.


--
-- TOC entry 2485 (class 0 OID 0)
-- Dependencies: 209
-- Name: transaccion_codigo_transaccion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('transaccion_codigo_transaccion_seq', 1, false);


--
-- TOC entry 2329 (class 0 OID 41835)
-- Dependencies: 212
-- Data for Name: transportista; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY transportista (codigo, codigo_comprobante, codigo_producto, razon_social, descripcion, fecha_inicio, fecha_fin) FROM stdin;
\.


--
-- TOC entry 2486 (class 0 OID 0)
-- Dependencies: 211
-- Name: transportista_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('transportista_codigo_seq', 1, false);


--
-- TOC entry 2331 (class 0 OID 41848)
-- Dependencies: 214
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuario (codigo, codigo_estado, identificador, nombre_completo, correo_electronico, correo_alternativo, clave) FROM stdin;
\.


--
-- TOC entry 2487 (class 0 OID 0)
-- Dependencies: 213
-- Name: usuario_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuario_codigo_seq', 1, false);


--
-- TOC entry 2336 (class 0 OID 41875)
-- Dependencies: 219
-- Data for Name: usuario_emisor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuario_emisor (codigo_emisor, codigo_usuario) FROM stdin;
\.


--
-- TOC entry 2146 (class 2606 OID 42045)
-- Name: pagina_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pagina
    ADD CONSTRAINT pagina_pkey PRIMARY KEY (codigo);


--
-- TOC entry 2148 (class 2606 OID 42067)
-- Name: perfil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY perfil
    ADD CONSTRAINT perfil_pkey PRIMARY KEY (codigo);


--
-- TOC entry 2144 (class 2606 OID 42036)
-- Name: permiso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY permiso
    ADD CONSTRAINT permiso_pkey PRIMARY KEY (codigo);


--
-- TOC entry 2049 (class 2606 OID 41611)
-- Name: pk_aduana_comprobante; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY aduana_comprobante
    ADD CONSTRAINT pk_aduana_comprobante PRIMARY KEY (codigo);


--
-- TOC entry 2053 (class 2606 OID 41621)
-- Name: pk_clave_contingencia; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY clave_contingencia
    ADD CONSTRAINT pk_clave_contingencia PRIMARY KEY (codigo);


--
-- TOC entry 2057 (class 2606 OID 41631)
-- Name: pk_comprobante; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY comprobante
    ADD CONSTRAINT pk_comprobante PRIMARY KEY (codigo);


--
-- TOC entry 2065 (class 2606 OID 41654)
-- Name: pk_comprobante_detalle; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY comprobante_detalle
    ADD CONSTRAINT pk_comprobante_detalle PRIMARY KEY (codigo);


--
-- TOC entry 2061 (class 2606 OID 41641)
-- Name: pk_comprobante_lote; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY comprobante_lote
    ADD CONSTRAINT pk_comprobante_lote PRIMARY KEY (codigo);


--
-- TOC entry 2140 (class 2606 OID 41866)
-- Name: pk_comprobante_modifica; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY comprobante_modifica
    ADD CONSTRAINT pk_comprobante_modifica PRIMARY KEY (codigo);


--
-- TOC entry 2070 (class 2606 OID 41667)
-- Name: pk_emisor; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY emisor
    ADD CONSTRAINT pk_emisor PRIMARY KEY (codigo);


--
-- TOC entry 2074 (class 2606 OID 41678)
-- Name: pk_establecimiento; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY establecimiento
    ADD CONSTRAINT pk_establecimiento PRIMARY KEY (codigo);


--
-- TOC entry 2079 (class 2606 OID 41691)
-- Name: pk_estado; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT pk_estado PRIMARY KEY (codigo_estado);


--
-- TOC entry 2084 (class 2606 OID 41702)
-- Name: pk_estado_cuenta; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estado_cuenta
    ADD CONSTRAINT pk_estado_cuenta PRIMARY KEY (codigo_estado_cuenta);


--
-- TOC entry 2088 (class 2606 OID 41716)
-- Name: pk_impuesto; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY impuesto
    ADD CONSTRAINT pk_impuesto PRIMARY KEY (codigo_impuesto);


--
-- TOC entry 2091 (class 2606 OID 41729)
-- Name: pk_impuestos_comprobante; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY impuestos_comprobante
    ADD CONSTRAINT pk_impuestos_comprobante PRIMARY KEY (codigo);


--
-- TOC entry 2095 (class 2606 OID 41738)
-- Name: pk_lote; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lote
    ADD CONSTRAINT pk_lote PRIMARY KEY (codigo_lote);


--
-- TOC entry 2099 (class 2606 OID 41748)
-- Name: pk_perfil_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY perfil_usuario
    ADD CONSTRAINT pk_perfil_usuario PRIMARY KEY (codigo_perfil_usuario);


--
-- TOC entry 2101 (class 2606 OID 41755)
-- Name: pk_proveedor_certificado; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY proveedor_certificado
    ADD CONSTRAINT pk_proveedor_certificado PRIMARY KEY (codigo);


--
-- TOC entry 2105 (class 2606 OID 41767)
-- Name: pk_saldo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY saldo
    ADD CONSTRAINT pk_saldo PRIMARY KEY (codigo);


--
-- TOC entry 2110 (class 2606 OID 41774)
-- Name: pk_secuencial_comprobante; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY secuencial_comprobante
    ADD CONSTRAINT pk_secuencial_comprobante PRIMARY KEY (codigo);


--
-- TOC entry 2113 (class 2606 OID 41785)
-- Name: pk_tipo_ambiente; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_ambiente
    ADD CONSTRAINT pk_tipo_ambiente PRIMARY KEY (codigo);


--
-- TOC entry 2142 (class 2606 OID 41874)
-- Name: pk_tipo_comprador; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_comprador
    ADD CONSTRAINT pk_tipo_comprador PRIMARY KEY (codigo);


--
-- TOC entry 2116 (class 2606 OID 41794)
-- Name: pk_tipo_comprobante; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_comprobante
    ADD CONSTRAINT pk_tipo_comprobante PRIMARY KEY (codigo);


--
-- TOC entry 2119 (class 2606 OID 41803)
-- Name: pk_tipo_emision; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_emision
    ADD CONSTRAINT pk_tipo_emision PRIMARY KEY (codigo_tipo_emision);


--
-- TOC entry 2122 (class 2606 OID 41812)
-- Name: pk_tipo_estado; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_estado
    ADD CONSTRAINT pk_tipo_estado PRIMARY KEY (codigo);


--
-- TOC entry 2125 (class 2606 OID 41821)
-- Name: pk_tipo_impuesto; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_impuesto
    ADD CONSTRAINT pk_tipo_impuesto PRIMARY KEY (codigo);


--
-- TOC entry 2129 (class 2606 OID 41830)
-- Name: pk_transaccion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY transaccion
    ADD CONSTRAINT pk_transaccion PRIMARY KEY (codigo_transaccion);


--
-- TOC entry 2133 (class 2606 OID 41843)
-- Name: pk_transportista; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY transportista
    ADD CONSTRAINT pk_transportista PRIMARY KEY (codigo);


--
-- TOC entry 2138 (class 2606 OID 41856)
-- Name: pk_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_usuario PRIMARY KEY (codigo);


--
-- TOC entry 2150 (class 2606 OID 49162)
-- Name: producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (codigo);


--
-- TOC entry 2066 (class 1259 OID 41668)
-- Name: adm_emisor_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX adm_emisor_pk ON emisor USING btree (codigo);


--
-- TOC entry 2135 (class 1259 OID 41857)
-- Name: adm_usuario_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX adm_usuario_pk ON usuario USING btree (codigo);


--
-- TOC entry 2046 (class 1259 OID 41612)
-- Name: aduana_comprobante_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX aduana_comprobante_pk ON aduana_comprobante USING btree (codigo);


--
-- TOC entry 2071 (class 1259 OID 41680)
-- Name: association10_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX association10_fk ON establecimiento USING btree (codigo_emisor);


--
-- TOC entry 2107 (class 1259 OID 41776)
-- Name: association11_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX association11_fk ON secuencial_comprobante USING btree (codigo_establecimiento);


--
-- TOC entry 2108 (class 1259 OID 41777)
-- Name: association12_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX association12_fk ON secuencial_comprobante USING btree (codigo_tipo_comprobante);


--
-- TOC entry 2054 (class 1259 OID 41633)
-- Name: association14_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX association14_fk ON comprobante USING btree (codigo_tipo_comprobante);


--
-- TOC entry 2062 (class 1259 OID 41656)
-- Name: association17_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX association17_fk ON comprobante_detalle USING btree (codigo_comprobante);


--
-- TOC entry 2075 (class 1259 OID 41694)
-- Name: association26_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX association26_fk ON estado USING btree (codigo_comprobante);


--
-- TOC entry 2050 (class 1259 OID 41623)
-- Name: association28_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX association28_fk ON clave_contingencia USING btree (codigo_emisor);


--
-- TOC entry 2058 (class 1259 OID 41643)
-- Name: association29_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX association29_fk ON comprobante_lote USING btree (codigo_lote);


--
-- TOC entry 2096 (class 1259 OID 41750)
-- Name: association2_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX association2_fk ON perfil_usuario USING btree (codigo_usuario);


--
-- TOC entry 2047 (class 1259 OID 41613)
-- Name: association30_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX association30_fk ON aduana_comprobante USING btree (codigo_comprobante);


--
-- TOC entry 2085 (class 1259 OID 41718)
-- Name: association32_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX association32_fk ON impuesto USING btree (codigo_tipo_impuesto);


--
-- TOC entry 2131 (class 1259 OID 41845)
-- Name: association34_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX association34_fk ON transportista USING btree (codigo_comprobante);


--
-- TOC entry 2103 (class 1259 OID 41769)
-- Name: association35_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX association35_fk ON saldo USING btree (codigo_emisor);


--
-- TOC entry 2127 (class 1259 OID 41832)
-- Name: association36_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX association36_fk ON transaccion USING btree (codigo_emisor);


--
-- TOC entry 2092 (class 1259 OID 41740)
-- Name: association37_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX association37_fk ON lote USING btree (codigo_transaccion);


--
-- TOC entry 2136 (class 1259 OID 41858)
-- Name: association3_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX association3_fk ON usuario USING btree (codigo_estado);


--
-- TOC entry 2076 (class 1259 OID 41693)
-- Name: association4_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX association4_fk ON estado USING btree (codigo_tipo_estado);


--
-- TOC entry 2080 (class 1259 OID 41704)
-- Name: association5_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX association5_fk ON estado_cuenta USING btree (codigo_emisor);


--
-- TOC entry 2081 (class 1259 OID 41705)
-- Name: association6_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX association6_fk ON estado_cuenta USING btree (codigo_estado);


--
-- TOC entry 2067 (class 1259 OID 41669)
-- Name: association8_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX association8_fk ON emisor USING btree (codigo_tipo_ambiente);


--
-- TOC entry 2068 (class 1259 OID 41670)
-- Name: association9_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX association9_fk ON emisor USING btree (codigo_proveedor_certificado);


--
-- TOC entry 2051 (class 1259 OID 41622)
-- Name: clavecontingencia_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX clavecontingencia_pk ON clave_contingencia USING btree (codigo);


--
-- TOC entry 2055 (class 1259 OID 41632)
-- Name: comprobante_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX comprobante_pk ON comprobante USING btree (codigo);


--
-- TOC entry 2059 (class 1259 OID 41642)
-- Name: comprobantelote_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX comprobantelote_pk ON comprobante_lote USING btree (codigo);


--
-- TOC entry 2063 (class 1259 OID 41655)
-- Name: detallecomprobante_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX detallecomprobante_pk ON comprobante_detalle USING btree (codigo);


--
-- TOC entry 2072 (class 1259 OID 41679)
-- Name: establecimiento_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX establecimiento_pk ON establecimiento USING btree (codigo);


--
-- TOC entry 2077 (class 1259 OID 41692)
-- Name: estado_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX estado_pk ON estado USING btree (codigo_estado);


--
-- TOC entry 2082 (class 1259 OID 41703)
-- Name: estadocuenta_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX estadocuenta_pk ON estado_cuenta USING btree (codigo_estado_cuenta);


--
-- TOC entry 2086 (class 1259 OID 41717)
-- Name: impuesto_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX impuesto_pk ON impuesto USING btree (codigo_impuesto);


--
-- TOC entry 2089 (class 1259 OID 41730)
-- Name: impuestos_comprobante_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX impuestos_comprobante_pk ON impuestos_comprobante USING btree (codigo);


--
-- TOC entry 2093 (class 1259 OID 41739)
-- Name: lote_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX lote_pk ON lote USING btree (codigo_lote);


--
-- TOC entry 2097 (class 1259 OID 41749)
-- Name: perfil_usuario_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX perfil_usuario_pk ON perfil_usuario USING btree (codigo_perfil_usuario);


--
-- TOC entry 2134 (class 1259 OID 41844)
-- Name: producto_transportado_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX producto_transportado_pk ON transportista USING btree (codigo);


--
-- TOC entry 2102 (class 1259 OID 41756)
-- Name: proveedorcertificado_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX proveedorcertificado_pk ON proveedor_certificado USING btree (codigo);


--
-- TOC entry 2106 (class 1259 OID 41768)
-- Name: saldo_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX saldo_pk ON saldo USING btree (codigo);


--
-- TOC entry 2111 (class 1259 OID 41775)
-- Name: secuencialcomprobante_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX secuencialcomprobante_pk ON secuencial_comprobante USING btree (codigo);


--
-- TOC entry 2114 (class 1259 OID 41786)
-- Name: tipo_ambiente_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX tipo_ambiente_pk ON tipo_ambiente USING btree (codigo);


--
-- TOC entry 2117 (class 1259 OID 41795)
-- Name: tipocomprobante_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX tipocomprobante_pk ON tipo_comprobante USING btree (codigo);


--
-- TOC entry 2120 (class 1259 OID 41804)
-- Name: tipoemision_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX tipoemision_pk ON tipo_emision USING btree (codigo_tipo_emision);


--
-- TOC entry 2123 (class 1259 OID 41813)
-- Name: tipoestado_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX tipoestado_pk ON tipo_estado USING btree (codigo);


--
-- TOC entry 2126 (class 1259 OID 41822)
-- Name: tipoimpuesto_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX tipoimpuesto_pk ON tipo_impuesto USING btree (codigo);


--
-- TOC entry 2130 (class 1259 OID 41831)
-- Name: transaccion_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX transaccion_pk ON transaccion USING btree (codigo_transaccion);


--
-- TOC entry 2151 (class 2606 OID 41878)
-- Name: fk_aduana_c_associati_comproba; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aduana_comprobante
    ADD CONSTRAINT fk_aduana_c_associati_comproba FOREIGN KEY (codigo_comprobante) REFERENCES comprobante(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2152 (class 2606 OID 41883)
-- Name: fk_clave_co_associati_emisor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clave_contingencia
    ADD CONSTRAINT fk_clave_co_associati_emisor FOREIGN KEY (codigo_emisor) REFERENCES emisor(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2158 (class 2606 OID 41913)
-- Name: fk_comproba_associati_comproba; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comprobante_detalle
    ADD CONSTRAINT fk_comproba_associati_comproba FOREIGN KEY (codigo_comprobante) REFERENCES comprobante(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2157 (class 2606 OID 41908)
-- Name: fk_comproba_associati_lote; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comprobante_lote
    ADD CONSTRAINT fk_comproba_associati_lote FOREIGN KEY (codigo_lote) REFERENCES lote(codigo_lote) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2156 (class 2606 OID 41903)
-- Name: fk_comproba_associati_tipo_com; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comprobante
    ADD CONSTRAINT fk_comproba_associati_tipo_com FOREIGN KEY (codigo_tipo_comprobante) REFERENCES tipo_comprobante(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2177 (class 2606 OID 42008)
-- Name: fk_comproba_reference_comproba; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comprobante_modifica
    ADD CONSTRAINT fk_comproba_reference_comproba FOREIGN KEY (codigo_comprobante) REFERENCES comprobante(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2153 (class 2606 OID 41888)
-- Name: fk_comproba_reference_emisor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comprobante
    ADD CONSTRAINT fk_comproba_reference_emisor FOREIGN KEY (codigo_emisor) REFERENCES emisor(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2155 (class 2606 OID 41898)
-- Name: fk_comproba_reference_tipo_com; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comprobante
    ADD CONSTRAINT fk_comproba_reference_tipo_com FOREIGN KEY (codigo_tipo_comprador) REFERENCES tipo_comprador(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2154 (class 2606 OID 41893)
-- Name: fk_comproba_reference_tipo_emi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comprobante
    ADD CONSTRAINT fk_comproba_reference_tipo_emi FOREIGN KEY (codigo_tipo_emision) REFERENCES tipo_emision(codigo_tipo_emision) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2160 (class 2606 OID 41923)
-- Name: fk_emisor_associati_proveedo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY emisor
    ADD CONSTRAINT fk_emisor_associati_proveedo FOREIGN KEY (codigo_proveedor_certificado) REFERENCES proveedor_certificado(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2159 (class 2606 OID 41918)
-- Name: fk_emisor_associati_tipo_amb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY emisor
    ADD CONSTRAINT fk_emisor_associati_tipo_amb FOREIGN KEY (codigo_tipo_ambiente) REFERENCES tipo_ambiente(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2161 (class 2606 OID 41928)
-- Name: fk_establec_associati_emisor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY establecimiento
    ADD CONSTRAINT fk_establec_associati_emisor FOREIGN KEY (codigo_emisor) REFERENCES emisor(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2162 (class 2606 OID 41933)
-- Name: fk_estado_associati_comproba; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT fk_estado_associati_comproba FOREIGN KEY (codigo_comprobante) REFERENCES comprobante(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2163 (class 2606 OID 41938)
-- Name: fk_estado_associati_tipo_est; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT fk_estado_associati_tipo_est FOREIGN KEY (codigo_tipo_estado) REFERENCES tipo_estado(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2164 (class 2606 OID 41943)
-- Name: fk_estado_c_associati_emisor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado_cuenta
    ADD CONSTRAINT fk_estado_c_associati_emisor FOREIGN KEY (codigo_emisor) REFERENCES emisor(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2165 (class 2606 OID 41948)
-- Name: fk_estado_c_associati_estado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado_cuenta
    ADD CONSTRAINT fk_estado_c_associati_estado FOREIGN KEY (codigo_estado) REFERENCES estado(codigo_estado) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2166 (class 2606 OID 41953)
-- Name: fk_impuesto_associati_tipo_imp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY impuesto
    ADD CONSTRAINT fk_impuesto_associati_tipo_imp FOREIGN KEY (codigo_tipo_impuesto) REFERENCES tipo_impuesto(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2168 (class 2606 OID 41963)
-- Name: fk_impuesto_reference_comproba; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY impuestos_comprobante
    ADD CONSTRAINT fk_impuesto_reference_comproba FOREIGN KEY (codigo_comprobante_detalle) REFERENCES comprobante_detalle(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2167 (class 2606 OID 41958)
-- Name: fk_impuesto_reference_impuesto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY impuestos_comprobante
    ADD CONSTRAINT fk_impuesto_reference_impuesto FOREIGN KEY (codigo_impuesto) REFERENCES impuesto(codigo_impuesto) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2169 (class 2606 OID 41968)
-- Name: fk_lote_associati_transacc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lote
    ADD CONSTRAINT fk_lote_associati_transacc FOREIGN KEY (codigo_transaccion) REFERENCES transaccion(codigo_transaccion) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2170 (class 2606 OID 41973)
-- Name: fk_perfil_u_associati_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY perfil_usuario
    ADD CONSTRAINT fk_perfil_u_associati_usuario FOREIGN KEY (codigo_usuario) REFERENCES usuario(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2171 (class 2606 OID 41978)
-- Name: fk_saldo_associati_emisor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY saldo
    ADD CONSTRAINT fk_saldo_associati_emisor FOREIGN KEY (codigo_emisor) REFERENCES emisor(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2172 (class 2606 OID 41983)
-- Name: fk_secuenci_associati_establec; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY secuencial_comprobante
    ADD CONSTRAINT fk_secuenci_associati_establec FOREIGN KEY (codigo_establecimiento) REFERENCES establecimiento(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2173 (class 2606 OID 41988)
-- Name: fk_secuenci_associati_tipo_com; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY secuencial_comprobante
    ADD CONSTRAINT fk_secuenci_associati_tipo_com FOREIGN KEY (codigo_tipo_comprobante) REFERENCES tipo_comprobante(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2174 (class 2606 OID 41993)
-- Name: fk_transacc_associati_emisor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transaccion
    ADD CONSTRAINT fk_transacc_associati_emisor FOREIGN KEY (codigo_emisor) REFERENCES emisor(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2175 (class 2606 OID 41998)
-- Name: fk_transpor_associati_comproba; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transportista
    ADD CONSTRAINT fk_transpor_associati_comproba FOREIGN KEY (codigo_comprobante) REFERENCES comprobante(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2178 (class 2606 OID 42013)
-- Name: fk_usuario__usuario_e_emisor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario_emisor
    ADD CONSTRAINT fk_usuario__usuario_e_emisor FOREIGN KEY (codigo_emisor) REFERENCES emisor(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2179 (class 2606 OID 42018)
-- Name: fk_usuario__usuario_e_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario_emisor
    ADD CONSTRAINT fk_usuario__usuario_e_usuario FOREIGN KEY (codigo_usuario) REFERENCES usuario(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2176 (class 2606 OID 42003)
-- Name: fk_usuario_associati_estado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_usuario_associati_estado FOREIGN KEY (codigo_estado) REFERENCES estado(codigo_estado) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2353 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2014-04-18 07:28:08

--
-- PostgreSQL database dump complete
--

