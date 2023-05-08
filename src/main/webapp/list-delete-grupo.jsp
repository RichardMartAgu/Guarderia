<%@ page import="com.sanvalero.dao.Database" %>
<%@ page import="com.sanvalero.dao.GrupoDAO" %>
<%@ page import="com.sanvalero.domain.Grupo" %>
<%@ page import="java.util.List" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="Includes/header.jsp"%>


<div class="d-flex justify-content-center">
  <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="index.jsp">Inicio</a></li>
      <li class="breadcrumb-item active" aria-current="page">Listado de borrado grupo</li>
    </ol>
  </nav>
</div>

<main>
        <div class="d-flex justify-content-center align-items-center ">

        </div>
        <div class="row bg-body-tertiary ">
        <div class="bg-danger-subtle text-emphasis-danger">
            <h1 class="fw-normal text-center text-info ">Grupos con alumnos</h1>
            <h1 class="fw-normal text-center text-danger ">No se pueden borrar sin borrar al los alumnos del grupo</h1>
        </div>

        <br>
            <%
                Class.forName("com.mysql.cj.jdbc.Driver");
                Database.connect();
                List<Grupo> grupoListBorradoNo = Database.jdbi.withExtension(GrupoDAO.class, GrupoDAO::getGruposConAlumno);
                List<Grupo> grupoListBorradoSi = Database.jdbi.withExtension(GrupoDAO.class, GrupoDAO::getGruposSinAlumno);
                for (Grupo grupo : grupoListBorradoNo) {
        %>

              <div class="col-sm-4 text-center" >
                <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false">
                 <title>Placeholder</title>
                 <image href="../guarderia_data/<%= grupo.getImagen() %>" width="100%" height="100%" />
                 <rect width="100%" height="100%" fill="var(--bs-secondary-color)" opacity="0"></rect>
                </svg>
                <h2 class="fw-normal"><%= grupo.getLetra_grupo() %> <br> <%= grupo.getNombre_grupo() %></h2>
                <br>
                <p><a class="btn btn-outline-info" href="./view-details-grupo.jsp?Letra_grupo=<%= grupo.getLetra_grupo()%>">Entrar</a></p>
              </div>

         <%
                   }
               %>

       <div class="bg-success-subtle text-emphasis-danger">
                   <h1 class="fw-normal text-center text-info ">Grupos sin alumnos </h1>
                   <h1 class="fw-normal text-center text-success ">Se pueden borrar</h1>
               </div>
        <%
            for (Grupo grupo : grupoListBorradoSi)  {
        %>

           <div class="col-sm-4 text-center" >
            <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false">
            <title>Placeholder</title>
            <image href="../guarderia_data/<%= grupo.getImagen() %>" width="100%" height="100%" />
            <rect width="100%" height="100%" fill="var(--bs-secondary-color)" opacity="0"></rect>
           </svg>
           <h2 class="fw-normal"><%= grupo.getLetra_grupo() %> <br> <%= grupo.getNombre_grupo() %></h2>
           <br>
           <p><a class="btn btn-outline-info" href="./view-details-grupo.jsp?Letra_grupo=<%= grupo.getLetra_grupo()%>">Entrar</a></p>
           <form id="formulario" action="./remove-grupo" >
                <input type="hidden" name="letra_grupo" value="<%= grupo.getLetra_grupo() %>">
                <a class="btn btn-outline-danger" onclick="confirmarBorrado(event)" href="./remove-grupo?letra_grupo=<%= grupo.getLetra_grupo() %>">Borrado definitivo del Grupo</a>
            </form>

             </div>

               <script>
               function confirmarBorrado(event) {
                   event.preventDefault();
                        swal({
                            title: "¿Estás seguro?",
                            text: "¡Una vez borrado, no se puede recuperar!",
                            icon: "warning",
                            buttons: true,
                            dangerMode: true,
                        })
                   .then((willDelete) => {
                       if (willDelete) {
                       document.getElementById('formulario').submit();
                       } else {
                         swal("El grupo no ha sido borrado");
                       }
                    });
               }
               </script>


         <%
            }
         %>
        </div>
 </main>

<%@include file="Includes/footer.jsp"%>