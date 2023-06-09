package com.sanvalero.servlet;

import com.sanvalero.dao.Database;
import com.sanvalero.dao.AlumnoDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/edit-alumno")
public class EditAlumnoServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    String dni_tutor_legal = request.getParameter("dni_tutor_legal");
    String nombre_alumno = request.getParameter("nombre_alumno");
    String fecha_texto = request.getParameter("fecha_nacimiento");
    String letra_grupo = request.getParameter("letra_grupo");
    int id_alumno = Integer.parseInt(request.getParameter("Id_alumno"));

    DateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");

    try {

      Date fecha_nacimiento = formatoFecha.parse(fecha_texto);
      Class.forName("com.mysql.cj.jdbc.Driver");
      Database.connect();
      Database.jdbi.withExtension(
          AlumnoDAO.class,
          dao -> {
            dao.editAlumno(
                nombre_alumno, fecha_nacimiento, letra_grupo, dni_tutor_legal, id_alumno);
            return null;
          });

      out.println(
          "<div class='alert alert-success text-center' role='alert'>Alumno editado correctamente</div>");

    } catch (ParseException | ClassNotFoundException cnfe) {

      cnfe.printStackTrace();
    }
  }
}
