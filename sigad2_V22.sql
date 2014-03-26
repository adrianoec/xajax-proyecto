/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     23/03/2014 9:40:04                           */
/*==============================================================*/


drop index association30_fk;

drop index aduana_comprobante_pk;

drop table aduana_comprobante;

drop index clavecontingencia_pk;

drop index association28_fk;

drop table clave_contingencia;

drop index comprobante_pk;

drop index association14_fk;

drop table comprobante;

drop index comprobantelote_pk;

drop index association29_fk;

drop table comprobante_lote;

drop table comprobante_modifica;

drop index detallecomprobante_pk;

drop index association17_fk;

drop table detalle_comprobante;

drop index association9_fk;

drop index association8_fk;

drop index adm_emisor_pk;

drop table emisor;

drop index establecimiento_pk;

drop index association10_fk;

drop table establecimiento;

drop index estado_pk;

drop index association4_fk;

drop index association26_fk;

drop table estado;

drop index estadocuenta_pk;

drop index association6_fk;

drop index association5_fk;

drop table estado_cuenta;

drop index impuesto_pk;

drop index association32_fk;

drop table impuesto;

drop index impuestos_comprobante_pk;

drop table impuestos_comprobante;

drop index lote_pk;

drop index association37_fk;

drop table lote;

drop table pagina;

drop table pagina_perfil;

drop table perfil;

drop index perfil_usuario_pk;

drop index association2_fk;

drop table perfil_usuario;

drop table permiso;

drop index proveedorcertificado_pk;

drop table proveedor_certificado;

drop index saldo_pk;

drop index association35_fk;

drop table saldo;

drop index secuencialcomprobante_pk;

drop index association12_fk;

drop index association11_fk;

drop table secuencial_comprobante;

drop index tipo_ambiente_pk;

drop table tipo_ambiente;

drop index tipocomprobante_pk;

drop table tipo_comprobante;

drop index tipoemision_pk;

drop table tipo_emision;

drop index tipoestado_pk;

drop table tipo_estado;

drop index tipoimpuesto_pk;

drop table tipo_impuesto;

drop index transaccion_pk;

drop index association36_fk;

drop table transaccion;

drop index producto_transportado_pk;

drop index association34_fk;

drop table transportista;

drop index association3_fk;

drop index adm_usuario_pk;

drop table usuario;

drop index usuario_emisor_pk;

drop index usuario_emisor_fk2;

drop index usuario_emisor_fk;

drop table usuario_emisor;

drop user postgres;

/*==============================================================*/
/* User: postgres                                               */
/*==============================================================*/
create user postgres sysid 10 createdb createuser;

/*==============================================================*/
/* Table: aduana_comprobante                                    */
/*==============================================================*/
create table aduana_comprobante (
   codigo_aduana_comprobante int4                 not null default nextval('aduana_comprobante_codigo_aduana_comprobante_seq'::regclass),
   codigo_comprobante   int4                 not null,
   motivo               varchar(254)         null,
   destino              varchar(254)         null,
   documento_aduanero   varchar(254)         null,
   ruta                 varchar(254)         null,
   codigo_establecimeinto_destino varchar(32)          null,
   punto_partida        varchar(254)         null,
   constraint pk_aduana_comprobante primary key (codigo_aduana_comprobante)
);

comment on table aduana_comprobante is
'Datos aduaneros para guia de remisión';

comment on column aduana_comprobante.codigo_comprobante is
'Campo para identificación única del comprobante';

-- set table ownership
alter table aduana_comprobante owner to postgres
;
/*==============================================================*/
/* Index: aduana_comprobante_pk                                 */
/*==============================================================*/
create unique index aduana_comprobante_pk on aduana_comprobante using BTREE (
codigo_aduana_comprobante
);

/*==============================================================*/
/* Index: association30_fk                                      */
/*==============================================================*/
create  index association30_fk on aduana_comprobante using BTREE (
codigo_comprobante
);

/*==============================================================*/
/* Table: clave_contingencia                                    */
/*==============================================================*/
create table clave_contingencia (
   codigo_clave_contingencia int4                 not null default nextval('clave_contingencia_codigo_clave_contingencia_seq'::regclass),
   codigo_emisor        int4                 null,
   clave                char(64)             null,
   utilizada            char(1)              null,
   codigo_comprobante   varchar(254)         null,
   constraint pk_clave_contingencia primary key (codigo_clave_contingencia)
);

comment on table clave_contingencia is
'Entidad para claves de contingencia.

La longitud de las claves debe ser de 37 caracteres.';

comment on column clave_contingencia.codigo_emisor is
'Es el identificador único del emisor';

-- set table ownership
alter table clave_contingencia owner to postgres
;
/*==============================================================*/
/* Index: association28_fk                                      */
/*==============================================================*/
create  index association28_fk on clave_contingencia using BTREE (
codigo_emisor
);

/*==============================================================*/
/* Index: clavecontingencia_pk                                  */
/*==============================================================*/
create unique index clavecontingencia_pk on clave_contingencia using BTREE (
codigo_clave_contingencia
);

