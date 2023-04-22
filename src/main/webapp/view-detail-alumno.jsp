<%@ page import="com.sanvalero.dao.Database" %>
<%@ page import="com.sanvalero.dao.AlumnoDAO" %>
<%@ page import="com.sanvalero.domain.Alumno" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="Includes/header.jsp"%>

<main>


<div class="d-flex justify-content-center">
  <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="index.jsp">Inicio</a></li>
      <li class="breadcrumb-item active" aria-current="page">Alumno</li>
    </ol>
  </nav>
</div>
<%

    Class.forName("com.mysql.cj.jdbc.Driver");
    Database.connect();
    int idAlumno = Integer.parseInt(request.getParameter("Id_alumno"));
    Alumno alumno = Database.jdbi.withExtension(AlumnoDAO.class, dao -> dao.getAlumno(idAlumno));

%>

<div class="container container-sm ">
    <div class="card text-center w-50 mx-auto ">
      <h2 class="card-header text-danger-emphasis">
      ID Alumno :
        <%= idAlumno%>
      </h2>
      <div class="card-body ">
       <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false">
           <title>Placeholder</title>
           <image href="../guarderia_data/<%= alumno.getImagen() %>" width="100%" height="100%" />
           <rect width="100%" height="100%" fill="var(--bs-secondary-color)" opacity="0"></rect>
          </svg>

        <h5 class="card-title text-info-emphasis"><%= alumno.getNombre_alumno() %> </h5>
        <p class="card-text"><b class="text-decoration-underline">Fecha de nacimiento:</b><br> <%= alumno.getFecha_nacimiento() %></p>
        <b>Letra grupo:</b> <p class="card-title text-info-emphasis"> <%= alumno.getLetra_grupo() %> </p>
        <b>Dni Tutor Legal:</b> <p class="card-title text-info-emphasis"> <%= alumno.getDni_tutor_legal() %> </p>
        <a href="./view-details-grupo.jsp?Letra_grupo=<%= alumno.getLetra_grupo() %>" class="btn btn-info">Datos Grupo</a>
        <a href="./view-detail-tutor-legal.jsp?Dni_tutor_legal=<%= alumno.getDni_tutor_legal()  %>" class="btn btn-info">Datos Tutor Legal</a>
        </div>
        <form id="formulario" action="./remove-alumno" >
          <input type="hidden" name="Id_alumno" value="<%= alumno.getId_alumno() %>">
           <a class="btn btn-warning"  href="./edit-alumno.jsp?Id_alumno=<%= alumno.getId_alumno() %>">Editar Alumno</a>
          <a class="btn btn-danger" onclick="confirmarBorrado(event)" href="./remove-alumno?Id_alumno=<%= alumno.getId_alumno() %>">Borrado definitivo del Alumno</a>
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
              swal("El alumno no ha sido borrado");
            }
          });
        }
        </script>



</div>

</main>
<%@include file="Includes/footer.jsp"%>