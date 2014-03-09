<?php

function validarForm($form, $opcion) {
    $codigo_tipo_impuesto = strtoupper(trim($form['codigo_tipo_impuesto']));
    $descripcion = strtoupper(trim($form['descripcion']));
    $activo = strtoupper(trim($form['activo']));
    $codigo_sri = strtoupper(trim($form['codigo_sri']));
    $objResponse = new xajaxResponse();
    $msg = "";
    if (strcasecmp($codigo_tipo_impuesto, '') == 0 or strcasecmp($codigo_tipo_impuesto, 'seleccione') == 0) {
        $msg.="\nINGRESE CODIGO TIPO IMPUESTO...";
    }
    if (strcasecmp($descripcion, '') == 0 or strcasecmp($descripcion, 'seleccione') == 0) {
        $msg.="\nINGRESE DESCRIPCION...";
    }
    if (strcasecmp($activo, '') == 0 or strcasecmp($activo, 'seleccione') == 0) {
        $msg.="\nSELECCIONE ACTIVO...";
    }
    if (strcasecmp($codigo_sri, '') == 0 or strcasecmp($codigo_sri, 'seleccione') == 0) {
        $msg.="\nINGRESE CODIGO SRI...";
    }
    if (strlen(trim($msg)) > 0) {
        $objResponse->alert($msg);
        return $objResponse;
    } else {
        if ($opcion == 0) { // inserta
            $objResponse->call("xajax_ingresar", $form);
        } else { // actualizar
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

function actualizar($form) {
    $codigo_tipo_impuesto = strtoupper(trim($form['codigo_tipo_impuesto']));
    $descripcion = strtoupper(trim($form['descripcion']));
    $activo = strtoupper(trim($form['activo']));
    $codigo_sri = strtoupper(trim($form['codigo_sri']));
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
        $tabla .="<th>$campo</th>";
    }
    $tabla.=" <th colspan='2' $nuevoLnk >$nuevo</th> </tr></thead><tbody>";
    while ($ln = $objDB->fetch_array($result)) {
        $id = $ln[0];
        $tb = "<tr>";
        for ($i = 0; $i < $numCols; $i++) {
            $dato = $ln[$i];
            $tb.="<td id = 'dv_$i'.'_$id'>$dato</td>";
        }
        $actualizar = "<img src='" . HOME . "imagenes/page_white_edit.png'/>";
        $actalizarLnk = " style='cursor:pointer' onclick = 'xajax_seleccionar($id)' ";
        $eliminar = "<img src='" . HOME . "imagenes/cross.png'/>";
        $eliminarLnk = " style='cursor:pointer' onclick = 'xajax_confirmarEliminarForm($id)' ";
        $tabla.=$tb . " <td $actalizarLnk >$actualizar</td><td $eliminarLnk >$eliminar</td>   </tr>";
    }
    $tabla.="</tbody></table>";
    $objResponse->assign("dvRespuesta", "innerHTML", "$tabla");
    $objResponse->script('loadTabla();');

    return $objResponse;
}

$xajax->register(XAJAX_FUNCTION, "validarForm");
$xajax->register(XAJAX_FUNCTION, "ingresar");
$xajax->register(XAJAX_FUNCTION, "actualizar");
$xajax->register(XAJAX_FUNCTION, "eliminar");
$xajax->register(XAJAX_FUNCTION, "limpiar");
$xajax->register(XAJAX_FUNCTION, "confirmarEliminarForm");
$xajax->register(XAJAX_FUNCTION, "consultar");
$xajax->register(XAJAX_FUNCTION, "seleccionar");
?>