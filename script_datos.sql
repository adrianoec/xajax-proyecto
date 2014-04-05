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

insert into perfil(descripcion)values('Administrador');

insert into tipo_comprobante (descripcion,codigo_sri) values ('FACTURA','01');
insert into tipo_comprobante (descripcion,codigo_sri) values ('NOTA DE CREDITO','04');
insert into tipo_comprobante (descripcion,codigo_sri) values ('NOTA DE DEBITO','05');
insert into tipo_comprobante (descripcion,codigo_sri) values ('GUIA DE REMISION','06');
insert into tipo_comprobante (descripcion,codigo_sri) values ('COMPROBANTE RETENCION','07');
insert into tipo_comprobante (descripcion,codigo_sri) values ('LOTE','00');

insert into pagina (descripcion,pagina,activo, menu, codigo_padre, padre, orden) values('Administracion','Administracion','1','Administracion',0,1,1); 
insert into pagina (descripcion,pagina,activo, menu, codigo_padre, padre, orden) values('Salir','Salir','1','salir.php',1,0,5);
insert into pagina (descripcion,pagina,activo, menu, codigo_padre, padre, orden) values('Gestion Permisos','Gestion Permisos','1','Gestion Permisos',1,1,4);
insert into pagina (descripcion,pagina,activo, menu, codigo_padre, padre, orden) values('Paginas','pagina.php','1','Paginas',3,0,0); 
insert into pagina (descripcion,pagina,activo, menu, codigo_padre, padre, orden) values('Asignacion de paginas a perfil','paginaperfil.php','1','Asignar Paginas al Perfil',3,0,1); 
insert into pagina (descripcion,pagina,activo, menu, codigo_padre, padre, orden) values('Permisos','permiso.php','1','Permisos',3,0,2); 
insert into pagina (descripcion,pagina,activo, menu, codigo_padre, padre, orden) values('Configuracion','Configuracion','1','Configuracion',1,1,3); 
insert into pagina (descripcion,pagina,activo, menu, codigo_padre, padre, orden) values('Catalogos','Catalogos','1','Catalogos',7,1,7); 
insert into pagina (descripcion,pagina,activo, menu, codigo_padre, padre, orden) values('Tipos de Impuesto','tipoimpuesto.php','1','Tipo de Impuesto',8,0,8); 
  insert into pagina (descripcion,pagina,activo, menu, codigo_padre, padre, orden) values('Tipo de comprobantes','tipocomprobante.php','1','Tipo de Comprobantes',8,0,9); 


insert into pagina_perfil(codigo_pagina, codigo_perfil)values(5,1);  
insert into permiso(codigo_pagina, codigo_perfil)values(5,1); 

insert into pagina_perfil(codigo_pagina, codigo_perfil)values(1,1);
insert into permiso(codigo_pagina, codigo_perfil)values(1,1);

insert into pagina_perfil(codigo_pagina, codigo_perfil)values(4,1); 
insert into permiso(codigo_pagina, codigo_perfil)values(4,1);

insert into pagina_perfil(codigo_pagina, codigo_perfil)values(2,1);  
insert into permiso(codigo_pagina, codigo_perfil)values(2,1); 

insert into pagina_perfil(codigo_pagina, codigo_perfil)values(3,1);  
insert into permiso(codigo_pagina, codigo_perfil)values(3,1);

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


