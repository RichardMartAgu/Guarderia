package com.sanvalero.servlet;

import com.sanvalero.dao.Database;
import com.sanvalero.dao.ProfesorDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/edit-profesor")
public class EditProfesorServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    String dni_profesor = request.getParameter("Dni_profesor");
    System.out.println(dni_profesor);
    String nombre_profesor = request.getParameter("nombre_profesor");
    System.out.println(nombre_profesor);
    String direccion = request.getParameter("direccion");
    System.out.println(direccion);
    String email = request.getParameter("email");
    System.out.println(email);
    int telefono = Integer.parseInt(request.getParameter("telefono"));
    System.out.println(telefono);

    try {

      Class.forName("com.mysql.cj.jdbc.Driver");
      Database.connect();
      Database.jdbi.withExtension(
          ProfesorDAO.class,
          dao -> {
            dao.editProfesor(nombre_profesor, direccion, email, telefono, dni_profesor);
            return null;
          });

      out.println(
          "<div class='alert alert-success text-center' role='alert'>Profesor editado correctamente</div>");

    } catch (ClassNotFoundException cnfe) {

      cnfe.printStackTrace();
    }
  }
}
