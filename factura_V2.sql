/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     18/04/2014 7:04:34                           */
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

drop table Comprobante_detalle;

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

drop table tipo_comprador;

drop table usuario_Emisor;

/*==============================================================*/
/* Table: Aduana_Comprobante                                    */
/*==============================================================*/
create table Aduana_Comprobante (
   Codigo               SERIAL not null,
   codigo_Comprobante   INT4                 not null,
   Motivo               VARCHAR(254)         null,
   Destino              VARCHAR(254)         null,
   documento_Aduanero   VARCHAR(254)         null,
   ruta                 VARCHAR(254)         null,
   codigo_Establecimeinto_Destino VARCHAR(32)          null,
   punto_partida        VARCHAR(254)         null,
   constraint PK_ADUANA_COMPROBANTE primary key (Codigo)
);

comment on table Aduana_Comprobante is
'Datos aduaneros para guia de remisión';

comment on column Aduana_Comprobante.codigo_Comprobante is
'Campo para identificación única del comprobante';

/*==============================================================*/
/* Index: ADUANA_COMPROBANTE_PK                                 */
/*==============================================================*/
create unique index ADUANA_COMPROBANTE_PK on Aduana_Comprobante (
Codigo
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
   Codigo               SERIAL not null,
   Codigo_Emisor        INT4                 null,
   clave                CHAR(64)             null,
   utilizada            CHAR(1)              null,
   codigo_Comprobante   INT4                 null,
   fecha_ingreso        TIMESTAMP            null,
   fecha_uso            TIMESTAMP            null,
   constraint PK_CLAVE_CONTINGENCIA primary key (Codigo)
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
Codigo
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
   codigo               INT4                 not null,
   codigo_Tipo_Comprobante INT4                 not null,
   Codigo_Emisor        INT4                 null,
   codigo_tipo_emision  INT4                 null,
   codigo_Establecimiento INT4                 null,
   secuencial           VARCHAR(64)          null,
   Numero_Factura       INT4                 null,
   fecha_Emision        TIMESTAMP            null,
   codigo_tipo_comprador INT4                 null,
   comprador            VARCHAR(128)         null,
   identificacion_comprador VARCHAR(32)          null,
   Direccion_comprador  VARCHAR(128)         null,
   Telefono_comprador   VARCHAR(32)          null,
   movil_comprador      VARCHAR(32)          null,
   Correo_comprador     VARCHAR(128)         null,
   subtotal             NUMERIC              null,
   subtotal_iva         NUMERIC              null,
   subtotal_no_Iva      NUMERIC              null,
   descuento            NUMERIC              null,
   iva                  NUMERIC              null,
   ice                  NUMERIC              null,
   Propina              NUMERIC              null,
   Total                NUMERIC              null,
   moneda               VARCHAR(64)          null,
   Guia_Remision        VARCHAR(254)         null,
   xml                  VARCHAR(254)         null,
   pdf                  VARCHAR(254)         null,
   numero_Autorizacion  VARCHAR(254)         null,
   Fecha_autorizacion   TIMESTAMP            null,
   motivo               VARCHAR(254)         null,
   transaccion          INT4                 null,
   lote                 INT2                 null,
   constraint PK_COMPROBANTE primary key (codigo)
);

comment on column Comprobante.codigo is
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

comment on column Comprobante.comprador is
'Razón social del comprador';

comment on column Comprobante.identificacion_comprador is
'Identificación del comprador';

comment on column Comprobante.Direccion_comprador is
'Dirección del comprador';

comment on column Comprobante.Telefono_comprador is
'Teléfono del comprador';

comment on column Comprobante.Correo_comprador is
'Correo electrónico del comprador';

comment on column Comprobante.subtotal_no_Iva is
'Total de la factura sin impuestos';

comment on column Comprobante.descuento is
'Total de descuentos de la factura';

comment on column Comprobante.ice is
'Valor del ICE';

comment on column Comprobante.Propina is
'Valor  de la propina';

