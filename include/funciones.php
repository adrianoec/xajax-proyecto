<?php

class Comun {

    function __construct() {
    
    }

    public function listaDatoEnlaceParametro($db, $nombre, $sql, $ajax, $seleccione, $todos, $selected, $parametro = '') {
        try {
            $rs = $db->query($sql);
            if (strlen($ajax) > 7) {
                $evt = $ajax;
            } else {
                $evt = '';
            }
            $nro = $db->getNumRows();
            if ($nro > 0) {
                $nombre = $nombre . '[]';
                $cmb = "<select  name='$nombre' id='$nombre' onChange='$evt' $parametro multiple />";
                if ($rs) {
                    if ($seleccione == 1) {
                        $cmb.="<option    value=''>Seleccione..</option>";
                    }
                    if ($todos == 1) {
                        $cmb.="<option value='TODOS'>Todos..</option>";
                    }
                    while ($ln = $db->fetch_array($rs)) {
                        if (strcasecmp($selected, $ln[0]) == 0) {
                            $cmb.="<option value='$ln[0]' selected>$ln[1]</option>";
                        } else {
                            $cmb.="<option value='$ln[0]'>$ln[1]</option>";
                        }
                    }
                }
                $cmb.="</select>";
            } else {
                $cmb = "<select  name='$nombre' id='$nombre' onChange='$evt' $parametro multiple />";
                if ($seleccione == 1) {
                    $cmb.="<option value=''>Seleccione..</option>";
                }
                $cmb.="<option value=''>No existen datos..</option>";
                $cmb.="</select>";
            }
            return $cmb;
        } catch (Exception $ex) {
            return -1;
        }
    }

    public function comboDatoEnlace($db,$nombre, $sql, $ajax, $seleccione, $todos, $selected) {
        try {
            $rs = $db->query($sql);
            if (strlen($ajax) > 7) {
                $evt = $ajax;
            } else {
                $evt = '';
            }
            $nro = $db->getNumRows();
            if ($nro > 0) {

                $cmb = "<select name='$nombre' id='$nombre' onChange='$evt'>";
                if ($rs) {
                    if ($seleccione == 1) {
                        $cmb.="<option    value='Seleccione'>Seleccione..</option>";
                    }
                    if ($todos == 1) {
                        $cmb.="<option value='TODOS'>TODOS..</option>";
                    }
                    while ($ln = $db->fetch_array($rs)) {
                        if (strcasecmp($selected, $ln[0]) == 0) {
                            $cmb.="<option value='$ln[0]' selected>$ln[1]</option>";
                        } else {
                            $cmb.="<option value='$ln[0]'>$ln[1]</option>";
                        }
                    }
                }
                $cmb.="</select>";
            } else {
                $cmb = "<select name='$nombre' id='$nombre' onclick=''>";
                $cmb.="<option value='TODOS'>TODOS</option>";
                $cmb.="<option value=''>No existen datos..</option>";
                $cmb.="</select>";
            }

            return $cmb;
        } catch (Exception $ex) {
            return -1;
        }
    }

    /* Combo con enlace y parametros adicionales de validaciçon DHTML */

    public function comboDatoEnlaceParametro($db,$nombre, $sql, $ajax, $seleccione, $todos, $selected, $parametro = '') {
        try {

            $rs = $db->query($sql);
            if (strlen($ajax) > 7) {
                $evt = $ajax;
            } else {
                $evt = '';
            }

            $nro = $db->getNumRows();
            if ($nro > 0) {

                $cmb = "<select $parametro name='$nombre' id='$nombre' onChange='$evt'>";
                if ($rs) {
                    if ($seleccione == 1) {
                        $cmb.="<option    value=''>Seleccione...</option>";
                    }
                    if ($todos == 1) {
                        $cmb.="<option value='TODOS'>Todos..</option>";
                    }
                    while ($ln = $db->fetch_array($rs)) {
                        if (strcasecmp($selected, $ln[0]) == 0) {
                            $cmb.="<option value='$ln[0]' selected>$ln[1]</option>";
                        } else {
                            $cmb.="<option value='$ln[0]'>$ln[1]</option>";
                        }
                    }
                }
                $cmb.="</select>";
            } else {
                $cmb = "<select name='$nombre' id='$nombre' onChange='$evt' $parametro>";
                if ($seleccione == 1) {
                    $cmb.="<option value=''>Seleccione..</option>";
                }
                $cmb.="<option value=''>No existen datos..</option>";
                $cmb.="</select>";
            }
            return $cmb;
        } catch (Exception $ex) {
            return -1;
        }
    }

