<?php

function validarForm($form, $opcion) {
    $codigo_tipo_impuesto = strtoupper(trim($form['codigo_tipo_impuesto']));

    $descripcion = strtoupper(trim($form['descripcion']));

    $activo = strtoupper(trim($form['activo']));

    $codigo_sri = strtoupper(trim($form['codigo_sri']));

    global $enlace, $objPaginacion, $objComun;

    $objResponse = new xajaxResponse();

    $msg = "";

    if (strcasecmp($codigo_tipo_impuesto, '') == 0 or strcasecmp($codigo_tipo_impuesto, 'seleccione') == 0) {
        $msg .= "\nINGRESE CODIGO TIPO IMPUESTO...";
    }

    if (strcasecmp($descripcion, '') == 0 or strcasecmp($descripcion, 'seleccione') == 0) {
        $msg .= "\nINGRESE DESCRIPCION...";
    }

    if (strcasecmp($activo, '') == 0 or strcasecmp($activo, 'seleccione') == 0) {
        $msg .= "\nSELECCIONE ACTIVO...";
    }

    if (strcasecmp($codigo_sri, '') == 0 or strcasecmp($codigo_sri, 'seleccione') == 0) {
        $msg .= "\nINGRESE CODIGO SRI...";
    }

    if (strlen(trim($msg)) > 0) {
        $objResponse->alert($msg);
        return $objResponse;
    } else {
        if ($opcion == 0) {// inserta
            $objResponse->call("xajax_ingresar", $form);
        } else {// actualizar
            $objResponse->call("xajax_actualizar", $form);
        }
    }
    return $objResponse;
}

function ingresar($form) {

    $codigo_tipo_impuesto = strtoupper(trim($form['codigo_tipo_impuesto']));

    $descripcion = strtoupper(trim($form['descripcion']));

    $activo = strtoupper(trim($form['activo']));

    $codigo_sri = strtoupper(trim($form['codigo_sri']));

    global $objPaginacion, $objComun;

    $objDB = new Database();
    $objDB->setParametrosBD(HOST, BASE, USER, PWD);
    $objDB->getConexion();
    $objResponse = new xajaxResponse();

    $sqlInsert = "insert into tipo_impuesto (descripcion,activo,codigo_sri) values";

    $sqlInsert .= "('$descripcion','$activo','$codigo_sri');";

    $rs = $objDB->query($sqlInsert);

    $objResponse->alert("Registrado...");
    return $objResponse;
}


