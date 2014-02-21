/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     31/01/2014 23:17:24                          */
/*==============================================================*/


drop index ASSOCIATION30_FK;

drop index ADUANA_COMPROBANTE_PK;

drop table Aduana_Comprobante;

drop index ASSOCIATION28_FK;

drop index CLAVECONTINGENCIA_PK;

drop table Clave_Contingencia;

drop index ASSOCIATION14_FK;

drop index COMPROBANTE_PK;

drop table Comprobante;

drop index ASSOCIATION29_FK;

drop index COMPROBANTELOTE_PK;

drop table Comprobante_Lote;

drop index ASSOCIATION17_FK;

drop index DETALLECOMPROBANTE_PK;

drop table Detalle_Comprobante;

drop index ASSOCIATION9_FK;

drop index ASSOCIATION8_FK;

drop index ADM_EMISOR_PK;

drop table Emisor;

drop index ASSOCIATION10_FK;

drop index ESTABLECIMIENTO_PK;

drop table Establecimiento;

drop index ASSOCIATION26_FK;

drop index ASSOCIATION4_FK;

drop index ESTADO_PK;

drop table Estado;

drop index ASSOCIATION6_FK;

drop index ASSOCIATION5_FK;

drop index ESTADOCUENTA_PK;

drop table Estado_Cuenta;

drop index ASSOCIATION32_FK;

drop index IMPUESTO_PK;

drop table Impuesto;

drop index IMPUESTOS_COMPROBANTE_PK;

drop table Impuestos_Comprobante;

drop index ASSOCIATION37_FK;

drop index LOTE_PK;

drop table Lote;

drop index ASSOCIATION2_FK;

drop index PERFIL_USUARIO_PK;

drop table Perfil_Usuario;

drop index PROVEEDORCERTIFICADO_PK;

drop table Proveedor_Certificado;

drop index ASSOCIATION35_FK;

drop index SALDO_PK;

drop table Saldo;

drop index ASSOCIATION12_FK;

drop index ASSOCIATION11_FK;

drop index SECUENCIALCOMPROBANTE_PK;

drop table Secuencial_Comprobante;

drop index TIPO_AMBIENTE_PK;

drop table Tipo_Ambiente;

drop index TIPOCOMPROBANTE_PK;

drop table Tipo_Comprobante;

drop index TIPOEMISION_PK;

drop table Tipo_Emision;

drop index TIPOESTADO_PK;

drop table Tipo_Estado;

drop index TIPOIMPUESTO_PK;

drop table Tipo_Impuesto;

drop index ASSOCIATION36_FK;

drop index TRANSACCION_PK;

drop table Transaccion;

drop index ASSOCIATION34_FK;

drop index PRODUCTO_TRANSPORTADO_PK;

drop table Transportista;

drop index ASSOCIATION3_FK;

drop index ADM_USUARIO_PK;

drop table Usuario;

drop table comprobante_modifica;

drop index USUARIO_EMISOR_FK2;

drop index USUARIO_EMISOR_FK;

drop index USUARIO_EMISOR_PK;

drop table usuario_Emisor;

/*==============================================================*/
/* Table: Aduana_Comprobante                                    */
/*==============================================================*/
create table Aduana_Comprobante (
   codigo_Aduana_Comprobante SERIAL not null,
   codigo_Comprobante   INT4                 not null,
   Motivo               VARCHAR(254)         null,
   Destino              VARCHAR(254)         null,
   documento_Aduanero   VARCHAR(254)         null,
   ruta                 VARCHAR(254)         null,
   codigo_Establecimeinto_Destino VARCHAR(32)          null,
   punto_partida        VARCHAR(254)         null,
   constraint PK_ADUANA_COMPROBANTE primary key (codigo_Aduana_Comprobante)
);

comment on table Aduana_Comprobante is
'Datos aduaneros para guia de remisión';

comment on column Aduana_Comprobante.codigo_Comprobante is
'Campo para identificación única del comprobante';

/*==============================================================*/
/* Index: ADUANA_COMPROBANTE_PK                                 */
/*==============================================================*/
create unique index ADUANA_COMPROBANTE_PK on Aduana_Comprobante (
codigo_Aduana_Comprobante
);

/*==============================================================*/
/* Index: ASSOCIATION30_FK                                      */
/*==============================================================*/
create  index ASSOCIATION30_FK on Aduana_Comprobante (
codigo_Comprobante
);

/*==============================================================*/
/* Table: Clave_Contingencia                                    */
/*==============================================================*/
create table Clave_Contingencia (
   codigo_Clave_Contingencia SERIAL not null,
   Codigo_Emisor        INT4                 null,
   clave                CHAR(64)             null,
   utilizada            CHAR(1)              null,
   codigo_Comprobante   VARCHAR(254)         null,
   constraint PK_CLAVE_CONTINGENCIA primary key (codigo_Clave_Contingencia)
);

comment on table Clave_Contingencia is
'Entidad para claves de contingencia.

La longitud de las claves debe ser de 37 caracteres.
';

comment on column Clave_Contingencia.Codigo_Emisor is
'Es el identificador único del emisor';

