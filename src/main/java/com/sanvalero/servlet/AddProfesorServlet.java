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

@WebServlet("/add-profesor")
public class AddProfesorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String dni_tutor_legal = request.getParameter("dni_profesor");
        String nombre_tutor_legal = request.getParameter("nombre_profesor");
        String direccion = request.getParameter("direccion");
        String email = request.getParameter("email");
        int telefono = Integer.parseInt(request.getParameter("telefono"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();
            Database.jdbi.withExtension(ProfesorDAO.class, dao -> {
                dao.addProfesor(dni_tutor_legal, nombre_tutor_legal, direccion, email,telefono);
                return null;
            });

            out.println("<div class='alert alert-success text-center' role='alert'>Tutor Legal registrado correctamente</div>");
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}