function addrow($indice) {
    global $enlace, $objPaginacion, $objComun;
    $objResponse = new xajaxResponse();
    $idx = $indice + 2;
    $indice = $indice + 1;
    $row = "<table class='borde_detalle' width='1100px'>
	    <tr id='tr_$indice' class='borde_item'>
		<td id='td_$indice" . "_1'  width='10%' class='borde_text'>		
		<input type='text' class='borde_text' name='txtCP_$indice' id='txtCP_$indice' size='14' value='' maxlength='25' onblur='xajax_verProducto(this.value,1,$indice)' />
		</td>
		<td id='td_$indice" . "_2' width='10%'  class='borde_text'>		
		<input type='text'  class='borde_text'  name='txtCA_$indice' id='txtCA_$indice' size='14' value='' maxlength='25' onblur='xajax_verProducto(this.value,2,$indice)' />
		</td>
		<td id='td_$indice" . "_3' width='10%'  class='borde_num'>		
		<input type='text'   class='borde_num'  name='txtC_$indice' id='txtC_$indice' size='14' value='' maxlength='9'  onkeyup=\"mask_decimal4(txtC_$indice)\"   onfocus=\"xajax_calcularPrecioTotal($indice,xajax.getFormValues('form'));\"   />
		</td>
		<td id='td_$indice" . "_4' width='15%' class='borde_text'>		
		<input type='text'   class='borde_text'  name='txtD_$indice' id='txtD_$indice' size='27' value='' maxlength='64' />
		</td>
		<td id='td_$indice" . "_5' width='15%'  class='borde_text'>		
		<input type='text'   class='borde_text'  name='txtDA_$indice' id='txtDA_$indice' size='27' value='' maxlength='64' />
		</td>
		<td id='td_$indice" . "_6' width='10%'  class='borde_num'>		
		<input type='text'   class='borde_num'  name='txtPU_$indice' id='txtPU_$indice' size='14' value='0.0000' maxlength='9' onkeyup=\"mask_decimal4(txtPU_$indice)\"  onblur=\"xajax_calcularPrecioTotal($indice,xajax.getFormValues('form'));\" />
		</td>
		<td id='td_$indice" . "_7' width='10%'  class='borde_num'>		
		<input type='text'   class='borde_num'  name='txtDsct_$indice' id='txtDsct_$indice' size='14' value='0.00' maxlength='9'  onkeyup=\"mask_decimal2(txtDsct_$indice)\"  onblur=\"xajax_calcularPrecioTotal($indice,xajax.getFormValues('form'));\" />
		</td>
		<td id='td_$indice" . "_8'  width='10%' class='borde_num'>		
		<input type='text'   class='borde_num'  name='txtPT_$indice' id='txtPT_$indice' size='14' value='0.00' maxlength='14' onchange=\"mask_decimal2(txtDsct_$indice)\" />
		</td>
		
		<td align='center' class='enlace' id='td_$indice" . "_9'  width='5%' onclick=\"xajax_addrow(document.getElementById('txtIndice').value)\">
			<img src='imagenes/add.png' />
		</td>
		<td align='center'  class='enlace' id='td_$indice" . "_10'  width='5%' onclick='xajax_delrow($indice);'>
			<img src='imagenes/cross.png' />
                        
                        <input type='hidden'    name='txtIVA_$indice' id='txtIVA_$indice' value='0' />
                        <input type='hidden'    name='txtPIVA_$indice' id='txtPIVA_$indice' value='0' />
                        <input type='hidden'    name='txtICE_$indice' id='txtICE_$indice' value='0' />
                        <input type='hidden'    name='txtPICE_$indice' id='txtPICE_$indice' value='0' />
                        <input type='hidden'    name='txtCICE_$indice' id='txtCICE_$indice' value='0' />
                            
		</td>
		
		</tr>
		</table> <div id='dvDet$idx'></div>";

    $dev = "dvDet$indice";
    $objResponse->append("$dev", "innerHTML", $row);
    $objResponse->assign("txtIndice", "value", $indice);

    return $objResponse;
}

function delrow($indice) {

    global $enlace, $objPaginacion, $objComun;
    $dev = "dvDet$indice";
    $objResponse = new xajaxResponse();
    $objResponse->assign("tr_$indice", "innerHTML", "");
// $objResponse->assign("$dev", "innerHTML", "");
    return $objResponse;
}

function calcularPrecioTotal($idx, $form) {
    $objResponse = new xajaxResponse();

    $objResponse->alert(print_r($form, true));
    
    $codPrincipal = $form["txtCP_$idx"];
    $codAuxiliar = $form["txtCA_$idx"];
    $cantidad = $form["txtC_$idx"];
    $descripcion = $form["txtD_$idx"];
    $descripcionAdicional = $form["txtDA_$idx"];
    $precioUnitario = $form["txtPU_$idx"];
    $descuento = $form["txtDsct_$idx"];
    $precioTotal = $form["txtPT_$idx"];
    $iva = $form["txtIVA_$idx"];
    $tarifa12 = $form["txtPIVA_$idx"];
    $ice = $form["txtICE_$idx"];
    $tarifaIce = $form["txtPICE_$idx"];
    $codigoIce = $form["txtCICE_$idx"];

    if ($cantidad == "") {
        $cantidad = 0;
    }
    if ($precioUnitario == "") {
        $precioUnitario = 0;
    }
    if ($descuento == "") {
        $descuento = 0;
    }

    $cal = ($cantidad * $precioUnitario) - $descuento;

    $calice = $cal * $tarifaIce / 100.00;
    $caliva = $cal * $tarifa12 / 100.00;
    if ($cal <= 0) {
        $cal = 0;
    }
    if ($calice <= 0) {
        $calice = 0;
    }
    if ($caliva <= 0) {
        $caliva = 0;
    }
    $objResponse->assign("txtPT_$idx", "value", "$cal");
    $objResponse->assign("txtICE_$idx", "value", "$calice");
    $objResponse->assign("txtIVA_$idx", "value", "$caliva");

    return $objResponse;
}