comment on column Comprobante.Total is
'Valor Total de la factura';

comment on column Comprobante.moneda is
'Moneda de la transacción';

comment on column Comprobante.Guia_Remision is
'Numero de guía de remisión';

comment on column Comprobante.xml is
'Es el nombre del archivo firmado y enviado al SRI. Solo debe tener datos en el caso de que se envío correctamente.';

/*==============================================================*/
/* Index: COMPROBANTE_PK                                        */
/*==============================================================*/
create unique index COMPROBANTE_PK on Comprobante (
codigo
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
   Codigo               SERIAL               not null,
   codigo_Lote          INT4                 null,
   codigo_comprobante   INT4                 null,
   constraint PK_COMPROBANTE_LOTE primary key (Codigo)
);

comment on table Comprobante_Lote is
'Se incluyen los comprobantes que fueron enviados en el lote respectivo.';

comment on column Comprobante_Lote.Codigo is
'Código único para identificación del comprobante por lote';

comment on column Comprobante_Lote.codigo_Lote is
'Es el código único que representa al lote';

/*==============================================================*/
/* Index: COMPROBANTELOTE_PK                                    */
/*==============================================================*/
create unique index COMPROBANTELOTE_PK on Comprobante_Lote (
Codigo
);

/*==============================================================*/
/* Index: ASSOCIATION29_FK                                      */
/*==============================================================*/
create  index ASSOCIATION29_FK on Comprobante_Lote (
codigo_Lote
);

/*==============================================================*/
/* Table: Comprobante_detalle                                   */
/*==============================================================*/
create table Comprobante_detalle (
   Codigo               SERIAL not null,
   codigo_Comprobante   INT4                 not null,
   codigo_Principal     VARCHAR(64)          null,
   codigo_Auxiliar      VARCHAR(64)          null,
   cantidad             NUMERIC              null,
   precio_Unitario      NUMERIC              null,
   detalle              VARCHAR(96)          null,
   detalle_Adicional1   VARCHAR(96)          null,
   detalle_Adicional2   VARCHAR(69)          null,
   descuento            NUMERIC              null,
   precio_Total         NUMERIC              null,
   constraint PK_COMPROBANTE_DETALLE primary key (Codigo)
);

comment on column Comprobante_detalle.Codigo is
'Es el código identificador del detalle de la factura';

comment on column Comprobante_detalle.codigo_Comprobante is
'Campo para identificación única del comprobante';

comment on column Comprobante_detalle.codigo_Principal is
'Es el código principal del producto';

comment on column Comprobante_detalle.codigo_Auxiliar is
'Es el códio auxiliar del producto';

comment on column Comprobante_detalle.cantidad is
'Es la cantidad del producto';

comment on column Comprobante_detalle.precio_Unitario is
'Es el precio unitario del producto';

comment on column Comprobante_detalle.detalle is
'Es una información adicional del producto';

comment on column Comprobante_detalle.detalle_Adicional1 is
'Es una información adicional del producto';

comment on column Comprobante_detalle.detalle_Adicional2 is
'Es una información adicional del producto';

comment on column Comprobante_detalle.descuento is
'Es el descuento del producto';

comment on column Comprobante_detalle.precio_Total is
'Es el precio total del producto (Cantidad * PrecioUnitario)- Descuento';

/*==============================================================*/
/* Index: DETALLECOMPROBANTE_PK                                 */
/*==============================================================*/
create unique index DETALLECOMPROBANTE_PK on Comprobante_detalle (
Codigo
);

/*==============================================================*/
/* Index: ASSOCIATION17_FK                                      */
/*==============================================================*/
create  index ASSOCIATION17_FK on Comprobante_detalle (
codigo_Comprobante
);

/*==============================================================*/
/* Table: Emisor                                                */
/*==============================================================*/
create table Emisor (
   Codigo               SERIAL not null,
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
   constraint PK_EMISOR primary key (Codigo)
);

