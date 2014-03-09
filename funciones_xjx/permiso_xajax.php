<?php

function actualizar($opcion, $codigo, $value) {

    global $objPaginacion, $objComun;

    $objDB = new Database();
    $objDB->setParametrosBD(HOST, BASE, USER, PWD);
    $objDB->getConexion();
    $objResponse = new xajaxResponse();

    if ($value == 1) {
        $value = 0;
    } else {
        $value = 1;
    }

    //$objResponse->alert(" $opcion, $codigo ,$value ");
    //acceso_menu, acceso_consulta, acceso_guardar, acceso_actualizar, acceso_eliminar
    if ($opcion == 1) {
        $sqlUpdate = "update  permiso set  acceso_menu = '$value' where  codigo= '$codigo'";
    } elseif ($opcion == 2) {
        $sqlUpdate = "update  permiso set  acceso_consulta = '$value' where  codigo= '$codigo'";
    } elseif ($opcion == 3) {
        $sqlUpdate = "update  permiso set  acceso_guardar = '$value' where  codigo= '$codigo'";
    } elseif ($opcion == 4) {
        $sqlUpdate = "update  permiso set  acceso_actualizar = '$value' where  codigo= '$codigo'";
    } elseif ($opcion == 5) {
        $sqlUpdate = "update  permiso set  acceso_eliminar = '$value' where  codigo= '$codigo'";
    }

    $rs = $objDB->query($sqlUpdate);
    $opciones = "chk_" . $opcion . "_$codigo";
    $objResponse->assign($opciones, "value", $value);
    return $objResponse;
}

function consultar($form) {
    
    $query = trim($form["cmbPerfil"]);
    $objResponse = new xajaxResponse();

    $objDB = new Database();
    $objDB->setParametrosBD(HOST, BASE, USER, PWD);
    $objDB->getConexion();

    $sql = "select a.codigo, a.codigo_perfil, '' as perfil, b.pagina, a.acceso_menu, a.acceso_consulta, a.acceso_guardar, a.acceso_actualizar, a.acceso_eliminar 
from permiso as a inner join pagina as b
on a.codigo_pagina = b.codigo 
and a.activo=1
and a.codigo_perfil = $query
";

    $result = $objDB->query($sql);
    $numCols = $objDB->getNumCols();

    $nuevo = "<img src='" . HOME . "imagenes/page_white_text.png'/>";
    $nuevoLnk = " style='cursor:pointer' onclick = 'xajax_nuevo()' ";

    $tabla = "<form name='fadm' id='fadm'> <table border='0' align ='center' class='tablesorter' cellspacing='1'><thead><tr>";
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
            if ($i == 4) {
                if ($dato == 1) {
                    $checked = " checked='checked' ";
                } else {
                    $checked = "";
                }
                $tb.="<td id = 'dv_$i'.'_$id'><input type='checkbox' id='chk_1_$id' name='chk_1_$id' value='$dato' $checked onchange='xajax_actualizar(1,$id, this.value)' />  </td>";
            } elseif ($i == 5) {
                if ($dato == 1) {
                    $checked = " checked='checked' ";
                } else {
                    $checked = "";
                }
                $tb.="<td id = 'dv_$i'.'_$id'><input type='checkbox' id='chk_2_$id' name='chk_2_$id' value='$dato' $checked onchange='xajax_actualizar(2,$id, this.value)' />  </td>";
            } elseif ($i == 6) {
                if ($dato == 1) {
                    $checked = " checked='checked' ";
                } else {
                    $checked = "";
                }
                $tb.="<td id = 'dv_$i'.'_$id'><input type='checkbox' id='chk_3_$id' name='chk_3_$id' value='$dato' $checked onchange='xajax_actualizar(3,$id, this.value)' />  </td>";
            } elseif ($i == 7) {
                if ($dato == 1) {
                    $checked = " checked='checked' ";
                } else {
                    $checked = "";
                }
                $tb.="<td id = 'dv_$i'.'_$id'><input type='checkbox' id='chk_4_$id' name='chk_4_$id' value='$dato' $checked onchange='xajax_actualizar(4,$id, this.value)' />  </td>";
            } elseif ($i == 8) {
                if ($dato == 1) {
                    $checked = " checked='checked' ";
                } else {
                    $checked = "";
                }
                $tb.="<td id = 'dv_$i'.'_$id'><input type='checkbox' id='chk_5_$id' name='chk_5_$id' value='$dato' $checked onchange='xajax_actualizar(5,$id, this.value)' />  </td>";
            } else {
                $tb.="<td id = 'dv_$i'.'_$id'>$dato</td>";
            }
        }
        $tabla.=$tb . " <td $actalizarLnk >$actualizar</td><td $eliminarLnk >$eliminar</td>   </tr>";
    }
    $tabla.="</tbody> </table> </form>";
    
    $objResponse->assign("dvRespuesta", "innerHTML", "$tabla");
    $objResponse->script('loadTabla();');
    return $objResponse;
}

function perfiles($selected) {
    $objDB = new Database();
    $objFun = new Comun();
    $objDB->setParametrosBD(HOST, BASE, USER, PWD);
    $objDB->getConexion();

    $sql = "select * from perfil  where  activo = 1";
    return $objFun->comboDatoEnlace($objDB, "cmbPerfil", $sql, "", 0, 0, $selected);
}

$xajax->register(XAJAX_FUNCTION, "actualizar");


$xajax->register(XAJAX_FUNCTION, "consultar");
?>