<?php

function validarForm($form, $opcion) {
	$codigo_tipo_ambiente = strtoupper(trim($form['codigo_tipo_ambiente']));

	$codigo_proveedor_certificado = strtoupper(trim($form['codigo_proveedor_certificado']));

	$razon_social = strtoupper(trim($form['razon_social']));

	$ruc = strtoupper(trim($form['ruc']));

	$nombre_comercial = strtoupper(trim($form['nombre_comercial']));

	$numero_resolucion = strtoupper(trim($form['numero_resolucion']));

	$es_contribuyente_especial = strtoupper(trim($form['es_contribuyente_especial']));

	$lleva_contabilidad = strtoupper(trim($form['lleva_contabilidad']));

	$logo_imagen = strtoupper(trim($form['logo_imagen']));

	$tiempo_espera = strtoupper(trim($form['tiempo_espera']));

	$clave_interna = strtoupper(trim($form['clave_interna']));

	$direccion_matriz = strtoupper(trim($form['direccion_matriz']));

	$clave_firma = strtoupper(trim($form['clave_firma']));

	$correo_electronico = strtoupper(trim($form['correo_electronico']));

	$correo_alternativo = strtoupper(trim($form['correo_alternativo']));

	$directorios = strtoupper(trim($form['directorios']));

	$nombre_certificado = strtoupper(trim($form['nombre_certificado']));

	$url_produccion = strtoupper(trim($form['url_produccion']));

	$url_pruebas = strtoupper(trim($form['url_pruebas']));

	global $enlace, $objPaginacion, $objComun;

	$objResponse = new xajaxResponse();

	$msg = "";

	if (strcasecmp($codigo_tipo_ambiente, '') == 0 or strcasecmp($codigo_tipo_ambiente, 'seleccione') == 0) {
		$msg .= "\nSELECCIONE CODIGO TIPO AMBIENTE...";
	}

	if (strcasecmp($codigo_proveedor_certificado, '') == 0 or strcasecmp($codigo_proveedor_certificado, 'seleccione') == 0) {
		$msg .= "\nSELECCIONE CODIGO PROVEEDOR CERTIFICADO...";
	}

	if (strcasecmp($razon_social, '') == 0 or strcasecmp($razon_social, 'seleccione') == 0) {
		$msg .= "\nINGRESE RAZON SOCIAL...";
	}

	if (strcasecmp($ruc, '') == 0 or strcasecmp($ruc, 'seleccione') == 0) {
		$msg .= "\nINGRESE RUC...";
	}

	if (strcasecmp($nombre_comercial, '') == 0 or strcasecmp($nombre_comercial, 'seleccione') == 0) {
		$msg .= "\nINGRESE NOMBRE COMERCIAL...";
	}

	if (strcasecmp($numero_resolucion, '') == 0 or strcasecmp($numero_resolucion, 'seleccione') == 0) {
		$msg .= "\nINGRESE NUMERO RESOLUCION...";
	}

	if (strcasecmp($es_contribuyente_especial, '') == 0 or strcasecmp($es_contribuyente_especial, 'seleccione') == 0) {
		$msg .= "\nSELECCIONE ES CONTRIBUYENTE ESPECIAL...";
	}

	if (strcasecmp($lleva_contabilidad, '') == 0 or strcasecmp($lleva_contabilidad, 'seleccione') == 0) {
		$msg .= "\nSELECCIONE LLEVA CONTABILIDAD...";
	}

	if (strcasecmp($logo_imagen, '') == 0 or strcasecmp($logo_imagen, 'seleccione') == 0) {
		$msg .= "\nINGRESE LOGO IMAGEN...";
	}

	if (strcasecmp($tiempo_espera, '') == 0 or strcasecmp($tiempo_espera, 'seleccione') == 0) {
		$msg .= "\nINGRESE TIEMPO ESPERA...";
	}

	if (strcasecmp($clave_interna, '') == 0 or strcasecmp($clave_interna, 'seleccione') == 0) {
		$msg .= "\nINGRESE CLAVE INTERNA...";
	}

	if (strcasecmp($direccion_matriz, '') == 0 or strcasecmp($direccion_matriz, 'seleccione') == 0) {
		$msg .= "\nINGRESE DIRECCION MATRIZ...";
	}

	if (strcasecmp($clave_firma, '') == 0 or strcasecmp($clave_firma, 'seleccione') == 0) {
		$msg .= "\nINGRESE CLAVE FIRMA...";
	}

	if (strcasecmp($correo_electronico, '') == 0 or strcasecmp($correo_electronico, 'seleccione') == 0) {
		$msg .= "\nINGRESE CORREO ELECTRONICO...";
	}

	if (strcasecmp($correo_alternativo, '') == 0 or strcasecmp($correo_alternativo, 'seleccione') == 0) {
		$msg .= "\nINGRESE CORREO ALTERNATIVO...";
	}

	if (strcasecmp($directorios, '') == 0 or strcasecmp($directorios, 'seleccione') == 0) {
		$msg .= "\nINGRESE DIRECTORIOS...";
	}

	if (strcasecmp($nombre_certificado, '') == 0 or strcasecmp($nombre_certificado, 'seleccione') == 0) {
		$msg .= "\nINGRESE NOMBRE CERTIFICADO...";
	}

	if (strcasecmp($url_produccion, '') == 0 or strcasecmp($url_produccion, 'seleccione') == 0) {
		$msg .= "\nINGRESE URL PRODUCCION...";
	}

	if (strcasecmp($url_pruebas, '') == 0 or strcasecmp($url_pruebas, 'seleccione') == 0) {
		$msg .= "\nINGRESE URL PRUEBAS...";
	}

	if (strlen(trim($msg)) > 0) {
		$objResponse -> alert($msg);
		return $objResponse;
	} else {
		if ($opcion == 0) {// inserta
			$objResponse -> call("xajax_ingresar", $form);
		} else {// actualizar
			$objResponse -> call("xajax_actualizar", $form);
		}
	}
	return $objResponse;

}

