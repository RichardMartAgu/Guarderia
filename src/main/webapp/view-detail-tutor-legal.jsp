<%@ page import="com.sanvalero.dao.Database" %>
<%@ page import="com.sanvalero.dao.TutorLegalDAO" %>
<%@ page import="com.sanvalero.domain.TutorLegal" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="Includes/header.jsp"%>

<main>

<div class="d-flex justify-content-center">
  <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="index.jsp">Inicio</a></li>
      <li class="breadcrumb-item active" aria-current="page">Tutor Legal</li>
    </ol>
  </nav>
</div>


<%

    Class.forName("com.mysql.cj.jdbc.Driver");
    Database.connect();
    String dniTutorLegal = request.getParameter("Dni_tutor_legal");
    TutorLegal tutorLegal = Database.jdbi.withExtension(TutorLegalDAO.class, dao -> dao.getTutorLegal(dniTutorLegal.trim()));

%>

<div class="container container-sm ">
    <div class="card text-center w-50 mx-auto ">
      <h2 class="card-header text-danger-emphasis">
        <%= tutorLegal.getNombre_tutor_legal()%>
      </h2>
      <div class="card-body ">
      <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false">
       <title>Placeholder</title>
       <image href="../guarderia_data/<%= tutorLegal.getImagen() %>" width="100%" height="100%" />
       <rect width="100%" height="100%" fill="var(--bs-secondary-color)" opacity="0"></rect>
       </div>
    </svg>
      <div class="card-body ">
        <b>DNI:</b> <p class="card-title text-info-emphasis"> <%= dniTutorLegal %> </p>
        <b>Dirección:</b> <p class="card-title text-info-emphasis"> <%= tutorLegal.getDireccion() %> </p>
        <b>Teléfono:</b> <p class="card-title text-info-emphasis"> <%= tutorLegal.getTelefono()  %> </p>
        <b>Email:</b> <p class="card-title text-info-emphasis"> <%= tutorLegal.getEmail()  %> </p>
        <a class="btn btn-warning"  href="./edit-tutor-legal.jsp?Dni_tutor_legal=<%= tutorLegal.getDni_tutor_legal() %>">Editar Tutor Legal</a>
        <a href="list-delete-tutor-legal.jsp" class="btn btn-danger">Ir al listado de eliminar registro</a>

      </div>
    </div>

</div>

</main>
<%@include file="Includes/footer.jsp"%>