comment on table Emisor is
'Clase emisor que almacenará la información necesaria para el SRI y el sistema Anyway Invoice.';

comment on column Emisor.Codigo is
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
Codigo
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
   codigo               SERIAL not null,
   Codigo_Emisor        INT4                 not null,
   numero_Establecimiento VARCHAR(8)           null,
   direccion            VARCHAR(254)         null,
   punto_emision        VARCHAR(8)           null,
   constraint PK_ESTABLECIMIENTO primary key (codigo)
);

comment on column Establecimiento.Codigo_Emisor is
'Es el identificador único del emisor';

/*==============================================================*/
/* Index: ESTABLECIMIENTO_PK                                    */
/*==============================================================*/
create unique index ESTABLECIMIENTO_PK on Establecimiento (
codigo
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
   documento            VARCHAR(32)          null,
   xml                  VARCHAR(254)         null,
   pdf                  VARCHAR(254)         null,
   error                TEXT                 null,
   sri_recepcion        TEXT                 null,
   sri_autorizacion     TEXT                 null,
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
   Fecha_Inicial        TIMESTAMP            null,
   Fecha_Final          TIMESTAMP            null
);

comment on column Estado_Cuenta.Codigo_Emisor is
'Es el identificador único del emisor';

/*==============================================================*/
/* Index: ESTADOCUENTA_PK                                       */
/*==============================================================*/
create unique index ESTADOCUENTA_PK on Estado_Cuenta (
Codigo_Emisor
);

/*==============================================================*/
/* Index: ASSOCIATION5_FK                                       */
/*==============================================================*/
create  index ASSOCIATION5_FK on Estado_Cuenta (
Codigo_Emisor
);

/*==============================================================*/
/* Table: Impuesto                                              */
/*==============================================================*/
create table Impuesto (
   codigo_Impuesto      SERIAL               not null,
   Codigo_Tipo_Impuesto INT4                 not null,
   porcentaje           NUMERIC              null,
   descripcion          VARCHAR(254)         null,
   codigo_sri           VARCHAR(8)           null,
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
   codigo               SERIAL               not null,
   Codigo_Detalle_Comprobante INT4                 null,
   codigo_Impuesto      INT4                 null,
   base_Impobible       NUMERIC              null,
   valor_Impuesto       NUMERIC              null,
   constraint PK_IMPUESTOS_COMPROBANTE primary key (codigo)
);

comment on table Impuestos_Comprobante is
'Entidad que contiene todas los impuestos del comprobante';

comment on column Impuestos_Comprobante.Codigo_Detalle_Comprobante is
'Es el código identificador del detalle de la factura';

/*==============================================================*/
/* Index: IMPUESTOS_COMPROBANTE_PK                              */
/*==============================================================*/
create unique index IMPUESTOS_COMPROBANTE_PK on Impuestos_Comprobante (
codigo
);

/*==============================================================*/
/* Table: Lote                                                  */
/*==============================================================*/
create table Lote (
   codigo_Lote          SERIAL not null,
   codigo_transaccion   INT4                 null,
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

comment on column Lote.codigo_transaccion is
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
codigo_transaccion
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
   Codigo               INT4                 not null,
   descripcion          VARCHAR(254)         null,
   constraint PK_PROVEEDOR_CERTIFICADO primary key (Codigo)
);

/*==============================================================*/
/* Index: PROVEEDORCERTIFICADO_PK                               */
/*==============================================================*/
create unique index PROVEEDORCERTIFICADO_PK on Proveedor_Certificado (
Codigo
);

/*==============================================================*/
/* Table: Saldo                                                 */
/*==============================================================*/
create table Saldo (
   codigo               SERIAL not null,
   Codigo_Emisor        INT4                 not null,
   Cantidad_Adquirida   INT4                 null,
   Cantidad_Utilizada   INT4                 null,
   saldo                NUMERIC              null,
   constraint PK_SALDO primary key (codigo)
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
codigo
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
   Codigo               INT4                 not null,
   codigo_Tipo_Comprobante INT4                 null,
   codigo_Establecimiento INT4                 null,
   Secuencial           INT4                 null,
   constraint PK_SECUENCIAL_COMPROBANTE primary key (Codigo)
);

