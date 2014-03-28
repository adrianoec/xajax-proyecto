<?php
/*
 create  table  permisos(
 codigo serial primary key,
 codigo_perfil integer,
 codigo_pagina integer,
 descripcion character varying(32),
 acceso_menu integer,
 acceso_consulta integer,
 acceso_guardar integer,
 acceso_actualizar integer,
 acceso_eliminar integer,
 fecha timestamp default now(),
 activo  integer default 1
 );

 create table pagina(
 codigo serial primary key,
 descripcion character varying(128),
 pagina character varying(128),
 activo integer default 1
 );
 *
 */
$perfil = perfiles("");
?>
<table width="100%" class="acordeon">
	<tr>
            <td onclick="muestra_oculta('dvFormulario sss')" style="cursor: pointer"><br/></td>
	</tr>
</table>
<div id='dvFormulario' >
	<form name='form' id='form' action=''>
		<table   align='center' class="campo">
			<tr>
				<td class="campo"> Perfil </td>
				<td class="dato">
				<div id='dvReqCODIGO_TIPO_AMBIENTE'>
					<font color='red'>*</font>
				</div></td>
				<td class="dato"><?php echo $perfil
				?></td>

				<td class="dato">
				<input type="button" name="buscar" id="buscar"value="Buscar" onclick="xajax_consultar(xajax.getFormValues('form'))" />
				</td>
			</tr>

		</table>
	</form>
</div>

<div id='dvRespuesta' >

</div>
