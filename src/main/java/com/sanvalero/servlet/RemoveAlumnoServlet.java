package com.sanvalero.servlet;

import com.sanvalero.dao.AlumnoDAO;
import com.sanvalero.dao.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/remove-alumno")
public class RemoveAlumnoServlet extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Database.connect();

      if (request.getParameter("Id_alumno") != null) {
        int id = Integer.parseInt(request.getParameter("Id_alumno"));
        Database.jdbi.withExtension(
            AlumnoDAO.class,
            dao -> {
              dao.removeAlumno(id);
              return null;
            });
      } else {
        String dni_tutor_legal = request.getParameter("Dni_tutor_legal");
        Database.jdbi.withExtension(
            AlumnoDAO.class,
            dao -> {
              dao.removeAlumnoDniTutorLegal(dni_tutor_legal);
              return null;
            });
      }

      response.sendRedirect("confirm-delete.jsp");

    } catch (ClassNotFoundException cnfe) {
      cnfe.printStackTrace();
    }
  }
}