/*==============================================================*/
/* Index: SECUENCIALCOMPROBANTE_PK                              */
/*==============================================================*/
create unique index SECUENCIALCOMPROBANTE_PK on Secuencial_Comprobante (
Codigo
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
   Codigo               SERIAL               not null,
   descripcion          VARCHAR(64)          null,
   codigo_sri           VARCHAR(8)           null,
   constraint PK_TIPO_AMBIENTE primary key (Codigo)
);

/*==============================================================*/
/* Index: TIPO_AMBIENTE_PK                                      */
/*==============================================================*/
create unique index TIPO_AMBIENTE_PK on Tipo_Ambiente (
Codigo
);

/*==============================================================*/
/* Table: Tipo_Comprobante                                      */
/*==============================================================*/
create table Tipo_Comprobante (
   Codigo               SERIAL               not null,
   descripcion          VARCHAR(254)         null,
   codigo_sri           VARCHAR(8)           null,
   constraint PK_TIPO_COMPROBANTE primary key (Codigo)
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
Codigo
);

/*==============================================================*/
/* Table: Tipo_Emision                                          */
/*==============================================================*/
create table Tipo_Emision (
   codigo_tipo_emision  SERIAL               not null,
   descripcion          VARCHAR(64)          null,
   codigo_sri           VARCHAR(8)           null,
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
   Codigo               SERIAL               not null,
   descripcion          VARCHAR(64)          null,
   codigo_sri           VARCHAR(8)           null,
   constraint PK_TIPO_ESTADO primary key (Codigo)
);

/*==============================================================*/
/* Index: TIPOESTADO_PK                                         */
/*==============================================================*/
create unique index TIPOESTADO_PK on Tipo_Estado (
Codigo
);

/*==============================================================*/
/* Table: Tipo_Impuesto                                         */
/*==============================================================*/
create table Tipo_Impuesto (
   Codigo               SERIAL               not null,
   descripcion          VARCHAR(64)          null,
   codigo_sri           VARCHAR(8)           null,
   constraint PK_TIPO_IMPUESTO primary key (Codigo)
);

/*==============================================================*/
/* Index: TIPOIMPUESTO_PK                                       */
/*==============================================================*/
create unique index TIPOIMPUESTO_PK on Tipo_Impuesto (
Codigo
);

/*==============================================================*/
/* Table: Transaccion                                           */
/*==============================================================*/
create table Transaccion (
   Codigo_Transaccion   SERIAL not null,
   Codigo_Emisor        INT4                 not null,
   Fecha_Transaccion    TIMESTAMP            null,
   archivo_original     VARCHAR(254)         null,
   codigo_tipo_estado   INT4                 null,
   archivo_proceso      VARCHAR(254)         null,
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

comment on column Transaccion.archivo_original is
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
   Codigo               SERIAL not null,
   codigo_Comprobante   INT4                 not null,
   Codigo_Producto      VARCHAR(254)         null,
   razon_social         VARCHAR(254)         null,
   descripcion          VARCHAR(254)         null,
   fecha_inicio         TIMESTAMP            null,
   fecha_fin            TIMESTAMP            null,
   constraint PK_TRANSPORTISTA primary key (Codigo)
);

comment on table Transportista is
'Almacena los productos que serán transportados para un guia de remisión';

comment on column Transportista.codigo_Comprobante is
'Campo para identificación única del comprobante';

