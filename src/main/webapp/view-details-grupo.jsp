<%@ page import="com.sanvalero.dao.Database" %>
<%@ page import="com.sanvalero.dao.GrupoDAO" %>
<%@ page import="com.sanvalero.domain.Grupo" %>
<%@ page import="com.sanvalero.dao.AlumnoDAO" %>
<%@ page import="com.sanvalero.domain.Alumno" %>
<%@ page import="java.util.List" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="Includes/header.jsp"%>

<main>
<div class="d-flex justify-content-center">
  <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="index.jsp">Inicio</a></li>
      <li class="breadcrumb-item active" aria-current="page">Grupo</li>
    </ol>
  </nav>
</div>
<%

    Class.forName("com.mysql.cj.jdbc.Driver");
    Database.connect();
    String letraGrupo = request.getParameter("Letra_grupo");
    Grupo grupo = Database.jdbi.withExtension(GrupoDAO.class, dao -> dao.getGrupo(letraGrupo.trim()));
    List<Alumno> alumnoList = Database.jdbi.withExtension(AlumnoDAO.class, dao-> dao.getAlumnoLetraGrupo(letraGrupo));

%>

<div class="container container-sm ">
    <div class="card text-center w-50 mx-auto ">
      <h2 class="card-header text-danger-emphasis">
        <%= letraGrupo%>
      </h2>
      <div class="card-body ">
      <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false">
         <title>Placeholder</title>
         <image href="../guarderia_data/<%= grupo.getImagen() %>" width="100%" height="100%" />
         <rect width="100%" height="100%" fill="var(--bs-secondary-color)" opacity="0"></rect>
      </svg>
        <h5 class="card-title text-info-emphasis"><%= grupo.getNombre_grupo() %> </h5>
        <p class="card-text"><b class="text-decoration-underline">DNI profesor al cargo:</b><br> <%= grupo.getDni_profesor() %></p>
        <%
        for (Alumno alumno : alumnoList) {
            %>

               <p class="card-text"><b class="text-decoration-underline">ID y nombre niño del grupo:</b> <%= alumno.getId_alumno() %>  <%= alumno.getNombre_alumno() %></p>

            <%
        }
            %>

        <a href="./view-details-profesor.jsp?Dni_profesor=<%= grupo.getDni_profesor() %>" class="btn btn-info">Datos profesor</a>
        <a href="list-delete-grupo.jsp" class="btn btn-danger">Ir al listado de eliminar registro</a>
      </div>
    </div>
</div>

</main>
<%@include file="Includes/footer.jsp"%>