package com.sanvalero.servlet;

import com.sanvalero.dao.Database;
import com.sanvalero.dao.TutorLegalDAO;
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

@WebServlet("/edit-image-tutor-legal")
@MultipartConfig
public class EditTutorImageServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    String dni_tutor_legal = request.getParameter("Dni_tutor_legal");
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
          TutorLegalDAO.class,
          dao -> {
            dao.addImage(imagen, dni_tutor_legal);
            return null;
          });

      out.println(
          "<div class='alert alert-success text-center' role='alert'>Foto registrada correctamente</div>");

    } catch (ClassNotFoundException cnfe) {

      cnfe.printStackTrace();
    }
  }
}
