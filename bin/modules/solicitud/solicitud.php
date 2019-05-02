<?php
session_start();
  if (!isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] != 1) {
        header("location: ../../../login.php");
    exit;
        }
        if($_SESSION['perfil'] != 'Empleado')
        {
          header("location: ../../../login.php");
        }

        

  $active_new="active";
  $active_solicitud="";
  $active_clientes="";
  $active_usuarios="";  
  $title="Solicitud";
  
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <?php include("../../../plantilla/head.php");?>
    <script src="../../../lib/js/jquery.js?v=<?php echo str_replace('.', '', microtime(true)); ?>"></script>
    <script src="../../../lib/jquery-ui.min.js?v=<?php echo str_replace('.', '', microtime(true)); ?>"></script>  
     <script src="../../../lib/jquery/jquery-2.2.3.min.js"></script>      
    <script src="../../../lib/js/jquery.dataTables.min.js?v=<?php echo str_replace('.', '', microtime(true)); ?>"></script>
    <script src='../../../lib/data_table.js?v=<?php echo str_replace('.', '', microtime(true)); ?>'></script>
    
     <script src='js/solicitud.js?v=<?php echo str_replace('.', '', microtime(true)); ?>'></script>
      <script src='js/modal_ver.js?v=<?php echo str_replace('.', '', microtime(true)); ?>'></script>
      <link href="//cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css" />
     <style>
             #pre-load-web {
                width:100%;
                position:absolute;
                background:rgba(0,0,0,0.5);
                left:0px;
                top:0px;
                z-index:100000
            }
            #pre-load-web #imagen-load{
                left:50%;
                margin-left:-30px;
                position:absolute
            }
            #content{
                padding-top: 15%;
                padding-left: 20%;
                padding-right: 20%;
                text-align: center;
            }
         
            .dataTables_filter label{
                display:block !important;
            }
            #myTable_paginate{
                text-align: -webkit-center;
            }
            #myTable_info{
                font-weight: bold;
            }
           /* .panel-body {
            height: 500px;
            }*/
        </style>
  </head>
  <body>
  <?php
  include("../../../plantilla/navbar.php"); //var_dump($_SESSION['user_id']) ;
  ?>  
<div class="container-fluid">
             <div class="col-md-12">
                <div class="panel panel-primary">
                    <div class="panel-heading"><h5>Realizar Peticion Queja o Reclamo</h5></div>
                    <div class="panel-body">
                        <form id="form_solicitud" action="clases/control_solicitud.php">
                            <div class="col-md-6">
                              <label for="tipo">Elija el tipo de Solicitud:</label>
                               <select id="id_tiposolicitud" name="id_tiposolicitud" class="form-control">
                                <option value="-1" selected>---Seleccione una Opción---</option>
                                <option value="1">PETICIÓN</option>
                                <option value="2">QUEJA</option>
                                <option value="3">RECLAMO</option>
                                <option value='4'>VIVENCIA</option>
                               </select><br>                        
                            </div>  
                            <input type="hidden" name="user_id" value="<?php echo $_SESSION['user_id']; ?>">
                            <div class="col-md-12">
                              <label for="descripcion_solicitud">Nos gustaria conocer el motivo de su queja o reclamo:</label>
                              <textarea class="form-control" rows="5" id="descripcion_solicitud" name="descripcion_solicitud" required="true"></textarea><br>
                                </div>                                                              
                                  <input id="fecha" name="fecha" type="hidden" value="<?php echo date('Y-m-d');?>" > 

                                  <div class="col-md-6">
                                    <label for="tipo">Desea Subir Documentos?:</label>
                                     <select id="doc" name="doc" class="form-control">
                                      <option value="-1" selected>---Seleccione una Opción---</option>
                                      <option value="1">Subir PDF</option>                                      
                                     </select><br>  
                                     <input id="sub" name="sub" type="hidden" value="-1" >                       
                                  </div>   
                              <div id="mostrar">
                                 <!--   <div class="col-md-12">
                                       <label for="titulo">Titulo:</label>
                                       <input type="text" name="titulo" class="form-control">                    
                                   </div>  -->
                                     <input type="hidden" name="user_id" value="<?php echo $_SESSION['user_id']; ?>">
                                    <!--   <div class="col-md-12">
                                          <label for="descripcion">Descripcion:</label>
                                          <textarea class="form-control" rows="1" id="descripcion1" name="descripcion1" ></textarea><br>
                                     </div>   -->                                                           
                                      
                                  <div class="col-md-12">
                                      <input type="file" class="form-control-file" name="archivo"><br>                                     
                                  </div>    
                              </div>          
                            <div class="col-md-12">
                                <button type="submit" class="btn btn-success"><i class="glyphicon glyphicon-floppy-disk"></i> Enviar Datos</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
           <!--    <div class="col-md-8">
                <div class="panel panel-primary">
                   <div class="panel-heading"><h5>Historial PQR</h5></div>
                    <div class="panel-body">
                        <div class="table-responsive"> 
                         <div id="ver_cargas"></div>
                       </div>
                    </div>
                </div>
            </div>-->
</div>

<?php
include 'modal_ver.php';
?>
  <?php
    include '../../../plantilla/footer1.php';
  ?>
  <script src="../../../lib/bootbox.min.js"></script>
</body>
</html>