/*==============================================================*/
/* Table: comprobante                                           */
/*==============================================================*/
create table comprobante (
   codigo_comprobante   int4                 not null default nextval('comprobante_codigo_comprobante_seq'::regclass),
   codigo_tipo_comprobante varchar(8)           not null,
   codigo_emisor        int4                 null,
   codigo_tipo_emision  int4                 null,
   codigo_establecimiento INT4                 null,
   secuencial           int4                 null,
   numero_factura       int4                 null,
   fecha_emision        timestamp            null,
   tipo_comprador       varchar(254)         null,
   razon_social         varchar(254)         null,
   comprador            varchar(254)         null,
   direccion            varchar(254)         null,
   telefono             varchar(254)         null,
   telefono_movil       varchar(254)         null,
   correo               varchar(254)         null,
   subtotal_iva         numeric              null,
   subtotal_sin_iva     numeric              null,
   subtotal_no_sujeto_impuesto numeric              null,
   subtotal             numeric              null,
   descuento            numeric              null,
   iva                  numeric              null,
   ice                  numeric              null,
   propina              numeric              null,
   total_factura        numeric              null,
   moneda               varchar(254)         null,
   guia_remision        varchar(254)         null,
   nombre_archivo_firmado varchar(254)         null,
   nombre_xml           VARCHAR(254)         null,
   nombre_pdf           varchar(254)         null,
   numero_autorizacion  varchar(254)         null,
   fecha_autorizacion   timestamp            null,
   constraint pk_comprobante primary key (codigo_comprobante)
);

comment on column comprobante.codigo_comprobante is
'Campo para identificación única del comprobante';

comment on column comprobante.codigo_emisor is
'Es el identificador único del emisor';

comment on column comprobante.codigo_establecimiento is
'Numero del establecimiento del emisor';

comment on column comprobante.secuencial is
'Numero secuencial generado por el sistema Anyway Invoice de la tabla de secuenciales.';

comment on column comprobante.numero_factura is
'Número de referencia de número de comprobante en el sistema de facturación del emisor.';

comment on column comprobante.fecha_emision is
'Fecha de emisión del comprobante';

comment on column comprobante.tipo_comprador is
'Tipo de Comprador:
CONSUMIDOR_FINAL 07
RUC 04
CEDULA 05
PASAPORTE 06';

comment on column comprobante.razon_social is
'Razón social del comprador';

comment on column comprobante.comprador is
'Identificación del comprador';

comment on column comprobante.direccion is
'Dirección del comprador';

comment on column comprobante.telefono is
'Teléfono del comprador';

comment on column comprobante.correo is
'Correo electrónico del comprador';

comment on column comprobante.subtotal_sin_iva is
'Total de la factura sin impuestos';

comment on column comprobante.descuento is
'Total de descuentos de la factura';

comment on column comprobante.ice is
'Valor del ICE';

comment on column comprobante.propina is
'Valor  de la propina';

comment on column comprobante.total_factura is
'Valor Total de la factura';

comment on column comprobante.moneda is
'Moneda de la transacción';

comment on column comprobante.guia_remision is
'Numero de guía de remisión';

comment on column comprobante.nombre_archivo_firmado is
'Es el nombre del archivo firmado y enviado al SRI. Solo debe tener datos en el caso de que se envío correctamente.';

-- set table ownership
alter table comprobante owner to postgres
;
/*==============================================================*/
/* Index: association14_fk                                      */
/*==============================================================*/
create  index association14_fk on comprobante using BTREE (
codigo_tipo_comprobante
);

/*==============================================================*/
/* Index: comprobante_pk                                        */
/*==============================================================*/
create unique index comprobante_pk on comprobante using BTREE (
codigo_comprobante
);

/*==============================================================*/
/* Table: comprobante_lote                                      */
/*==============================================================*/
create table comprobante_lote (
   codigo_comprobante_lote int4                 not null default nextval('comprobante_lote_codigo_comprobante_lote_seq'::regclass),
   codigo_lote          int4                 null,
   mensajes             varchar(254)         null,
   constraint pk_comprobante_lote primary key (codigo_comprobante_lote)
);

comment on table comprobante_lote is
'Se incluyen los comprobantes que fueron enviados en el lote respectivo.';

comment on column comprobante_lote.codigo_comprobante_lote is
'Código único para identificación del comprobante por lote';

comment on column comprobante_lote.codigo_lote is
'Es el código único que representa al lote';

comment on column comprobante_lote.mensajes is
'Campo que almacena los mensajes de cada comprobante enviados por el SRI.';

-- set table ownership
alter table comprobante_lote owner to postgres
;
/*==============================================================*/
/* Index: association29_fk                                      */
/*==============================================================*/
create  index association29_fk on comprobante_lote using BTREE (
codigo_lote
);

/*==============================================================*/
/* Index: comprobantelote_pk                                    */
/*==============================================================*/
create unique index comprobantelote_pk on comprobante_lote using BTREE (
codigo_comprobante_lote
);

