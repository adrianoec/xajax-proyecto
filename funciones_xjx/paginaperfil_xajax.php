<?php

function mostrar($perfil) {
    $objResponse = new xajaxResponse();
    $objResponse->call("xajax_asignados", "$perfil");
    $objResponse->call("xajax_noasignados", "$perfil");
    $cmb = "<input type='button' name='btnanadir' id='btnanadir' value='>>' onclick='xajax_anadir(xajax.getFormValues(form))' /> "
            . "<br/> <br/><br/>"
            . "<input type='button' name='btnquitar' id='btnquitar' value='<<' onclick='xajax_quitar(xajax.getFormValues(form))'  />  ";
    $objResponse->assign("dvAcciones", "innerHTML", $cmb);
    return $objResponse;
}

function asignados($perfil) {
    $objDB = new Database();
    $objDB->setParametrosBD(HOST, BASE, USER, PWD);
    $objDB->getConexion();
    $objResponse = new xajaxResponse();
    $sqlUpdate = "select a.codigo, a.menu from pagina as a inner join pagina_perfil as b
        on a.codigo = b.codigo_pagina
        and b.codigo_perfil=$perfil";
    $rs = $objDB->query($sqlUpdate);
    $cmb = "<select name='cmbAsignado' id='cmbAsignado' multiple ='multiple' size='15' width='200' style='width: 200px'  >";
    if ($objDB->getNumRows() > 0) {
        while ($ln = $objDB->fetch_array($rs)) {
            $c = $ln["codigo"];
            $m = $ln["menu"];
            $cmb .="<option value='$c' >$m</option>";
        }
    }else{
        $cmb .="<option value='' >No Existen Paginas</option>";
    }
    $cmb.="</select>";
    $objResponse->assign("dvAsignados", "innerHTML", $cmb);
    return $objResponse;
}

function noasignados($perfil) {
    $objDB = new Database();
    $objDB->setParametrosBD(HOST, BASE, USER, PWD);
    $objDB->getConexion();
    $objResponse = new xajaxResponse();
    $sqlUpdate = "select distinct a.codigo, a.menu from pagina as a where padre =0
        except
        select a.codigo, a.menu from pagina as a inner join pagina_perfil as b
        on a.codigo = b.codigo_pagina
        and b.codigo_perfil=$perfil";
    $rs = $objDB->query($sqlUpdate);
    $cmb = "<select name='cmbNoAsignado' id='cmbNoAsignado' multiple ='multiple' size='15'  width='200' style='width: 200px' >";
    if ($objDB->getNumRows() > 0) {
        while ($ln = $objDB->fetch_array($rs)) {
            $c = $ln["codigo"];
            $m = $ln["menu"];
            $cmb .="<option value='$c' >$m</option>";
        }
    }else{
        $cmb .="<option value='' >No Existen Paginas</option>";
    }
    $cmb.="</select>";
    $objResponse->assign("dvNoAsignados", "innerHTML", $cmb);
    return $objResponse;
}

function anadir($form) {
    $paginas = $form['cmbNoAsignado'];
    $perfil = $form['perfil'];
    $objDB = new Database();
    $objDB->setParametrosBD(HOST, BASE, USER, PWD);
    $objDB->getConexion();
    $objResponse = new xajaxResponse();
    //$objResponse->alert("formData: " . print_r($form, true));
    foreach ($paginas as $codigo) {
        $sqlUpdate = "insert into pagina_perfil(codigo_pagina, codigo_perfil)values($codigo,$perfil); ";
        $rs = $objDB->query($sqlUpdate);
        $sqlUpdate = "insert into permiso(codigo_pagina, codigo_perfil)values($codigo,$perfil); ";
        $rs = $objDB->query($sqlUpdate);
    }
    $objResponse->call("xajax_asignados", "$perfil");
    $objResponse->call("xajax_noasignados", "$perfil");
    return $objResponse;
}

function mostrarPerfiles() {
    $objDB = new Database();
    $objDB->setParametrosBD(HOST, BASE, USER, PWD);
    $objDB->getConexion();
    $sqlUpdate = "select * from perfil where  activo=1;";
    $rs = $objDB->query($sqlUpdate);
    $numrows = $objDB->getNumRows();
    if ($numrows > 0) {
        while ($ln = $objDB->fetch_array($rs)) {
            $codigo = $ln["id"];
            $descripcion = $ln["descripcion"];
            $padres .= "<option value='$codigo'>$descripcion</option>";
        }
    } else {
        $padres = '';
    }
    return $padres;
}

function quitar($form) {
    $paginas = $form['cmbAsignado'];
    $perfil = $form['perfil'];
    $objDB = new Database();
    $objDB->setParametrosBD(HOST, BASE, USER, PWD);
    $objDB->getConexion();
    $objResponse = new xajaxResponse();

    foreach ($paginas as $codigo) {
        $sqlUpdate = "delete from pagina_perfil where codigo_pagina='$codigo' and  codigo_perfil ='$perfil'; ";
        $rs = $objDB->query($sqlUpdate);
		$sqlUpdate = "update permiso set activo=0, fecha_salida=now() where codigo_pagina='$codigo' and  codigo_perfil ='$perfil'; ";
        $rs = $objDB->query($sqlUpdate);
    }
    $objResponse->call("xajax_asignados", "$perfil");
    $objResponse->call("xajax_noasignados", "$perfil");
    return $objResponse;
}

$xajax->register(XAJAX_FUNCTION, "mostrar");
$xajax->register(XAJAX_FUNCTION, "noasignados");
$xajax->register(XAJAX_FUNCTION, "anadir");
$xajax->register(XAJAX_FUNCTION, "quitar");
$xajax->register(XAJAX_FUNCTION, "asignados");
$xajax->register(XAJAX_FUNCTION, "confirmarEliminarForm");
?>