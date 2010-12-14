<?php

class dbTable
{
    var $class_name;
    var $db_name;
    var $fields;
    var $fkeys;

    public function __construct($cn, $dn, $f, $k)
    {
        $this->class_name = $cn;
        $this->db_name = $dn;
        $this->fields = $f;
        $this->fkeys = $k;
    }
}
?>