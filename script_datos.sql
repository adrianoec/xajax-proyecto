create table permiso (
   codigo               serial,
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


create table pagina (
   codigo               serial,
   descripcion          varchar(128)         null,
   pagina               varchar(128)         null,
   activo               int4                 null default 1,
   menu                 varchar(32)          null,
   padre                int4                 null,
   codigo_padre         int4                 null,
   orden                int4                 null,
   constraint pagina_pkey primary key (codigo)
);

create table pagina_perfil (
   codigo_pagina        int4                 null,
   codigo_perfil        int4                 null,
   fecha                timestamp            null default now(),
   usuario              int4                 null
);

create table perfil (
   codigo                   	serial,
   descripcion          	varchar(64)          null,
   activo               	int4                 null default 1,
   constraint perfil_pkey primary key (codigo)
);




create table producto(
codigo serial primary key,
descripcion character varying(128),
codigo_principal  character varying(32),
codigo_auxiliar   character varying(32),
precio_unitario numeric,
descripcion_adicional  character varying(128),
aplica_iva character varying(1), 
aplica_ice  character varying(1),
activo  integer
);

create table producto_impuesto(
codigo_producto integer,
codigo_impuesto integer
);



insert into perfil(descripcion)values('Administrador');

insert into tipo_comprobante (descripcion,codigo_sri) values ('FACTURA','01');
insert into tipo_comprobante (descripcion,codigo_sri) values ('NOTA DE CREDITO','04');
insert into tipo_comprobante (descripcion,codigo_sri) values ('NOTA DE DEBITO','05');
insert into tipo_comprobante (descripcion,codigo_sri) values ('GUIA DE REMISION','06');
insert into tipo_comprobante (descripcion,codigo_sri) values ('COMPROBANTE RETENCION','07');
insert into tipo_comprobante (descripcion,codigo_sri) values ('LOTE','00');

insert into tipo_comprador (descripcion,codigo_sri) values('RUC','04');
insert into tipo_comprador (descripcion,codigo_sri) values('CEDULA','05');
insert into tipo_comprador (descripcion,codigo_sri) values('PASAPORTE','06');
insert into tipo_comprador (descripcion,codigo_sri) values('CONSUMIDOR FINAL','07');


insert into tipo_emision (codigo_sri, descripcion) values ('1', 'Normal');
insert into tipo_emision (codigo_sri, descripcion) values ('2', 'Indisponibilidad del Sistema');

insert into tipo_ambiente (codigo_sri, descripcion) values ('1', 'Pruebas');
insert into tipo_ambiente (codigo_sri, descripcion) values ('2', 'Producción');

insert into tipo_impuesto (codigo_sri, descripcion) values ('1', 'RENTA');
insert into tipo_impuesto (codigo_sri, descripcion) values ('2', 'IVA');
insert into tipo_impuesto (codigo_sri, descripcion) values ('3', 'ICE');
insert into tipo_impuesto (codigo_sri, descripcion) values ('6', 'ISD');

insert into impuesto(codigo_tipo_impuesto,porcentaje, codigo_sri, descripcion) values(2, 0, '0', 'Tarifa del IVA del 0%');
insert into impuesto(codigo_tipo_impuesto,porcentaje, codigo_sri, descripcion) values(2, 12, '2', 'Tarifa del IVA del 12%');
insert into impuesto(codigo_tipo_impuesto,porcentaje, codigo_sri, descripcion) values(2, 0, '6', 'Tarifa del IVA No objeto de Impuesto');

insert into impuesto(codigo_sri, codigo_tipo_impuesto,porcentaje, descripcion) values ('3023', 3, 150, 'Productos del tabaco y sucedáneos del tabaco (abarcan los productos preparados totalmente o en parte utilizando como materia prima hojas de tabaco y destinados a ser fumados, chupados, inhalados, mascados o utilizados como rapé)');
insert into impuesto(codigo_sri, codigo_tipo_impuesto,porcentaje, descripcion) values ('3051', 3, 10, 'Bebidas gaseosas');
insert into impuesto(codigo_sri, codigo_tipo_impuesto,porcentaje, descripcion) values ('3610', 3, 20, 'Perfumes y aguas de tocador');
insert into impuesto(codigo_sri, codigo_tipo_impuesto,porcentaje, descripcion) values ('3620', 3, 35, 'Videojuegos');
insert into impuesto(codigo_sri, codigo_tipo_impuesto,porcentaje, descripcion) values ('3630', 3, 300, 'Armas de fuego, armas deportivas y municiones excepto aquellas adquiridas por la fuerza pública');
insert into impuesto(codigo_sri, codigo_tipo_impuesto,porcentaje, descripcion) values ('3640', 3, 100, 'Focos incandescentes excepto aquellos utilizados como insumos automotrices');
insert into impuesto(codigo_sri, codigo_tipo_impuesto,porcentaje, descripcion) values ('3073', 3, 5, 'Vehículos motor cuyo precio de venta al público sea de hasta USD 20.000');
insert into impuesto(codigo_sri, codigo_tipo_impuesto,porcentaje, descripcion) values ('3072', 3, 5, 'Camionetas, furgonetas, camiones, y vehículos de rescate PVP sea de hasta USD 30.000');
insert into impuesto(codigo_sri, codigo_tipo_impuesto,porcentaje, descripcion) values ('3074', 3, 10, 'Vehículos motor excepto camionetas, furgonetas, camiones y vehículos de rescate, PVP mayor a  USD 20.000 y de hasta USD 30.000');
insert into impuesto(codigo_sri, codigo_tipo_impuesto,porcentaje, descripcion) values ('3075', 3, 15, 'Vehículos motor PVP mayor a USD 30.000 y de hasta USD 40.000');
insert into impuesto(codigo_sri, codigo_tipo_impuesto,porcentaje, descripcion) values ('3077', 3, 20, 'Vehículos motor PVP mayor a USD 40.000 y de hasta USD 50.000');
insert into impuesto(codigo_sri, codigo_tipo_impuesto,porcentaje, descripcion) values ('3078', 3, 25, 'Vehículos motor PVP mayor a USD 50.000 y de hasta USD 60.000');
insert into impuesto(codigo_sri, codigo_tipo_impuesto,porcentaje, descripcion) values ('3079', 3, 30, 'Vehículos motor PVP mayor a USD 60.000 y de hasta USD 70.000');
insert into impuesto(codigo_sri, codigo_tipo_impuesto,porcentaje, descripcion) values ('3080', 3, 35, 'Vehículos motor PVP mayor a USD 70.000');
insert into impuesto(codigo_sri, codigo_tipo_impuesto,porcentaje, descripcion) values ('3171', 3, 0, 'Vehículos híbridos/eléctricos PVP sea de hasta USD 35.000');
insert into impuesto(codigo_sri, codigo_tipo_impuesto,porcentaje, descripcion) values ('3172', 3, 8, 'Vehículos híbridos/eléctricos PVP mayor a USD 35.000 y de hasta USD 40.000');
insert into impuesto(codigo_sri, codigo_tipo_impuesto,porcentaje, descripcion) values ('3173', 3, 14, 'Vehículos híbridos/eléctricos PVP mayor a USD 40.000 y de hasta USD 50.000');
insert into impuesto(codigo_sri, codigo_tipo_impuesto,porcentaje, descripcion) values ('3174', 3, 20, 'Vehículos híbridos/eléctricos PVP mayor a USD 50.000 y de hasta USD 60.000');
insert into impuesto(codigo_sri, codigo_tipo_impuesto,porcentaje, descripcion) values ('3175', 3, 26, 'Vehículos híbridos/eléctricos PVP mayor a USD 60.000 y de hasta USD 70.000');
insert into impuesto(codigo_sri, codigo_tipo_impuesto,porcentaje, descripcion) values ('3176', 3, 32, 'Vehículos híbridos/eléctricos PVP mayor a USD 70.000');
insert into impuesto(codigo_sri, codigo_tipo_impuesto,porcentaje, descripcion) values ('3081', 3, 15, 'Aviones, avionetas y helicópteros excepto aquellas destinadas al transporte comercial de pasajeros, carga y servicios; motos acuáticas, tricares, cuadrones, yates y barcos de recreo:');
insert into impuesto(codigo_sri, codigo_tipo_impuesto,porcentaje, descripcion) values ('3092', 3, 15, 'Servicios de televisión pagada');
insert into impuesto(codigo_sri, codigo_tipo_impuesto,porcentaje, descripcion) values ('3650', 3, 35, 'Servicios de casinos, salas de juego (bingo - mecánicos) y otros juegos de azar');
insert into impuesto(codigo_sri, codigo_tipo_impuesto,porcentaje, descripcion) values ('3660', 3, 35, 'Las cuotas, membresías, afiliaciones, acciones y similares que cobren a sus miembros y usuarios los Clubes Sociales, para prestar sus servicios, cuyo monto en su conjunto supere los US $ 1.500 anuales');
insert into impuesto(codigo_sri, codigo_tipo_impuesto,porcentaje, descripcion) values ('3011', 3, 0, 'Cigarrillos rubio');
insert into impuesto(codigo_sri, codigo_tipo_impuesto,porcentaje, descripcion) values ('3021', 3, 0, 'Cigarrillos negros');
insert into impuesto(codigo_sri, codigo_tipo_impuesto,porcentaje, descripcion) values ('3031', 3, 75, 'Bebidas alcohólicas, distintas a cerveza');
insert into impuesto(codigo_sri, codigo_tipo_impuesto,porcentaje, descripcion) values ('3041', 3, 75, 'Cerveza');


-- productos
insert into producto(descripcion, codigo_principal, codigo_auxiliar, precio_unitario, descripcion_adicional, aplica_iva, aplica_ice, activo)
values('Cuaderno','11','CU0001',2.67,'','S','S',1);

insert into producto(descripcion, codigo_principal, codigo_auxiliar, precio_unitario, descripcion_adicional, aplica_iva, aplica_ice, activo)
values('Lapiz HB','22','CU0002',0.67,'','N','S',1);

insert into producto(descripcion, codigo_principal, codigo_auxiliar, precio_unitario, descripcion_adicional, aplica_iva, aplica_ice, activo)
values('Esfero Azul','33','CU0003',0.97,'','N','N',1);

insert into producto_impuesto(  codigo_producto ,  codigo_impuesto ) values(1,2);
insert into producto_impuesto(  codigo_producto ,  codigo_impuesto ) values(1,7);

insert into producto_impuesto(  codigo_producto ,  codigo_impuesto ) values(2,1);
insert into producto_impuesto(  codigo_producto ,  codigo_impuesto ) values(2,5);

insert into producto_impuesto(  codigo_producto ,  codigo_impuesto ) values(3,1);



insert into pagina (descripcion,pagina,activo, menu, codigo_padre, padre, orden) values('Administracion','Administracion','1','Administracion',0,1,1); 
insert into pagina (descripcion,pagina,activo, menu, codigo_padre, padre, orden) values('Salir','salir.php','1','Salir',1,0,5);
insert into pagina (descripcion,pagina,activo, menu, codigo_padre, padre, orden) values('Gestion Permisos','Gestion Permisos','1','Gestion Permisos',1,1,4);
insert into pagina (descripcion,pagina,activo, menu, codigo_padre, padre, orden) values('Paginas','pagina.php','1','Paginas',3,0,0); 
insert into pagina (descripcion,pagina,activo, menu, codigo_padre, padre, orden) values('Asignacion de paginas a perfil','paginaperfil.php','1','Asignar Paginas al Perfil',3,0,1); 
insert into pagina (descripcion,pagina,activo, menu, codigo_padre, padre, orden) values('Permisos','permiso.php','1','Permisos',3,0,2); 
insert into pagina (descripcion,pagina,activo, menu, codigo_padre, padre, orden) values('Configuracion','Configuracion','1','Configuracion',1,1,3); 
insert into pagina (descripcion,pagina,activo, menu, codigo_padre, padre, orden) values('Catalogos','Catalogos','1','Catalogos',7,1,7); 
insert into pagina (descripcion,pagina,activo, menu, codigo_padre, padre, orden) values('Tipos de Impuesto','tipoimpuesto.php','1','Tipo de Impuesto',8,0,8); 
  insert into pagina (descripcion,pagina,activo, menu, codigo_padre, padre, orden) values('Tipo de comprobantes','tipocomprobante.php','1','Tipo de Comprobantes',8,0,9); 
 insert into pagina (descripcion,pagina,activo, menu, codigo_padre, padre, orden) values('Comprobantes','Comprobantes','1','Comprobantes',0,1,10);
insert into pagina (descripcion,pagina,activo, menu, codigo_padre, padre, orden) values('Facturas','factura.php','1','Facturas',11,0,11); 
insert into pagina (descripcion,pagina,activo, menu, codigo_padre, padre, orden) values('Registro de tipos  de compradores','tipocomprador.php','1','Tipo Comprador',8,0,6); 


insert into pagina_perfil(codigo_pagina, codigo_perfil)values(1,1);
insert into permiso(codigo_pagina, codigo_perfil)values(1,1);


insert into pagina_perfil(codigo_pagina, codigo_perfil)values(2,1);  
insert into permiso(codigo_pagina, codigo_perfil)values(2,1); 

insert into pagina_perfil(codigo_pagina, codigo_perfil)values(3,1);  
insert into permiso(codigo_pagina, codigo_perfil)values(3,1);

insert into pagina_perfil(codigo_pagina, codigo_perfil)values(4,1); 
insert into permiso(codigo_pagina, codigo_perfil)values(4,1);

insert into pagina_perfil(codigo_pagina, codigo_perfil)values(5,1);  
insert into permiso(codigo_pagina, codigo_perfil)values(5,1); 

insert into pagina_perfil(codigo_pagina, codigo_perfil)values(6,1);  
insert into permiso(codigo_pagina, codigo_perfil)values(6,1);

insert into pagina_perfil(codigo_pagina, codigo_perfil)values(7,1);  
insert into permiso(codigo_pagina, codigo_perfil)values(7,1);

insert into pagina_perfil(codigo_pagina, codigo_perfil)values(8,1);  
insert into permiso(codigo_pagina, codigo_perfil)values(8,1); 

insert into pagina_perfil(codigo_pagina, codigo_perfil)values(9,1);  
insert into permiso(codigo_pagina, codigo_perfil)values(9,1); 

insert into pagina_perfil(codigo_pagina, codigo_perfil)values(10,1);  
insert into permiso(codigo_pagina, codigo_perfil)values(10,1);

insert into pagina_perfil(codigo_pagina, codigo_perfil)values(11,1);  
insert into permiso(codigo_pagina, codigo_perfil)values(11,1);

insert into pagina_perfil(codigo_pagina, codigo_perfil)values(12,1);  
 insert into permiso(codigo_pagina, codigo_perfil)values(12,1);

insert into pagina_perfil(codigo_pagina, codigo_perfil)values(13,1); 
insert into permiso(codigo_pagina, codigo_perfil)values(13,1); 

update permiso set acceso_menu = '1' where codigo= '1';
update permiso set acceso_menu = '1' where codigo= '2';
update permiso set acceso_menu = '1' where codigo= '3';
update permiso set acceso_menu = '1' where codigo= '4';
update permiso set acceso_menu = '1' where codigo= '5';
update permiso set acceso_menu = '1' where codigo= '6';
update permiso set acceso_menu = '1' where codigo= '7';
update permiso set acceso_menu = '1' where codigo= '8';
update permiso set acceso_menu = '1' where codigo= '9';
update permiso set acceso_menu = '1' where codigo= '10';
update permiso set acceso_menu = '1' where codigo= '11';
update permiso set acceso_menu = '1' where codigo= '12';
update permiso set acceso_consulta = '1' where codigo= '1';
update permiso set acceso_consulta = '1' where codigo= '2';
update permiso set acceso_consulta = '1' where codigo= '3';
update permiso set acceso_consulta = '1' where codigo= '4';
update permiso set acceso_consulta = '1' where codigo= '5';
update permiso set acceso_consulta = '1' where codigo= '6';
update permiso set acceso_consulta = '1' where codigo= '7';
update permiso set acceso_consulta = '1' where codigo= '8';
update permiso set acceso_consulta = '1' where codigo= '9';
update permiso set acceso_consulta = '1' where codigo= '10';
update permiso set acceso_consulta = '1' where codigo= '11';
update permiso set acceso_consulta = '1' where codigo= '12';

update permiso set acceso_guardar = '1' where codigo= '6';
update permiso set acceso_actualizar = '1' where codigo= '6';
update permiso set acceso_eliminar = '1' where codigo= '6';