/*==============================================================*/
/* Index: CLAVECONTINGENCIA_PK                                  */
/*==============================================================*/
create unique index CLAVECONTINGENCIA_PK on Clave_Contingencia (
codigo_Clave_Contingencia
);

/*==============================================================*/
/* Index: ASSOCIATION28_FK                                      */
/*==============================================================*/
create  index ASSOCIATION28_FK on Clave_Contingencia (
Codigo_Emisor
);

/*==============================================================*/
/* Table: Comprobante                                           */
/*==============================================================*/
create table Comprobante (
   codigo_Comprobante   SERIAL not null,
   codigo_Tipo_Comprobante VARCHAR(8)           not null,
   Codigo_Emisor        INT4                 null,
   codigo_tipo_emision  INT4                 null,
   codigo_Establecimiento VARCHAR(254)         null,
   secuencial           INT4                 null,
   Numero_Factura       INT4                 null,
   fecha_Emision        TIMESTAMP            null,
   tipo_Comprador       VARCHAR(254)         null,
   Razon_Social         VARCHAR(254)         null,
   comprador            VARCHAR(254)         null,
   Direccion            VARCHAR(254)         null,
   Telefono             VARCHAR(254)         null,
   Telefono_Movil       VARCHAR(254)         null,
   Correo               VARCHAR(254)         null,
   subtotal_iva         NUMERIC              null,
   subtotal_Sin_Iva     NUMERIC              null,
   subtotal_no_sujeto_impuesto NUMERIC              null,
   subtotal             NUMERIC              null,
   descuento            NUMERIC              null,
   iva                  NUMERIC              null,
   ice                  NUMERIC              null,
   Propina              NUMERIC              null,
   Total_Factura        NUMERIC              null,
   moneda               VARCHAR(254)         null,
   Guia_Remision        VARCHAR(254)         null,
   nombre_Archivo_Firmado VARCHAR(254)         null,
   nombre_pdf           VARCHAR(254)         null,
   numero_Autorizacion  VARCHAR(254)         null,
   Fecha_autorizacion   TIMESTAMP            null,
   constraint PK_COMPROBANTE primary key (codigo_Comprobante)
);

comment on column Comprobante.codigo_Comprobante is
'Campo para identificación única del comprobante';

comment on column Comprobante.Codigo_Emisor is
'Es el identificador único del emisor';

comment on column Comprobante.codigo_Establecimiento is
'Numero del establecimiento del emisor';

comment on column Comprobante.secuencial is
'Numero secuencial generado por el sistema Anyway Invoice de la tabla de secuenciales.';

comment on column Comprobante.Numero_Factura is
'Número de referencia de número de comprobante en el sistema de facturación del emisor.
';

comment on column Comprobante.fecha_Emision is
'Fecha de emisión del comprobante
';

comment on column Comprobante.tipo_Comprador is
'Tipo de Comprador:
CONSUMIDOR_FINAL 07
RUC 04
CEDULA 05
PASAPORTE 06     ';

comment on column Comprobante.Razon_Social is
'Razón social del comprador';

comment on column Comprobante.comprador is
'Identificación del comprador';

comment on column Comprobante.Direccion is
'Dirección del comprador';

comment on column Comprobante.Telefono is
'Teléfono del comprador';

comment on column Comprobante.Correo is
'Correo electrónico del comprador';

comment on column Comprobante.subtotal_Sin_Iva is
'Total de la factura sin impuestos';

comment on column Comprobante.descuento is
'Total de descuentos de la factura';

comment on column Comprobante.ice is
'Valor del ICE';

comment on column Comprobante.Propina is
'Valor  de la propina';

comment on column Comprobante.Total_Factura is
'Valor Total de la factura';

comment on column Comprobante.moneda is
'Moneda de la transacción';

comment on column Comprobante.Guia_Remision is
'Numero de guía de remisión';

comment on column Comprobante.nombre_Archivo_Firmado is
'Es el nombre del archivo firmado y enviado al SRI. Solo debe tener datos en el caso de que se envío correctamente.';

/*==============================================================*/
/* Index: COMPROBANTE_PK                                        */
/*==============================================================*/
create unique index COMPROBANTE_PK on Comprobante (
codigo_Comprobante
);

/*==============================================================*/
/* Index: ASSOCIATION14_FK                                      */
/*==============================================================*/
create  index ASSOCIATION14_FK on Comprobante (
codigo_Tipo_Comprobante
);

/*==============================================================*/
/* Table: Comprobante_Lote                                      */
/*==============================================================*/
create table Comprobante_Lote (
   codigo_Comprobante_Lote SERIAL               not null,
   codigo_Lote          INT4                 null,
   mensajes             VARCHAR(254)         null,
   constraint PK_COMPROBANTE_LOTE primary key (codigo_Comprobante_Lote)
);

comment on table Comprobante_Lote is
'Se incluyen los comprobantes que fueron enviados en el lote respectivo.';

comment on column Comprobante_Lote.codigo_Comprobante_Lote is
'Código único para identificación del comprobante por lote';

comment on column Comprobante_Lote.codigo_Lote is
'Es el código único que representa al lote';

comment on column Comprobante_Lote.mensajes is
'Campo que almacena los mensajes de cada comprobante enviados por el SRI.';

