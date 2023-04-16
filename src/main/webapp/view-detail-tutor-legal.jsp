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
        <b>DNI:</b> <p class="card-title text-info-emphasis"> <%= dniTutorLegal %> </p>
        <b>Dirección:</b> <p class="card-title text-info-emphasis"> <%= tutorLegal.getDireccion() %> </p>
        <b>Teléfono:</b> <p class="card-title text-info-emphasis"> <%= tutorLegal.getTelefono()  %> </p>
        <b>Email:</b> <p class="card-title text-info-emphasis"> <%= tutorLegal.getEmail()  %> </p>

      </div>
    </div>
</div>

</main>
<%@include file="Includes/footer.jsp"%>