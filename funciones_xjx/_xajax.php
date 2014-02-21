<?php


    function validarForm($form, $opcion){
    $codigo= strtoupper(trim($form['codigo']));

                $descripcion= strtoupper(trim($form['descripcion']));

                $pagina= strtoupper(trim($form['pagina']));

                $activo= strtoupper(trim($form['activo']));

                
    	 global $enlace, $objPaginacion, $objComun;

    	 $objResponse = new xajaxResponse();

    	 $msg="";
    
                    if(strcasecmp($codigo,'')==0 or  strcasecmp($codigo,'seleccione')==0){
                    	 $msg.="\nINGRESE CODIGO...";
                    }
                
                    if(strcasecmp($descripcion,'')==0 or  strcasecmp($descripcion,'seleccione')==0){
                    	 $msg.="\nINGRESE DESCRIPCION...";
                    }
                
                    if(strcasecmp($pagina,'')==0 or  strcasecmp($pagina,'seleccione')==0){
                    	 $msg.="\nINGRESE PAGINA...";
                    }
                
                  if(strcasecmp($activo,'')==0 or  strcasecmp($activo,'seleccione')==0){
                  	 $msg.="\nSELECCIONE ACTIVO...";
                  }
                
    	 if(strlen(trim($msg))>0){
            $objResponse->alert($msg);
            return $objResponse;
        }else{
            if($opcion==0){ // inserta
                $objResponse->call("xajax_ingresar",$form);
            }else{ // actualizar
                $objResponse->call("xajax_actualizar",$form);
            }
        }
    	 return $objResponse;

    }

    function ingresar($form){

    $codigo= strtoupper(trim($form['codigo']));

                $descripcion= strtoupper(trim($form['descripcion']));

                $pagina= strtoupper(trim($form['pagina']));

                $activo= strtoupper(trim($form['activo']));

                
    	 global  $objPaginacion, $objComun;

    $objDB = new Database();
    $objDB->setParametrosBD(HOST, BASE, USER, PWD);
    $objDB->getConexion();
    	 $objResponse = new xajaxResponse();

    	 $sqlInsert = "insert into  (descripcion,pagina,activo) values" ;

    	 $sqlInsert .= "('$descripcion','$pagina','$activo');" ;

    	 $rs=$objDB->query($sqlInsert);

    	 $objResponse->alert("Registrado...");
    	 return $objResponse;

    }

    function actualizar($form){

    $codigo= strtoupper(trim($form['codigo']));

                $descripcion= strtoupper(trim($form['descripcion']));

                $pagina= strtoupper(trim($form['pagina']));

                $activo= strtoupper(trim($form['activo']));

                
    	 global  $objPaginacion, $objComun;

    $objDB = new Database();
    $objDB->setParametrosBD(HOST, BASE, USER, PWD);
    $objDB->getConexion();
    	 $objResponse = new xajaxResponse();

    	 $sqlUpdate = "update   set  descripcion= '$descripcion'
, pagina= '$pagina'
, activo= '$activo'
 where  codigo= '$codigo'
" ;

    	 $rs=$objDB->query($sqlUpdate);

    	 $objResponse->alert("Actualizado...");
    	 return $objResponse;

    }

    
function confirmarEliminarForm($form){

    	 global $enlace, $objPaginacion, $objComun;

    	 $objResponse = new xajaxResponse();

    $objResponse->confirmCommands(1, "Deseas eliminar el registro?");
    $objResponse->call("xajax_eliminar",$form);
    	 return $objResponse;

    }

    
function eliminar($form){

    $codigo= strtoupper(trim($form['codigo']));

                $descripcion= strtoupper(trim($form['descripcion']));

                $pagina= strtoupper(trim($form['pagina']));

                $activo= strtoupper(trim($form['activo']));

                
    	 global $objPaginacion, $objComun;

    $objResponse = new xajaxResponse();
    $objDB = new Database();
    $objDB->setParametrosBD(HOST, BASE, USER, PWD);
    $objDB->getConexion();
    	 $objResponse = new xajaxResponse();

    	 $sqlUpdate = "update   set activo=0 where  codigo= '$codigo'
" ;

    	 $rs=$objDB->query($sqlUpdate);

    	 $objResponse->alert("Desactivado...");
    	 return $objResponse;

    }


function limpiar($form){

    	 $objResponse = new xajaxResponse();

$objResponse->assign("codigo","value","");
$objResponse->assign("descripcion","value","");
$objResponse->assign("pagina","value","");
$objResponse->assign("activo","value","");

    	 return $objResponse;

    }


function seleccionar($id){

    	 $objResponse = new xajaxResponse();

    
    $objDB = new Database();
    $objDB->setParametrosBD(HOST, BASE, USER, PWD);
    $objDB->getConexion();

    $sql = " select *    from  
    where  XXXXXXXXXXXX  like '%$query%' ";

    $result = $objDB->query($sql);
    $numCols = $objDB->getNumCols();

    $ln=$objDB->fetch_array($result);
    
$objResponse->assign("codigo","value","$nombre");
$objResponse->assign("descripcion","value","$nombre");
$objResponse->assign("pagina","value","$nombre");
$objResponse->assign("activo","value","$nombre");

    
    	 return $objResponse;

    }


function consultar($form) {
    $query = trim($form["txtConsulta"]);
    $objResponse = new xajaxResponse();

    $objDB = new Database();
    $objDB->setParametrosBD(HOST, BASE, USER, PWD);
    $objDB->getConexion();

    $sql = " select *    from  
    where  XXXXXXXXXXXX  like '%$query%' ";

    $result = $objDB->query($sql);
    $numCols = $objDB->getNumCols();

    $nuevo = "<img src='".HOME."imagenes/page_white_text.png'/>";
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
        $tb="<tr>";
        for($i=0;$i<$numCols;$i++){
            $dato = $ln[$i];
            $tb.="<td id = 'dv_$i'.'_$id'>$dato</td>";
        }
        $actualizar = "<img src='".HOME."imagenes/page_white_edit.png'/>";
        $actalizarLnk = " style='cursor:pointer' onclick = 'xajax_seleccionar($id)' ";
        $eliminar = "<img src='".HOME."imagenes/cross.png'/>";
        $eliminarLnk = " style='cursor:pointer' onclick = 'xajax_confirmarEliminarForm($id)' ";
        $tabla.=$tb." <td $actalizarLnk >$actualizar</td><td $eliminarLnk >$eliminar</td>   </tr>";
    }
    $tabla.="</tbody></table>";
    $objResponse->script('function loadTabla(){$("table").tablesorter({ widgets: [\'zebra\']});  }  $(function() {$("table") .tablesorter({ widgets: [\'zebra\']});  });');
    $objResponse->assign("dvRespuesta", "innerHTML", "$tabla");
    return $objResponse;
}







    $xajax->register(XAJAX_FUNCTION,"validarForm");

    $xajax->register(XAJAX_FUNCTION,"ingresar");

    $xajax->register(XAJAX_FUNCTION,"actualizar");

    $xajax->register(XAJAX_FUNCTION,"eliminar");

    $xajax->register(XAJAX_FUNCTION,"limpiar");

    $xajax->register(XAJAX_FUNCTION,"confirmarEliminarForm");

    $xajax->register(XAJAX_FUNCTION,"consultar");

    $xajax->register(XAJAX_FUNCTION,"seleccionar");

    ?>