/*==============================================================*/
/* Index: COMPROBANTELOTE_PK                                    */
/*==============================================================*/
create unique index COMPROBANTELOTE_PK on Comprobante_Lote (
codigo_Comprobante_Lote
);

/*==============================================================*/
/* Index: ASSOCIATION29_FK                                      */
/*==============================================================*/
create  index ASSOCIATION29_FK on Comprobante_Lote (
codigo_Lote
);

/*==============================================================*/
/* Table: Detalle_Comprobante                                   */
/*==============================================================*/
create table Detalle_Comprobante (
   Codigo_Detalle_Comprobante SERIAL not null,
   codigo_Comprobante   INT4                 not null,
   codigo_Principal     VARCHAR(254)         null,
   codigo_Auxiliar      VARCHAR(254)         null,
   cantidad             NUMERIC              null,
   precio_Unitario      NUMERIC              null,
   detalle              VARCHAR(254)         null,
   detalle_Adicional1   VARCHAR(254)         null,
   detalle_Adicional2   VARCHAR(254)         null,
   descuento            NUMERIC              null,
   precio_Total         NUMERIC              null,
   constraint PK_DETALLE_COMPROBANTE primary key (Codigo_Detalle_Comprobante)
);

comment on column Detalle_Comprobante.Codigo_Detalle_Comprobante is
'Es el código identificador del detalle de la factura';

comment on column Detalle_Comprobante.codigo_Comprobante is
'Campo para identificación única del comprobante';

comment on column Detalle_Comprobante.codigo_Principal is
'Es el código principal del producto';

comment on column Detalle_Comprobante.codigo_Auxiliar is
'Es el códio auxiliar del producto';

comment on column Detalle_Comprobante.cantidad is
'Es la cantidad del producto';

comment on column Detalle_Comprobante.precio_Unitario is
'Es el precio unitario del producto';

comment on column Detalle_Comprobante.detalle is
'Es una información adicional del producto';

comment on column Detalle_Comprobante.detalle_Adicional1 is
'Es una información adicional del producto';

comment on column Detalle_Comprobante.detalle_Adicional2 is
'Es una información adicional del producto';

comment on column Detalle_Comprobante.descuento is
'Es el descuento del producto';

comment on column Detalle_Comprobante.precio_Total is
'Es el precio total del producto (Cantidad * PrecioUnitario)- Descuento';

/*==============================================================*/
/* Index: DETALLECOMPROBANTE_PK                                 */
/*==============================================================*/
create unique index DETALLECOMPROBANTE_PK on Detalle_Comprobante (
Codigo_Detalle_Comprobante
);

/*==============================================================*/
/* Index: ASSOCIATION17_FK                                      */
/*==============================================================*/
create  index ASSOCIATION17_FK on Detalle_Comprobante (
codigo_Comprobante
);

/*==============================================================*/
/* Table: Emisor                                                */
/*==============================================================*/
create table Emisor (
   Codigo_Emisor        SERIAL not null,
   Codigo_Tipo_Ambiente INT4                 not null,
   Codigo_Proveedor_Certificado INT4                 not null,
   Razon_Social         VARCHAR(254)         null,
   ruc                  VARCHAR(254)         null,
   Nombre_Comercial     VARCHAR(254)         null,
   Numero_Resolucion    VARCHAR(254)         null,
   Es_Contribuyente_Especial CHAR(2)              null,
   Lleva_Contabilidad   CHAR(2)              null,
   Logo_Imagen          VARCHAR(254)         null,
   Tiempo_Espera        INT4                 null,
   Clave_Interna        VARCHAR(254)         null,
   Direccion_Matriz     VARCHAR(254)         null,
   Clave_Firma          VARCHAR(254)         null,
   Correo_Electronico   VARCHAR(254)         null,
   Correo_Alternativo   VARCHAR(254)         null,
   directorios          VARCHAR(254)         null,
   nombre_Certificado   VARCHAR(254)         null,
   url_produccion       VARCHAR(254)         null,
   url_pruebas          VARCHAR(254)         null,
   constraint PK_EMISOR primary key (Codigo_Emisor)
);

comment on table Emisor is
'Clase emisor que almacenará la información necesaria para el SRI y el sistema Anyway Invoice.';

comment on column Emisor.Codigo_Emisor is
'Es el identificador único del emisor';

comment on column Emisor.Razon_Social is
'Es la razón social del emisor';

comment on column Emisor.ruc is
'Es el Ruc del emisor';

comment on column Emisor.Nombre_Comercial is
'Es el nombre comecial del emisor';

comment on column Emisor.Numero_Resolucion is
'Es el numero de resolución de contribuyente especial,l si es el caso. Es obligatorio si el indicador de Contribuyente Especial es S';

comment on column Emisor.Es_Contribuyente_Especial is
'Es el indicador de si el emisor es contribuyente especial. Si es "S" el numero de resolución es obligatorio.';

comment on column Emisor.Lleva_Contabilidad is
'Es el indicador de si el emisor lleva contabilidad.';

comment on column Emisor.Logo_Imagen is
'Es el campo que contendrá el logo en formato gráfico para impresión.';

comment on column Emisor.Tiempo_Espera is
'Tiempo de espera para envío de comprobantes.';

