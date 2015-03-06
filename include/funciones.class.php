<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Funciones {

    private $_db;

    function __construct() {
        $objDB = new Database();
        $objDB->setParametrosBD(HOST, BASE, USER, PWD);
        $this->_db = $objDB;
    }

    function __destruct() {
        
    }

    public function setdb($link) {
        $this->_db = $link;
    }

    public function generarCombo($nombre, $sql, $accion, $seleccione, $todos, $class, $selected = "") {
        $rs = $this->_db->query($sql);
        $nro = $this->_db->getNumRows();
        error_log("generarCombo:$nro \n");
        if ($nro > 0) {
            error_log("generarCombo($nombre, $sql, $accion, $seleccione, $todos, $class, $selected = )\n");
            
            $combo = "<select name='$nombre' id='$nombre' class='$class' $accion >";
            if ($todos == true) {
                $combo .="<option value='T'>Todos</option>";
            }
            if ($seleccione == true) {
                $combo .="<option value=''>Seleccione</option>";
            }

            while ($ln = $this->_db->fetch_array($rs)) {
                $value = $ln[0];
                $des = $ln[1];
                if ($selected == $value) {
                    $combo .="<option value='$value' selected>$des</option>";
                } else {
                    $combo .="<option value='$value'>$des</option>";
                }
            }
            $combo .="</select>";
        } else {
            $combo = "<select name='$nombre' id='$nombre' class='$class' $accion >";
            $combo .="<option value=''>No existen registros!!!</option>";
            $combo .="</select>".$this->_db->getLastError();
        }
        return $combo;
    }

}

?>