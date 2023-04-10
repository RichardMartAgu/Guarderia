<%@ page import="com.savalero.dao.Database" %>
<%@ page import="com.savalero.dao.AlumnoDAO" %>
<%@ page import="com.savalero.domain.Alumno" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="Includes/header.jsp"%>



<main>
    <div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-body-tertiary">
       <div class="col-md-5 p-lg-5 mx-auto my-5">
         <h1 class="display-4 fw-normal">Guardería</h1>
         <a class="btn btn-outline-secondary" href="#">Registrarse</a>
       </div>
       <div class="product-device shadow-sm d-none d-md-block"></div>
       <div class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
    </div>
     <%
                Class.forName("com.mysql.cj.jdbc.Driver");
                Database.connect();
                List<Alumno> alumnoList = Database.jdbi.withExtension(AlumnoDAO.class, AlumnoDAO::getAlumno);
                for (Alumno alumno : alumnoList) {
            %>
    <div class="row bg-body-tertiary">
       <div class="col-lg-4 text-center" >
         <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="var(--bs-secondary-color)"></rect></svg>
         <h2 class="fw-normal">hola</h2>
         <p><a class="btn btn-secondary" href="#">Entrar</a></p>
       </div>
    </div>
  <%
            }
        %>
 </main>


<%@include file="Includes/footer.jsp"%>