comment on column Emisor.nombre_Certificado is
'Nombre del certificado';

/*==============================================================*/
/* Index: ADM_EMISOR_PK                                         */
/*==============================================================*/
create unique index ADM_EMISOR_PK on Emisor (
Codigo_Emisor
);

/*==============================================================*/
/* Index: ASSOCIATION8_FK                                       */
/*==============================================================*/
create  index ASSOCIATION8_FK on Emisor (
Codigo_Tipo_Ambiente
);

/*==============================================================*/
/* Index: ASSOCIATION9_FK                                       */
/*==============================================================*/
create  index ASSOCIATION9_FK on Emisor (
Codigo_Proveedor_Certificado
);

/*==============================================================*/
/* Table: Establecimiento                                       */
/*==============================================================*/
create table Establecimiento (
   codigo_Establecimiento SERIAL not null,
   Codigo_Emisor        INT4                 not null,
   numero_Establecimiento INT4                 null,
   direccion            VARCHAR(254)         null,
   constraint PK_ESTABLECIMIENTO primary key (codigo_Establecimiento)
);

comment on column Establecimiento.Codigo_Emisor is
'Es el identificador único del emisor';

/*==============================================================*/
/* Index: ESTABLECIMIENTO_PK                                    */
/*==============================================================*/
create unique index ESTABLECIMIENTO_PK on Establecimiento (
codigo_Establecimiento
);

/*==============================================================*/
/* Index: ASSOCIATION10_FK                                      */
/*==============================================================*/
create  index ASSOCIATION10_FK on Establecimiento (
Codigo_Emisor
);

/*==============================================================*/
/* Table: Estado                                                */
/*==============================================================*/
create table Estado (
   codigo_Estado        SERIAL               not null,
   Codigo_Tipo_Estado   INT4                 not null,
   codigo_Comprobante   INT4                 null,
   descripcion          VARCHAR(254)         null,
   constraint PK_ESTADO primary key (codigo_Estado)
);

comment on column Estado.codigo_Comprobante is
'Campo para identificación única del comprobante';

/*==============================================================*/
/* Index: ESTADO_PK                                             */
/*==============================================================*/
create unique index ESTADO_PK on Estado (
codigo_Estado
);

/*==============================================================*/
/* Index: ASSOCIATION4_FK                                       */
/*==============================================================*/
create  index ASSOCIATION4_FK on Estado (
Codigo_Tipo_Estado
);

/*==============================================================*/
/* Index: ASSOCIATION26_FK                                      */
/*==============================================================*/
create  index ASSOCIATION26_FK on Estado (
codigo_Comprobante
);

/*==============================================================*/
/* Table: Estado_Cuenta                                         */
/*==============================================================*/
create table Estado_Cuenta (
   codigo_Estado_Cuenta SERIAL not null,
   Codigo_Emisor        INT4                 not null,
   codigo_Estado        INT4                 not null,
   Fecha_Inicial        TIMESTAMP            null,
   Fecha_Final          TIMESTAMP            null,
   constraint PK_ESTADO_CUENTA primary key (codigo_Estado_Cuenta)
);

comment on column Estado_Cuenta.Codigo_Emisor is
'Es el identificador único del emisor';

/*==============================================================*/
/* Index: ESTADOCUENTA_PK                                       */
/*==============================================================*/
create unique index ESTADOCUENTA_PK on Estado_Cuenta (
codigo_Estado_Cuenta
);

/*==============================================================*/
/* Index: ASSOCIATION5_FK                                       */
/*==============================================================*/
create  index ASSOCIATION5_FK on Estado_Cuenta (
Codigo_Emisor
);

/*==============================================================*/
/* Index: ASSOCIATION6_FK                                       */
/*==============================================================*/
create  index ASSOCIATION6_FK on Estado_Cuenta (
codigo_Estado
);

/*==============================================================*/
/* Table: Impuesto                                              */
/*==============================================================*/
create table Impuesto (
   codigo_Impuesto      VARCHAR(8)           not null,
   Codigo_Tipo_Impuesto VARCHAR(8)           not null,
   porcentaje           NUMERIC              null,
   descripcion          VARCHAR(254)         null,
   constraint PK_IMPUESTO primary key (codigo_Impuesto)
);

comment on column Impuesto.porcentaje is
'Valor del porcentaje del impuesto o retención dependiendo del tipo de impuesto';

/*==============================================================*/
/* Index: IMPUESTO_PK                                           */
/*==============================================================*/
create unique index IMPUESTO_PK on Impuesto (
codigo_Impuesto
);

/*==============================================================*/
/* Index: ASSOCIATION32_FK                                      */
/*==============================================================*/
create  index ASSOCIATION32_FK on Impuesto (
Codigo_Tipo_Impuesto
);

/*==============================================================*/
/* Table: Impuestos_Comprobante                                 */
/*==============================================================*/
create table Impuestos_Comprobante (
   codigo_Impuesto_Comprobante SERIAL               not null,
   Codigo_Detalle_Comprobante INT4                 null,
   codigo_Impuesto      VARCHAR(8)           null,
   base_Impobible       NUMERIC              null,
   valor_Impuesto       NUMERIC              null,
   constraint PK_IMPUESTOS_COMPROBANTE primary key (codigo_Impuesto_Comprobante)
);