/*==============================================================*/
/* Index: PRODUCTO_TRANSPORTADO_PK                              */
/*==============================================================*/
create unique index PRODUCTO_TRANSPORTADO_PK on Transportista (
Codigo
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
   codigo               SERIAL not null,
   codigo_Estado        INT4                 null,
   identificador        VARCHAR(128)         not null,
   nombre_Completo      VARCHAR(128)         not null,
   correo_Electronico   VARCHAR(128)         not null,
   correo_Alternativo   VARCHAR(128)         null,
   clave                VARCHAR(128)         null,
   constraint PK_USUARIO primary key (codigo)
);

comment on table Usuario is
'Clase de usuario';

/*==============================================================*/
/* Index: ADM_USUARIO_PK                                        */
/*==============================================================*/
create unique index ADM_USUARIO_PK on Usuario (
codigo
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
   codigo               SERIAL               not null,
   codigo_Comprobante   INT4                 not null,
   nombre_comprobante   VARCHAR(64)          null,
   numero_comprobante   VARCHAR(64)          null,
   fecha_emision        TIMESTAMP            null,
   codigo_tipo_comprobante INT4                 null,
   constraint PK_COMPROBANTE_MODIFICA primary key (codigo)
);

comment on column comprobante_modifica.codigo_Comprobante is
'Campo para identificación única del comprobante';

/*==============================================================*/
/* Table: tipo_comprador                                        */
/*==============================================================*/
create table tipo_comprador (
   codigo               SERIAL               not null,
   descripcion          VARCHAR(64)          not null,
   codigo_sri           VARCHAR(8)           not null,
   constraint PK_TIPO_COMPRADOR primary key (codigo)
);

/*==============================================================*/
/* Table: usuario_Emisor                                        */
/*==============================================================*/
create table usuario_Emisor (
   Codigo_Emisor        INT4                 not null,
   codigo_Usuario       INT4                 not null
);

comment on column usuario_Emisor.Codigo_Emisor is
'Es el identificador único del emisor';

alter table Aduana_Comprobante
   add constraint FK_ADUANA_C_ASSOCIATI_COMPROBA foreign key (codigo_Comprobante)
      references Comprobante (codigo)
      on delete restrict on update restrict;

alter table Clave_Contingencia
   add constraint FK_CLAVE_CO_ASSOCIATI_EMISOR foreign key (Codigo_Emisor)
      references Emisor (Codigo)
      on delete restrict on update restrict;

alter table Comprobante
   add constraint FK_COMPROBA_REFERENCE_EMISOR foreign key (Codigo_Emisor)
      references Emisor (Codigo)
      on delete restrict on update restrict;

alter table Comprobante
   add constraint FK_COMPROBA_REFERENCE_TIPO_EMI foreign key (codigo_tipo_emision)
      references Tipo_Emision (codigo_tipo_emision)
      on delete restrict on update restrict;

alter table Comprobante
   add constraint FK_COMPROBA_REFERENCE_TIPO_COM foreign key (codigo_tipo_comprador)
      references tipo_comprador (codigo)
      on delete restrict on update restrict;

alter table Comprobante
   add constraint FK_COMPROBA_ASSOCIATI_TIPO_COM foreign key (codigo_Tipo_Comprobante)
      references Tipo_Comprobante (Codigo)
      on delete restrict on update restrict;

alter table Comprobante_Lote
   add constraint FK_COMPROBA_ASSOCIATI_LOTE foreign key (codigo_Lote)
      references Lote (codigo_Lote)
      on delete restrict on update restrict;

alter table Comprobante_detalle
   add constraint FK_COMPROBA_ASSOCIATI_COMPROBA foreign key (codigo_Comprobante)
      references Comprobante (codigo)
      on delete restrict on update restrict;

alter table Emisor
   add constraint FK_EMISOR_ASSOCIATI_TIPO_AMB foreign key (Codigo_Tipo_Ambiente)
      references Tipo_Ambiente (Codigo)
      on delete restrict on update restrict;

alter table Emisor
   add constraint FK_EMISOR_ASSOCIATI_PROVEEDO foreign key (Codigo_Proveedor_Certificado)
      references Proveedor_Certificado (Codigo)
      on delete restrict on update restrict;

