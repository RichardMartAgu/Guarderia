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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        int id = Integer.parseInt(request.getParameter("id"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();

            Database.jdbi.withExtension(AlumnoDAO.class, dao -> {
                dao.removeAlumno(id);
                return null;
            });

            out.println("<div class='alert alert-danger text-center' role='alert'>Alumno eliminado correctamente</div>");

        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}
