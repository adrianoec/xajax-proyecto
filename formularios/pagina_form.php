<table>
	<tr>
		<td onclick='muestra_oculta(dvFormulario)'>Formulario</td>
	</tr>
</table>
<div id='dvFormulario' >
	<form name='form' id='form' action=''>
		<table border='0' align='center'>
			<tr>
				<td> DESCRIPCION </td>
				<td><div id='dvReqDESCRIPCION'></div></td>
				<td>				<textarea name='descripcion' id='descripcion' onchange='' cols='30'></textarea></td>
			</tr>
			<tr>
				<td>  PAGINA PHP </td>
				<td>
				<div id='dvReqPAGINA'>
					<font color='red'>*</font>
				</div></td>
				<td>
				<input type='text' name='pagina' id='pagina' value='' onfocus='' size='40'>
				</td>
			</tr>
			
			<tr>
				<td> NOMBRE EN MENU </td>
				<td>
				<div id='dvReqMENU'>
					<font color='red'>*</font>
				</div></td>
				<td><input type='text' name='menu' id='menu' value='' onfocus='' size='40'></td>
			</tr>
			
			<tr>
				<td> ARBOL </td>
				<td>
				<div id='dvReqPADRE'>
					<font color='red'>*</font>
				</div></td>
				<td>
				<select name='padre' id='padre' onchange=''>
					<option value=''>Seleccione...</option>
					<option value='0'>Nuevo Arbol</option>
					<?php
					echo mostrarPadres();
					?>

				</select></td>
			</tr>
			<tr>

				<td> ES PADRE </td>
				<td>
				<div id='dvReqACTIVO'>
					<font color='red'>*</font>
				</div></td>
				<td>
				<select name='es_padre' id='es_padre' onchange=''>
					<option value=''>Seleccione...</option>
					<option value='1'>Si</option>
					<option value='0'>No</option>
				</select></td>
			</tr>
			<tr>
				<td colspan='5' align='center'>
				<table align='center'>
					<tr>

						<td>
						<input type="button" name="btnGuardar" id="btnGuardar" value="Guardar" onclick="xajax_validarForm(xajax.getFormValues('form'), 0)" >
						</td>

						<td>
						<input type="button" name="btnActualizar" id="btnActualizar" value="Actualizar" onclick="xajax_validarForm(xajax.getFormValues('form'), 1)" >
						</td>

						<td>
						<input type="button" name="btnEliminar" id="btnEliminar" value="Eliminar" onclick="xajax_confirmarEliminarForm(xajax.getFormValues('form'))" >
						</td>

						<td>
						<input type="button" name="btnCancelar" id="btnCancelar" value="Cancelar" onclick="xajax_limpiar(xajax.getFormValues('form'))" >
						</td>

					</tr>
				</table></td>

			</tr>
		</table>
	</form>
</div>
<table>
	<tr>
		<td onclick='muestra_oculta(dvConsulta)' >Consulta</td>
	</tr>
</table>
<div id='dvConsulta' >

	<form id='formQuery'>
		<table>
			<tr>
				<td>Consultar:</td><td>
				<input type='text' id='txtConsulta' name='txtConsulta' value='' />
				</td><td>
				<input type="button" name="btnConsultar" id="btnConsultar" value="Consultar" onclick="xajax_consultar(xajax.getFormValues('formQuery'))" >
				</td>
			</tr>
		</table>
	</form>
	<center>
		<div id='dvRespuesta'></div>
		<div id='dvPaginacion'></div>
	</center>
</div>
