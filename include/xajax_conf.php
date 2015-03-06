<?php

include_once(HOME.'lib/'.XAJAX_VERSION.'/xajax_core/xajax.inc.php');
$useEncoding = "ISO-8859-1"; //"UTF-8"; ISO-8859-1
$htmlEntities = false;
$decodeUTF8 = true;

$xajax = new xajax();

$xajax->configure("outputEntities", $htmlEntities);
$xajax->configure("decodeUTF8Input", $decodeUTF8);
$xajax->configure('characterEncoding', $useEncoding);
$xajax->configure('javascript URI',HOME.'lib/'.XAJAX_VERSION);

// $xajax->configure('debug', true);

?>
