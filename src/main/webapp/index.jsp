
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="Includes/header.jsp"%>
<main>

<%-- Barra navegación --%>

<nav class="navbar navbar-expand-lg bg-body-tertiary fixed-top"">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      <div class="navbar-nav">
        <a class="nav-link" href="#seccion1">Grupos</a>
        <a class="nav-link" href="#seccion2">Profesores</a>
        <a class="nav-link" href="#seccion3">Tutores legales</a>
        <a class="nav-link" href="#seccion4">Alumnos</a>
      </div>
    </div>
  </div>
</nav>

 <%-- Sección 1 --%>

<div id="seccion1" class="bg-body-tertiary me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
      <div  class="my-3 py-3">
        <h2 class="display-5">Grupos</h2>
        <br/>
        <a href="./listar-grupo.jsp" class="btn btn-outline-info" role="button" >Listar todos los grupos</a>
        <a href="#" class="btn btn-outline-success" role="button" >Administrar datos Grupo</a>
      </div>
      <div class="bg-body shadow-sm mx-auto" style="width: 700px; border-radius: 21px 21px 0 0;">
         <img src="https://img.freepik.com/vector-gratis/fuente-abc-ninos-felices_1308-5923.jpg?w=2000" alt="Descripción de la imagen" class="img-fluid rounded mx-auto d-block">
        </div>
</div>

<%-- Sección 2 --%>

<div id="seccion2" class="bg-body-tertiary me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
      <div class="my-3 py-3">
        <h2 class="display-5">Profesores</h2>
        <br/>
        <a href="./listar-profesores.jsp" class="btn btn-outline-info" role="button" >Listar Profesores</a>
        <a href="#" class="btn btn-outline-success" role="button" >Administrar datos profesores</a>
      </div>
      <div class="bg-body shadow-sm mx-auto" style="width: 700px; border-radius: 21px 21px 0 0;">
         <img src="https://img.freepik.com/vector-gratis/fondo-dia-maestro-dibujado-mano-espanol_23-2149368586.jpg?w=826&t=st=1681551900~exp=1681552500~hmac=f3138936e691ebe7888dba437a27cf8d19b4ce90f78e0a9f566631a37ce87bde" alt="Descripción de la imagen" class="img-fluid rounded mx-auto d-block widg">
        </div>
</div>

<%-- Sección 3 --%>

<div id="seccion3" class="bg-body-tertiary me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
      <div class="my-3 py-3">
        <h2 class="display-5">Tutor Legal</h2>
        <br/>
        <a href="./add-tutor-legal.jsp" class="btn btn-outline-info" role="button" >Listar Tutores Legales</a>
        <a href="./add-tutor-legal.jsp" class="btn btn-outline-success" role="button" >Administrar Tutores Legales</a>
      </div>
      <div class="bg-body shadow-sm mx-auto" style="width: 700px; border-radius: 21px 21px 0 0;">
         <img src="https://img.freepik.com/vector-gratis/fondo-dia-padre-dibujado-mano_52683-85125.jpg?w=826&t=st=1681552200~exp=1681552800~hmac=121e65b9a475026a19b7d3f9dca136e0e6db775b82c3b0e909232ef1412635e1" alt="Descripción de la imagen" class="img-fluid rounded mx-auto d-block">
        </div>
</div>

<%-- Sección 4 --%>

<div id="seccion4" class="bg-body-tertiary me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
      <div  class="my-3 py-3">
        <h2 class="display-5">Alumno</h2>
        <br/>
        <a href="./add-alumno.jsp.jsp" class="btn btn-outline-info" role="button" >Listar Alumnos</a>
        <a href="./add-tutor-legal.jsp" class="btn btn-outline-success" role="button" >Administrar Alumnos</a>
      </div>
      <div class="bg-body shadow-sm mx-auto" style="width: 700px; border-radius: 21px 21px 0 0;">
         <img src="https://img.freepik.com/vector-gratis/conjunto-ninos-preescolares-multietnicos-felices-pie-diferentes-acciones_1150-65467.jpg?w=740&t=st=1681552300~exp=1681552900~hmac=68f5d511b0f3f62d1781e899437a82d9b34c9c89845fa0d3dcc83d8d0b677bbe" alt="Descripción de la imagen" class="img-fluid rounded mx-auto d-block">
        </div>
</div>

</main>


<%@include file="Includes/footer.jsp"%>