/*==============================================================*/
/* Table: comprobante_modifica                                  */
/*==============================================================*/
create table comprobante_modifica (
   codigo_comprobante_modifica int4                 not null,
   codigo_comprobante   int4                 not null default nextval('comprobante_modifica_codigo_comprobante_seq'::regclass),
   nombre_comprobante   varchar(64)          null,
   numero_comprobante   varchar(64)          null,
   fecha_emision        timestamp            null,
   motivo               varchar(254)         null,
   constraint pk_comprobante_modifica primary key (codigo_comprobante_modifica)
);

comment on column comprobante_modifica.codigo_comprobante is
'Campo para identificación única del comprobante';

-- set table ownership
alter table comprobante_modifica owner to postgres
;
/*==============================================================*/
/* Table: detalle_comprobante                                   */
/*==============================================================*/
create table detalle_comprobante (
   codigo_detalle_comprobante int4                 not null default nextval('detalle_comprobante_codigo_detalle_comprobante_seq'::regclass),
   codigo_comprobante   int4                 not null,
   codigo_principal     varchar(254)         null,
   codigo_auxiliar      varchar(254)         null,
   cantidad             numeric              null,
   precio_unitario      numeric              null,
   detalle              varchar(254)         null,
   detalle_adicional1   varchar(254)         null,
   detalle_adicional2   varchar(254)         null,
   descuento            numeric              null,
   precio_total         numeric              null,
   constraint pk_detalle_comprobante primary key (codigo_detalle_comprobante)
);

comment on column detalle_comprobante.codigo_detalle_comprobante is
'Es el código identificador del detalle de la factura';

comment on column detalle_comprobante.codigo_comprobante is
'Campo para identificación única del comprobante';

comment on column detalle_comprobante.codigo_principal is
'Es el código principal del producto';

comment on column detalle_comprobante.codigo_auxiliar is
'Es el códio auxiliar del producto';

comment on column detalle_comprobante.cantidad is
'Es la cantidad del producto';

comment on column detalle_comprobante.precio_unitario is
'Es el precio unitario del producto';

comment on column detalle_comprobante.detalle is
'Es una información adicional del producto';

comment on column detalle_comprobante.detalle_adicional1 is
'Es una información adicional del producto';

comment on column detalle_comprobante.detalle_adicional2 is
'Es una información adicional del producto';

comment on column detalle_comprobante.descuento is
'Es el descuento del producto';

comment on column detalle_comprobante.precio_total is
'Es el precio total del producto (Cantidad * PrecioUnitario)- Descuento';

-- set table ownership
alter table detalle_comprobante owner to postgres
;
/*==============================================================*/
/* Index: association17_fk                                      */
/*==============================================================*/
create  index association17_fk on detalle_comprobante using BTREE (
codigo_comprobante
);

/*==============================================================*/
/* Index: detallecomprobante_pk                                 */
/*==============================================================*/
create unique index detallecomprobante_pk on detalle_comprobante using BTREE (
codigo_detalle_comprobante
);

/*==============================================================*/
/* Table: emisor                                                */
/*==============================================================*/
create table emisor (
   codigo_emisor        int4                 not null default nextval('emisor_codigo_emisor_seq'::regclass),
   codigo_tipo_ambiente int4                 not null,
   codigo_proveedor_certificado int4                 not null,
   razon_social         varchar(254)         null,
   ruc                  varchar(254)         null,
   nombre_comercial     varchar(254)         null,
   numero_resolucion    varchar(254)         null,
   es_contribuyente_especial char(2)              null,
   lleva_contabilidad   char(2)              null,
   logo_imagen          varchar(254)         null,
   tiempo_espera        int4                 null,
   clave_interna        varchar(254)         null,
   direccion_matriz     varchar(254)         null,
   clave_firma          varchar(254)         null,
   correo_electronico   varchar(254)         null,
   correo_alternativo   varchar(254)         null,
   directorios          varchar(254)         null,
   nombre_certificado   varchar(254)         null,
   url_produccion       varchar(254)         null,
   url_pruebas          varchar(254)         null,
   constraint pk_emisor primary key (codigo_emisor)
);

comment on table emisor is
'Clase emisor que almacenará la información necesaria para el SRI y el sistema Anyway Invoice.';

comment on column emisor.codigo_emisor is
'Es el identificador único del emisor';

comment on column emisor.razon_social is
'Es la razón social del emisor';

comment on column emisor.ruc is
'Es el Ruc del emisor';

comment on column emisor.nombre_comercial is
'Es el nombre comecial del emisor';

comment on column emisor.numero_resolucion is
'Es el numero de resolución de contribuyente especial,l si es el caso. Es obligatorio si el indicador de Contribuyente Especial es S';

comment on column emisor.es_contribuyente_especial is
'Es el indicador de si el emisor es contribuyente especial. Si es "S" el numero de resolución es obligatorio.';

comment on column emisor.lleva_contabilidad is
'Es el indicador de si el emisor lleva contabilidad.';

comment on column emisor.logo_imagen is
'Es el campo que contendrá el logo en formato gráfico para impresión.';

comment on column emisor.tiempo_espera is
'Tiempo de espera para envío de comprobantes.';

comment on column emisor.nombre_certificado is
'Nombre del certificado';

-- set table ownership
alter table emisor owner to postgres
;
/*==============================================================*/
/* Index: adm_emisor_pk                                         */
/*==============================================================*/
create unique index adm_emisor_pk on emisor using BTREE (
codigo_emisor
);

