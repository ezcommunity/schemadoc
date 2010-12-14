<?php
//error_reporting( 0 );

ini_set('include_path', ini_get('include_path').':../../ezpublish:');

require 'autoload.php';
require_once 'dbtable.php';

// All kernel classes
$kernelClasses = require 'autoload/ezp_kernel.php';

// Remove refelction exceptions
unset($kernelClasses['eZINIAddonPackageHandler']);
unset($kernelClasses['eZPDFExport']);
unset($kernelClasses['eZRSSExport']);

// Selected extension classes
$allExtClasses = require 'var/autoload/ezp_extension.php';
$extNames = array('ezwebin', 'ezflow', 'ezjscore', 'ezgmaplocation', 'ezstarrating');
$selectedExtClasses = array();
foreach ( $allExtClasses as $class => $file )
{
    foreach ( $extNames as $name )
    {
        if ( strpos( $file, $name ) and strpos( $file, 'classes' ) ) {
            $selectedExtClasses[$class] = $file;
            break;
        }
    }
}

$autoloadClasses = array_merge( $kernelClasses, $selectedExtClasses );
ksort( $autoloadClasses );

$dbtables = array();
foreach ( $autoloadClasses as $class => $file )
{
    try {
        $refClass = new ReflectionClass( $class );
    } catch (Exception $e) {
        echo $e . "\n";
        continue;
    }

    if ( $refClass->isSubclassOf( 'eZPersistentObject') )
    {
        $def = $class::definition( );
        $classname = $def['class_name'];
        $dbname = $def['name'];
        $fields = array();
        $foreignkeys = array();
        
        foreach ($def['fields'] as $fkey => $fvalue)
        {
            if ( is_array($fvalue) and 
                 array_key_exists('foreign_class', $fvalue) and 
                 array_key_exists('foreign_attribute', $fvalue) )
            {
                $foreignkeys[$fkey] = $fvalue;
            }
            else 
            {
                $fields[$fkey] = $fvalue;
            }
        }
        // Debug
//        if (empty($foreignkeys)) {
//            echo $classname . "(" . $dbname . ") has no foreign keys \n";
//        }
        $dbtables[$classname] = new dbTable($classname, $dbname, $fields, $foreignkeys);
    }
}


// alter table ezbasket add foreign key(order_id) references ezorder(id);
$format = "alter table %s add foreign key(%s) references %s(%s);\n";

foreach ($dbtables as $tbl)
{
    foreach ($tbl->fkeys as $k => $v)
    {
        if (array_key_exists( $v['foreign_class'], $dbtables ) )
        {
            $foreign_table = $dbtables[$v['foreign_class']];
            printf($format, $tbl->db_name, $k, $foreign_table->db_name, $v['foreign_attribute']);
        }
    }
}
?>
