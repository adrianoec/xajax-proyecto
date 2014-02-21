<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<?php

        session_start();
        include_once('facturacion_config.php');
        include_once (HOME.'include/xajax_conf.php');
        include_once (HOME.'include/db_conf.php');
        include_once(HOME.'funciones_xjx/tipoImpuesto_xajax.php');
        include_once (HOME.'include/xajax_conf_process.php');
        include_once (HOME.'cabecera.php');
        include_once (HOME.'menu.php');
        include_once(HOME.'formularios/tipoImpuesto_form.php');
    ?>