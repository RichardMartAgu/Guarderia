<%@ page import="com.sanvalero.dao.Database" %>
<%@ page import="com.sanvalero.dao.ProfesorDAO" %>
<%@ page import="com.sanvalero.domain.Profesor" %>
<%@ page import="java.util.List" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="Includes/header.jsp"%>


<div class="d-flex justify-content-center">
  <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="index.jsp">Inicio</a></li>
      <li class="breadcrumb-item active" aria-current="page">Listado de borrado tutor Legal</li>
    </ol>
  </nav>
</div>



<main>
        <div class="d-flex justify-content-center align-items-center ">

        </div>
        <div class="row bg-body-tertiary ">
        <div class="bg-danger-subtle text-emphasis-danger">
            <h1 class="fw-normal text-center text-info ">Profesor con grupo al cargo</h1>
            <h1 class="fw-normal text-center text-danger ">No se pueden borrar sin borrar el grupo al cargo</h1>
        </div>
        <br>
            <%
                Class.forName("com.mysql.cj.jdbc.Driver");
                Database.connect();
                List<Profesor> ProfesorListBorradoNo = Database.jdbi.withExtension(ProfesorDAO.class, ProfesorDAO::getProfesoresConGrupo);
                List<Profesor> ProfesorListBorradoSi = Database.jdbi.withExtension(ProfesorDAO.class, ProfesorDAO::getProfesoresSinGrupo);
                for (Profesor profesor : ProfesorListBorradoNo) {
            %>

        <div class="col-sm-4 text-center" >
               <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="var(--bs-secondary-color)"></rect></svg>
               <h2 class="fw-normal"><%= profesor.getNombre_profesor() %></h2>
               <h2 class="fw-normal">DNI: <%= profesor.getDni_profesor() %></h2>
               <br>
               <p><a class="btn btn-outline-info" href="./view-details-profesor.jsp?Dni_profesor=<%= profesor.getDni_profesor() %>">Más datos del profesor</a></p>
                <a class="btn btn-outline-danger" href="./list-delete-grupo.jsp">Listado posible borrado grupo</a></p>
             </div>

        <%
            }
            %>

       <div class="bg-success-subtle text-emphasis-danger">
                   <h1 class="fw-normal text-center text-info ">Tutores legales sin grupos al cargo</h1>
                   <h1 class="fw-normal text-center text-success ">Se pueden borrar</h1>
               </div>
        <%
            for (Profesor profesor : ProfesorListBorradoSi) {
        %>

         <div class="col-sm-4 text-center" >
          <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="var(--bs-secondary-color)"></rect></svg>
           <h2 class="fw-normal"><%= profesor.getNombre_profesor() %></h2>
           <h2 class="fw-normal">DNI: <%= profesor.getDni_profesor() %></h2>
            <br>
             <p><a class="btn btn-outline-info" href="./view-details-profesor.jsp?Dni_profesor=<%= profesor.getDni_profesor() %>">Más datos del profesor</a></p>
              <form id="formulario" action="./remove-profesor" >
              <input type="hidden" name="Dni_profesor" value="<%= profesor.getDni_profesor() %>">
              <a class="btn btn-outline-danger" onclick="confirmarBorrado(event)" href="./remove-profesor?Dni_profesor=<%= profesor.getDni_profesor() %>">Borrado definitivo del profesor</a>
                </form>
             </div>



            <script>
            function confirmarBorrado(event) {
              event.preventDefault();
              swal({
                title: "¿Estás seguro?",
                text: "¡Una vez borrado, no se puede recuperar!",
                icon: "warning",
                buttons: true,
                dangerMode: true,
              })
              .then((willDelete) => {
                if (willDelete) {
                document.getElementById('formulario').submit();
                } else {
                  swal("El profesor no ha sido borrado");
                }
              });
            }
            </script>

             <%
             }
             %>

        </div>
 </main>

<%@include file="Includes/footer.jsp"%>