package com.sanvalero.servlet;

import com.sanvalero.dao.Database;
import com.sanvalero.dao.ProfesorDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.UUID;

@WebServlet("/add-profesor")
@MultipartConfig
public class AddProfesorServlet extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    String dni_profesor = request.getParameter("dni_profesor");
    String nombre_profesor = request.getParameter("nombre_profesor");
    String direccion = request.getParameter("direccion");
    String email = request.getParameter("email");
    int telefono = Integer.parseInt(request.getParameter("telefono"));
    String imagePath = request.getServletContext().getInitParameter("image-path");

    try {

      Part imagePart = request.getPart("image");
      String imagen;
      if (imagePart.getSize() == 0) {
        imagen = "no_image.jpg";
      } else {
        imagen = UUID.randomUUID() + ".jpg";
        InputStream fileStream = imagePart.getInputStream();
        Files.copy(fileStream, Path.of(imagePath + File.separator + imagen));
      }

      Class.forName("com.mysql.cj.jdbc.Driver");
      Database.connect();
      Database.jdbi.withExtension(
          ProfesorDAO.class,
          dao -> {
            dao.addProfesor(dni_profesor, nombre_profesor, direccion, email, telefono, imagen);
            return null;
          });

      out.println(
          "<div class='alert alert-success text-center' role='alert'>Profesor registrado correctamente</div>");
    } catch (ClassNotFoundException cnfe) {
      cnfe.printStackTrace();
    }
  }
}
