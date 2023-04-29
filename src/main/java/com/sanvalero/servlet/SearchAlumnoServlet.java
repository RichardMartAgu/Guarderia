package com.sanvalero.servlet;

import com.sanvalero.dao.Database;
import com.sanvalero.dao.AlumnoDAO;
import com.sanvalero.domain.Alumno;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Objects;

@WebServlet("/search-alumno")
public class SearchAlumnoServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    String id_alumno = request.getParameter("id_alumno");
    String letra_grupo = request.getParameter("letra_grupo");

    try {

      Class.forName("com.mysql.cj.jdbc.Driver");
      Database.connect();
      List<Alumno> listaAlumnos;

      if (Objects.equals(id_alumno, "") || Objects.equals(letra_grupo, "")) {
        System.out.println("1");
        Class.forName("com.mysql.cj.jdbc.Driver");
        Database.connect();
        listaAlumnos =
            Database.jdbi.withExtension(
                AlumnoDAO.class,
                dao -> {
                  return dao.getSearchAlumnoOr(id_alumno, letra_grupo);
                });

      } else {

        listaAlumnos =
            Database.jdbi.withExtension(
                AlumnoDAO.class,
                dao -> {
                  return dao.getSearchAlumnoAnd(id_alumno, letra_grupo);
                });
      }

      out.println("<div class=\"container\">");
      out.println("<h2>Lista de Alumnos</h2>");
      out.println("<table class=\"table\">");
      out.println("<thead>");
      out.println("<tr>");
      out.println("<th>ID Alumno</th>");
      out.println("<th>Nombre Alumno</th>");
      out.println("<th>Fecha Nacimiento</th>");
      out.println("<th>Letra Grupo</th>");
      out.println("<th>Dni Tutor Legal</th>");
      out.println("</tr>");
      out.println("</thead>");
      out.println("<tbody>");

      for (Alumno alumno : listaAlumnos) {

        out.println("<tr>");
        out.println("<td>" + alumno.getId_alumno() + "</td>");
        out.println("<td>" + alumno.getNombre_alumno() + "</td>");
        out.println("<td>" + alumno.getFecha_nacimiento() + "</td>");
        out.println("<td>" + alumno.getLetra_grupo() + "</td>");
        out.println("<td>" + alumno.getDni_tutor_legal() + "</td>");
        out.println("<td>");
        out.println(
            "<a href=\"./view-detail-alumno.jsp?Id_alumno="
                + alumno.getId_alumno()
                + "\" class=\"btn btn-primary btn-sm\">Editar</a>");
        out.println(
            "<a href=\"./edit-alumno.jsp=?Id_alumno="
                + alumno.getId_alumno()
                + "\" class=\"btn btn-danger btn-sm\">Borrar</a>");
        out.println("</td>");
        out.println("</tr>");
      }

      out.println("</tbody>");
      out.println("</table>");
      out.println("</div>");

    } catch (ClassNotFoundException cnfe) {

      cnfe.printStackTrace();
    }
  }
}
