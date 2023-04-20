package com.sanvalero.servlet;

import com.sanvalero.dao.AlumnoDAO;
import com.sanvalero.dao.Database;
import com.sanvalero.dao.TutorLegalDAO;
import com.sanvalero.domain.TutorLegal;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Objects;

@WebServlet("/remove-tutor-legal")
public class RemoveTutorLegalServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String dni_tutor_legal = request.getParameter("Dni_tutor_legal");


        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.jdbi.withExtension(TutorLegalDAO.class, dao -> {
                dao.removeTutorLegal(dni_tutor_legal);
                return null;
            });
        } catch (ClassNotFoundException e) {
            System.out.println("<div class='alert alert-danger text-center' role='alert'>Tutor Legal no se pude borrar porque tiene un alumno a su cargo</div>");
            throw new RuntimeException(e);
        }

    }
}



