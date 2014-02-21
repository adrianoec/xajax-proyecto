<?php

include_once '../lib/nusoap-0.9.5/lib/nusoap.php';
include_once '../include/db_conf.php';
include_once '../include/db.php';

$server = new soap_server();

$wsdl_addr = '';
$server->configureWSDL('', '', $wsdl_addr);

$server->wsdl->addComplexType('wsPermisos', 'complexType', 'struct', 'all', '', array(
    'menu' => array('name' => 'menu', 'type' => 'tns:status_mssg'),
    'consultar' => array('name' => 'consulta', 'type' => 'xsd:string'),
    'guardar' => array('name' => 'guardar', 'type' => 'xsd:string'),
    'actualizar' => array('name' => 'actualizar', 'type' => 'xsd:string'),
    'eliminar' => array('name' => 'eliminar', 'type' => 'xsd:string')
        )
);

$in = array(
    'pagina' => 'xsd:string',
    'perfil' => 'xsd:string',
    'usuario' => 'xsd:int',
);

$out = array('return' => 'tns:wsPemisos');
$namespace = 'uri:wsPemisos';
$soapaction = 'uri:wsPemisoss';
$doc = 'Retorna los permisos que el usuario tienen en la pagina';
$server->register('wsPemisos', $in, $out, $namespace, $soapaction, 'rpc', 'encoded', $doc);

$server->service($HTTP_RAW_POST_DATA);
exit;

// **** Function for the webservice
function wsPermisos($pagina, $perfil, $usuario) {
    $objdb =new Database();
    return $fin_data;
}

?>