    public function comboDatoEnlaceParametroDisabled($db,$nombre, $sql, $ajax, $seleccione, $todos, $selected, $parametro) {
        try {

            $rs = $db->query($sql);
            if (strlen($ajax) > 7) {
                $evt = $ajax;
            } else {
                $evt = '';
            }
            $nro = $db->getNumRows();
            if ($nro > 0) {

                $cmb = "<select $parametro disabled='true' name='$nombre' id='$nombre' onChange='$evt'>";
                if ($rs) {
                    if ($seleccione == 1) {
                        $cmb.="<option    value='SELECCIONE'>Seleccione..</option>";
                    }
                    if ($todos == 1) {
                        $cmb.="<option value='TODOS'>TODOS..</option>";
                    }
                    while ($ln = $db->fetch_array($rs)) {
                        if (strcasecmp($selected, $ln[0]) == 0) {
                            $cmb.="<option value='$ln[0]' selected>$ln[1]</option>";
                        } else {
                            $cmb.="<option value='$ln[0]'>$ln[1]</option>";
                        }
                    }
                }
                $cmb.="</select>";
            } else {
                $cmb = "<select name='$nombre' id='$nombre' onclick=''>";
                $cmb.="<option value=''>No existen datos..</option>";
                $cmb.="</select>";
            }

            return $cmb;
        } catch (Exception $ex) {
            return -1;
        }
    }

    function listaDatoSql($db,$nombre, $sql, $ajax, $size, $multiple) {
        try {
            $rs = $db->query($sql);
            if (strlen($ajax) > 7) {
                $evt = $ajax;
            } else {
                $evt = '';
            }
            $cmb = "<select name='$nombre'  id='$nombre' size='$size' onclick='$evt' $multiple >";
            if ($rs) {
                //$cmb.="<option value='Seleccione'>Seleccine..</option>";
                while ($ln = $db->fetch_array($rs)) {
                    $cmb.="<option value='$ln[0]'>$ln[1]</option>";
                }
            } else {
                $cmb.="<option value=''>No existen datos..</option>";
            }
            $cmb.="</select>";
            return $cmb;
        } catch (Exception $ex) {
            return -1;
        }
    }

    /**
     * Construye  un combo a partir del arreglo que se pasa como  parametro.
     *
     * @param string $nombre Nombre asignado al combo
     * @param array $array Arreglo de  dos columnas ej: [codigo][descripcion]
     * @param string $ajax funcion ajax a ejecutar en el evento onchange
     * @param int $seleccione 1=muestra opcion Selecciona; 0=no muestra opcion seleccione
     * @param int $todos 1=muestra opcion Todos; 0=no muestra opcion Todos
     * @param int $selected  Nro de campo preseleccionado (value)
     * @return string
     */
    public function comboDatoArreglo($nombre, $array, $ajax, $seleccione, $todos, $selected, $parametro = '') {
        try {
            if (strlen($ajax) > 7) {
                $evt = $ajax;
            } else {
                $evt = '';
            }
            $nro = $array;
            if (count($nro) > 0) {
                $cmb = "<select name='$nombre' id='$nombre' onChange='$evt' $parametro>";
                if ($seleccione == 1) {
                    $cmb.="<option value=''>Seleccine..</option>";
                }
                if ($todos == 1) {
                    $cmb.="<option value='TODOS'>Todos..</option>";
                }
                foreach ($array as $ln) {
                    if (strcasecmp($selected, $ln[0]) == 0) {
                        $cmb.="<option value='$ln[0]' selected>$ln[1]</option>";
                    } else {
                        $cmb.="<option value='$ln[0]'>$ln[1]</option>";
                    }
                }

                $cmb.="</select>";
            } else {
                $cmb = "<select name='$nombre' id='$nombre' onclick=''>";
                if ($seleccione == 1) {
                    $cmb.="<option value=''>Seleccine..</option>";
                }
                $cmb.="<option value=''>No existen datos..</option>";
                $cmb.="</select>";
            }

            return $cmb;
        } catch (Exception $ex) {
            return -1;
        }
    }

}

?>