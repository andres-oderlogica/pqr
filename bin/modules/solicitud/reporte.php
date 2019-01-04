<?php
include_once '../utiles/pdf_helper.php';
include_once '../utiles/code128.php';
include_once 'clases/reporte.php';
include '../../../core.php';

class reportePDF extends PDFReport  
{
	public function Render($datos)
	{
				
		$this->SetFont('Arial','B',12);
		$this->Cell(195,5,"REPORTE DE SOLICITUDES",0,0,'c');//primer cero indica que no lleve borde
		$this->Ln();
		$this->Ln();
		$this->Ln();
       
       if(count($datos) > 0){
		foreach ($datos as $d) {
		$this->SetFont('Arial','B',12);
		$this->Cell(70, 5, "Sufijo", 0, 0, 'L');$this->Cell(70, 5, "Estado", 0, 0, 'L');
		$this->Ln();
		$this->SetFont('Arial','',12);
		$this->Cell(70, 5, "{$d['sufijo_solicitud']}", 0, 0, 'L');$this->Cell(40, 5, "{$d['des_estado']}", 0, 0, 'L');
		$this->Ln();
		$this->SetFont('Arial','B',12);
		$this->Cell(30, 5, "Descripcion", 0, 0, 'L');
		$this->Ln();
		$this->SetFont('Arial','',12);
		$this->Cell(40, 5, "{$d['descripcion_solicitud']}", 0, 0, 'L');
		$this->SetFont('Arial','B',12);
		$this->Ln();
		$this->Cell(30, 5, "Observacion. Estado", 0, 0, 'L');
		$this->Ln();
		$this->SetFont('Arial','',12);
		$this->Cell(40, 5, "{$d['descripcion_estado']}", 0, 0, 'L');
		//$this->Cell(40, 5, "{$d['estado_solicitud']}", 0, 0, 'L');
		$this->Ln();
		$this->Ln();
		}
	      }
	     else
	     {
	     	$this->Cell(195, 5, "No hay solicitudes, intenta con otros filtros", 0, 0, 'L');
		$this->Ln();
	     }
		
		
	}

	
	
}

$pdf = new reportePDF('P','mm','Letter');
$reporte= new reporte();
$idsUltimoSeguimiento=$reporte->get_ids_ultimo_seguimiento();
//var_dump($_GET['id_estado'],$_GET['fecha_ini'],$_GET['fecha_fin']);
$solicitudes=$reporte->get_solicitudes($_GET['id_estado'],$_GET['fecha_ini'],$_GET['fecha_fin']);

$finales=array();
foreach ($idsUltimoSeguimiento as $id) {
	foreach ($solicitudes as $solicitud) {
		if($id==$solicitud['id_seguimiento'])
		{
			$finales[]=$solicitud;
		}
	}
}

//var_dump($finales);
$pdf->render($finales);
$pdf->Output();	
?>