function calcularTotal($form) {
    $objResponse = new xajaxResponse();


    $documento = $form["txtDocumento"];
    $cliente = $form["txtCliente"];
    $telefono = $form["txtTelefono"];
    $email = $form["txtEmail"];
    $direccion = $form["txtDireccion"];
    $nroItems = $form["txtIndice"];



    $subtotal12 = $form["txtSubtotal12"];
    $subtotal0 = $form["txtSubtotal0"];
    $subtotalNoIva = $form["txtSubtotalnoiva"];
    $subtotalSinImp["txtSubtotalsinimp"];
    $subtotalDescuento = $form["txtDescuento"];
    $totalIce = $form["txtIce"];
    $totalIva = ["txtIva"];
    $totalPropina = $form["txtPropina"];
    $total = $form["txtValorTotal"];


    $sub12 = 0;
    $sub0 = 0;
    $pt = 0;
    $dsc = 0;
    $vice = 0;
    $v12 = 0;
    $v0 = 0;

    for ($i = 0; $i <= $nroItems; $i++) {

        $codPrincipal = $form["txtCP_$i"];
        $codAuxiliar = $form["txtCA_$i"];
        $cantidad = $form["txtC_$i"];
        $descripcion = $form["txtD_$i"];
        $descripcionAdicional = $form["txtDA_$i"];
        $precioUnitario = $form["txtPU_$i"];
        $descuento = $form["txtDsct_$i"];
        $precioTotal = $form["txtPT_$i"];
        $iva = $form["txtIVA_$i"];
        $tarifa12 = $form["txtPIVA_$i"];
        $ice = $form["txtICE_$i"];
        $tarifaIce = $form["txtPICE_$i"];
        $codigoIce = $form["txtCICE_$i"];

        if (!is_null($codPrincipal)) {

            if ($cantidad == "") {
                $cantidad = 0;
            }
            if ($precioUnitario == "") {
                $precioUnitario = 0;
            }
            if ($descuento == "") {
                $descuento = 0;
            }
            if ($precioTotal == "") {
                $precioTotal = 0;
            }
            if ($iva == "") {
                $iva = 0;
            }
            if ($tarifa12 == "") {
                $tarifa12 = 0;
            }
            if ($ice == "") {
                $ice = 0;
            }
            if ($tarifaIce == "") {
                $tarifaIce = 0;
            }
            if ($codigoIce == "") {
                $codigoIce = 0;
            }

            $pt = $pt + $precioTotal;
            $dsc = $dsc + $descuento;
            if ($tarifa12 > 0) {
                $v12 = $v12 + $iva;
                $sub12 = $sub12 + $precioTotal;
            } else {
                $sub0 = $sub0 + $precioTotal;
            }
            if ($tarifaIce > 0) {
                $vice = $pt + $vice + $ice + $totalPropina;
            }
        }
    }
//$objResponse->alert($sub0);
    $st = $sub0 + $sub12;
    $cal = $st + $v12 + $vice + $totalPropina;
    // $objResponse->alert(print_r($form, true));

    $objResponse->assign("txtSubtotal12", "value", "$sub12");
    $objResponse->assign("txtSubtotal0", "value", "$sub0");
    $objResponse->assign("txtSubtotalnoiva", "value", "$sub0");
    $objResponse->assign("txtSubtotalsinimp", "value", "$st");
    $objResponse->assign("txtDescuento", "value", "$dsc");
    $objResponse->assign("txtIce", "value", "$vice");
    $objResponse->assign("txtIva", "value", "$v12");
    $objResponse->assign("txtPropina", "value", "$totalPropina");
    $objResponse->assign("txtValorTotal", "value", $cal);
    return $objResponse;
}

