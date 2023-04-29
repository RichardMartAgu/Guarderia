<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="Includes/header.jsp"%>

<script>
      setTimeout(function() {
        window.location.href = "index.jsp";
      }, 2000);
    </script>

<div class="d-flex justify-content-center">
  <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="index.jsp">Inicio</a></li>
      <li class="breadcrumb-item active" aria-current="page">Confirmación de borrado</li>
    </ol>
  </nav>
</div>

<div class="alert alert-danger text-center" role="alert">
  Registro Borrado Con Éxito!!
</div>

<%@include file="Includes/footer.jsp"%>