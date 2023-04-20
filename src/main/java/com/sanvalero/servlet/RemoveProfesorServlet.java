package com.sanvalero.servlet;

import com.sanvalero.dao.ProfesorDAO;
import com.sanvalero.dao.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/remove-profesor")
public class RemoveProfesorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");


        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();

            String dniProfesor = request.getParameter("Dni_profesor");
            Database.jdbi.withExtension(ProfesorDAO.class, dao -> {
                dao.removeProfesor(dniProfesor);
                return null;
            });
            response.sendRedirect("confirm-delete.jsp");

        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}