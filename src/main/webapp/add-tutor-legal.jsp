<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="Includes/header.jsp"%>

<main>

<%-- Formulario para añadir Tutor Legal --%>



<div class="container px-5">
    <h3 class="display-4 fw-normal text-center">Añadir tutor legal</h3>
    <br/> <br/>
    <form class="row g-3">
     <div class="col-md-6">
            <label for="inputEmail4" class="form-label">Nombre</label>
            <input type="email" class="form-control" id="inputEmail4">
     </div>
          <div class="col-md-6">
            <label for="inputPassword4" class="form-label">DNI</label>
            <input type="password" class="form-control" id="inputPassword4">
     </div>

      <div class="col-md-6">
        <label for="inputEmail4" class="form-label">Email</label>
        <input type="email" class="form-control" id="inputEmail4">
      </div>
      <div class="col-md-6">
        <label for="inputPassword4" class="form-label">Telefono</label>
        <input type="password" class="form-control" id="inputPassword4">
      </div>
      <div class="col-12">
        <label for="inputAddress" class="form-label">Direccion</label>
        <input type="text" class="form-control" id="inputAddress" placeholder="Calle...">
      </div>

      <div class="col-12">
        <div class="form-check">
          <input class="form-check-input" type="checkbox" id="gridCheck">
          <label class="form-check-label" for="gridCheck">
            Acepto condiciones
          </label>
        </div>
      </div>
      <div class="col-12 text-center">
        <button type="submit" class="btn btn-primary">Registrar</button>
      </div>
     </div>
</form>

<main/>

<%@include file="Includes/footer.jsp"%>