comment on table Impuestos_Comprobante is
'Entidad que contiene todas los impuestos del comprobante';

comment on column Impuestos_Comprobante.Codigo_Detalle_Comprobante is
'Es el código identificador del detalle de la factura';

/*==============================================================*/
/* Index: IMPUESTOS_COMPROBANTE_PK                              */
/*==============================================================*/
create unique index IMPUESTOS_COMPROBANTE_PK on Impuestos_Comprobante (
codigo_Impuesto_Comprobante
);

/*==============================================================*/
/* Table: Lote                                                  */
/*==============================================================*/
create table Lote (
   codigo_Lote          SERIAL not null,
   Codigo_Transaccion   INT4                 null,
   nombre               INT4                 null,
   Fecha_Creacion       TIMESTAMP            null,
   Fecha_Envio          TIMESTAMP            null,
   Fecha_Recepcion      TIMESTAMP            null,
   constraint PK_LOTE primary key (codigo_Lote)
);

comment on table Lote is
'Entidad para almancenar los lotes generados por cada subida de archivos';

comment on column Lote.codigo_Lote is
'Es el código único que representa al lote';

comment on column Lote.Codigo_Transaccion is
'Representa el código único de identificación de la transacción';

comment on column Lote.nombre is
'Nombre del lote. ';

comment on column Lote.Fecha_Creacion is
'Fecha de creación del lote';

comment on column Lote.Fecha_Envio is
'Fecha de envío del lote';

comment on column Lote.Fecha_Recepcion is
'Fecha de recepción de la autorización del lote';

/*==============================================================*/
/* Index: LOTE_PK                                               */
/*==============================================================*/
create unique index LOTE_PK on Lote (
codigo_Lote
);

/*==============================================================*/
/* Index: ASSOCIATION37_FK                                      */
/*==============================================================*/
create  index ASSOCIATION37_FK on Lote (
Codigo_Transaccion
);

/*==============================================================*/
/* Table: Perfil_Usuario                                        */
/*==============================================================*/
create table Perfil_Usuario (
   codigo_Perfil_Usuario SERIAL not null,
   codigo_Usuario       INT4                 null,
   codigo_Perfil        INT4                 null,
   constraint PK_PERFIL_USUARIO primary key (codigo_Perfil_Usuario)
);

/*==============================================================*/
/* Index: PERFIL_USUARIO_PK                                     */
/*==============================================================*/
create unique index PERFIL_USUARIO_PK on Perfil_Usuario (
codigo_Perfil_Usuario
);

/*==============================================================*/
/* Index: ASSOCIATION2_FK                                       */
/*==============================================================*/
create  index ASSOCIATION2_FK on Perfil_Usuario (
codigo_Usuario
);

/*==============================================================*/
/* Table: Proveedor_Certificado                                 */
/*==============================================================*/
create table Proveedor_Certificado (
   Codigo_Proveedor_Certificado INT4                 not null,
   descripcion          VARCHAR(254)         null,
   constraint PK_PROVEEDOR_CERTIFICADO primary key (Codigo_Proveedor_Certificado)
);

/*==============================================================*/
/* Index: PROVEEDORCERTIFICADO_PK                               */
/*==============================================================*/
create unique index PROVEEDORCERTIFICADO_PK on Proveedor_Certificado (
Codigo_Proveedor_Certificado
);

/*==============================================================*/
/* Table: Saldo                                                 */
/*==============================================================*/
create table Saldo (
   codigo_Saldo         SERIAL not null,
   Codigo_Emisor        INT4                 not null,
   Cantidad_Adquirida   INT4                 null,
   Cantidad_Utilizada   INT4                 null,
   saldo                NUMERIC              null,
   constraint PK_SALDO primary key (codigo_Saldo)
);

comment on table Saldo is
'Entidad para almacenar los saldos de los usuarios pos-pago';

comment on column Saldo.Codigo_Emisor is
'Es el identificador único del emisor';

comment on column Saldo.Cantidad_Adquirida is
'cantidad original adquirida mediante el botón de pago';

comment on column Saldo.Cantidad_Utilizada is
'Cantidad actual de transacciones utilizadas';

comment on column Saldo.saldo is
'Cantidad Adquirida - Cantidad Utilizada';

/*==============================================================*/
/* Index: SALDO_PK                                              */
/*==============================================================*/
create unique index SALDO_PK on Saldo (
codigo_Saldo
);

/*==============================================================*/
/* Index: ASSOCIATION35_FK                                      */
/*==============================================================*/
create  index ASSOCIATION35_FK on Saldo (
Codigo_Emisor
);

/*==============================================================*/
/* Table: Secuencial_Comprobante                                */
/*==============================================================*/
create table Secuencial_Comprobante (
   Codigo_Secuencial    INT4                 not null,
   codigo_Tipo_Comprobante VARCHAR(8)           null,
   codigo_Establecimiento INT4                 null,
   Secuencial           INT4                 null,
   constraint PK_SECUENCIAL_COMPROBANTE primary key (Codigo_Secuencial)
);

