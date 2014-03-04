<?php
$fileForm = fopen("./formularios/$txtNombreArchivo" . "_form.php", "w+");
if (fwrite($fileForm, $tabla)) {
	$objResponse -> alert("formulario creado...");
}
fclose($fileForm);

$objDB = new Database();
	$objDB -> setParametrosBD(HOST, BASE, USER, PWD);
	$objDB -> getConexion();
	$objResponse = new xajaxResponse();
	$sqlInsert = "select count(*) as cantidad from usuario where correo_electronico='$usuario' and clave='$clave'";
	$rs = $objDB -> query($sqlInsert);
	$numrows = $objDB -> getNumRows();
	


?>