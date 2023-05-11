package com.sanvalero.servlet;

import com.sanvalero.dao.Database;
import com.sanvalero.dao.TutorLegalDAO;
import com.sanvalero.domain.TutorLegal;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Objects;

@WebServlet("/search-tutor-legal")
public class SearchTutorLegalServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    String dni_tutor_legal = request.getParameter("dni_tutor_legal");
    String nombre_tutor_legal = request.getParameter("nombre_tutor_legal");

    try {

      Class.forName("com.mysql.cj.jdbc.Driver");
      Database.connect();
      List<TutorLegal> listaTutorLegal;

      if (Objects.equals(nombre_tutor_legal, "") || Objects.equals(dni_tutor_legal, "")) {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Database.connect();
        listaTutorLegal =
            Database.jdbi.withExtension(
                TutorLegalDAO.class,
                dao -> {
                  return dao.getSearchTutorOr(dni_tutor_legal, nombre_tutor_legal);
                });

      } else {

        listaTutorLegal =
            Database.jdbi.withExtension(
                TutorLegalDAO.class,
                dao -> {
                  return dao.getSearchTutorAnd(dni_tutor_legal, nombre_tutor_legal);
                });
      }

      out.println("<div class=\"container\">");
      out.println("<h2>Lista de Tutores Legales</h2>");
      out.println("<table class=\"table\">");
      out.println("<thead>");
      out.println("<tr>");
      out.println("<th>DNI Tutor Legal</th>");
      out.println("<th>Nombre Tutor Legal</th>");
      out.println("<th>Dirección</th>");
      out.println("<th>Email</th>");
      out.println("<th>Teléfono</th>");
      out.println("</tr>");
      out.println("</thead>");
      out.println("<tbody>");

      for (TutorLegal tutorLegal : listaTutorLegal) {

        out.println("<tr>");
        out.println("<td>" + tutorLegal.getDni_tutor_legal() + "</td>");
        out.println("<td>" + tutorLegal.getNombre_tutor_legal() + "</td>");
        out.println("<td>" + tutorLegal.getDireccion() + "</td>");
        out.println("<td>" + tutorLegal.getEmail() + "</td>");
        out.println("<td>" + tutorLegal.getTelefono() + "</td>");
        out.println("<td>");
        out.println(
            "<a href=\"./edit-tutor-legal.jsp?Dni_tutor_legal="
                + tutorLegal.getDni_tutor_legal()
                + "\" class=\"btn btn-primary btn-sm\">Editar</a>");
        out.println(
            "<a href=\"./list-delete-tutor-legal.jsp?Dni_tutor_legal="
                + tutorLegal.getDni_tutor_legal()
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
