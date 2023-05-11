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

@WebServlet("/edit-grupo")
public class EditGrupoServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    String letra_grupo = request.getParameter("Letra_grupo");
    String nombre_grupo = request.getParameter("nombre_grupo");
    String dni_profesor = request.getParameter("dni_profesor");

    try {

      Class.forName("com.mysql.cj.jdbc.Driver");
      Database.connect();
      Database.jdbi.withExtension(
          GrupoDAO.class,
          dao -> {
            dao.editGrupo(nombre_grupo, dni_profesor, letra_grupo);
            return null;
          });

      out.println(
          "<div class='alert alert-success text-center' role='alert'>Grupo editado correctamente</div>");

    } catch (ClassNotFoundException cnfe) {

      cnfe.printStackTrace();
    }
  }
}
