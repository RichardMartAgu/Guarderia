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
        <b>DNI:</b> <p class="card-title text-info-emphasis"> <%= dniProfesor %> </p>
        <b>Dirección:</b> <p class="card-title text-info-emphasis"> <%= profesor.getDireccion() %> </p>
        <b>Teléfono:</b> <p class="card-title text-info-emphasis"> <%= profesor.getTelefono()  %> </p>
        <b>Email:</b> <p class="card-title text-info-emphasis"> <%= profesor.getEmail()  %> </p>

      </div>
    </div>
</div>

</main>
<%@include file="Includes/footer.jsp"%>