/*==============================================================*/
/* Index: SECUENCIALCOMPROBANTE_PK                              */
/*==============================================================*/
create unique index SECUENCIALCOMPROBANTE_PK on Secuencial_Comprobante (
Codigo_Secuencial
);

/*==============================================================*/
/* Index: ASSOCIATION11_FK                                      */
/*==============================================================*/
create  index ASSOCIATION11_FK on Secuencial_Comprobante (
codigo_Establecimiento
);

/*==============================================================*/
/* Index: ASSOCIATION12_FK                                      */
/*==============================================================*/
create  index ASSOCIATION12_FK on Secuencial_Comprobante (
codigo_Tipo_Comprobante
);

/*==============================================================*/
/* Table: Tipo_Ambiente                                         */
/*==============================================================*/
create table Tipo_Ambiente (
   Codigo_Tipo_Ambiente INT4                 not null,
   descripcion          VARCHAR(254)         null,
   constraint PK_TIPO_AMBIENTE primary key (Codigo_Tipo_Ambiente)
);

/*==============================================================*/
/* Index: TIPO_AMBIENTE_PK                                      */
/*==============================================================*/
create unique index TIPO_AMBIENTE_PK on Tipo_Ambiente (
Codigo_Tipo_Ambiente
);

/*==============================================================*/
/* Table: Tipo_Comprobante                                      */
/*==============================================================*/
create table Tipo_Comprobante (
   codigo_Tipo_Comprobante VARCHAR(8)           not null,
   descripcion          VARCHAR(254)         null,
   constraint PK_TIPO_COMPROBANTE primary key (codigo_Tipo_Comprobante)
);

comment on table Tipo_Comprobante is
'Factura("01"),
NotaDeCredito("04"),
NotaDeDebito ("05"),
GuiaDeRemision ("06"),
ComprobanteDeRetencion("07");';

/*==============================================================*/
/* Index: TIPOCOMPROBANTE_PK                                    */
/*==============================================================*/
create unique index TIPOCOMPROBANTE_PK on Tipo_Comprobante (
codigo_Tipo_Comprobante
);

/*==============================================================*/
/* Table: Tipo_Emision                                          */
/*==============================================================*/
create table Tipo_Emision (
   codigo_tipo_emision  INT4                 not null,
   descripcion          VARCHAR(254)         null,
   constraint PK_TIPO_EMISION primary key (codigo_tipo_emision)
);

comment on table Tipo_Emision is
'Tabla que contiene los tipos de emisión de la factura: "Normal" e "Indisponibilidad del sistema"';

/*==============================================================*/
/* Index: TIPOEMISION_PK                                        */
/*==============================================================*/
create unique index TIPOEMISION_PK on Tipo_Emision (
codigo_tipo_emision
);

/*==============================================================*/
/* Table: Tipo_Estado                                           */
/*==============================================================*/
create table Tipo_Estado (
   Codigo_Tipo_Estado   INT4                 not null,
   descripcion          VARCHAR(254)         null,
   constraint PK_TIPO_ESTADO primary key (Codigo_Tipo_Estado)
);

/*==============================================================*/
/* Index: TIPOESTADO_PK                                         */
/*==============================================================*/
create unique index TIPOESTADO_PK on Tipo_Estado (
Codigo_Tipo_Estado
);

/*==============================================================*/
/* Table: Tipo_Impuesto                                         */
/*==============================================================*/
create table Tipo_Impuesto (
   Codigo_Tipo_Impuesto VARCHAR(8)           not null,
   descripcion          VARCHAR(254)         null,
   constraint PK_TIPO_IMPUESTO primary key (Codigo_Tipo_Impuesto)
);

/*==============================================================*/
/* Index: TIPOIMPUESTO_PK                                       */
/*==============================================================*/
create unique index TIPOIMPUESTO_PK on Tipo_Impuesto (
Codigo_Tipo_Impuesto
);

/*==============================================================*/
/* Table: Transaccion                                           */
/*==============================================================*/
create table Transaccion (
   Codigo_Transaccion   SERIAL not null,
   Codigo_Emisor        INT4                 not null,
   Fecha_Transaccion    TIMESTAMP            null,
   Nombre_Archivo       VARCHAR(254)         null,
   constraint PK_TRANSACCION primary key (Codigo_Transaccion)
);

comment on table Transaccion is
'Entidad que almacena las transacciones realizadas por el emisor. Cada transacción puede contener varios lotes y cada lote máximo puede contener 50 comprobantes';

comment on column Transaccion.Codigo_Transaccion is
'Representa el código único de identificación de la transacción';

comment on column Transaccion.Codigo_Emisor is
'Es el identificador único del emisor';

comment on column Transaccion.Fecha_Transaccion is
'Fecha en la que se realiza la transacción';

comment on column Transaccion.Nombre_Archivo is
'Nombre del archivo subido por el usuario dessde la página web.';

/*==============================================================*/
/* Index: TRANSACCION_PK                                        */
/*==============================================================*/
create unique index TRANSACCION_PK on Transaccion (
Codigo_Transaccion
);

/*==============================================================*/
/* Index: ASSOCIATION36_FK                                      */
/*==============================================================*/
create  index ASSOCIATION36_FK on Transaccion (
Codigo_Emisor
);

