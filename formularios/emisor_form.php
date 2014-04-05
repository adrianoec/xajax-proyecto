<?php
if($_SESSION["pm"]=="0"){
    $pm ="disabled=\"true\"";
}
if($_SESSION["pc"]=="0"){
    $pc ="disabled=\"true\"";
}
if($_SESSION["pg"]=="0"){
    $pg ="disabled=\"true\"";
}
if($_SESSION["pa"]=="0"){
    $pa ="disabled=\"true\"";
}
if($_SESSION["pe"]=="0"){
    $pe ="disabled=\"true\"";
}
?>
<table><tr><td onclick='muestra_oculta(dvFormulario)'>Formulario</td></tr></table>
<div id='dvFormulario' >
    <form name='form' id='form' action=''>
        <table border='0' align='center'>
            <tr> 
                <td> 
                    TIPO AMBIENTE 
                </td> 
                <td><div id='dvReqCODIGO_TIPO_AMBIENTE'><font color='red'>*</font></div></td> 
                <td> 
                    <select name='codigo_tipo_ambiente' id='codigo_tipo_ambiente' onchange=''><option value=''>Seleccione...</option></select> 
                </td>

                <td> 
                    PROVEEDOR CERTIFICADO 
                </td> 
                <td><div id='dvReqCODIGO_PROVEEDOR_CERTIFICADO'><font color='red'>*</font></div></td> 
                <td> 
                    <select name='codigo_proveedor_certificado' id='codigo_proveedor_certificado' onchange=''><option value=''>Seleccione...</option></select> 
                </td>
            </tr>
            <tr> 
                <td> 
                    RAZON SOCIAL 
                </td> 
                <td><div id='dvReqRAZON_SOCIAL'><font color='red'>*</font></div></td> 
                <td> 
                    <input type='text' name='razon_social' id='razon_social' value='' onfocus='' size='64'> 
                </td>
                <td> 
                    RUC 
                </td> 
                <td><div id='dvReqRUC'><font color='red'>*</font></div></td> 
                <td> 
                    <input type='text' name='ruc' id='ruc' value='' onfocus='' size='32'> 
                </td>
            </tr>
            <tr> 
                <td> 
                    NOMBRE COMERCIAL 
                </td> 
                <td><div id='dvReqNOMBRE_COMERCIAL'><font color='red'>*</font></div></td> 
                <td> 
                    <input type='text' name='nombre_comercial' id='nombre_comercial' value='' onfocus='' size='64'> 
                </td>

                <td> 
                    NUMERO RESOLUCION 
                </td> 
                <td><div id='dvReqNUMERO_RESOLUCION'><font color='red'>*</font></div></td> 
                <td> 
                    <input type='text' name='numero_resolucion' id='numero_resolucion' value='' onfocus='' size='64'> 
                </td>
            </tr>
            <tr> 
                <td> 
                    CONTRIBUYENTE ESPECIAL 
                </td> 
                <td><div id='dvReqES_CONTRIBUYENTE_ESPECIAL'><font color='red'>*</font></div></td> 
                <td> 
                    <select name='es_contribuyente_especial' id='es_contribuyente_especial' onchange=''><option value=''>Seleccione...</option></select> 
                </td>

                <td> 
                    LLEVA CONTABILIDAD 
                </td> 
                <td><div id='dvReqLLEVA_CONTABILIDAD'><font color='red'>*</font></div></td> 
                <td> 
                    <select name='lleva_contabilidad' id='lleva_contabilidad' onchange=''><option value=''>Seleccione...</option></select> 
                </td>
            </tr>
            <tr> 
                <td> 
                    LOGO IMAGEN 
                </td> 
                <td><div id='dvReqLOGO_IMAGEN'><font color='red'>*</font></div></td> 
                <td> 
                    <input type='text' name='logo_imagen' id='logo_imagen' value='' onfocus='' size='64'> 
                </td>

                <td> 
                    TIEMPO ESPERA 
                </td> 
                <td><div id='dvReqTIEMPO_ESPERA'><font color='red'>*</font></div></td> 
                <td> 
                    <input type='text' name='tiempo_espera' id='tiempo_espera' value='' onfocus='' size='16'> 
                </td>
            </tr>
            <tr> 
                <td> 
                    CLAVE INTERNA 
                </td> 
                <td><div id='dvReqCLAVE_INTERNA'><font color='red'>*</font></div></td> 
                <td> 
                    <input type='text' name='clave_interna' id='clave_interna' value='' onfocus='' size='32'> 
                </td>

                <td> 
                    DIRECCION MATRIZ 
                </td> 
                <td><div id='dvReqDIRECCION_MATRIZ'><font color='red'>*</font></div></td> 
                <td> 
                    <textarea name='direccion_matriz' id='direccion_matriz' onchange='' cols='32'></textarea> 
                </td>
            </tr>
            <tr> 
                <td> 
                    CLAVE FIRMA 
                </td> 
                <td><div id='dvReqCLAVE_FIRMA'><font color='red'>*</font></div></td> 
                <td> 
                    <input type='text' name='clave_firma' id='clave_firma' value='' onfocus='' size='32'> 
                </td>

                <td> 
                    CORREO ELECTRONICO 
                </td> 
                <td><div id='dvReqCORREO_ELECTRONICO'><font color='red'>*</font></div></td> 
                <td> 
                    <input type='text' name='correo_electronico' id='correo_electronico' value='' onfocus='' size='64'> 
                </td>
            </tr>
            <tr> 
                <td> 
                    CORREO ALTERNATIVO 
                </td> 
                <td><div id='dvReqCORREO_ALTERNATIVO'><font color='red'>*</font></div></td> 
                <td> 
                    <input type='text' name='correo_alternativo' id='correo_alternativo' value='' onfocus='' size='64'> 
                </td>

                <td> 
                    DIRECTORIOS 
                </td> 
                <td><div id='dvReqDIRECTORIOS'><font color='red'>*</font></div></td> 
                <td> 
                    <input type='text' name='directorios' id='directorios' value='' onfocus='' size='64'> 
                </td>
            </tr>
            <tr> 
                <td> 
                    NOMBRE CERTIFICADO 
                </td> 
                <td><div id='dvReqNOMBRE_CERTIFICADO'><font color='red'>*</font></div></td> 
                <td> 
                    <input type='text' name='nombre_certificado' id='nombre_certificado' value='' onfocus='' size='64'> 
                </td>

                <td> 
                    URL PRODUCCION 
                </td> 
                <td><div id='dvReqURL_PRODUCCION'><font color='red'>*</font></div></td> 
                <td> 
                    <input type='text' name='url_produccion' id='url_produccion' value='' onfocus='' size='64'> 
                </td>
            </tr>
            <tr> 

                <td> 
                    URL PRUEBAS 
                </td> 
                <td><div id='dvReqURL_PRUEBAS'><font color='red'>*</font></div></td> 
                <td> 
                    <input type='text' name='url_pruebas' id='url_pruebas' value='' onfocus='' size='64'> 
                </td>
            </tr>
            <tr> 
                <td colspan='5' align='center'>

                    <table align='center'> 
                        <tr>

                            <td> 
                                <input type="button" name="btnGuardar" id="btnGuardar" value="Guardar" onclick="xajax_validarForm(xajax.getFormValues('form'), 0)"  <?php echo $pg ?> > 
                            </td>

                            <td> 
                                <input type="button" name="btnActualizar" id="btnActualizar" value="Actualizar" onclick="xajax_validarForm(xajax.getFormValues('form'), 1)"   <?php echo $pa ?>  > 
                            </td>

                            <td> 
                                <input type="button" name="btnEliminar" id="btnEliminar" value="Eliminar" onclick="xajax_confirmarEliminarForm(xajax.getFormValues('form'))"   <?php echo $pe ?> > 
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
</div> <table>
    <tr>
        <td onclick='muestra_oculta(dvConsulta)' >Consulta</td>
    </tr>
</table>
<div id='dvConsulta' >

    <form id='formQuery'><table><tr><td>Consultar:</td><td><input type='text' id='txtConsulta' name='txtConsulta' value='' /></td><td><input type="button" name="btnConsultar" id="btnConsultar" value="Consultar" onclick="xajax_consultar(xajax.getFormValues('formQuery'))"  <?php echo $pc ?> ></td></tr></table></form> 
    <center> 
        <div id='dvRespuesta'> </div> 
        <div id='dvPaginacion'></div> 
    </center> 
</div> 
