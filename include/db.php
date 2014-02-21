<?php

class Database {

    private $_dbname, $_dbhost, $_dbuser, $_dbpasswd, $_connection_status;
    public $_dblink;
    public $save_queries = false; //Asignar a true si se desea obtener la bitacora de los SQL ejecutados
    public $arr_queries = array();
    private $_numRows, $_numCols, $_affectedRows, $_lastError, $_lastOid;
  
    private $_pathlog;

    function __construct() {
        
    }

    function __destruct() {
        $this->close();
    }

    public function getNumRows() {
        return $this->_numRows;
    }

    public function getNumCols() {
        return $this->_numCols;
    }

    public function getAffectedRows() {
        return $this->_affectedRows;
    }

    public function getLastError() {
        return $this->_lastError;
    }

    public function getLastOID() {
        return $this->_lastOid;
    }

    /*
     * Obtener la conexion a la BD
     * @access public
     * return enlace conexion BD
     */

    public function getConexion() {
        return $this->_dblink;
    }

    public function query($sql) {
        $result = false;
        if (is_resource($this->_dblink) && ( $this->_connection_status === PGSQL_CONNECTION_OK )) {
            $result = pg_query($this->_dblink, $sql);
            if ($this->save_queries) {
                $this->arr_queries[] = $sql;
            }
            if ($result == true) {
                $this->_numRows = pg_num_rows($result);
                $this->_numCols = pg_num_fields($result);
                $this->_affectedRows = pg_affected_rows($result);
                $this->_lastOid = pg_last_oid($result);
                $this->_lastError = null;
            } else {
                $this->_lastError = pg_last_error($this->_dblink);
                $this->_numRows = null;
                $this->_numCols = null;
                $this->_affectedRows = null;
                $this->_lastOid = null;
            }
        }
        return $result;
    }

    public function fetch_assoc($result) {
        return pg_fetch_assoc($result);
    }

    public function fetch_array($result) {
        return pg_fetch_array($result);
    }

    public function field_name($result) {
        $arr = array();
        for ($i = 0; $i < $this->getNumCols(); $i++) {
            $arr[] = pg_field_name($result, $i);
        }
        return $arr;
    }

    /**
     * Metodo que setea los datos de conexion a la BD
     * @access public
     * @param string $dbhost Nombre o IP del host de la BD
     * @param string $dbname Nombre BD
     * @param string $dbuser Usuario de BD
     * @param string $dbpasswd Clave usuario BD
     * @return boolean {true|false}
     */
    public function setParametrosBD($dbhost, $dbname, $dbuser, $dbpasswd) {
        $this->_dbhost = $dbhost;
        $this->_dbname = $dbname;
        $this->_dbuser = $dbuser;
        $this->_dbpasswd = $dbpasswd;
        return $this->connect();
    }

    /**
     * Funcion que retorna un boolean dependiendo si pudo o no conectarse a la BD
     * en base a las configuraciones que fueron seteadas en el metodo setParametrosBD
     * @access private
     * @return boolean
     */
    private function connect() {
        $conn_string = "host=" . $this->_dbhost . " port=5432 dbname=" . $this->_dbname . " user=" . $this->_dbuser . " password=" . $this->_dbpasswd;

        $this->_dblink = pg_connect($conn_string);
        if ($this->_dblink) {
            $this->_connection_status = pg_connection_status($this->_dblink);
            return true;
        }
        return false;
    }

    /**
     * Ejecuta una sentencia SQL
     * @access private
     * @param string $tSql Cadena SQL a ser ejecutada
     * @return resource $res
     */
    private function _query($tSql) {
        $res = false;

        if (is_resource($this->_dblink) && ( $this->_connection_status === PGSQL_CONNECTION_OK )) {
            $res = pg_query($this->_dblink, $tSql);
        }
        return $res;
    }

    /*
     * Permite ejecutar sentencias SQL SELECT y obtiene los registros en un array asociativo
     * @access public
     * @param string $tSql Cadena SQL a ser ejecutada
     * @return array asociativo si el SQL tuvo exito, boolean si hubo algun problema $result
     */

    public function select($tSql) {
        $result = false;
        $res = $this->_query($tSql);

        if (!is_bool($res)) {
            $result = array();
            while ($row = pg_fetch_assoc($res)) {
                $result[] = $row;
            }
            pg_free_result($res);
        } else {
            $php = $_SERVER["PHP_SELF"];
            error_log(date("Y-m-d H:i:s") . " [/home/lib/db.php] [$php] [$tSql] [" . pg_last_error($this->_dblink) . "]\n", 3, $this->_pathlog);
        }
        return $result;
    }

    /**
     * Permite ejecutar multiples setencias sql separadas por ';', por ejm: "select * from table where col1 BETWEEN 1 and 2; SELECT now();"
     * @access public
     * @param string $mSql a ser ejecutada
     * @return array que en cada posicion contiene un subarray con los datos obtenidos por cada sql, boolean si existio algun problema en la consulta
     * 	array(2) {  [0]=> array(2) { [0]=> array(1) { ["col1"]=> string(1) "1" } [1]=> array(1) { ["col1"]=> string(1) "2" } }
      [1]=> array(1) { [0]=> array(1) { ["now"]=> string(29) "2012-02-13 10:09:28.430723-05" } } }
     */
    public function multi_query($mSql) {
        $res = false;

        if (is_resource($this->_dblink) && ( $this->_connection_status === PGSQL_CONNECTION_OK ) && pg_send_query($this->_dblink, $mSql)) {

            if ($this->save_queries) {
                $this->arr_queries[] = $mSql;
            }

            do {
                $rst = pg_get_result($this->_dblink);

                $ban = (is_resource($rst)) ? true : false;

                if ($ban) {
                    $arr_query = array();
                    while ($row = pg_fetch_assoc($rst)) {
                        $arr_query[] = $row;
                    }
                    pg_free_result($rst);
                }

                if (isset($arr_query) && $ban) {
                    $res[] = $arr_query;
                }
            } while ($ban);
        }
        return $res;
    }

    /**
     * Retorna el ultimo query ejecutado
     * @access	public
     * @return	false si no existe sentencias sql ejecutas, caso contrario retorna la mas reciente
     */
    public function last_query() {
        return end($this->arr_queries);
    }

    /**
     * Cierra la conexion a la BD
     */
    private function close() {
        if (!empty($this->_dblink)) {
            pg_close($this->_dblink);
            unset($this->_dblink);
        }
    }

}

?>