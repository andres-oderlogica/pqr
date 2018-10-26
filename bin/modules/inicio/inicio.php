<?php
session_start();
  if (!isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] != 1) {
        header("location: ../../../login.php");
    exit;
        }
     
  $active_new="active";
  $active_solicitud="";
  $active_clientes="";
  $active_usuarios="";  
  $title="Inicio";
  

  require_once ("../../../config/db.php");
  require_once ("../../../config/conexion.php");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <?php include("../../../plantilla/head.php");?>
     <script src="../../../lib/js/jquery.js?v=<?php echo str_replace('.', '', microtime(true)); ?>"></script>
    <script src="../../../lib/jquery-ui.min.js?v=<?php echo str_replace('.', '', microtime(true)); ?>"></script>  
     <script src="../../../lib/jquery/jquery-2.2.3.min.js"></script> 
    
  </head>
  <body>
  <?php
  include("../../../plantilla/navbar.php");
  ?>  

 <div class="col-md-12">
      <div class="panel panel-primary">
          <div class="panel-heading"><h4>Inicio</h4></div>
              <div class="panel-body">
<center><h1><strong>Sistema P.Q.R</strong></h1></center>
                    <!--       <div class="col-md-6">
                              <label>Tipo Documento</label>
                               <select class="form-control" name="id_tipodocumento">
                                <option value ="1">CEDULA DE CIUDADANIA</option>
                                <option value ="2">TARJETA DE IDENTIDAD</option>
                                <option value ="3">CEDULA EXTRANJERO</option>
                                <option value ="4">NIT</option>
                                <option value ="5">RUT</option>
                               </select><br>
                             </div>

                              <div class="col-md-6">

                              <input class="form-control" id="documento" name="documento" placeholder="No de documento" type="text" required><br>
                              </div>
                              <div class="col-md-12">
                               <input class="form-control" id="codigo" name="codigo" placeholder="Digita el codigo" type="text" ><br>
                             </div>

                                  <div class="col-md-12">
                              <input class="form-control" required="true" id="primer_nombre" name="primer_nombre" placeholder="Digite Primer Nombre" type="text" ><br>
                              </div>

                              <div class="col-md-12">
                              <input class="form-control" id="segundo_nombre" name="segundo_nombre" placeholder="Digite Segundo Nombre" type="text" ><br>
                              </div>

                              <div class="col-md-12">
                              <input class="form-control" required="true" id="primer_apellido" name="primer_apellido" placeholder="Digite Primer Apellido" type="text" ><br>
                              </div>

                              <div class="col-md-12">
                              <input class="form-control" id="segundo_apellido" name="segundo_apellido" placeholder="Digite Segundo Apellido" type="text" ><br>
                              </div>-->






                    </div>
                </div>
            </div>


<?php
  include '../../../plantilla/footer1.php';
  ?>


</body>
</html>


