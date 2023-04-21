<%@ page import="com.sanvalero.dao.Database" %>
<%@ page import="com.sanvalero.dao.TutorLegalDAO" %>
<%@ page import="com.sanvalero.domain.TutorLegal" %>
<%@ page import="java.util.List" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="Includes/header.jsp"%>


<div class="d-flex justify-content-center">
  <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="index.jsp">Inicio</a></li>
      <li class="breadcrumb-item active" aria-current="page">Listado de borrado tutor Legal</li>
    </ol>
  </nav>
</div>

<main>
        <div class="d-flex justify-content-center align-items-center ">

        </div>
        <div class="row bg-body-tertiary ">
        <div class="bg-danger-subtle text-emphasis-danger">
            <h1 class="fw-normal text-center text-info ">Tutores legales con niños al cargo</h1>
            <h1 class="fw-normal text-center text-danger ">No se pueden borrar sin borrar al alumno</h1>
        </div>
        <br>
            <%
                Class.forName("com.mysql.cj.jdbc.Driver");
                Database.connect();
                List<TutorLegal> tutorLegalListBorradoNo = Database.jdbi.withExtension(TutorLegalDAO.class, TutorLegalDAO::getTutoresLegalesConAlumnos);
                List<TutorLegal> tutorLegalListBorradoSi = Database.jdbi.withExtension(TutorLegalDAO.class, TutorLegalDAO::getTutoresLegalesSinAlumnos);
                for (TutorLegal tutorLegal : tutorLegalListBorradoNo) {
            %>

       <div class="col-sm-4 text-center" >

         <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false">
          <title>Placeholder</title>
          <image href="../guarderia_data/<%= tutorLegal.getImagen() %>" width="100%" height="100%" />
          <rect width="100%" height="100%" fill="var(--bs-secondary-color)" opacity="0"></rect>
         </svg>
         <h2 class="fw-normal"><%= tutorLegal.getNombre_tutor_legal() %></h2>
         <h2 class="fw-normal"><%= tutorLegal.getDni_tutor_legal() %></h2>
         <br>
         <p><a class="btn btn-outline-info" href="./view-detail-tutor-legal.jsp?Dni_tutor_legal=<%= tutorLegal.getDni_tutor_legal() %>">Más datos del tutor legal</a></p>
         <a class="btn btn-outline-danger" href="./remove-alumno?Dni_tutor_legal=<%= tutorLegal.getDni_tutor_legal() %>">Borrado definitivo del niño al cargo</a></p>
       </div>

        <%
            }
            %>

       <div class="bg-success-subtle text-emphasis-danger">
                   <h1 class="fw-normal text-center text-info ">Tutores legales sin niños al cargo</h1>
                   <h1 class="fw-normal text-center text-success ">Se pueden borrar</h1>
               </div>
        <%
            for (TutorLegal tutorLegal : tutorLegalListBorradoSi) {
        %>

                   <div class="col-sm-4 text-center" >

                     <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false">
                       <title>Placeholder</title>
                       <image href="../guarderia_data/<%= tutorLegal.getImagen() %>" width="100%" height="100%" />
                       <rect width="100%" height="100%" fill="var(--bs-secondary-color)" opacity="0"></rect>
                      </svg>

                     <h2 class="fw-normal"><%= tutorLegal.getNombre_tutor_legal() %></h2>
                     <h2 class="fw-normal"><%= tutorLegal.getDni_tutor_legal() %></h2>
                     <br>
                     <p><a class="btn btn-outline-info" href="./view-detail-tutor-legal.jsp?Dni_tutor_legal=<%= tutorLegal.getDni_tutor_legal() %>">Más datos del tutor legal</a></p>
                     <form id="formulario" action="./remove-tutor-legal" >
                              <input type="hidden" name="Dni_tutor_legal" value="<%= tutorLegal.getDni_tutor_legal() %>">
                              <a class="btn btn-outline-danger" onclick="confirmarBorrado(event)" href="./remove-tutor-legal?Dni_tutor_legal=<%= tutorLegal.getDni_tutor_legal() %>">Borrado definitivo del profesor</a>
                     </form>

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
                                       swal("El tutor legal no ha sido borrado");
                                     }
                                   });
                                 }
                                 </script>
                   </div>

                    <%
                        }
                        %>
        </div>
 </main>

<%@include file="Includes/footer.jsp"%>