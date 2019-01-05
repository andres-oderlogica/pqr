<?php
include_once 'notificaciones.php';
//$id = $_POST['id'];
$disc       = new listCorreo();
$res = $disc->listarNotificacion();
echo $res;
?>