/*==============================================================*/
/* Index: association8_fk                                       */
/*==============================================================*/
create  index association8_fk on emisor using BTREE (
codigo_tipo_ambiente
);

/*==============================================================*/
/* Index: association9_fk                                       */
/*==============================================================*/
create  index association9_fk on emisor using BTREE (
codigo_proveedor_certificado
);

/*==============================================================*/
/* Table: establecimiento                                       */
/*==============================================================*/
create table establecimiento (
   codigo_establecimiento int4                 not null default nextval('establecimiento_codigo_establecimiento_seq'::regclass),
   codigo_emisor        int4                 not null,
   numero_establecimiento VARCHAR(8)           null,
   punto_emision        varchar(8)           null,
   direccion            VARCHAR(254)         null,
   constraint pk_establecimiento primary key (codigo_establecimiento)
);

comment on column establecimiento.codigo_emisor is
'Es el identificador único del emisor';

-- set table ownership
alter table establecimiento owner to postgres
;
/*==============================================================*/
/* Index: association10_fk                                      */
/*==============================================================*/
create  index association10_fk on establecimiento using BTREE (
codigo_emisor
);

/*==============================================================*/
/* Index: establecimiento_pk                                    */
/*==============================================================*/
create unique index establecimiento_pk on establecimiento using BTREE (
codigo_establecimiento
);

/*==============================================================*/
/* Table: estado                                                */
/*==============================================================*/
create table estado (
   codigo_estado        int4                 not null default nextval('estado_codigo_estado_seq'::regclass),
   codigo_tipo_estado   int4                 not null,
   codigo_comprobante   int4                 null,
   descripcion          varchar(254)         null,
   constraint pk_estado primary key (codigo_estado)
);

comment on column estado.codigo_comprobante is
'Campo para identificación única del comprobante';

-- set table ownership
alter table estado owner to postgres
;
/*==============================================================*/
/* Index: association26_fk                                      */
/*==============================================================*/
create  index association26_fk on estado using BTREE (
codigo_comprobante
);

/*==============================================================*/
/* Index: association4_fk                                       */
/*==============================================================*/
create  index association4_fk on estado using BTREE (
codigo_tipo_estado
);

/*==============================================================*/
/* Index: estado_pk                                             */
/*==============================================================*/
create unique index estado_pk on estado using BTREE (
codigo_estado
);

/*==============================================================*/
/* Table: estado_cuenta                                         */
/*==============================================================*/
create table estado_cuenta (
   codigo_estado_cuenta int4                 not null default nextval('estado_cuenta_codigo_estado_cuenta_seq'::regclass),
   codigo_emisor        int4                 not null,
   codigo_estado        int4                 not null,
   fecha_inicial        timestamp            null,
   fecha_final          timestamp            null,
   constraint pk_estado_cuenta primary key (codigo_estado_cuenta)
);

comment on column estado_cuenta.codigo_emisor is
'Es el identificador único del emisor';

-- set table ownership
alter table estado_cuenta owner to postgres
;
/*==============================================================*/
/* Index: association5_fk                                       */
/*==============================================================*/
create  index association5_fk on estado_cuenta using BTREE (
codigo_emisor
);

/*==============================================================*/
/* Index: association6_fk                                       */
/*==============================================================*/
create  index association6_fk on estado_cuenta using BTREE (
codigo_estado
);

/*==============================================================*/
/* Index: estadocuenta_pk                                       */
/*==============================================================*/
create unique index estadocuenta_pk on estado_cuenta using BTREE (
codigo_estado_cuenta
);

/*==============================================================*/
/* Table: impuesto                                              */
/*==============================================================*/
create table impuesto (
   codigo_impuesto      varchar(8)           not null,
   codigo_tipo_impuesto varchar(8)           not null,
   porcentaje           numeric              null,
   descripcion          varchar(254)         null,
   constraint pk_impuesto primary key (codigo_impuesto)
);

comment on column impuesto.porcentaje is
'Valor del porcentaje del impuesto o retención dependiendo del tipo de impuesto';

-- set table ownership
alter table impuesto owner to postgres
;
/*==============================================================*/
/* Index: association32_fk                                      */
/*==============================================================*/
create  index association32_fk on impuesto using BTREE (
codigo_tipo_impuesto
);

/*==============================================================*/
/* Index: impuesto_pk                                           */
/*==============================================================*/
create unique index impuesto_pk on impuesto using BTREE (
codigo_impuesto
);

/*==============================================================*/
/* Table: impuestos_comprobante                                 */
/*==============================================================*/
create table impuestos_comprobante (
   codigo_impuesto_comprobante int4                 not null default nextval('impuestos_comprobante_codigo_impuesto_comprobante_seq'::regclass),
   codigo_detalle_comprobante int4                 null,
   codigo_impuesto      varchar(8)           null,
   base_impobible       numeric              null,
   valor_impuesto       numeric              null,
   constraint pk_impuestos_comprobante primary key (codigo_impuesto_comprobante)
);

comment on table impuestos_comprobante is
'Entidad que contiene todas los impuestos del comprobante';

