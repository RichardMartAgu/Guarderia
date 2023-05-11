<%@ page import="com.sanvalero.dao.Database" %>
<%@ page import="com.sanvalero.domain.Profesor" %>
<%@ page import="com.sanvalero.dao.ProfesorDAO" %>
<%@ page import="com.sanvalero.domain.Grupo" %>
<%@ page import="com.sanvalero.dao.GrupoDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.ArrayList" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="Includes/header.jsp"%>

<script type="text/javascript">
$(document).ready(function() {
    $("form").on("submit", function(event) {
        event.preventDefault();
        var form = $(this)[0];
        var formData = new FormData(form);
        $.ajax({
            url: "edit-grupo",
            type: "POST",
            data: formData,
            processData: false,
            contentType: false,
            success: function(data) {
                $("#result").html(data);
            },
            error: function(jqXHR, textStatus, errorThrown) {
                $("#error-message").html("Fallo al editar! " + errorThrown);
            }
        });
    });
});

</script>

<main>

  <%
       Class.forName("com.mysql.cj.jdbc.Driver");
       Database.connect();
       List<Grupo> grupoList = Database.jdbi.withExtension(GrupoDAO.class, GrupoDAO::getGrupos);
       List<Profesor> profesorList = Database.jdbi.withExtension(ProfesorDAO.class, ProfesorDAO::getProfesoresSinGrupo);
       String letraGrupo = request.getParameter("Letra_grupo");
       Grupo grupo = Database.jdbi.withExtension(GrupoDAO.class, dao -> dao.getGrupo(letraGrupo));

   %>

<div class="d-flex justify-content-center">
<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="index.jsp">Inicio</a></li>
    <li class="breadcrumb-item active" aria-current="page">Editar Grupo</li>
  </ol>
</nav>
</div>


<%-- Formulario para añadir Grupo --%>

<div class="container px-5">
  <h3 class="display-4 fw-normal text-center">Editar Grupo</h3>
  <br/> <br/>
  <form class="row g-3 needs-validation"method="post" action="edit-grupo" enctype="multipart/form-data">
   <div class="col-md-6">
          <label for="inputPassword4" class="form-label">Nombre Grupo</label>
          <input type="text" class="form-control" id="nombre_grupo"name="nombre_grupo" value= "<%= grupo.getNombre_grupo() %>"required>
          <div class="invalid-feedback">
                     Por favor ingrese el nombre del grupo.
         </div>
  </div>

    <div class="col-md-6">
               <label for="dni" class="form-label">Dni Profesor al cargo Legal</label>
               <select class="form-select" id="dni_profesor" name="dni_profesor" required>

                   <option value="<%= grupo.getDni_profesor() %>"><%= grupo.getDni_profesor() %></option>
                   <% for (Profesor profesor : profesorList)  { %>
                   <option value="<%= profesor.getDni_profesor() %>"><%= profesor.getDni_profesor() %></option>
                   <% } %>

               </select>
       </div>
               <div class="invalid-feedback">
                   Por favor seleccione un DNI de profesor al cargo.
               </div>
               <div>
                   <input type="hidden" class="form-control"  name="Letra_grupo" value= "<%= grupo.getLetra_grupo() %>" >
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
                           $.post("edit-grupo", formValue, function(data) {
                               $("#result").html(data);
                               $submitButton.prop('disabled', false);
                           });
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
                   $('form .form-check-input').on('change', function() {
                       if ($('form.needs-validation')[0].checkValidity()) {
                           $('form.needs-validation button[type="submit"]').removeAttr('disabled');
                       } else {
                           $('form.needs-validation button[type="submit"]').attr('disabled', 'disabled');
                       }
                   });
               });
          </script>
     </div>

   </div>
</form>
<div id="result"></div>
<div class= "text-center bg-danger-subtle text-danger-emphasis fs-4" id="error-message"></div>
</div>
</main>

<%@include file="Includes/footer.jsp"%>