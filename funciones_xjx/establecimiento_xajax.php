<?php


    function validarForm($form, $opcion){
    $codigo_establecimiento= strtoupper(trim($form['codigo_establecimiento']));

                $codigo_emisor= strtoupper(trim($form['codigo_emisor']));

                $numero_establecimiento= strtoupper(trim($form['numero_establecimiento']));

                $direccion= strtoupper(trim($form['direccion']));

                
    	 global $enlace, $objPaginacion, $objComun;

    	 $objResponse = new xajaxResponse();

    	 $msg="";
    
                    if(strcasecmp($codigo_establecimiento,'')==0 or  strcasecmp($codigo_establecimiento,'seleccione')==0){
                    	 $msg.="\nINGRESE CODIGO ESTABLECIMIENTO...";
                    }
                
                  if(strcasecmp($codigo_emisor,'')==0 or  strcasecmp($codigo_emisor,'seleccione')==0){
                  	 $msg.="\nSELECCIONE CODIGO EMISOR...";
                  }
                
                    if(strcasecmp($numero_establecimiento,'')==0 or  strcasecmp($numero_establecimiento,'seleccione')==0){
                    	 $msg.="\nINGRESE NUMERO ESTABLECIMIENTO...";
                    }
                
                    if(strcasecmp($direccion,'')==0 or  strcasecmp($direccion,'seleccione')==0){
                    	 $msg.="\nINGRESE DIRECCION...";
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

    $codigo_establecimiento= strtoupper(trim($form['codigo_establecimiento']));

                $codigo_emisor= strtoupper(trim($form['codigo_emisor']));

                $numero_establecimiento= strtoupper(trim($form['numero_establecimiento']));

                $direccion= strtoupper(trim($form['direccion']));

                
    	 global  $objPaginacion, $objComun;

    $objDB = new Database();
    $objDB->setParametrosBD(HOST, BASE, USER, PWD);
    $objDB->getConexion();
    	 $objResponse = new xajaxResponse();

    	 $sqlInsert = "insert into establecimiento (codigo_emisor,numero_establecimiento,direccion) values" ;

    	 $sqlInsert .= "('$codigo_emisor','$numero_establecimiento','$direccion');" ;

    	 $rs=$objDB->query($sqlInsert);

    	 $objResponse->alert("Registrado...");
    	 return $objResponse;

    }

    function actualizar($form){

    $codigo_establecimiento= strtoupper(trim($form['codigo_establecimiento']));

                $codigo_emisor= strtoupper(trim($form['codigo_emisor']));

                $numero_establecimiento= strtoupper(trim($form['numero_establecimiento']));

                $direccion= strtoupper(trim($form['direccion']));

                
    	 global  $objPaginacion, $objComun;

    $objDB = new Database();
    $objDB->setParametrosBD(HOST, BASE, USER, PWD);
    $objDB->getConexion();
    	 $objResponse = new xajaxResponse();

    	 $sqlUpdate = "update  establecimiento set  codigo_emisor= '$codigo_emisor'
, numero_establecimiento= '$numero_establecimiento'
, direccion= '$direccion'
 where  codigo_establecimiento= '$codigo_establecimiento'
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

    $codigo_establecimiento= strtoupper(trim($form['codigo_establecimiento']));

                $codigo_emisor= strtoupper(trim($form['codigo_emisor']));

                $numero_establecimiento= strtoupper(trim($form['numero_establecimiento']));

                $direccion= strtoupper(trim($form['direccion']));

                
    	 global $objPaginacion, $objComun;

    $objResponse = new xajaxResponse();
    $objDB = new Database();
    $objDB->setParametrosBD(HOST, BASE, USER, PWD);
    $objDB->getConexion();
    	 $objResponse = new xajaxResponse();

    	 $sqlUpdate = "update  establecimiento set activo=0 where  codigo_establecimiento= '$codigo_establecimiento'
" ;

    	 $rs=$objDB->query($sqlUpdate);

    	 $objResponse->alert("Desactivado...");
    	 return $objResponse;

    }


function limpiar($form){

    	 $objResponse = new xajaxResponse();

$objResponse->assign("codigo_establecimiento","value","");
$objResponse->assign("codigo_emisor","value","");
$objResponse->assign("numero_establecimiento","value","");
$objResponse->assign("direccion","value","");

    	 return $objResponse;

    }


function seleccionar($id){

    	 $objResponse = new xajaxResponse();

    
    $objDB = new Database();
    $objDB->setParametrosBD(HOST, BASE, USER, PWD);
    $objDB->getConexion();

    $sql = " select *    from establecimiento 
    where  XXXXXXXXXXXX  like '%$query%' ";

    $result = $objDB->query($sql);
    $numCols = $objDB->getNumCols();

    $ln=$objDB->fetch_array($result);
    
$objResponse->assign("codigo_establecimiento","value","$nombre");
$objResponse->assign("codigo_emisor","value","$nombre");
$objResponse->assign("numero_establecimiento","value","$nombre");
$objResponse->assign("direccion","value","$nombre");

    
    	 return $objResponse;

    }


function consultar($form) {
    $query = trim($form["txtConsulta"]);
    $objResponse = new xajaxResponse();

    $objDB = new Database();
    $objDB->setParametrosBD(HOST, BASE, USER, PWD);
    $objDB->getConexion();

    $sql = " select *    from establecimiento 
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