<?php
include_once 'class_solicitud.php';
$opcion = $_POST['opcion'];
$id     = $_POST['id'];
$disc   = new regSolicitud();
//var_dump($id);
switch ($opcion) {
	case '1':
	try {
		$disc->eliminar($id);
		echo json_encode(array('eliminado' => TRUE));
		
	} catch (Exception $ex) {
		echo json_encode(array('eliminado' => FALSE));
		
	}		
		break;
	case '2':	
		$res = $disc->buscar($id);
		echo json_encode($res);		
		break;
		case '3':
			$disc->editar($id,$desc,$letra, $num);
			break;
	default:
		# code...
		break;
}

?>