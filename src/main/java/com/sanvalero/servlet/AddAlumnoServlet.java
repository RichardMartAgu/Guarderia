package com.sanvalero.servlet;

import com.sanvalero.dao.Database;
import com.sanvalero.dao.AlumnoDAO;
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
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@WebServlet("/add-alumno")
@MultipartConfig
public class AddAlumnoServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    String dni_tutor_legal = request.getParameter("dni_tutor_legal");
    String nombre_alumno = request.getParameter("nombre_alumno");
    String fecha_texto = request.getParameter("fecha_nacimiento");
    String letra_grupo = request.getParameter("letra_grupo");
    String imagePath = request.getServletContext().getInitParameter("image-path");

    DateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy");

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

      Date fecha_nacimiento = formatoFecha.parse(fecha_texto);
      Class.forName("com.mysql.cj.jdbc.Driver");
      Database.connect();
      Database.jdbi.withExtension(
          AlumnoDAO.class,
          dao -> {
            dao.addAlumno(nombre_alumno, fecha_nacimiento, letra_grupo, dni_tutor_legal, imagen);
            return null;
          });

      out.println(
          "<div class='alert alert-success text-center' role='alert'>Alumno registrado correctamente</div>");

    } catch (ParseException | ClassNotFoundException cnfe) {

      cnfe.printStackTrace();
    }
  }
}
