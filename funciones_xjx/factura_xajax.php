<?php

$objDB = new Database();
$objDB->setParametrosBD(HOST, BASE, USER, PWD);

$objComun = new Comun();
$sql = "select codigo_sri, descripcion from tipo_comprador";
$cmbTipo = $objComun->comboDatoEnlace($objDB, "cmbTipoComprador", $sql, "xajax_verTipoComprador(this.value)", true, false, "");

$sqlIce = "select codigo_sri,codigo_sri||' - '||descripcion from impuesto where codigo_tipo_impuesto=3";
$arrIce = $objComun->obtenerArreglo($objDB, $sqlIce);

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

    global $arrIce;
    $objComun = new Comun();

    $objResponse = new xajaxResponse();
    $idx = $indice + 2;
    $indice = $indice + 1;
    $cmbIce = $objComun->comboDatoArreglo("cmbIce_$indice", $arrIce, "", true, false, "", "class='combo_dato'");

    $row = "<tr id='tr_$indice' class=''>
		<td id='td_$indice" . "_1'  width='120px' class='borde'>		
		<input type='text' class='borde_text' name='txtCP_$indice' id='txtCP_$indice'  value='' maxlength='25' onblur='xajax_verProducto(this.value,1,$indice)' />
		</td>
		<td id='td_$indice" . "_2' width='120px'  class='borde'>		
		<input type='text'  class='borde_text'  name='txtCA_$indice' id='txtCA_$indice'  value='' maxlength='25'  />
		</td>
		<td id='td_$indice" . "_3' width='100px'  class='borde'>		
		<input type='text'   class='borde_num_short'  name='txtC_$indice' id='txtC_$indice'  value='' maxlength='9' onkeyup=\"soloNumeros(this)\"   onchange=\"calcularDetalle($indice);\"  onblur=\"calcularDetalle($indice);\" />
		</td>
		<td id='td_$indice" . "_4' width='230px' class='borde'>		
		<input type='text'   class='borde_text_large'  name='txtD_$indice' id='txtD_$indice'  value='' maxlength='64' />
		</td>
		
		<td id='td_$indice" . "_6' width='120px'  class='borde'>		
		<input type='text'   class='borde_num'  name='txtPU_$indice' id='txtPU_$indice'  value='' maxlength='9'  onkeyup=\"soloNumeros(this)\"    onblur=\"calcularDetalle($indice);\" />
		</td>
		<td id='td_$indice" . "_7' width='100px'  class='borde'>		
		<input type='text'   class='borde_num_short'  name='txtDsct_$indice' id='txtDsct_$indice'  value='' maxlength='9'   onkeyup=\"soloNumeros(this)\"   onblur=\"calcularDetalle($indice);\"  />
		</td>
                
                <td id='td_$indice" . "_9'  width='40px' class='borde' align='center'>		
		<input type='checkbox'  name='chkIva_$indice' id='chkIva_$indice' onchange='xajax_cambiarIva($indice,this.checked)' />
		</td>
                
                <td id='td_$indice" . "_10'  width='70px' class='borde'>		
                    $cmbIce
		</td>
                
		<td id='td_$indice" . "_8'  width='120px' class='borde'>		
		<input type='text'   class='borde_num'  name='txtPT_$indice' id='txtPT_$indice'  value='' maxlength='14'  onkeyup=\"soloNumeros(this)\"  onblur=\"calcularDetalle($indice);\"  />
		</td>
		
		<td align='center' class='enlace' id='td_$indice" . "_9'  width='25px' onclick=\"xajax_addrow(document.getElementById('txtIndice').value)\">
			<img src='imagenes/add.png' />
		</td>
		<td align='center'  class='enlace' id='td_$indice" . "_10'  width='25px' onclick='xajax_delrow($indice);'>
			<img src='imagenes/cross.png' />
                        
                        
                        
                        <input type='hidden'    name='txtIVA_$indice' id='txtIVA_$indice' value='0' />
                        <input type='hidden'    name='txtPIVA_$indice' id='txtPIVA_$indice' value='0' />
                        <input type='hidden'    name='txtCIVA_$indice' id='txtCIVA_$indice' value='0' />
                        <input type='hidden'    name='txtICE_$indice' id='txtICE_$indice' value='0' />
                        <input type='hidden'    name='txtPICE_$indice' id='txtPICE_$indice' value='0' />
                        <input type='hidden'    name='txtCICE_$indice' id='txtCICE_$indice' value='0' />
                            
		</td>
		
		</tr>
		 <tr id=\"tr_$idx\"></tr>";


    $dev = "tr_$indice";
    $objResponse->assign("$dev", "outerHTML", $row);
    $objResponse->assign("txtIndice", "value", $indice);

    return $objResponse;
}

function delrow($indice) {
    $dev = "tr_$indice";
    $objResponse = new xajaxResponse();
    $objResponse->assign("tr_$indice", "outerHTML", "");
// $objResponse->assign("$dev", "innerHTML", "");
    return $objResponse;
}

