package com.sanvalero.servlet;

import com.sanvalero.dao.Database;
import com.sanvalero.dao.TutorLegalDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/remove-tutor-legal")
public class RemoveTutorLegalServlet extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    String dni_tutor_legal = request.getParameter("Dni_tutor_legal");

    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Database.connect();

      Database.jdbi.withExtension(
          TutorLegalDAO.class,
          dao -> {
            dao.removeTutorLegal(dni_tutor_legal);
            return null;
          });

      response.sendRedirect("confirm-delete.jsp");

    } catch (ClassNotFoundException cnfe) {
      cnfe.printStackTrace();
    }
  }
}
