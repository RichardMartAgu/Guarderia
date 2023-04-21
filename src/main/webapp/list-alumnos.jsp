<%@ page import="com.sanvalero.dao.Database" %>
<%@ page import="com.sanvalero.domain.Alumno" %>
<%@ page import="com.sanvalero.dao.AlumnoDAO" %>
<%@ page import="java.util.List" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="Includes/header.jsp"%>

<div class="d-flex justify-content-center">
  <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="index.jsp">Inicio</a></li>
      <li class="breadcrumb-item active" aria-current="page">Listar Alumnos</li>
    </ol>
  </nav>
</div>


<main>
        <div class="d-flex justify-content-center align-items-center ">

        </div>
        <div class="row bg-body-tertiary ">
     <%
                Class.forName("com.mysql.cj.jdbc.Driver");
                Database.connect();
                List<Alumno> alumnoList = Database.jdbi.withExtension(AlumnoDAO.class, AlumnoDAO::getAlumnos);
                for (Alumno alumno : alumnoList) {
            %>

       <div class="col-sm-4 text-center" >
         <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false">
         <title>Placeholder</title>
         <image href="../guarderia_data/<%= alumno.getImagen() %>" width="100%" height="100%" />
         <rect width="100%" height="100%" fill="var(--bs-secondary-color)" opacity="0"></rect>
        </svg>

         <h2 class="fw-normal">ID = <%= alumno.getId_alumno() %> </h2>
         <h2 class="fw-normal"><%= alumno.getNombre_alumno() %></h2>
         <br>
         <p><a class="btn btn-outline-info" href="./view-detail-alumno.jsp?Id_alumno=<%= alumno.getId_alumno()%>">Entrar</a></p>
       </div>

  <%
            }
        %>
        </div>
 </main>


<%@include file="Includes/footer.jsp"%>