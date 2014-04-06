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

function actualizar($form) {

    $codigo_tipo_impuesto = strtoupper(trim($form['codigo_tipo_impuesto']));

    $descripcion = strtoupper(trim($form['descripcion']));

    $activo = strtoupper(trim($form['activo']));

    $codigo_sri = strtoupper(trim($form['codigo_sri']));

    global $objPaginacion, $objComun;

    $objDB = new Database();
    $objDB->setParametrosBD(HOST, BASE, USER, PWD);
    $objDB->getConexion();
    $objResponse = new xajaxResponse();

    $sqlUpdate = "update  tipo_impuesto set  descripcion= '$descripcion'
, activo= '$activo'
, codigo_sri= '$codigo_sri'
 where  codigo_tipo_impuesto= '$codigo_tipo_impuesto'
";

    $rs = $objDB->query($sqlUpdate);

    $objResponse->alert("Actualizado...");
    return $objResponse;
}

function confirmarEliminarForm($form) {

    global $enlace, $objPaginacion, $objComun;

    $objResponse = new xajaxResponse();

    $objResponse->confirmCommands(1, "Deseas eliminar el registro?");
    $objResponse->call("xajax_eliminar", $form);
    return $objResponse;
}

function eliminar($form) {

    $codigo_tipo_impuesto = strtoupper(trim($form['codigo_tipo_impuesto']));

    $descripcion = strtoupper(trim($form['descripcion']));

    $activo = strtoupper(trim($form['activo']));

    $codigo_sri = strtoupper(trim($form['codigo_sri']));

    global $objPaginacion, $objComun;

    $objResponse = new xajaxResponse();
    $objDB = new Database();
    $objDB->setParametrosBD(HOST, BASE, USER, PWD);
    $objDB->getConexion();
    $objResponse = new xajaxResponse();

    $sqlUpdate = "update  tipo_impuesto set activo=0 where  codigo_tipo_impuesto= '$codigo_tipo_impuesto'
";

    $rs = $objDB->query($sqlUpdate);

    $objResponse->alert("Desactivado...");
    return $objResponse;
}

function limpiar($form) {

    $objResponse = new xajaxResponse();

    $objResponse->assign("codigo_tipo_impuesto", "value", "");
    $objResponse->assign("descripcion", "value", "");
    $objResponse->assign("activo", "value", "");
    $objResponse->assign("codigo_sri", "value", "");

    return $objResponse;
}

function seleccionar($id) {

    $objResponse = new xajaxResponse();

    $objDB = new Database();
    $objDB->setParametrosBD(HOST, BASE, USER, PWD);
    $objDB->getConexion();

    $sql = " select *    from tipo_impuesto 
    where  codigo_tipo_impuesto  = '$id' ";

    $result = $objDB->query($sql);
    $numCols = $objDB->getNumCols();

    $ln = $objDB->fetch_array($result);
    $codigo_tipo_impuesto = $ln[0];
    $descripcion = $ln[1];
    $activo = $ln[2];
    $codigo_sri = $ln[3];
    $objResponse->assign("codigo_tipo_impuesto", "value", "$codigo_tipo_impuesto");
    $objResponse->assign("descripcion", "value", "$descripcion");
    $objResponse->assign("activo", "value", "$activo");
    $objResponse->assign("codigo_sri", "value", "$codigo_sri");

    return $objResponse;
}

