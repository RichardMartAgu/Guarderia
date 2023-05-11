package com.sanvalero.servlet;

import com.sanvalero.dao.Database;
import com.sanvalero.dao.ProfesorDAO;
import com.sanvalero.domain.Profesor;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Objects;

@WebServlet("/search-profesor")
public class SearchProfesorServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    String dni_profesor = request.getParameter("dni_profesor");
    String nombre_profesor = request.getParameter("nombre_profesor");

    try {

      Class.forName("com.mysql.cj.jdbc.Driver");
      Database.connect();
      List<Profesor> listaProfesor;

      if (Objects.equals(nombre_profesor, "") || Objects.equals(dni_profesor, "")) {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Database.connect();
        listaProfesor =
            Database.jdbi.withExtension(
                ProfesorDAO.class,
                dao -> {
                  return dao.getSearchProfesorOR(dni_profesor, nombre_profesor);
                });

      } else {

        listaProfesor =
            Database.jdbi.withExtension(
                ProfesorDAO.class,
                dao -> {
                  return dao.getSearchProfesorAnd(dni_profesor, nombre_profesor);
                });
      }

      out.println("<div class=\"container\">");
      out.println("<h2>Lista de Profesores</h2>");
      out.println("<table class=\"table\">");
      out.println("<thead>");
      out.println("<tr>");
      out.println("<th>DNI Profesor</th>");
      out.println("<th>Nombre Profesor</th>");
      out.println("<th>Dirección</th>");
      out.println("<th>Email</th>");
      out.println("<th>Teléfono</th>");
      out.println("</tr>");
      out.println("</thead>");
      out.println("<tbody>");

      for (Profesor profesor : listaProfesor) {

        out.println("<tr>");
        out.println("<td>" + profesor.getDni_profesor() + "</td>");
        out.println("<td>" + profesor.getNombre_profesor() + "</td>");
        out.println("<td>" + profesor.getDireccion() + "</td>");
        out.println("<td>" + profesor.getEmail() + "</td>");
        out.println("<td>" + profesor.getTelefono() + "</td>");
        out.println("<td>");
        out.println(
            "<a href=\"./edit-tutor-legal.jsp?Dni_tutor_legal="
                + profesor.getDni_profesor()
                + "\" class=\"btn btn-primary btn-sm\">Editar</a>");
        out.println(
            "<a href=\"./list-delete-tutor-legal.jsp?Dni_tutor_legal="
                + profesor.getDni_profesor()
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