function verProducto($producto, $tipo, $indice) {
    $objResponse = new xajaxResponse();

    $objDB = new Database();
    $objDB->setParametrosBD(HOST, BASE, USER, PWD);
    $objDB->getConexion();

    if ($tipo == "1") {
        $pro = " and UPPER(a.codigo_principal) =UPPER('$producto')";
    } else {
        $pro = " and UPPER(a.codigo_auxiliar) =UPPER('$producto')";
    }
    $sql = "select a.codigo_auxiliar, a.descripcion, a.descripcion_adicional, a.precio_unitario, c.porcentaje, c.codigo_sri, 'IVA' as tipo from producto as a inner join producto_impuesto as b
    on a.codigo = b.codigo_producto inner join impuesto as c
    on b.codigo_impuesto = c.codigo_impuesto
    and c.codigo_tipo_impuesto = 1
    $pro ";

    $sql1 = " select a.codigo_auxiliar, a.descripcion, a.descripcion_adicional, a.precio_unitario, c.porcentaje, c.codigo_sri, 'ICE' as tipo from producto as a inner join producto_impuesto as b
    on a.codigo = b.codigo_producto inner join impuesto as c
    on b.codigo_impuesto = c.codigo_impuesto
    and c.codigo_tipo_impuesto = 2
    $pro ";
    $rs = $objDB->query($sql);
    $arr_iva = $objDB->fetch_array($rs);

    $rs1 = $objDB->query($sql1);
    $arr_ice = $objDB->fetch_array($rs1);


    $pu = $arr_iva["precio_unitario"];
    $iva = 0;
    $tarifa12 = $arr_iva["porcentaje"];
    $ice = 0;
    $tarifaIce = $arr_ice["porcentaje"];
    $codigoIce = $arr_ice["codigo_sri"];
    if ($tipo == "1") {
        $des = $arr_iva["descripcion"];
        $desa = $arr_iva["descripcion_adicional"];
        $codigo_auxiliar = $arr_iva["codigo_auxiliar"];
    } else {
        $des = $arr_ice["descripcion"];
        $desa = $arr_ice["descripcion_adicional"];
        $codigo_auxiliar = $arr_iva["codigo_auxiliar"];
    }


    $objResponse->assign("txtCA_$indice", "value", "$codigo_auxiliar");
    
    $objResponse->assign("txtD_$indice", "value", "$des");
    $objResponse->assign("txtDA_$indice", "value", "$desa");

    $objResponse->assign("txtPU_$indice", "value", "$pu");
    $objResponse->assign("txtC_$indice", "value", "1");
    $objResponse->assign("txtIVA_$indice", "value", "$iva");
    $objResponse->assign("txtPIVA_$indice", "value", "$tarifa12");
    $objResponse->assign("txtICE_$indice", "value", "$ice");
    $objResponse->assign("txtPICE_$indice", "value", "$tarifaIce");
    $objResponse->assign("txtCICE_$indice", "value", "$codigoIce");

    return $objResponse;
}

$xajax->register(XAJAX_FUNCTION, "addrow");
$xajax->register(XAJAX_FUNCTION, "delrow");
$xajax->register(XAJAX_FUNCTION, "calcularPrecioTotal");
$xajax->register(XAJAX_FUNCTION, "calcularPrecioTotal1");
$xajax->register(XAJAX_FUNCTION, "calcularPrecioTotal2");
$xajax->register(XAJAX_FUNCTION, "calcularTotal");
$xajax->register(XAJAX_FUNCTION, "verProducto");


$xajax->register(XAJAX_FUNCTION, "validarForm");
$xajax->register(XAJAX_FUNCTION, "ingresar");
$xajax->register(XAJAX_FUNCTION, "actualizar");
$xajax->register(XAJAX_FUNCTION, "eliminar");
$xajax->register(XAJAX_FUNCTION, "limpiar");
$xajax->register(XAJAX_FUNCTION, "confirmarEliminarForm");
$xajax->register(XAJAX_FUNCTION, "consultar");
$xajax->register(XAJAX_FUNCTION, "seleccionar");
?>