comment on column impuestos_comprobante.codigo_detalle_comprobante is
'Es el código identificador del detalle de la factura';

-- set table ownership
alter table impuestos_comprobante owner to postgres
;
/*==============================================================*/
/* Index: impuestos_comprobante_pk                              */
/*==============================================================*/
create unique index impuestos_comprobante_pk on impuestos_comprobante using BTREE (
codigo_impuesto_comprobante
);

/*==============================================================*/
/* Table: lote                                                  */
/*==============================================================*/
create table lote (
   codigo_lote          int4                 not null default nextval('lote_codigo_lote_seq'::regclass),
   codigo_transaccion   int4                 null,
   nombre               int4                 null,
   fecha_creacion       timestamp            null,
   fecha_envio          timestamp            null,
   fecha_recepcion      timestamp            null,
   constraint pk_lote primary key (codigo_lote)
);

comment on table lote is
'Entidad para almancenar los lotes generados por cada subida de archivos';

comment on column lote.codigo_lote is
'Es el código único que representa al lote';

comment on column lote.codigo_transaccion is
'Representa el código único de identificación de la transacción';

comment on column lote.nombre is
'Nombre del lote.';

comment on column lote.fecha_creacion is
'Fecha de creación del lote';

comment on column lote.fecha_envio is
'Fecha de envío del lote';

comment on column lote.fecha_recepcion is
'Fecha de recepción de la autorización del lote';

-- set table ownership
alter table lote owner to postgres
;
/*==============================================================*/
/* Index: association37_fk                                      */
/*==============================================================*/
create  index association37_fk on lote using BTREE (
codigo_transaccion
);

/*==============================================================*/
/* Index: lote_pk                                               */
/*==============================================================*/
create unique index lote_pk on lote using BTREE (
codigo_lote
);

/*==============================================================*/
/* Table: pagina                                                */
/*==============================================================*/
create table pagina (
   codigo               int4                 not null default nextval('pagina_codigo_seq'::regclass),
   descripcion          varchar(128)         null,
   pagina               varchar(128)         null,
   activo               int4                 null default 1,
   menu                 varchar(32)          null,
   padre                int4                 null,
   codigo_padre         int4                 null,
   orden                int4                 null,
   constraint pagina_pkey primary key (codigo)
);

-- set table ownership
alter table pagina owner to postgres
;
/*==============================================================*/
/* Table: pagina_perfil                                         */
/*==============================================================*/
create table pagina_perfil (
   codigo_pagina        int4                 null,
   codigo_perfil        int4                 null,
   fecha                timestamp            null default now(),
   usuario              int4                 null
);

-- set table ownership
alter table pagina_perfil owner to postgres
;
/*==============================================================*/
/* Table: perfil                                                */
/*==============================================================*/
create table perfil (
   id                   int4                 not null default nextval('perfil_id_seq'::regclass),
   descripcion          varchar(64)          null,
   activo               int4                 null default 1,
   constraint perfil_pkey primary key (id)
);

-- set table ownership
alter table perfil owner to postgres
;
/*==============================================================*/
/* Table: perfil_usuario                                        */
/*==============================================================*/
create table perfil_usuario (
   codigo_perfil_usuario int4                 not null default nextval('perfil_usuario_codigo_perfil_usuario_seq'::regclass),
   codigo_usuario       int4                 null,
   codigo_perfil        int4                 null,
   constraint pk_perfil_usuario primary key (codigo_perfil_usuario)
);

-- set table ownership
alter table perfil_usuario owner to postgres
;
/*==============================================================*/
/* Index: association2_fk                                       */
/*==============================================================*/
create  index association2_fk on perfil_usuario using BTREE (
codigo_usuario
);

/*==============================================================*/
/* Index: perfil_usuario_pk                                     */
/*==============================================================*/
create unique index perfil_usuario_pk on perfil_usuario using BTREE (
codigo_perfil_usuario
);

/*==============================================================*/
/* Table: permiso                                               */
/*==============================================================*/
create table permiso (
   codigo               int4                 not null default nextval('permiso_codigo_seq'::regclass),
   codigo_perfil        int4                 null,
   codigo_pagina        int4                 null,
   descripcion          varchar(32)          null,
   acceso_menu          int4                 null,
   acceso_consulta      int4                 null,
   acceso_guardar       int4                 null,
   acceso_actualizar    int4                 null,
   acceso_eliminar      int4                 null,
   fecha                timestamp            null default now(),
   activo               int4                 null default 1,
   fecha_salida         timestamp            null,
   constraint permiso_pkey primary key (codigo)
);

-- set table ownership
alter table permiso owner to postgres
;
/*==============================================================*/
/* Table: proveedor_certificado                                 */
/*==============================================================*/
create table proveedor_certificado (
   codigo_proveedor_certificado int4                 not null,
   descripcion          varchar(254)         null,
   constraint pk_proveedor_certificado primary key (codigo_proveedor_certificado)
);

-- set table ownership
alter table proveedor_certificado owner to postgres
;
/*==============================================================*/
/* Index: proveedorcertificado_pk                               */
/*==============================================================*/
create unique index proveedorcertificado_pk on proveedor_certificado using BTREE (
codigo_proveedor_certificado
);