function calcularPrecioTotal($idx, $form) {
    $objResponse = new xajaxResponse();

    //$objResponse->alert(print_r($form, true));

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

    //$objResponse->alert($producto."".$tipo."".$indice);


    $pro = " and UPPER(a.codigo_principal) =UPPER('$producto')";

    $sql = "select a.codigo, a.codigo_auxiliar, a.descripcion, a.descripcion_adicional, a.precio_unitario, c.porcentaje, c.codigo_sri, 'IVA' as tipo 
    from producto as a inner join producto_impuesto as b
    on a.codigo = b.codigo_producto inner join impuesto as c
    on b.codigo_impuesto = c.codigo_impuesto
    and c.codigo_tipo_impuesto = 2
    $pro ";
    $rs = $objDB->query($sql);
    $arr_iva = $objDB->fetch_array($rs);
    $codProducto = $arr_iva["codigo"];
    $des = $arr_iva["descripcion"];
    $desa = $arr_iva["descripcion_adicional"];
    $codigo_auxiliar = $arr_iva["codigo_auxiliar"];
    $pu = $arr_iva["precio_unitario"];

    $sql1 = "select c.descripcion, b.codigo_sri, b.porcentaje, c.codigo_sri as codigo_tipo_impuesto from producto_impuesto as a inner join impuesto as b
    on a.codigo_impuesto = b.codigo_impuesto inner join tipo_impuesto as c
    on b.codigo_tipo_impuesto = c.codigo
    and a.codigo_producto = '$codProducto'
    and c.codigo_sri = '2'";
    $rs1 = $objDB->query($sql1);
    $arr_ice = $objDB->fetch_array($rs1);

    $iva = 0;
    $tarifa12 = $arr_ice["porcentaje"];
    $codigoIva = $arr_ice["codigo_sri"];

    $sql1 = "select c.descripcion, b.codigo_sri, b.porcentaje, c.codigo_sri as codigo_tipo_impuesto from producto_impuesto as a inner join impuesto as b
    on a.codigo_impuesto = b.codigo_impuesto inner join tipo_impuesto as c
    on b.codigo_tipo_impuesto = c.codigo
    and a.codigo_producto = '$codProducto'
    and c.codigo_sri = '3'";
    $rs1 = $objDB->query($sql1);
    $arr_ice = $objDB->fetch_array($rs1);

    $ice = 0;
    $tarifaIce = $arr_ice["porcentaje"];
    $codigoIce = $arr_ice["codigo_sri"];

    $objResponse->assign("txtCA_$indice", "value", "$codigo_auxiliar");

    $objResponse->assign("txtD_$indice", "value", "$des");
    $objResponse->assign("txtDA_$indice", "value", "$desa");
    $objResponse->assign("txtPU_$indice", "value", "$pu");
    $objResponse->assign("txtC_$indice", "value", "1");

    $objResponse->assign("txtIVA_$indice", "value", "$iva");
    $objResponse->assign("txtPIVA_$indice", "value", "$tarifa12");
    $objResponse->assign("txtCIVA_$indice", "value", "$codigoIva");

    $objResponse->assign("txtICE_$indice", "value", "$ice");
    $objResponse->assign("txtPICE_$indice", "value", "$tarifaIce");
    $objResponse->assign("txtCICE_$indice", "value", "$codigoIce");
    $objResponse->assign("cmbIce_$indice", "value", "$codigoIce");

    $objResponse->assign("txtPT_$indice", "value", $pu);


    if ($tarifa12 > 0) {
        $objResponse->assign("chkIva_$indice", "checked", "checked");
    }

    $objResponse->script("calcularDetalle($indice)");
    return $objResponse;
}

function verTipoComprador($tipoComprador) {
    $objResponse = new xajaxResponse();
    if ($tipoComprador == "07") {
        $objResponse->assign("txtDocumento", "value", "9999999999999");
        $objResponse->assign("txtDocumento", "maxlength", "13");
        $objResponse->setEvent("txtDocumento", "onkeyup", "xajax_validaConsumidor(this.value)");
    }
    return $objResponse;
}

function validaConsumidor($dato) {
    $objResponse = new xajaxResponse();
    if ($dato != "9999999999999") {
        $objResponse->assign("txtDocumento", "style", "border-color:red;border-style:solid;");
        //$objResponse->assign("dvMensaje", "innerHTML", "Consumidor final no es valido");
    } else {
        $objResponse->assign("dvMensaje", "innerHTML", "");
        $objResponse->assign("txtDocumento", "style", "border-color:#ccccc");
    }
    return $objResponse;
}

function cambiarIva($indice, $valor) {
    $objResponse = new xajaxResponse();
    if ($valor == "1") {
        $objResponse->assign("txtIVA_$indice", "value", "0");
        $objResponse->assign("txtPIVA_$indice", "value", "12");
        $objResponse->assign("txtCIVA_$indice", "value", "2");
    } else {
        $objResponse->assign("txtIVA_$indice", "value", "0");
        $objResponse->assign("txtPIVA_$indice", "value", "0");
        $objResponse->assign("txtCIVA_$indice", "value", "1");
    }
    return $objResponse;
}

$xajax->register(XAJAX_FUNCTION, "addrow");
$xajax->register(XAJAX_FUNCTION, "delrow");
$xajax->register(XAJAX_FUNCTION, "calcularPrecioTotal");
$xajax->register(XAJAX_FUNCTION, "calcularPrecioTotal1");
$xajax->register(XAJAX_FUNCTION, "calcularPrecioTotal2");
$xajax->register(XAJAX_FUNCTION, "calcularTotal");
$xajax->register(XAJAX_FUNCTION, "verProducto");


$xajax->register(XAJAX_FUNCTION, "cambiarIva");
$xajax->register(XAJAX_FUNCTION, "validaConsumidor");
$xajax->register(XAJAX_FUNCTION, "verTipoComprador");
$xajax->register(XAJAX_FUNCTION, "validarForm");
$xajax->register(XAJAX_FUNCTION, "ingresar");
$xajax->register(XAJAX_FUNCTION, "actualizar");
$xajax->register(XAJAX_FUNCTION, "eliminar");
$xajax->register(XAJAX_FUNCTION, "limpiar");
$xajax->register(XAJAX_FUNCTION, "confirmarEliminarForm");
$xajax->register(XAJAX_FUNCTION, "consultar");
$xajax->register(XAJAX_FUNCTION, "seleccionar");
?>