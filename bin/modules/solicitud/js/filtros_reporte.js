$(function ()
{

estados();

$( "#b_reporte" ).on( "click", function() {
    $("#reporte").html('<iframe src="reporte.php?id_estado='+$("#estados").val()+'&fecha_ini='+$("#fecha_inicial").val()+'&fecha_fin='+$("#fecha_final").val()+'" style="width:100%; height:835px;" frameborder="0"></iframe>')
});

function estados(id, solicitud)
{   
    
    $.ajax({    url: "clases/control_crud.php",
              type: "POST",
              dataType: "json",
              data: {opcion:"4"},
          })
      .done(function(data) {
        $("#estados").empty()
        for (var i = 0; i < data.length; i++) {
            $("#estados").append('<option value="'+data[i].id_estado+'">'+data[i].descripcion+'</option>')
            
        }
     
   
            
    });    

     
}

});






