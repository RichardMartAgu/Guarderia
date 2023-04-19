

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="Includes/header.jsp"%>

<script type="text/javascript">
    $(document).ready(function() {
        $("form").on("submit", function(event) {
            event.preventDefault();
            var formValue = $(this).serialize();
            $.post("add-tutor-legal", formValue, function(data) {
                $("#result").html(data);
            });
        });
    });
</script>

<main>

<div class="d-flex justify-content-center">
  <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="index.jsp">Inicio</a></li>
      <li class="breadcrumb-item active" aria-current="page">Listar Alumnos</li>
    </ol>
  </nav>
</div>


<%-- Formulario para añadir Tutor Legal --%>

<div class="container px-5">
    <h3 class="display-4 fw-normal text-center">Añadir tutor legal</h3>
    <br/> <br/>
    <form class="row g-3 needs-validation">
     <div class="col-md-6">
            <label for="nombre" class="form-label">Nombre</label>
            <input type="text" class="form-control" id="nombre" name="nombre_tutor_legal" required>

     </div>
     <div class="invalid-feedback">
                       Por favor ingrese el nombre del tutor legal.
                 </div>
     <div class="col-md-6">
            <label for="inputPassword4" class="form-label">DNI</label>
            <input type="text" class="form-control" id="dni"name="dni_tutor_legal"required>
            <div class="invalid-feedback">
                       Por favor ingrese Dni.
           </div>
     </div>

      <div class="col-md-6">
        <label for="inputEmail4" class="form-label">Email</label>
        <input type="email" class="form-control" id="email"name="email" required>
        <div class="invalid-feedback">
                          Por favor ingrese el email.
        </div>
      </div>
      <div class="col-md-6">
        <label for="inputPassword4" class="form-label">Telefono</label>
        <input type="tel" class="form-control" id="telefono"name="telefono"required>
        <div class="invalid-feedback">
                                  Por favor ingrese el telefono.
                </div>
      </div>
      <div class="col-12">
        <label for="inputAddress" class="form-label">Direccion</label>
        <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Calle..."required>
        <div class="invalid-feedback">
              Por favor ingrese la dirección.
         </div>
      </div>


       <div class="col-12 text-center">
                 <button type="submit" class="btn btn-primary" disabled>Registrar</button>
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
                             $.post("add-alumno", formValue, function(data) {
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
</form>
 <div id="result"></div>
</div>
<main/>

<%@include file="Includes/footer.jsp"%>