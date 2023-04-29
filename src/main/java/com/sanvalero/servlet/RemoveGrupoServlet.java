package com.sanvalero.servlet;

import com.sanvalero.dao.Database;
import com.sanvalero.dao.GrupoDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/remove-grupo")
public class RemoveGrupoServlet extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    String letra_grupo = request.getParameter("letra_grupo");

    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Database.connect();

      Database.jdbi.withExtension(
          GrupoDAO.class,
          dao -> {
            dao.removeGrupo(letra_grupo);
            return null;
          });

      response.sendRedirect("confirm-delete.jsp");

    } catch (ClassNotFoundException cnfe) {
      cnfe.printStackTrace();
    }
  }
}
