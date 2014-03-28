
<table width="100%" class="acordeon">
    <tr>
        <td onclick="muestra_oculta('dvFormulario')" style="cursor: pointer">Formulario</td>
    </tr>
</table>
<div id='dvFormulario' >
    <form name='form' id='form' action=''>
        <table  align='center' class="campo">
            <tr> 
                <td class="campo"> 
                    CODIGO TIPO IMPUESTO 
                </td> 
                <td class="dato"><div id='dvReqCODIGO_TIPO_IMPUESTO'><font color='red'>*</font></div></td> 
                <td class="dato"> 
                    <input type='text' name='codigo_tipo_impuesto' id='codigo_tipo_impuesto' value='' onfocus='' size='4'> 
                </td>
            </tr>
            <tr> 
                <td class="campo"> 
                    DESCRIPCION 
                </td> 
                <td class="dato"><div id='dvReqDESCRIPCION'><font color='red'>*</font></div></td> 
                <td class="dato"> 
                    <input type='text' name='descripcion' id='descripcion' value='' onfocus='' size='32'> 
                </td>
            </tr>
 
            <tr> 
                <td class="campo"> 
                    CODIGO SRI 
                </td> 
                <td class="dato"><div id='dvReqCODIGO_SRI'><font color='red'>*</font></div></td> 
                <td class="dato"> 
                    <input type='text' name='codigo_sri' id='codigo_sri' value='' onfocus='' size='32'> 
                </td>
            </tr>
            <tr> 
            </tr>
            <tr> 
                <td colspan='3' align='center' class="dato">
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
                    </table> 
                </td> 
            </tr> 
        </table> 
    </form>  
</div> 

<table width="100%" class="acordeon">
    <tr>
        <td onclick="muestra_oculta('dvConsulta')" style="cursor: pointer">Consulta</td>
    </tr>
</table>

<div id='dvConsulta' >
    <form id='formQuery'>
        <table align="center" class="campo">
            <tr>
                <td class="campo" >Consultar:</td>
                <td class="dato" ><input type='text' id='txtConsulta' name='txtConsulta' value='' /></td>
                <td class="dato" ><input type="button" name="btnConsultar" id="btnConsultar" value="Consultar" onclick="xajax_consultar(xajax.getFormValues('formQuery'))" ></td>
            </tr>
        </table>
    </form> 
    <center> 
        <div id='dvRespuesta'> </div> 
        <div id='dvPaginacion'></div> 
    </center> 
</div> 
