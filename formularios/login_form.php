<div id='dvFormulario' >
	<form name='form' id='form' action='' >

		<table border='0' align='center' height="100%">
			<tr>
				<td valign="middle" >
				<fieldset>
					<legend>
						Acceso al Sistema
					</legend>
					<table border='0' align='center' >
						<tr>
							<th align="left"> Usuario  </th>
							<td>
							<div id='dvUsuario'>
								<font color='red'>*</font> 
							</div>
							</td>
							<td>
							<input type='text' name='usuario' id='usuario' value='1' onfocus='' size='25'>
							
							</td>
						</tr>
						<tr>
							<th align="left"> Clave </th>
							<td>
							<div id='dvClave'>
								<font color='red'>*</font> 
							</div></td>
							<td>
							<input type='password' name='clave' id='clave' value='2' onfocus='' size='25'>
						
							</td>
						</tr>

						<tr>
							<td colspan='3' align='center'>
							<input type="button" name="btnGuardar" id="btnGuardar" value="Ingresar" onclick="xajax_validarForm(xajax.getFormValues('form'),0)" >
							</td>

						</tr>
					</table>
				</fieldset></td>
			</tr>
		</table>
	</form>
	<center>
		<div id='dvRespuesta'></div>
		<div id='dvPaginacion'></div>
	</center>
</div>
