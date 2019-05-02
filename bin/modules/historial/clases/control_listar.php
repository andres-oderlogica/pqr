<?php
include_once 'class_solicitud.php';
$opcion = $_POST['opcion'];
$id = $_POST['id'];
$estado = $_POST['estado'];
$disc       = new regSolicitud();	
switch ($opcion) {
	case '1':
		//echo $disc->listSolicitud();
		break;
		case '2':
			echo $disc->listSolicitud2($estado);
			break;
			case '3':
				echo $disc->listSolicitud($id);
				break;
	
	default:
		# code...
		break;
}

?>