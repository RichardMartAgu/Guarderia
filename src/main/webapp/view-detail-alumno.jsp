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
        <h5 class="card-title text-info-emphasis"><%= alumno.getNombre_alumno() %> </h5>
        <p class="card-text"><b class="text-decoration-underline">Fecha de nacimiento:</b><br> <%= alumno.getFecha_nacimiento() %></p>
        <b>Letra grupo:</b> <p class="card-title text-info-emphasis"> <%= alumno.getLetra_grupo() %> </p>
        <b>Dni Tutor Legal:</b> <p class="card-title text-info-emphasis"> <%= alumno.getDni_tutor_legal() %> </p>
        <a href="./view-details-grupo.jsp?Letra_grupo=<%= alumno.getLetra_grupo() %>" class="btn btn-info">Datos Grupo</a>
        <a href="./view-detail-tutor-legal.jsp?Dni_tutor_legal=<%= alumno.getDni_tutor_legal()  %>" class="btn btn-info">Datos Tutor Legal</a>
        <a href="remove-alumno?id=<%= alumno.getId_alumno() %>" class="btn btn-danger">Eliminar registro</a>


    </div>
</div>

</main>
<%@include file="Includes/footer.jsp"%>