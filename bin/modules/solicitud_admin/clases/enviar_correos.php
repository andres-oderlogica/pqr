<?php
include '../../../../core.php';
require '../../correos/PHPMailerAutoload.php';
include_once Config::$home_bin.Config::$ds.'db'.Config::$ds.'active_table.php'; 
 class Notificacion extends ADOdb_Active_Record{}
class listCorreo
{

public function enviarCorreo($solicitud, $estado){
$correo = $this->buscarCorreo($solicitud);
//var_dump($correo);
//$curso = $this->buscar($id,1);
//$estudiante = $this->buscar($id,2);
//var_dump($cor);
$asunto = "Notificacion PQR# $solicitud";
$cuerpo = "Su solicitud ha cambiado de estado a $estado, Puedes revisar tu solicitud ingresando a : http://pruebas.oderlogica.com/pqr";
$inicio = nl2br("$cuerpo\n\nEste mensaje es automatico. Favor no responder");
$mensaje = str_replace("<br />", "", $inicio);
//$correo = "juanandres12102018@gmail.com";
//$correo = "germanjativa@gmail.com";
if($correo == "" || $correo =="NULL" ){
return -1;}
else{
$mail = new PHPMailer;
/*$mail->IsSMTP();                           // telling the class to use SMTP
$mail->SMTPAuth   = true;                  // enable SMTP authentication
$mail->Host       = "smtp.gmail.com"; // set the SMTP server
$mail->Port       = 587;   */
$mail->IsSMTP();   
$mail ->SMTPSecure  =  'ssl' ;                         // telling the class to use SMTP
$mail->SMTPAuth   = true;                  // enable SMTP authentication
$mail->Host       = "smtp.gmail.com"; // set the SMTP server
$mail->Port       = 465;                     // set the SMTP port
$mail->Username   = "pqr.odontocauca@gmail.com"; // SMTP account username
$mail->Password   = "odontocauca.2018";        // SMTP account password
//$mail->setFrom($correo, 'Padre de Familia');
$mail->setFrom($correo, "Notificador PQR");
$mail->addAddress($correo, 'Recibe');
$mail->Subject  = $asunto;
//$mail->Body     = "$cuerpo <br>"."Ingrese a :". "http://127.0.0.1/pqr/". "Para revisar su solicitud<br> Este mensaje es automatico. Favor no rsponder";
$mail->Body     = $mensaje;

if(!$mail->send()) {
 // echo 'Message was not sent.';
  //echo 'Mailer error: ' . $mail->ErrorInfo;
    return -2;
} else {
  //echo 'Message has been sent.';
    return 1;
}
}
}

public function buscarCorreo($id)
  {
    $db = App::$base;
        $sql = "SELECT 
				  `solicitud`.`id_solicitud`,
				  `solicitud`.`user_id`,
				  `users`.`user_email`
				FROM
				  `solicitud`
				  INNER JOIN `seguimiento_solicitud` ON (`solicitud`.`id_solicitud` = `seguimiento_solicitud`.`id_solicitud`)
				  INNER JOIN `users` ON (`solicitud`.`user_id` = `users`.`user_id`)
				   WHERE solicitud.id_solicitud = ?
  					GROUP BY user_id";

			    $rs = $db->dosql($sql, array($id));
			    return $rs->fields['user_email'];

  }


}

?>