/*==============================================================*/
/* Table: Transportista                                         */
/*==============================================================*/
create table Transportista (
   codigo_Producto_Transportado SERIAL not null,
   codigo_Comprobante   INT4                 not null,
   Codigo_Producto      VARCHAR(254)         null,
   razon_social         VARCHAR(254)         null,
   descripcion          VARCHAR(254)         null,
   fecha_inicio         TIMESTAMP            null,
   fecha_fin            TIMESTAMP            null,
   constraint PK_TRANSPORTISTA primary key (codigo_Producto_Transportado)
);

comment on table Transportista is
'Almacena los productos que serán transportados para un guia de remisión';

comment on column Transportista.codigo_Comprobante is
'Campo para identificación única del comprobante';

/*==============================================================*/
/* Index: PRODUCTO_TRANSPORTADO_PK                              */
/*==============================================================*/
create unique index PRODUCTO_TRANSPORTADO_PK on Transportista (
codigo_Producto_Transportado
);

/*==============================================================*/
/* Index: ASSOCIATION34_FK                                      */
/*==============================================================*/
create  index ASSOCIATION34_FK on Transportista (
codigo_Comprobante
);

/*==============================================================*/
/* Table: Usuario                                               */
/*==============================================================*/
create table Usuario (
   codigo_Usuario       SERIAL not null,
   codigo_Estado        INT4                 not null,
   identificador        VARCHAR(254)         not null,
   nombre_Completo      VARCHAR(254)         not null,
   correo_Electronico   VARCHAR(254)         not null,
   correo_Alternativo   VARCHAR(254)         null,
   clave                VARCHAR(254)         null,
   constraint PK_USUARIO primary key (codigo_Usuario)
);

comment on table Usuario is
'Clase de usuario';

/*==============================================================*/
/* Index: ADM_USUARIO_PK                                        */
/*==============================================================*/
create unique index ADM_USUARIO_PK on Usuario (
codigo_Usuario
);

/*==============================================================*/
/* Index: ASSOCIATION3_FK                                       */
/*==============================================================*/
create  index ASSOCIATION3_FK on Usuario (
codigo_Estado
);

/*==============================================================*/
/* Table: comprobante_modifica                                  */
/*==============================================================*/
create table comprobante_modifica (
   codigo_comprobante_modifica INT4                 not null,
   codigo_Comprobante   SERIAL               not null,
   nombre_comprobante   VARCHAR(64)          null,
   numero_comprobante   VARCHAR(64)          null,
   fecha_emision        TIMESTAMP            null,
   motivo               VARCHAR(254)         null,
   constraint PK_COMPROBANTE_MODIFICA primary key (codigo_comprobante_modifica)
);

comment on column comprobante_modifica.codigo_Comprobante is
'Campo para identificación única del comprobante';

/*==============================================================*/
/* Table: usuario_Emisor                                        */
/*==============================================================*/
create table usuario_Emisor (
   Codigo_Emisor        INT4                 not null,
   codigo_Usuario       INT4                 not null,
   constraint PK_USUARIO_EMISOR primary key (Codigo_Emisor, codigo_Usuario)
);

comment on column usuario_Emisor.Codigo_Emisor is
'Es el identificador único del emisor';

/*==============================================================*/
/* Index: USUARIO_EMISOR_PK                                     */
/*==============================================================*/
create unique index USUARIO_EMISOR_PK on usuario_Emisor (
Codigo_Emisor,
codigo_Usuario
);

/*==============================================================*/
/* Index: USUARIO_EMISOR_FK                                     */
/*==============================================================*/
create  index USUARIO_EMISOR_FK on usuario_Emisor (
Codigo_Emisor
);

/*==============================================================*/
/* Index: USUARIO_EMISOR_FK2                                    */
/*==============================================================*/
create  index USUARIO_EMISOR_FK2 on usuario_Emisor (
codigo_Usuario
);

alter table Aduana_Comprobante
   add constraint FK_ADUANA_C_ASSOCIATI_COMPROBA foreign key (codigo_Comprobante)
      references Comprobante (codigo_Comprobante)
      on delete restrict on update restrict;

alter table Clave_Contingencia
   add constraint FK_CLAVE_CO_ASSOCIATI_EMISOR foreign key (Codigo_Emisor)
      references Emisor (Codigo_Emisor)
      on delete restrict on update restrict;

alter table Comprobante
   add constraint FK_COMPROBA_REFERENCE_EMISOR foreign key (Codigo_Emisor)
      references Emisor (Codigo_Emisor)
      on delete restrict on update restrict;

alter table Comprobante
   add constraint FK_COMPROBA_REFERENCE_TIPO_EMI foreign key (codigo_tipo_emision)
      references Tipo_Emision (codigo_tipo_emision)
      on delete restrict on update restrict;

alter table Comprobante
   add constraint FK_COMPROBA_ASSOCIATI_TIPO_COM foreign key (codigo_Tipo_Comprobante)
      references Tipo_Comprobante (codigo_Tipo_Comprobante)
      on delete restrict on update restrict;

alter table Comprobante_Lote
   add constraint FK_COMPROBA_ASSOCIATI_LOTE foreign key (codigo_Lote)
      references Lote (codigo_Lote)
      on delete restrict on update restrict;

