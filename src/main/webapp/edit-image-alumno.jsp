<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="Includes/header.jsp"%>

<script type="text/javascript">
  $(document).ready(function() {
      $("form").on("submit", function(event) {
          event.preventDefault();
          var form = $(this)[0];
          var formData = new FormData(form);
          $.ajax({
              url: "edit-image-alumno",
              type: "POST",
              data: formData,
              processData: false,
              contentType: false,
              success: function(data) {
                  $("#result").html(data);
              },
              error: function(jqXHR, textStatus, errorThrown) {
                  $("#error-message").html("Fallo al registrar! " + errorThrown);
              }
          });
      });
  });
</script>
<div class="d-flex justify-content-center">
  <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="index.jsp">Inicio</a></li>
      <li class="breadcrumb-item active" aria-current="page">Editar Imagen Alumno</li>
    </ol>
  </nav>
</div>
<%
int idAlumno = Integer.parseInt(request.getParameter("Id_alumno"));
%>
<div class="container px-5">
    <h3 class="display-4 fw-normal text-center">Editar Foto Alumno</h3>
    <br/> <br/>
<form class="row g-3 needs-validation" method="post" action="edit-image-alumno" enctype="multipart/form-data" novalidate>

<div class="col-md-6">
                  <label for="image" class="form-label">Añadir imagen para cambio</label>
                  <input type="file" class="form-control" id="image" name="image">
       </div>
       <div>
               <input type="hidden" class="form-control"  name="Id_alumno" value= "<%= idAlumno %>" >
          </div>

       <div class="col-12 text-center">
           <button type="submit" class="btn btn-success" onclick="refreshPage()" >Editar</button>
       </div>

</form>
 <div id="result"></div>
 <div class= "text-center bg-danger-subtle text-danger-emphasis fs-4" id="error-message"></div>
</div>
<script type="text/javascript">
         function refreshPage() {
             setTimeout(function() {
                 location.reload();
             }, 2000);
         }
 </script>
</main>

<%@include file="Includes/footer.jsp"%>

<main>