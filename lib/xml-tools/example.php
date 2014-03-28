<?php

require_once "XMLTools.php";

$xmltools = new XMLTools();

$isvalid = $xmltools->validate('xml_1.1.1/factura.xml', 'factura');

    echo "<pre>";
    print_r($isvalid);
    echo "</pre>";