function ingresar($form) {

	$codigo_tipo_ambiente = strtoupper(trim($form['codigo_tipo_ambiente']));

	$codigo_proveedor_certificado = strtoupper(trim($form['codigo_proveedor_certificado']));

	$razon_social = strtoupper(trim($form['razon_social']));

	$ruc = strtoupper(trim($form['ruc']));

	$nombre_comercial = strtoupper(trim($form['nombre_comercial']));

	$numero_resolucion = strtoupper(trim($form['numero_resolucion']));

	$es_contribuyente_especial = strtoupper(trim($form['es_contribuyente_especial']));

	$lleva_contabilidad = strtoupper(trim($form['lleva_contabilidad']));

	$logo_imagen = strtoupper(trim($form['logo_imagen']));

	$tiempo_espera = strtoupper(trim($form['tiempo_espera']));

	$clave_interna = strtoupper(trim($form['clave_interna']));

	$direccion_matriz = strtoupper(trim($form['direccion_matriz']));

	$clave_firma = strtoupper(trim($form['clave_firma']));

	$correo_electronico = strtoupper(trim($form['correo_electronico']));

	$correo_alternativo = strtoupper(trim($form['correo_alternativo']));

	$directorios = strtoupper(trim($form['directorios']));

	$nombre_certificado = strtoupper(trim($form['nombre_certificado']));

	$url_produccion = strtoupper(trim($form['url_produccion']));

	$url_pruebas = strtoupper(trim($form['url_pruebas']));

	global $objPaginacion, $objComun;

	$objDB = new Database();
	$objDB -> setParametrosBD(HOST, BASE, USER, PWD);
	$objDB -> getConexion();
	$objResponse = new xajaxResponse();

	$sqlInsert = "insert into emisor (codigo_tipo_ambiente,codigo_proveedor_certificado,razon_social,ruc,nombre_comercial,numero_resolucion,es_contribuyente_especial,lleva_contabilidad,logo_imagen,tiempo_espera,clave_interna,direccion_matriz,clave_firma,correo_electronico,correo_alternativo,directorios,nombre_certificado,url_produccion,url_pruebas) values";

	$sqlInsert .= "('$codigo_tipo_ambiente','$codigo_proveedor_certificado','$razon_social','$ruc','$nombre_comercial','$numero_resolucion','$es_contribuyente_especial','$lleva_contabilidad','$logo_imagen','$tiempo_espera','$clave_interna','$direccion_matriz','$clave_firma','$correo_electronico','$correo_alternativo','$directorios','$nombre_certificado','$url_produccion','$url_pruebas');";

	$rs = $objDB -> query($sqlInsert);

	$objResponse -> alert("Registrado...");
	return $objResponse;

}