alter table Detalle_Comprobante
   add constraint FK_DETALLE__ASSOCIATI_COMPROBA foreign key (codigo_Comprobante)
      references Comprobante (codigo_Comprobante)
      on delete restrict on update restrict;

alter table Emisor
   add constraint FK_EMISOR_ASSOCIATI_TIPO_AMB foreign key (Codigo_Tipo_Ambiente)
      references Tipo_Ambiente (Codigo_Tipo_Ambiente)
      on delete restrict on update restrict;

alter table Emisor
   add constraint FK_EMISOR_ASSOCIATI_PROVEEDO foreign key (Codigo_Proveedor_Certificado)
      references Proveedor_Certificado (Codigo_Proveedor_Certificado)
      on delete restrict on update restrict;

alter table Establecimiento
   add constraint FK_ESTABLEC_ASSOCIATI_EMISOR foreign key (Codigo_Emisor)
      references Emisor (Codigo_Emisor)
      on delete restrict on update restrict;

alter table Estado
   add constraint FK_ESTADO_ASSOCIATI_COMPROBA foreign key (codigo_Comprobante)
      references Comprobante (codigo_Comprobante)
      on delete restrict on update restrict;

alter table Estado
   add constraint FK_ESTADO_ASSOCIATI_TIPO_EST foreign key (Codigo_Tipo_Estado)
      references Tipo_Estado (Codigo_Tipo_Estado)
      on delete restrict on update restrict;

alter table Estado_Cuenta
   add constraint FK_ESTADO_C_ASSOCIATI_EMISOR foreign key (Codigo_Emisor)
      references Emisor (Codigo_Emisor)
      on delete restrict on update restrict;

alter table Estado_Cuenta
   add constraint FK_ESTADO_C_ASSOCIATI_ESTADO foreign key (codigo_Estado)
      references Estado (codigo_Estado)
      on delete restrict on update restrict;

alter table Impuesto
   add constraint FK_IMPUESTO_ASSOCIATI_TIPO_IMP foreign key (Codigo_Tipo_Impuesto)
      references Tipo_Impuesto (Codigo_Tipo_Impuesto)
      on delete restrict on update restrict;

alter table Impuestos_Comprobante
   add constraint FK_IMPUESTO_REFERENCE_IMPUESTO foreign key (codigo_Impuesto)
      references Impuesto (codigo_Impuesto)
      on delete restrict on update restrict;

alter table Impuestos_Comprobante
   add constraint FK_IMPUESTO_REFERENCE_DETALLE_ foreign key (Codigo_Detalle_Comprobante)
      references Detalle_Comprobante (Codigo_Detalle_Comprobante)
      on delete restrict on update restrict;

alter table Lote
   add constraint FK_LOTE_ASSOCIATI_TRANSACC foreign key (Codigo_Transaccion)
      references Transaccion (Codigo_Transaccion)
      on delete restrict on update restrict;

alter table Perfil_Usuario
   add constraint FK_PERFIL_U_ASSOCIATI_USUARIO foreign key (codigo_Usuario)
      references Usuario (codigo_Usuario)
      on delete restrict on update restrict;

alter table Saldo
   add constraint FK_SALDO_ASSOCIATI_EMISOR foreign key (Codigo_Emisor)
      references Emisor (Codigo_Emisor)
      on delete restrict on update restrict;

alter table Secuencial_Comprobante
   add constraint FK_SECUENCI_ASSOCIATI_ESTABLEC foreign key (codigo_Establecimiento)
      references Establecimiento (codigo_Establecimiento)
      on delete restrict on update restrict;

alter table Secuencial_Comprobante
   add constraint FK_SECUENCI_ASSOCIATI_TIPO_COM foreign key (codigo_Tipo_Comprobante)
      references Tipo_Comprobante (codigo_Tipo_Comprobante)
      on delete restrict on update restrict;

alter table Transaccion
   add constraint FK_TRANSACC_ASSOCIATI_EMISOR foreign key (Codigo_Emisor)
      references Emisor (Codigo_Emisor)
      on delete restrict on update restrict;

alter table Transportista
   add constraint FK_TRANSPOR_ASSOCIATI_COMPROBA foreign key (codigo_Comprobante)
      references Comprobante (codigo_Comprobante)
      on delete restrict on update restrict;

alter table Usuario
   add constraint FK_USUARIO_ASSOCIATI_ESTADO foreign key (codigo_Estado)
      references Estado (codigo_Estado)
      on delete restrict on update restrict;

alter table comprobante_modifica
   add constraint FK_COMPROBA_REFERENCE_COMPROBA foreign key (codigo_Comprobante)
      references Comprobante (codigo_Comprobante)
      on delete restrict on update restrict;

alter table usuario_Emisor
   add constraint FK_USUARIO__USUARIO_E_EMISOR foreign key (Codigo_Emisor)
      references Emisor (Codigo_Emisor)
      on delete restrict on update restrict;

alter table usuario_Emisor
   add constraint FK_USUARIO__USUARIO_E_USUARIO foreign key (codigo_Usuario)
      references Usuario (codigo_Usuario)
      on delete restrict on update restrict;