/*==============================================================*/
/* Table: saldo                                                 */
/*==============================================================*/
create table saldo (
   codigo_saldo         int4                 not null default nextval('saldo_codigo_saldo_seq'::regclass),
   codigo_emisor        int4                 not null,
   cantidad_adquirida   int4                 null,
   cantidad_utilizada   int4                 null,
   saldo                numeric              null,
   constraint pk_saldo primary key (codigo_saldo)
);

comment on table saldo is
'Entidad para almacenar los saldos de los usuarios pos-pago';

comment on column saldo.codigo_emisor is
'Es el identificador único del emisor';

comment on column saldo.cantidad_adquirida is
'cantidad original adquirida mediante el botón de pago';

comment on column saldo.cantidad_utilizada is
'Cantidad actual de transacciones utilizadas';

comment on column saldo.saldo is
'Cantidad Adquirida - Cantidad Utilizada';

-- set table ownership
alter table saldo owner to postgres
;
/*==============================================================*/
/* Index: association35_fk                                      */
/*==============================================================*/
create  index association35_fk on saldo using BTREE (
codigo_emisor
);

/*==============================================================*/
/* Index: saldo_pk                                              */
/*==============================================================*/
create unique index saldo_pk on saldo using BTREE (
codigo_saldo
);

/*==============================================================*/
/* Table: secuencial_comprobante                                */
/*==============================================================*/
create table secuencial_comprobante (
   codigo_secuencial    int4                 not null,
   codigo_tipo_comprobante varchar(8)           null,
   codigo_establecimiento int4                 null,
   secuencial           int4                 null,
   constraint pk_secuencial_comprobante primary key (codigo_secuencial)
);

-- set table ownership
alter table secuencial_comprobante owner to postgres
;
/*==============================================================*/
/* Index: association11_fk                                      */
/*==============================================================*/
create  index association11_fk on secuencial_comprobante using BTREE (
codigo_establecimiento
);

/*==============================================================*/
/* Index: association12_fk                                      */
/*==============================================================*/
create  index association12_fk on secuencial_comprobante using BTREE (
codigo_tipo_comprobante
);

/*==============================================================*/
/* Index: secuencialcomprobante_pk                              */
/*==============================================================*/
create unique index secuencialcomprobante_pk on secuencial_comprobante using BTREE (
codigo_secuencial
);

/*==============================================================*/
/* Table: tipo_ambiente                                         */
/*==============================================================*/
create table tipo_ambiente (
   codigo_tipo_ambiente int4                 not null,
   descripcion          varchar(254)         null,
   constraint pk_tipo_ambiente primary key (codigo_tipo_ambiente)
);

-- set table ownership
alter table tipo_ambiente owner to postgres
;
/*==============================================================*/
/* Index: tipo_ambiente_pk                                      */
/*==============================================================*/
create unique index tipo_ambiente_pk on tipo_ambiente using BTREE (
codigo_tipo_ambiente
);

/*==============================================================*/
/* Table: tipo_comprobante                                      */
/*==============================================================*/
create table tipo_comprobante (
   codigo_tipo_comprobante varchar(8)           not null,
   descripcion          varchar(254)         null,
   constraint pk_tipo_comprobante primary key (codigo_tipo_comprobante)
);

comment on table tipo_comprobante is
'Factura("01"),
NotaDeCredito("04"),
NotaDeDebito ("05"),
GuiaDeRemision ("06"),
ComprobanteDeRetencion("07");';

-- set table ownership
alter table tipo_comprobante owner to postgres
;
/*==============================================================*/
/* Index: tipocomprobante_pk                                    */
/*==============================================================*/
create unique index tipocomprobante_pk on tipo_comprobante using BTREE (
codigo_tipo_comprobante
);

/*==============================================================*/
/* Table: tipo_emision                                          */
/*==============================================================*/
create table tipo_emision (
   codigo_tipo_emision  int4                 not null,
   descripcion          varchar(254)         null,
   constraint pk_tipo_emision primary key (codigo_tipo_emision)
);

comment on table tipo_emision is
'Tabla que contiene los tipos de emisión de la factura: "Normal" e "Indisponibilidad del sistema"';

-- set table ownership
alter table tipo_emision owner to postgres
;
/*==============================================================*/
/* Index: tipoemision_pk                                        */
/*==============================================================*/
create unique index tipoemision_pk on tipo_emision using BTREE (
codigo_tipo_emision
);

/*==============================================================*/
/* Table: tipo_estado                                           */
/*==============================================================*/
create table tipo_estado (
   codigo_tipo_estado   int4                 not null,
   descripcion          varchar(254)         null,
   constraint pk_tipo_estado primary key (codigo_tipo_estado)
);

-- set table ownership
alter table tipo_estado owner to postgres
;
/*==============================================================*/
/* Index: tipoestado_pk                                         */
/*==============================================================*/
create unique index tipoestado_pk on tipo_estado using BTREE (
codigo_tipo_estado
);

/*==============================================================*/
/* Table: tipo_impuesto                                         */
/*==============================================================*/
create table tipo_impuesto (
   codigo_tipo_impuesto varchar(8)           not null,
   descripcion          varchar(254)         null,
   constraint pk_tipo_impuesto primary key (codigo_tipo_impuesto)
);

