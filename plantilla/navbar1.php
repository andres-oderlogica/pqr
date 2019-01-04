	<?php
  session_start();
		if (isset($title))
		{
	?>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#"></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">

        <?php
        if($_SESSION['perfil'] == 'Administrador')
        {
        ?>
        
        <li class="nav-item <?php echo $active_new;?>"><a href="../solicitud_admin/admin_solicitud.php"> Revisar Solicitudes <span class="sr-only">(current)</span></a></li>
        <li class="nav-item <?php echo $active_revisar;?>"><a href="../revisarpdf"></i> Revisar Archivos</a></li>
        <li><a href="../encuesta/gestion_encuesta_pregunta.php"></i> Gestionar encusta y preguntas</a></li>
              <li><a href="../encuesta/gestion_opciones.php"></i> Gestionar opciones</a></li>
              <li><a href="../revisarpdf"></i> Ver Resultados</a></li>
              <li><a href="../solicitud/filtros_reporte.php"></i> Reporte Solicitudes</a></li>
              <li><a href="../encuesta/filtros_reporte.php"></i> Reporte Encuestas</a></li>
              <li><a href="../graficas/reporte_grafico.php"></i> Reporte Grafico</a></li>
               
    		<li class="nav-item <?php echo $active_usuarios;?>"><a href="../usuarios/usuarios.php">Usuarios</a></li>

        <?php
        }
        if($_SESSION['perfil'] == 'Gerente')
        {
        ?>   
        
        <li class="<?php echo $active_solicitud;?>"><a href="../solicitud/solicitud.php"></i> Realizar Peticion</a></li>
         <li class=""><a href="#"></i> menu5</a></li>
        <li class="<?php echo $active_productos;?>"><a href="#"></i> menu3</a></li>
        


        <?php
        }
        if($_SESSION['perfil'] == 'Empleado')
        {
        ?>
   
        <li class="<?php echo $active_new;?>"><a href="../solicitud/solicitud.php"></i> Realizar Peticion</a></li> 
        <li class="<?php echo $active_solicitud;?>"><a href="../historial/ver_historial.php"></i> Historial Solicitudes</a></li>   
        <li class="<?php echo $active_subir;?>"><a href="../subirpdf/lista.php"></i> Ver PDF Subidos</a></li> 
        <li><a href="../encuesta/responder_encuesta.php"></i> Responder Encuesta</a></li>  
        <?php
        }
        ?>


        <li><a href="../../../login.php?logout"><i class='glyphicon glyphicon-off'></i> Cerrar Sesion</a></li>
       </ul>
      <ul class="nav navbar-nav navbar-right">
        
		<!--<li><a href="../../../login.php?logout"><i class='glyphicon glyphicon-off'></i> Salir</a></li>-->
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
	<?php
		}
	?>