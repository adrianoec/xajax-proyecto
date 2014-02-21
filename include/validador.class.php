<?php

class validador {
    #constructor

    function validador() {
        
    }

    function isNumber($info) {
        $info = trim($info);
        //$check = eregi("^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$","$info",$info);
        $check = eregi("^[0-9]+(\.[0-9]+)*$", "$info", $info);
        if ($check) {
            return 1;
        } else {
            return 0;
        }
    }

    function isChar($info) {
        $info = trim($info);
        if (strlen($info) > 0) {
            //$check = eregi("^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$","$info",$info);
            //   $check = eregi("^[a-z]*$","$info",$info);
            $check = eregi("^[a-zñÑáéíóú\ ]*$", "$info", $info);
            if ($check) {
                return 1;
            } else {
                return 0;
            }
        } else {
            return 0;
        }
    }

    function isCadena($info) {
        // $check = eregi("^[a-z0-9ñÑáéíóú\ ]*$","$info",$info);
        $l = strlen(trim($info));
        if ($l > 0) {
            $check = true;
        } else
            $check = false;
        if ($check) {
            return 1;
        } else {
            return 0;
        }
    }

    function isFecha($info) {
        $info = str_replace('-', '/', $info);
        $info;
        if (strcmp($info, '0000/00/00') == 0) {
            return 1;
        } else {
            $check = eregi("^[0-9/\]{10}$", "$info", $info);
            if ($check) {
                return 1;
            } else {
                return 0;
            }
        }
    }

    function isMail($info) {
        $check = eregi("^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$", "$info", $info);
        if ($check) {
            return 1;
        } else {
            return 0;
        }
    }

    function isCedula($info) {
        $pro = substr($info, 0, 2);
        if ($pro < 25) {
            $check = eregi("^[0-9]{10}$", "$info", $info);
            if ($check) {
                return 1;
            } else {
                return 0;
            }
        } else {
            return 0;
        }
    }

    function isTelefono($info) {
        $info = trim($info);
        $info = str_replace('-', '', $info);
        if (strlen($info) > 0) {
            $pro = substr($info, 0, 2);
            if ($pro < 10 and $pro > 1 and substr($info, 2, 7) > 0) {
                $check = eregi("^[0-9]*$", "$info", $info);
                if ($check) {
                    return 1;
                } else {
                    return 0;
                }
            } else {
                return 0;
            }
        } else {
            return 0;
        }
    }

    /**
     * Compara dos fechas
     * url: http://dns.bdat.net/trucos/faqphp-v1/x338.html
     */
    function comparaFechas($fecha1, $fecha2) {
        if (preg_match("/[0-9]{4}\/[0-9]{1,2}\/[0-9]{1,2}/", $fecha1))
            list($año1, $mes1, $dia1) = split("/", $fecha1);
        if (preg_match("/[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}/", $fecha1))
            list($año1, $mes1, $dia1) = split("-", $fecha1);
        if (preg_match("/[0-9]{4}\/[0-9]{1,2}\/[0-9]{1,2}/", $fecha2))
            list($año2, $mes2, $dia2) = split("/", $fecha2);
        if (preg_match("/[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}/", $fecha2))
            list($año2, $mes2, $dia2) = split("-", $fecha2);
        $dif = mktime(0, 0, 0, $mes1, $dia1, $año1) - mktime(0, 0, 0, $mes2, $dia2, $año2);
        return ($dif);
    }

    function isAnioLectivo($info) {
        //$info=str_replace('-','/',$info);
        $anio = split('[/-]', $info);
        //print_r($anio);


        if (strcmp(trim($anio[0]), trim($anio[1]) - 1) == 0 and strcmp(trim($anio[0] + 1), trim($anio[1])) == 0) {
            return 1;
        } else {
            return 0;
        }
    }

    function isDato($info, $tipoDato) {
        if (strcasecmp($tipoDato, 'string') == 0) {
            return $this->isChar($info);
        } elseif (strcasecmp($tipoDato, 'date') == 0) {
            return $this->isFecha($info);
        } elseif (strcasecmp($tipoDato, 'int') == 0) {
            return $this->isNumber($info);
        } elseif (strcasecmp($tipoDato, 'dato') == 0) {
            return $this->isCadena($info);
        }
    }

}

?>