-- set table ownership
alter table tipo_impuesto owner to postgres
;
/*==============================================================*/
/* Index: tipoimpuesto_pk                                       */
/*==============================================================*/
create unique index tipoimpuesto_pk on tipo_impuesto using BTREE (
codigo_tipo_impuesto
);

/*==============================================================*/
/* Table: transaccion                                           */
/*==============================================================*/
create table transaccion (
   codigo_transaccion   int4                 not null default nextval('transaccion_codigo_transaccion_seq'::regclass),
   codigo_emisor        int4                 not null,
   fecha_transaccion    timestamp            null,
   nombre_archivo       varchar(254)         null,
   constraint pk_transaccion primary key (codigo_transaccion)
);

comment on table transaccion is
'Entidad que almacena las transacciones realizadas por el emisor. Cada transacción puede contener varios lotes y cada lote máximo puede contener 50 comprobantes';

comment on column transaccion.codigo_transaccion is
'Representa el código único de identificación de la transacción';

comment on column transaccion.codigo_emisor is
'Es el identificador único del emisor';

comment on column transaccion.fecha_transaccion is
'Fecha en la que se realiza la transacción';

comment on column transaccion.nombre_archivo is
'Nombre del archivo subido por el usuario dessde la página web.';

-- set table ownership
alter table transaccion owner to postgres
;
/*==============================================================*/
/* Index: association36_fk                                      */
/*==============================================================*/
create  index association36_fk on transaccion using BTREE (
codigo_emisor
);

/*==============================================================*/
/* Index: transaccion_pk                                        */
/*==============================================================*/
create unique index transaccion_pk on transaccion using BTREE (
codigo_transaccion
);

/*==============================================================*/
/* Table: transportista                                         */
/*==============================================================*/
create table transportista (
   codigo_producto_transportado int4                 not null default nextval('transportista_codigo_producto_transportado_seq'::regclass),
   codigo_comprobante   int4                 not null,
   codigo_producto      varchar(254)         null,
   razon_social         varchar(254)         null,
   descripcion          varchar(254)         null,
   fecha_inicio         timestamp            null,
   fecha_fin            timestamp            null,
   constraint pk_transportista primary key (codigo_producto_transportado)
);

comment on table transportista is
'Almacena los productos que serán transportados para un guia de remisión';

comment on column transportista.codigo_comprobante is
'Campo para identificación única del comprobante';

-- set table ownership
alter table transportista owner to postgres
;
/*==============================================================*/
/* Index: association34_fk                                      */
/*==============================================================*/
create  index association34_fk on transportista using BTREE (
codigo_comprobante
);

/*==============================================================*/
/* Index: producto_transportado_pk                              */
/*==============================================================*/
create unique index producto_transportado_pk on transportista using BTREE (
codigo_producto_transportado
);

/*==============================================================*/
/* Table: usuario                                               */
/*==============================================================*/
create table usuario (
   codigo_usuario       int4                 not null default nextval('usuario_codigo_usuario_seq'::regclass),
   codigo_estado        int4                 not null,
   identificador        varchar(254)         not null,
   nombre_completo      varchar(254)         not null,
   correo_electronico   varchar(254)         not null,
   correo_alternativo   varchar(254)         null,
   clave                varchar(254)         null,
   constraint pk_usuario primary key (codigo_usuario)
);

comment on table usuario is
'Clase de usuario';

-- set table ownership
alter table usuario owner to postgres
;
/*==============================================================*/
/* Index: adm_usuario_pk                                        */
/*==============================================================*/
create unique index adm_usuario_pk on usuario using BTREE (
codigo_usuario
);

/*==============================================================*/
/* Index: association3_fk                                       */
/*==============================================================*/
create  index association3_fk on usuario using BTREE (
codigo_estado
);

/*==============================================================*/
/* Table: usuario_emisor                                        */
/*==============================================================*/
create table usuario_emisor (
   codigo_emisor        int4                 not null,
   codigo_usuario       int4                 not null,
   constraint pk_usuario_emisor primary key (codigo_emisor, codigo_usuario)
);

comment on column usuario_emisor.codigo_emisor is
'Es el identificador único del emisor';

-- set table ownership
alter table usuario_emisor owner to postgres
;
/*==============================================================*/
/* Index: usuario_emisor_fk                                     */
/*==============================================================*/
create  index usuario_emisor_fk on usuario_emisor using BTREE (
codigo_emisor
);

/*==============================================================*/
/* Index: usuario_emisor_fk2                                    */
/*==============================================================*/
create  index usuario_emisor_fk2 on usuario_emisor using BTREE (
codigo_usuario
);

/*==============================================================*/
/* Index: usuario_emisor_pk                                     */
/*==============================================================*/
create unique index usuario_emisor_pk on usuario_emisor using BTREE (
codigo_emisor,
codigo_usuario
);

alter table aduana_comprobante
   add constraint fk_aduana_c_associati_comproba foreign key (codigo_comprobante)
      references comprobante (codigo_comprobante)
      on delete restrict on update restrict;

