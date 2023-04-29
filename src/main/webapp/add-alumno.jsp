<%@ page import="com.sanvalero.dao.Database" %>
<%@ page import="com.sanvalero.domain.TutorLegal" %>
<%@ page import="com.sanvalero.dao.TutorLegalDAO" %>
<%@ page import="com.sanvalero.domain.Grupo" %>
<%@ page import="com.sanvalero.dao.GrupoDAO" %>


<%@ page import="java.util.List" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="Includes/header.jsp"%>

<script type="text/javascript">
  $(document).ready(function() {
      $("form").on("submit", function(event) {
          event.preventDefault();
          var form = $(this)[0];
          var formData = new FormData(form);
          $.ajax({
              url: "add-alumno",
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

<main>

<div class="d-flex justify-content-center">
  <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="index.jsp">Inicio</a></li>
      <li class="breadcrumb-item active" aria-current="page">Añadir Alumnos</li>
    </ol>
  </nav>
</div>


<%-- Conectar y consultar BD --%>

     <%

         Class.forName("com.mysql.cj.jdbc.Driver");
         Database.connect();
         List<Grupo> grupoList = Database.jdbi.withExtension(GrupoDAO.class, GrupoDAO::getGrupos);
         List<TutorLegal> tutorLegalList = Database.jdbi.withExtension(TutorLegalDAO.class, TutorLegalDAO::getTutoresLegalesSinAlumnos);

     %>

<%-- Formulario para añadir Alumno --%>

<div class="container px-5">
    <h3 class="display-4 fw-normal text-center">Añadir Alumno</h3>
    <br/> <br/>
<form class="row g-3 needs-validation" method="post" action="add-alumno" enctype="multipart/form-data" novalidate>

   <div class="col-md-6">
           <label for="nombre" class="form-label">Nombre alumno</label>
           <input type="text" class="form-control" id="nombre_alumno" name="nombre_alumno"  required>
           <div class="invalid-feedback">
               Por favor ingrese el nombre del alumno.
           </div>
       </div>

       <div class="col-md-6">
           <label for="dni" class="form-label">Dni Tutor Legal</label>
           <select class="form-select" id="dni_tutor_legal" name="dni_tutor_legal"  required>

               <% for (TutorLegal tutorLegal : tutorLegalList)  { %>
               <option value="<%= tutorLegal.getDni_tutor_legal() %>"><%= tutorLegal.getDni_tutor_legal() %></option>
               <% } %>

           </select>
           <div class="invalid-feedback">
               Por favor seleccione un DNI de tutor legal.
           </div>
       </div>

       <div class="col-md-6">
           <label for="fecha_nacimiento">Fecha de nacimiento:</label>
           <input type="text" class="form-control" id="fecha_nacimiento" name="fecha_nacimiento"autocomplete="off" required>
           <div class="invalid-feedback">
               Por favor ingrese una fecha de nacimiento válida.
           </div>
           <script>
               $(function() {
                   $("#fecha_nacimiento").datepicker({
                       dateFormat: "yy/mm/dd",
                       changeYear: true,
                       yearRange: "c-100:c+10"
                   });
               });
           </script>
       </div>

       <div class="col-md-6">
           <label for="letra" class="form-label">Letra Grupo</label>
           <select class="form-select" id="letra_grupo" name="letra_grupo" required>

               <% for (Grupo grupo : grupoList) { %>
               <option value="<%= grupo.getLetra_grupo() %>"><%= grupo.getLetra_grupo() %></option>
               <% } %>
           </select>
           <div class="invalid-feedback">
               Por favor seleccione una letra de grupo disponible.
           </div>
       </div>

       <div class="col-md-6">
                  <label for="image" class="form-label">Añadir imagen (opcional)</label>
                  <input type="file" class="form-control" id="image" name="image">
       </div>

       <div class="col-12 text-center">
           <button type="submit" class="btn btn-primary" onclick="refreshPage()" disabled>Registrar</button>
       </div>


       <script>
           $(document).ready(function() {
               $('form.needs-validation').submit(function(event) {
                   event.preventDefault();
                   var $submitButton = $('form.needs-validation button[type="submit"]');
                   if ($submitButton.prop('disabled')) {
                       return;
                   }
                   if ($(this)[0].checkValidity() === false) {
                       event.stopPropagation();
                   } else {

                       var formValue = $(this).serialize();
                       $submitButton.prop('disabled', true);

                   }
                   $(this).addClass('was-validated');
               });
               $('form input, form select').on('change', function() {
                   if ($('form.needs-validation')[0].checkValidity()) {
                       $('form.needs-validation button[type="submit"]').removeAttr('disabled');
                   } else {
                       $('form.needs-validation button[type="submit"]').attr('disabled', 'disabled');
                   }

               });
           });
          </script>

       <script type="text/javascript">
           function refreshPage() {
               setTimeout(function() {
                   location.reload();
               }, 2000);
           }
       </script>

      </div>

     </div>

</form>
 <div id="result"></div>
 <div class= "text-center bg-danger-subtle text-danger-emphasis fs-4" id="error-message"></div>
</div>
</main>

<%@include file="Includes/footer.jsp"%>