<?php
if ($_SESSION["pm"] == "0") {
    $pm = "disabled=\"true\"";
}
if ($_SESSION["pc"] == "0") {
    $pc = "disabled=\"true\"";
}
if ($_SESSION["pg"] == "0") {
    $pg = "disabled=\"true\"";
}
if ($_SESSION["pa"] == "0") {
    $pa = "disabled=\"true\"";
}
if ($_SESSION["pe"] == "0") {
    $pe = "disabled=\"true\"";
}




?>

<form name="form" id="form" action="" method="get" accept-charset="utf-8">
    <p align="center">
    <center><div id="dvMensaje"></div></center>
    <table border="0" width="90%">
        <tr align="center">
            <td colspan="2">
                <fieldset title="Cliente">
                    <legend align= "center">
                        Datos del Cliente
                    </legend>
                    <table border="0" class="campo" >
                        <tr>
                            <td class="campo">Tipo Documento:</td>
                            <td>*</td>
                            <td> <?php echo $cmbTipo ?> </td>
                            <td class="campo">Documento:</td>
                            <td>*</td>
                            <td>
                                <input type="text" name="txtDocumento" id="txtDocumento" />
                                <input type="button" name="btnBuscar" id="btnBuscar" value="&rarr;" onclick=""/>
                            </td>
                        </tr>
                        <tr>
                            <td class="campo">Cliente:</td>
                            <td>*</td>
                            <td>
                                <input type="text" name="txtCliente" id="txtCliente"  size="32" />
                            </td>
                            <td class="campo">Telefono:</td>
                            <td>*</td>
                            <td>
                                <input type="text" name="txtTelefono" id="txtTelefono" />
                            </td>
                        </tr>
                        <tr>

                            <td class="campo">Email:</td>
                            <td>*</td>
                            <td>
                                <input type="text" name="txtEmail" id="txtEmail" size="32" />
                            </td>
                            <td class="campo">Direccion:</td>
                            <td>*</td>
                            <td colspan="4">							<textarea name="txtDireccion" id="txtDireccion" cols="30" rows="2"> </textarea></td>
                        </tr>
                    </table>
                </fieldset></td>
        </tr>
        <tr align="center">
            <td colspan="2">
                <fieldset title="Detalle">
                    <legend align= "center">
                        Detalle de Productos
                    </legend>
                    <label>Producto :
                        <input type="text" name="txtProducto" id="txtProducto" />
                        <input type="button" name="btnBuscarPro" id="btnBuscarPro" value="&rarr;" onclick=""/>
                    </label>
                    <table class="" width="1000px" border="0" id="tb_detalle">
                        <input type="hidden" name="txtIndice" id="txtIndice" value="1" />
                        <tr id="tr_1" class="">
                            <th id="td_0_1" width="120px" class=""> Principal</th>
                            <th id="td_0_2" width="120px" class=""> Cod Auxiliar </th>
                            <th id="td_0_3" width="100px" class=""> Cantidad </th>
                            <th id="td_0_4" width="230px" class=""> Descripcion </th>
                            <th id="td_0_6" width="120px" class=""> P. Unitario </th>
                            <th id="td_0_7" width="100px" class=""> Descuento </th>
                            <th id="td_0_9" width="40px" class=""> IVA </th>
                            <th id="td_0_10" width="70px" class=""> ICE </th>

                            <th id="td_0_8" width="120px" class=""> Precio Total </th>
                            <th align='center'  id="td_0_9" width="25px" onclick="xajax_addrow(document.getElementById('txtIndice').value)">
                                <img src="imagenes/add.png" />
                            </th>
                            <th align='center'  id="td_0_10"  width="25px" >
                                <img src="imagenes/cross.png" />
                            </th>
                        </tr>
                        <tr id="tr_2">
                        </tr>

                    </table>
                </fieldset></td>
        </tr>
        <tr align="right">

            <td colspan="2">
                <fieldset title="Valor Factura" align="right">
                    <legend align= "center">
                        Valor de Factura
                    </legend>
                    <table border="0" class="campo" >
                        <tr>
                            <td class="campo">Subtotal 12%:</td>
                            <td>
                                <input type="text" name="txtSubtotal12" value="" id="txtSubtotal12" onchange="xajax_calcularTotal(xajax.getFormValues('form'))"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="campo">Subtotal 0%:</td>
                            <td>
                                <input type="text" name="txtSubtotal0" value="" id="txtSubtotal0"  onchange="xajax_calcularTotal(xajax.getFormValues('form'))" />
                            </td>
                        </tr>
                        <tr>
                            <td class="campo">Subtotal sin impuestos:</td>
                            <td>
                                <input type="text" name="txtSubtotalsinimp" value="" id="txtSubtotalsinimp"   onchange="xajax_calcularTotal(xajax.getFormValues('form'))"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="campo">Descuento:</td>
                            <td>
                                <input type="text" name="txtDescuento" value="" id="txtDescuento"  onchange="xajax_calcularTotal(xajax.getFormValues('form'))" />
                            </td>
                        </tr>
                        <tr>
                            <td class="campo">ICE:</td>
                            <td>
                                <input type="text" name="txtIce" value="" id="txtIce"  onchange="xajax_calcularTotal(xajax.getFormValues('form'))" />
                            </td>
                        </tr>
                        <tr>
                            <td class="campo">IVA 12%:</td>
                            <td>
                                <input type="text" name="txtIva" value="" id="txtIva"  onchange="xajax_calcularTotal(xajax.getFormValues('form'))" />
                            </td>
                        </tr>
                        <tr>
                            <td class="campo">Propina:</td>
                            <td>
                                <input type="text" name="txtPropina" value="" id="txtPropina"   onchange="xajax_calcularTotal(xajax.getFormValues('form'))"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="campo">Valor Total:</td>
                            <td>
                                <input type="text" name="txtValorTotal" value="" id="txtValorTotal"    />
                            </td>
                        </tr>
                    </table>
                </fieldset></td>

        </tr>
        <tr>
            <td colspan="2">
                <fieldset title="Valor Factura" align="right">
                    <legend align= "center"></legend>
                    <table width="100%">
                        <tr align="center">
                            <td>
                                <input type="button" name="btnGuardar" id="btnGuardar" value="Guardar" />
                            </td>

                            <td>
                                <input type="button" name="btnGuardar" id="btnGuardar" value="Guardar & Firmar" />
                            </td>

                            <td>
                                <input type="button" name="btnGuardar" id="btnGuardar" value="Cancelar" />
                            </td>
                        </tr>
                    </table>
                </fieldset></td>
        </tr>
    </table>
</p>
</form>
<div id="dvrespuesta"></div>
<script >
    function mask_decimal4(id) {
        oNumberMask = new Mask("####.0000", "number");
        oNumberMask.attach(id);
    }
    function mask_decimal2(id) {
        oNumberMask = new Mask("######.00", "number");
        oNumberMask.attach(id);
    }

    function mask_comprobante(id) {
        oNumberMask = new Mask("###-###-#########", "number");
        oNumberMask.attach(id);
    }
    function mask_string(id) {
        oNumberMask = new Mask("################################################################");
        oNumberMask.attach(id);
    }

</script>