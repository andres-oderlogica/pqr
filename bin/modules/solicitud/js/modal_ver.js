$(document).ready(function() {


$("#btn_save").click(function(){
  var estado1 = $('input:radio[name=estado]:checked').val();
  $.ajax({
    url: "clases/control_crud.php",
    type: "POST",
    dataType: "json",
    data: {opcion:"1",
    id_r:$('#id').val(),
    nuevo_estado:$('#nuevo_estado').val(),
    id_sol:$('#id_sol').val(),
    estado:estado1
    },
          })
      .done(function() {     
      $('#id').val(""),
      $('#nuevo_estado').val(""),
     // $('#id_sol').val(""),
      $('#estado').val("")          
             })
      .always(function(){
        $('#myModal').on('hidden.bs.modal', function(){
            $(this).removeData('bs.modal');
        });
      $('#myModal').modal('toggle');
      parent.verCargas($('#id_sol').val()); 

      })
      
    });



})