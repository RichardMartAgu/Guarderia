<%@ page import="com.savalero.dao.Database" %>
<%@ page import="com.savalero.dao.AlumnoDAO" %>
<%@ page import="com.savalero.domain.Alumno" %>
<%@ page import="com.savalero.domain.Grupo" %>
<%@ page import="com.savalero.dao.GrupoDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="Includes/header.jsp"%>



<main>
        <div class="d-flex justify-content-center align-items-center" >
           <a href="addTutorLegal.jsp" class="btn btn-info my-2">Registrar un Tutor Legal</a>
        </div>
        <div class="row bg-body-tertiary ">
     <%
                Class.forName("com.mysql.cj.jdbc.Driver");
                Database.connect();
                List<Grupo> grupoList = Database.jdbi.withExtension(GrupoDAO.class, GrupoDAO::getGrupo);
                for (Grupo grupo : grupoList) {
            %>

       <div class="col-sm-4 text-center" >
         <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="var(--bs-secondary-color)"></rect></svg>
         <h2 class="fw-normal"><%= grupo.getLetra_grupo() %> <br> <%= grupo.getNombre_grupo() %></h2>
         <br>
         <p><a class="btn btn-outline-info" href="#">Entrar</a></p>
       </div>

  <%
            }
        %>
        </div>
 </main>


<%@include file="Includes/footer.jsp"%>