function actualizar($form) {

	$codigo_tipo_ambiente = strtoupper(trim($form['codigo_tipo_ambiente']));

	$codigo_proveedor_certificado = strtoupper(trim($form['codigo_proveedor_certificado']));

	$razon_social = strtoupper(trim($form['razon_social']));

	$ruc = strtoupper(trim($form['ruc']));

	$nombre_comercial = strtoupper(trim($form['nombre_comercial']));

	$numero_resolucion = strtoupper(trim($form['numero_resolucion']));

	$es_contribuyente_especial = strtoupper(trim($form['es_contribuyente_especial']));

	$lleva_contabilidad = strtoupper(trim($form['lleva_contabilidad']));

	$logo_imagen = strtoupper(trim($form['logo_imagen']));

	$tiempo_espera = strtoupper(trim($form['tiempo_espera']));

	$clave_interna = strtoupper(trim($form['clave_interna']));

	$direccion_matriz = strtoupper(trim($form['direccion_matriz']));

	$clave_firma = strtoupper(trim($form['clave_firma']));

	$correo_electronico = strtoupper(trim($form['correo_electronico']));

	$correo_alternativo = strtoupper(trim($form['correo_alternativo']));

	$directorios = strtoupper(trim($form['directorios']));

	$nombre_certificado = strtoupper(trim($form['nombre_certificado']));

	$url_produccion = strtoupper(trim($form['url_produccion']));

	$url_pruebas = strtoupper(trim($form['url_pruebas']));

	global $objPaginacion, $objComun;

	$objDB = new Database();
	$objDB -> setParametrosBD(HOST, BASE, USER, PWD);
	$objDB -> getConexion();
	$objResponse = new xajaxResponse();

	$sqlUpdate = "update  emisor set  codigo_tipo_ambiente= '$codigo_tipo_ambiente'
, codigo_proveedor_certificado= '$codigo_proveedor_certificado'
, razon_social= '$razon_social'
, ruc= '$ruc'
, nombre_comercial= '$nombre_comercial'
, numero_resolucion= '$numero_resolucion'
, es_contribuyente_especial= '$es_contribuyente_especial'
, lleva_contabilidad= '$lleva_contabilidad'
, logo_imagen= '$logo_imagen'
, tiempo_espera= '$tiempo_espera'
, clave_interna= '$clave_interna'
, direccion_matriz= '$direccion_matriz'
, clave_firma= '$clave_firma'
, correo_electronico= '$correo_electronico'
, correo_alternativo= '$correo_alternativo'
, directorios= '$directorios'
, nombre_certificado= '$nombre_certificado'
, url_produccion= '$url_produccion'
, url_pruebas= '$url_pruebas'
 where ";

	$rs = $objDB -> query($sqlUpdate);

	$objResponse -> alert("Actualizado...");
	return $objResponse;

}

function confirmarEliminarForm($form) {

	global $enlace, $objPaginacion, $objComun;

	$objResponse = new xajaxResponse();

	$objResponse -> confirmCommands(1, "Deseas eliminar el registro?");
	$objResponse -> call("xajax_eliminar", $form);
	return $objResponse;

}

function eliminar($form) {

	$codigo_tipo_ambiente = strtoupper(trim($form['codigo_tipo_ambiente']));

	$codigo_proveedor_certificado = strtoupper(trim($form['codigo_proveedor_certificado']));

	$razon_social = strtoupper(trim($form['razon_social']));

	$ruc = strtoupper(trim($form['ruc']));

	$nombre_comercial = strtoupper(trim($form['nombre_comercial']));

	$numero_resolucion = strtoupper(trim($form['numero_resolucion']));

	$es_contribuyente_especial = strtoupper(trim($form['es_contribuyente_especial']));

	$lleva_contabilidad = strtoupper(trim($form['lleva_contabilidad']));

	$logo_imagen = strtoupper(trim($form['logo_imagen']));

	$tiempo_espera = strtoupper(trim($form['tiempo_espera']));

	$clave_interna = strtoupper(trim($form['clave_interna']));

	$direccion_matriz = strtoupper(trim($form['direccion_matriz']));

	$clave_firma = strtoupper(trim($form['clave_firma']));

	$correo_electronico = strtoupper(trim($form['correo_electronico']));

	$correo_alternativo = strtoupper(trim($form['correo_alternativo']));

	$directorios = strtoupper(trim($form['directorios']));

	$nombre_certificado = strtoupper(trim($form['nombre_certificado']));

	$url_produccion = strtoupper(trim($form['url_produccion']));

	$url_pruebas = strtoupper(trim($form['url_pruebas']));

	global $objPaginacion, $objComun;

	$objResponse = new xajaxResponse();
	$objDB = new Database();
	$objDB -> setParametrosBD(HOST, BASE, USER, PWD);
	$objDB -> getConexion();
	$objResponse = new xajaxResponse();

	$sqlUpdate = "update  emisor set activo=0 where ";

	$rs = $objDB -> query($sqlUpdate);

	$objResponse -> alert("Desactivado...");
	return $objResponse;

}