alter table Establecimiento
   add constraint FK_ESTABLEC_ASSOCIATI_EMISOR foreign key (Codigo_Emisor)
      references Emisor (Codigo)
      on delete restrict on update restrict;

alter table Estado
   add constraint FK_ESTADO_ASSOCIATI_COMPROBA foreign key (codigo_Comprobante)
      references Comprobante (codigo)
      on delete restrict on update restrict;

alter table Estado
   add constraint FK_ESTADO_ASSOCIATI_TIPO_EST foreign key (Codigo_Tipo_Estado)
      references Tipo_Estado (Codigo)
      on delete restrict on update restrict;

alter table Estado_Cuenta
   add constraint FK_ESTADO_C_ASSOCIATI_EMISOR foreign key (Codigo_Emisor)
      references Emisor (Codigo)
      on delete restrict on update restrict;

alter table Impuesto
   add constraint FK_IMPUESTO_ASSOCIATI_TIPO_IMP foreign key (Codigo_Tipo_Impuesto)
      references Tipo_Impuesto (Codigo)
      on delete restrict on update restrict;

alter table Impuestos_Comprobante
   add constraint FK_IMPUESTO_REFERENCE_IMPUESTO foreign key (codigo_Impuesto)
      references Impuesto (codigo_Impuesto)
      on delete restrict on update restrict;

alter table Impuestos_Comprobante
   add constraint FK_IMPUESTO_REFERENCE_COMPROBA foreign key (Codigo_Detalle_Comprobante)
      references Comprobante_detalle (Codigo)
      on delete restrict on update restrict;

alter table Lote
   add constraint FK_LOTE_ASSOCIATI_TRANSACC foreign key (codigo_transaccion)
      references Transaccion (Codigo_Transaccion)
      on delete restrict on update restrict;

alter table Perfil_Usuario
   add constraint FK_PERFIL_U_ASSOCIATI_USUARIO foreign key (codigo_Usuario)
      references Usuario (codigo)
      on delete restrict on update restrict;

alter table Saldo
   add constraint FK_SALDO_ASSOCIATI_EMISOR foreign key (Codigo_Emisor)
      references Emisor (Codigo)
      on delete restrict on update restrict;

alter table Secuencial_Comprobante
   add constraint FK_SECUENCI_ASSOCIATI_ESTABLEC foreign key (codigo_Establecimiento)
      references Establecimiento (codigo)
      on delete restrict on update restrict;

alter table Secuencial_Comprobante
   add constraint FK_SECUENCI_ASSOCIATI_TIPO_COM foreign key (codigo_Tipo_Comprobante)
      references Tipo_Comprobante (Codigo)
      on delete restrict on update restrict;

alter table Transaccion
   add constraint FK_TRANSACC_ASSOCIATI_EMISOR foreign key (Codigo_Emisor)
      references Emisor (Codigo)
      on delete restrict on update restrict;

alter table Transportista
   add constraint FK_TRANSPOR_ASSOCIATI_COMPROBA foreign key (codigo_Comprobante)
      references Comprobante (codigo)
      on delete restrict on update restrict;

alter table Usuario
   add constraint FK_USUARIO_ASSOCIATI_ESTADO foreign key (codigo_Estado)
      references Estado (codigo_Estado)
      on delete restrict on update restrict;

alter table comprobante_modifica
   add constraint FK_COMPROBA_REFERENCE_COMPROBA foreign key (codigo_Comprobante)
      references Comprobante (codigo)
      on delete restrict on update restrict;

alter table usuario_Emisor
   add constraint FK_USUARIO__USUARIO_E_EMISOR foreign key (Codigo_Emisor)
      references Emisor (Codigo)
      on delete restrict on update restrict;

alter table usuario_Emisor
   add constraint FK_USUARIO__USUARIO_E_USUARIO foreign key (codigo_Usuario)
      references Usuario (codigo)
      on delete restrict on update restrict;

