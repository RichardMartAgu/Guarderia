<%@ page import="com.sanvalero.dao.Database" %>
<%@ page import="com.sanvalero.dao.ProfesorDAO" %>
<%@ page import="com.sanvalero.domain.Profesor" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="Includes/header.jsp"%>

<main>
<div class="d-flex justify-content-center">
  <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="index.jsp">Inicio</a></li>
      <li class="breadcrumb-item active" aria-current="page">Profesores</li>
    </ol>
  </nav>
</div>

<%

    Class.forName("com.mysql.cj.jdbc.Driver");
    Database.connect();
    String dniProfesor = request.getParameter("Dni_profesor");
    Profesor profesor = Database.jdbi.withExtension(ProfesorDAO.class, dao -> dao.getProfesor(dniProfesor.trim()));

%>

<div class="container container-sm ">
    <div class="card text-center w-50 mx-auto ">
      <h2 class="card-header text-danger-emphasis">
        <%= profesor.getNombre_profesor()%>
      </h2>
      <div class="card-body ">
      <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false">
         <title>Placeholder</title>
         <image href="../guarderia_data/<%= profesor.getImagen() %>" width="100%" height="100%" />
         <rect width="100%" height="100%" fill="var(--bs-secondary-color)" opacity="0"></rect>
        </svg>
        <br>
        <b>DNI:</b> <p class="card-title text-info-emphasis"> <%= dniProfesor %> </p>
        <b>Dirección:</b> <p class="card-title text-info-emphasis"> <%= profesor.getDireccion() %> </p>
        <b>Teléfono:</b> <p class="card-title text-info-emphasis"> <%= profesor.getTelefono()  %> </p>
        <b>Email:</b> <p class="card-title text-info-emphasis"> <%= profesor.getEmail()  %> </p>
        <a href="list-delete-profesor.jsp" class="btn btn-danger">Listado eliminar registro</a>

      </div>
    </div>
</div>

</main>
<%@include file="Includes/footer.jsp"%>