function limpiar($form) {

	$objResponse = new xajaxResponse();

	$objResponse -> assign("codigo_emisor", "value", "");
	$objResponse -> assign("codigo_tipo_ambiente", "value", "");
	$objResponse -> assign("codigo_proveedor_certificado", "value", "");
	$objResponse -> assign("razon_social", "value", "");
	$objResponse -> assign("ruc", "value", "");
	$objResponse -> assign("nombre_comercial", "value", "");
	$objResponse -> assign("numero_resolucion", "value", "");
	$objResponse -> assign("es_contribuyente_especial", "value", "");
	$objResponse -> assign("lleva_contabilidad", "value", "");
	$objResponse -> assign("logo_imagen", "value", "");
	$objResponse -> assign("tiempo_espera", "value", "");
	$objResponse -> assign("clave_interna", "value", "");
	$objResponse -> assign("direccion_matriz", "value", "");
	$objResponse -> assign("clave_firma", "value", "");
	$objResponse -> assign("correo_electronico", "value", "");
	$objResponse -> assign("correo_alternativo", "value", "");
	$objResponse -> assign("directorios", "value", "");
	$objResponse -> assign("nombre_certificado", "value", "");
	$objResponse -> assign("url_produccion", "value", "");
	$objResponse -> assign("url_pruebas", "value", "");

	return $objResponse;

}

function seleccionar($id) {

	$objResponse = new xajaxResponse();

	$objDB = new Database();
	$objDB -> setParametrosBD(HOST, BASE, USER, PWD);
	$objDB -> getConexion();

	$sql = " select *    from emisor 
    where  XXXXXXXXXXXX  like '%$query%' ";

	$result = $objDB -> query($sql);
	$numCols = $objDB -> getNumCols();

	$ln = $objDB -> fetch_array($result);

	$objResponse -> assign("codigo_emisor", "value", "$nombre");
	$objResponse -> assign("codigo_tipo_ambiente", "value", "$nombre");
	$objResponse -> assign("codigo_proveedor_certificado", "value", "$nombre");
	$objResponse -> assign("razon_social", "value", "$nombre");
	$objResponse -> assign("ruc", "value", "$nombre");
	$objResponse -> assign("nombre_comercial", "value", "$nombre");
	$objResponse -> assign("numero_resolucion", "value", "$nombre");
	$objResponse -> assign("es_contribuyente_especial", "value", "$nombre");
	$objResponse -> assign("lleva_contabilidad", "value", "$nombre");
	$objResponse -> assign("logo_imagen", "value", "$nombre");
	$objResponse -> assign("tiempo_espera", "value", "$nombre");
	$objResponse -> assign("clave_interna", "value", "$nombre");
	$objResponse -> assign("direccion_matriz", "value", "$nombre");
	$objResponse -> assign("clave_firma", "value", "$nombre");
	$objResponse -> assign("correo_electronico", "value", "$nombre");
	$objResponse -> assign("correo_alternativo", "value", "$nombre");
	$objResponse -> assign("directorios", "value", "$nombre");
	$objResponse -> assign("nombre_certificado", "value", "$nombre");
	$objResponse -> assign("url_produccion", "value", "$nombre");
	$objResponse -> assign("url_pruebas", "value", "$nombre");

	return $objResponse;

}

function consultar($form) {
	$query = trim($form["txtConsulta"]);
	$objResponse = new xajaxResponse();

	$objDB = new Database();
	$objDB -> setParametrosBD(HOST, BASE, USER, PWD);
	$objDB -> getConexion();

	$sql = " select *    from emisor 
    where  XXXXXXXXXXXX  like '%$query%' ";

	$result = $objDB -> query($sql);
	$numCols = $objDB -> getNumCols();

	$nuevo = "<img src='" . HOME . "imagenes/page_white_text.png'/>";
	$nuevoLnk = " style='cursor:pointer' onclick = 'xajax_nuevo()' ";

	$tabla = "<table border='0' align ='center' class='tablesorter' cellspacing='1'><thead><tr>";
	$arrTi = $objDB -> field_name($result);

	foreach ($arrTi as $ln) {
		$campo = $ln;
		$tabla .= "<th>$campo</th>";
	}
	$tabla .= " <th colspan='2' $nuevoLnk >$nuevo</th> </tr></thead><tbody>";
	while ($ln = $objDB -> fetch_array($result)) {
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
	$objResponse -> script('function loadTabla(){$("table").tablesorter({ widgets: [\'zebra\']});  }  $(function() {$("table") .tablesorter({ widgets: [\'zebra\']});  });');
	$objResponse -> assign("dvRespuesta", "innerHTML", "$tabla");
	return $objResponse;
}

$xajax -> register(XAJAX_FUNCTION, "validarForm");

$xajax -> register(XAJAX_FUNCTION, "ingresar");

$xajax -> register(XAJAX_FUNCTION, "actualizar");

$xajax -> register(XAJAX_FUNCTION, "eliminar");

$xajax -> register(XAJAX_FUNCTION, "limpiar");

$xajax -> register(XAJAX_FUNCTION, "confirmarEliminarForm");

$xajax -> register(XAJAX_FUNCTION, "consultar");

$xajax -> register(XAJAX_FUNCTION, "seleccionar");
?>