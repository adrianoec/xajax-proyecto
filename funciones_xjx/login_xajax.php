<?php

function validarForm($form, $opcion) {
	$usuario = $form['usuario'];
	$clave = $form['clave'];
	$objResponse = new xajaxResponse();
	$msg = "";
	if (strcasecmp($usuario, '') == 0 or strcasecmp($usuario, 'seleccione') == 0) {
		$msg .= "\nINGRESE USUARIO";
	}
	if (strcasecmp($clave, '') == 0 or strcasecmp($clave, 'seleccione') == 0) {
		$msg .= "\nINGRESE CLAVE...";
	}
	if (strlen(trim($msg)) > 0) {
		$objResponse -> alert($msg);
		return $objResponse;
	} else {
		$objResponse -> call("xajax_ingresar", $form);
	}
	return $objResponse;
}

function ingresar($form) {
	
	$usuario = $form['usuario'];
	$clave = $form['clave'];
	
	$objDB = new Database();
	$objDB -> setParametrosBD(HOST, BASE, USER, PWD);
	$objDB -> getConexion();
	$objResponse = new xajaxResponse();
	$sqlInsert = "select count(*) as cantidad from usuario where correo_electronico='$usuario' and clave='$clave'";
	$rs = $objDB -> query($sqlInsert);
	$numrows = $objDB -> getNumRows();
	$numrows = 1;
	

	if ($numrows > 0) {
		$_SESSION["aut_usuario"]=$usuario;
		$_SESSION["aut_clave"]=$clave;
		
		//$objResponse->waitFor("sleep(38)", 10);
		
		$objResponse -> redirect("index.php");
	} else {
		$intentos = 0;
		$objResponse -> alert("Datos incorrectos!!!\nIntentos disponibles $intentos de 5 ");
	}
	return $objResponse;
}

function limpiar($form) {
	$objResponse = new xajaxResponse();
	$objResponse -> assign("codigo_tipo_impuesto", "value", "");
	$objResponse -> assign("descripcion", "value", "");
	$objResponse -> assign("activo", "value", "");
	$objResponse -> assign("codigo_sri", "value", "");
	return $objResponse;
}
$xajax -> register(XAJAX_FUNCTION, "validarForm");
$xajax -> register(XAJAX_FUNCTION, "ingresar");
$xajax -> register(XAJAX_FUNCTION, "limpiar");
?>