function consultar($form) {
    $query = trim($form["txtConsulta"]);
    $objResponse = new xajaxResponse();

    $objDB = new Database();
    $objDB->setParametrosBD(HOST, BASE, USER, PWD);
    $objDB->getConexion();

    $sql = " select *    from tipo_impuesto 
    where  descripcion  like '%$query%' ";

    $result = $objDB->query($sql);
    $numCols = $objDB->getNumCols();

    $nuevo = "<img src='" . HOME . "imagenes/page_white_text.png'/>";
    $nuevoLnk = " style='cursor:pointer' onclick = 'xajax_nuevo()' ";

    $tabla = "<table border='0' align ='center' class='tablesorter' cellspacing='1'><thead><tr>";
    $arrTi = $objDB->field_name($result);

    foreach ($arrTi as $ln) {
        $campo = $ln;
        $tabla .= "<th>$campo</th>";
    }
    $tabla .= " <th colspan='2' $nuevoLnk >$nuevo</th> </tr></thead><tbody>";
    while ($ln = $objDB->fetch_array($result)) {
        $id = $ln[0];
        $tb = "<tr>";
        for ($i = 0; $i < $numCols; $i++) {
            $dato = $ln[$i];
            $tb .= "<td id = 'dv_$i'.'_$id'>$dato</td>";
        }
        $actualizar = "<img src='" . HOME . "imagenes/page_white_edit.png'/>";
        $actalizarLnk = " style='cursor:pointer' onclick = 'xajax_seleccionar($id)' ";
        $eliminar = "<img src='" . HOME . "imagenes/cross.png'/>";
        $eliminarLnk = " style='cursor:pointer' onclick = 'xajax_confirmarEliminarForm($id)' ";
        $tabla .= $tb . " <td $actalizarLnk >$actualizar</td><td $eliminarLnk >$eliminar</td>   </tr>";
    }
    $tabla .= "</tbody></table>";
    $objResponse->script('function loadTabla(){$("table").tablesorter({ widgets: [\'zebra\']});  }  $(function() {$("table") .tablesorter({ widgets: [\'zebra\']});  });');
    $objResponse->assign("dvRespuesta", "innerHTML", "$tabla");
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
		<input type='text' class='borde_text' name='txtCP_$indice' id='txtCP_$indice' size='14' value='' maxlength='25' />
		</td>
		<td id='td_$indice" . "_2' width='10%'  class='borde_text'>		
		<input type='text'  class='borde_text'  name='txtCA_$indice' id='txtCA_$indice' size='14' value='' maxlength='25'  />
		</td>
		<td id='td_$indice" . "_3' width='10%'  class='borde_num'>		
		<input type='text'   class='borde_num'  name='txtC_$indice' id='txtC_$indice' size='14' value='' maxlength='9' onkeyup=\"mask_decimal4(txtC_$indice)\"   onblur=\"xajax_calcularPrecioTotal($indice,document.getElementById('txtC_$indice').value,document.getElementById('txtPU_$indice').value, document.getElementById('txtDsct_$indice').value);\" />
		</td>
		<td id='td_$indice" . "_4' width='15%' class='borde_text'>		
		<input type='text'   class='borde_text'  name='txtD_$indice' id='txtD_$indice' size='27' value='' maxlength='64' />
		</td>
		<td id='td_$indice" . "_5' width='15%'  class='borde_text'>		
		<input type='text'   class='borde_text'  name='txtDA_$indice' id='txtDA_$indice' size='27' value='' maxlength='64' />
		</td>
		<td id='td_$indice" . "_6' width='10%'  class='borde_num'>		
		<input type='text'   class='borde_num'  name='txtPU_$indice' id='txtPU_$indice' size='14' value='0.0000' maxlength='9' onkeyup=\"mask_decimal4(txtPU_$indice)\"  onblur=\"xajax_calcularPrecioTotal($indice,document.getElementById('txtC_$indice').value,document.getElementById('txtPU_$indice').value, document.getElementById('txtDsct_$indice').value);\" />
		</td>
		<td id='td_$indice" . "_7' width='10%'  class='borde_num'>		
		<input type='text'   class='borde_num'  name='txtDsct_$indice' id='txtDsct_$indice' size='14' value='0.00' maxlength='9'  onkeyup=\"mask_decimal2(txtDsct_$indice)\"  onblur=\"xajax_calcularPrecioTotal($indice,document.getElementById('txtC_$indice').value,document.getElementById('txtPU_$indice').value, document.getElementById('txtDsct_$indice').value);\" />
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



function calcularPrecioTotal($idx, $cantidad,$pu,$des){
    $objResponse = new xajaxResponse();

    //$objResponse->alert("$idx, $cant, $pu, $dsct");
    if ($cantidad == "") {
        $cantidad = 0;
    }
    if ($pu == "") {
        $pu = 0;
    }
    if ($des == "") {
        $des = 0;
    }

    $cal = ($cantidad * $pu) - $des;
    if($cal<=0){
        $cal=0;
    }
    $objResponse->assign("txtPT_$idx", "value", $cal);
    return $objResponse;
}

$xajax->register(XAJAX_FUNCTION, "addrow");
$xajax->register(XAJAX_FUNCTION, "delrow");
$xajax->register(XAJAX_FUNCTION, "calcularPrecioTotal");

$xajax->register(XAJAX_FUNCTION, "validarForm");
$xajax->register(XAJAX_FUNCTION, "ingresar");
$xajax->register(XAJAX_FUNCTION, "actualizar");
$xajax->register(XAJAX_FUNCTION, "eliminar");
$xajax->register(XAJAX_FUNCTION, "limpiar");
$xajax->register(XAJAX_FUNCTION, "confirmarEliminarForm");
$xajax->register(XAJAX_FUNCTION, "consultar");
$xajax->register(XAJAX_FUNCTION, "seleccionar");
?>