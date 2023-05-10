<%@ page import="com.sanvalero.dao.Database" %>

<%@ page import="java.util.List" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="Includes/header.jsp"%>

<script type="text/javascript">
  $(document).ready(function() {
      $("form").on("submit", function(event) {
          event.preventDefault();
          var form = $(this)[0];
        var formData = $("form").serialize();
        $.ajax({
            url: "search-profesor",
            type: "POST",
            data: formData,
            success: function(data) {
                $("#result").html(data);
            },
            error: function(jqXHR, textStatus, errorThrown) {
                $("#error-message").html("Fallo al Buscar! " + errorThrown);
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
      <li class="breadcrumb-item active" aria-current="page">Buscar Profesores</li>
    </ol>
  </nav>
</div>

<div class="container px-5">
    <h3 class="display-4 fw-normal text-center">Buscar Profesores</h3>

    <br/> <br/>

<form class="row g-3 needs-validation" method="post" action="Search-profesor" >

     <div class="col-md-6">
               <label for="dni" class="form-label">Nombre Profesor</label>
               <input type="text" class="form-control" name="nombre_profesor" >

           </div>

   <div class="col-md-6">
           <label for="text" class="form-label">DNI Profesor</label>
           <input type="text" class="form-control" id="letra_grupo" name="dni_profesor" >

       </div>

       <div id="result"></div>

       <div class="col-12 text-center">
           <button type="submit" class="btn btn-primary" >Buscar</button>
       </div>


        <div id="result"></div>
        <div class= "text-center bg-danger-subtle text-danger-emphasis fs-4" id="error-message"></div>


   </form>
   </div>

 </main>

 <%@include file="Includes/footer.jsp"%>