alter table clave_contingencia
   add constraint fk_clave_co_associati_emisor foreign key (codigo_emisor)
      references emisor (codigo_emisor)
      on delete restrict on update restrict;

alter table comprobante
   add constraint fk_comproba_associati_tipo_com foreign key (codigo_tipo_comprobante)
      references tipo_comprobante (codigo_tipo_comprobante)
      on delete restrict on update restrict;

alter table comprobante
   add constraint fk_comproba_reference_emisor foreign key (codigo_emisor)
      references emisor (codigo_emisor)
      on delete restrict on update restrict;

alter table comprobante
   add constraint fk_comproba_reference_tipo_emi foreign key (codigo_tipo_emision)
      references tipo_emision (codigo_tipo_emision)
      on delete restrict on update restrict;

alter table comprobante_lote
   add constraint fk_comproba_associati_lote foreign key (codigo_lote)
      references lote (codigo_lote)
      on delete restrict on update restrict;

alter table comprobante_modifica
   add constraint fk_comproba_reference_comproba foreign key (codigo_comprobante)
      references comprobante (codigo_comprobante)
      on delete restrict on update restrict;

alter table detalle_comprobante
   add constraint fk_detalle__associati_comproba foreign key (codigo_comprobante)
      references comprobante (codigo_comprobante)
      on delete restrict on update restrict;

alter table emisor
   add constraint fk_emisor_associati_proveedo foreign key (codigo_proveedor_certificado)
      references proveedor_certificado (codigo_proveedor_certificado)
      on delete restrict on update restrict;

alter table emisor
   add constraint fk_emisor_associati_tipo_amb foreign key (codigo_tipo_ambiente)
      references tipo_ambiente (codigo_tipo_ambiente)
      on delete restrict on update restrict;

alter table establecimiento
   add constraint fk_establec_associati_emisor foreign key (codigo_emisor)
      references emisor (codigo_emisor)
      on delete restrict on update restrict;

alter table estado
   add constraint fk_estado_associati_comproba foreign key (codigo_comprobante)
      references comprobante (codigo_comprobante)
      on delete restrict on update restrict;

alter table estado
   add constraint fk_estado_associati_tipo_est foreign key (codigo_tipo_estado)
      references tipo_estado (codigo_tipo_estado)
      on delete restrict on update restrict;

alter table estado_cuenta
   add constraint fk_estado_c_associati_emisor foreign key (codigo_emisor)
      references emisor (codigo_emisor)
      on delete restrict on update restrict;

alter table estado_cuenta
   add constraint fk_estado_c_associati_estado foreign key (codigo_estado)
      references estado (codigo_estado)
      on delete restrict on update restrict;

alter table impuesto
   add constraint fk_impuesto_associati_tipo_imp foreign key (codigo_tipo_impuesto)
      references tipo_impuesto (codigo_tipo_impuesto)
      on delete restrict on update restrict;

alter table impuestos_comprobante
   add constraint fk_impuesto_reference_detalle_ foreign key (codigo_detalle_comprobante)
      references detalle_comprobante (codigo_detalle_comprobante)
      on delete restrict on update restrict;

alter table impuestos_comprobante
   add constraint fk_impuesto_reference_impuesto foreign key (codigo_impuesto)
      references impuesto (codigo_impuesto)
      on delete restrict on update restrict;

alter table lote
   add constraint fk_lote_associati_transacc foreign key (codigo_transaccion)
      references transaccion (codigo_transaccion)
      on delete restrict on update restrict;

alter table perfil_usuario
   add constraint fk_perfil_u_associati_usuario foreign key (codigo_usuario)
      references usuario (codigo_usuario)
      on delete restrict on update restrict;

alter table saldo
   add constraint fk_saldo_associati_emisor foreign key (codigo_emisor)
      references emisor (codigo_emisor)
      on delete restrict on update restrict;

alter table secuencial_comprobante
   add constraint fk_secuenci_associati_establec foreign key (codigo_establecimiento)
      references establecimiento (codigo_establecimiento)
      on delete restrict on update restrict;

alter table secuencial_comprobante
   add constraint fk_secuenci_associati_tipo_com foreign key (codigo_tipo_comprobante)
      references tipo_comprobante (codigo_tipo_comprobante)
      on delete restrict on update restrict;

alter table transaccion
   add constraint fk_transacc_associati_emisor foreign key (codigo_emisor)
      references emisor (codigo_emisor)
      on delete restrict on update restrict;

alter table transportista
   add constraint fk_transpor_associati_comproba foreign key (codigo_comprobante)
      references comprobante (codigo_comprobante)
      on delete restrict on update restrict;

alter table usuario
   add constraint fk_usuario_associati_estado foreign key (codigo_estado)
      references estado (codigo_estado)
      on delete restrict on update restrict;

alter table usuario_emisor
   add constraint fk_usuario__usuario_e_emisor foreign key (codigo_emisor)
      references emisor (codigo_emisor)
      on delete restrict on update restrict;

alter table usuario_emisor
   add constraint fk_usuario__usuario_e_usuario foreign key (codigo_usuario)
      references usuario (codigo_usuario)
      on delete restrict on update restrict;

