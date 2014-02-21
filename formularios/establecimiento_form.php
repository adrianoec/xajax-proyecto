<table><tr><td onclick='muestra_oculta(dvFormulario)'>Formulario</td></tr></table>
<div id='dvFormulario' >
<form name='form' id='form' action=''>
<table border='0' align='center'>
	<tr> 
		 <td> 
			 CODIGO ESTABLECIMIENTO 
		 </td> 
		 <td><div id='dvReqCODIGO_ESTABLECIMIENTO'><font color='red'>*</font></div></td> 
		 <td> 
			 <input type='text' name='codigo_establecimiento' id='codigo_establecimiento' value='' onfocus='' size='16'> 
		 </td>
 	</tr>
	<tr> 
		 <td> 
			 CODIGO EMISOR 
		 </td> 
		 <td><div id='dvReqCODIGO_EMISOR'><font color='red'>*</font></div></td> 
		 <td> 
			 <select name='codigo_emisor' id='codigo_emisor' onchange=''><option value=''>Seleccione...</option></select> 
		 </td>
 	</tr>
	<tr> 
		 <td> 
			 NUMERO ESTABLECIMIENTO 
		 </td> 
		 <td><div id='dvReqNUMERO_ESTABLECIMIENTO'><font color='red'>*</font></div></td> 
		 <td> 
			 <input type='text' name='numero_establecimiento' id='numero_establecimiento' value='' onfocus='' size='16'> 
		 </td>
 	</tr>
	<tr> 
		 <td> 
			 DIRECCION 
		 </td> 
		 <td><div id='dvReqDIRECCION'><font color='red'>*</font></div></td> 
		 <td> 
			 <textarea name='direccion' id='direccion' onchange='' cols='32'></textarea> 
		 </td>
 	</tr>
	 <tr> 
			  	</tr>
	<tr> 
		<td colspan='3' align='center'>

            			 <table align='center'> 
			 		<tr>

            					 <td> 
							 <input type="button" name="btnGuardar" id="btnGuardar" value="Guardar" onclick="xajax_validarForm(xajax.getFormValues('form'),0)" > 
						 </td>

            					 <td> 
							 <input type="button" name="btnActualizar" id="btnActualizar" value="Actualizar" onclick="xajax_validarForm(xajax.getFormValues('form'),1)" > 
						 </td>

            					 <td> 
							 <input type="button" name="btnEliminar" id="btnEliminar" value="Eliminar" onclick="xajax_confirmarEliminarForm(xajax.getFormValues('form'))" > 
						 </td>

            					 <td> 
							 <input type="button" name="btnCancelar" id="btnCancelar" value="Cancelar" onclick="xajax_limpiar(xajax.getFormValues('form'))" > 
						 </td>

            				 </tr>  
				  </table> 
		 </td> 

            </tr> 
</table> 
 </form>  
 </div> <table><tr><td onclick='muestra_oculta(dvConsulta)' >Consulta</td></tr></table><div id='dvConsulta' >
 
 <form id='formQuery'><table><tr><td>Consultar:</td><td><input type='text' id='txtConsulta' name='txtConsulta' value='' /></td><td><input type="button" name="btnConsultar" id="btnConsultar" value="Consultar" onclick="xajax_consultar(xajax.getFormValues('formQuery'))" ></td></tr></table></form> 
<center> 
	 <div id='dvRespuesta'> </div> 
	 <div id='dvPaginacion'></div> 
 </center> 
</div> 
 