<?php
session_start();
include '../../../../core.php';
 
class estado
{
  public $id;

  public function listar()
  {
    $db = App::$base;
        $sql = "SELECT
    id_estado
    , descripcion
FROM
    estado";
                    $rs = $db->dosql($sql, array());

    while (!$rs->EOF) 
                   {

                    $res[] = array( 
                     "id_estado" => $rs->fields['id_estado'],
                     "descripcion" => $rs->fields['descripcion']                     
                      );

                    $rs->MoveNext();      
                   } 
                   return $res;

  }

}

?>