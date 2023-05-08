package com.sanvalero.servlet;

import com.sanvalero.dao.Database;
import com.sanvalero.dao.AlumnoDAO;
import com.sanvalero.dao.GrupoDAO;
import com.sanvalero.domain.Alumno;
import com.sanvalero.domain.Grupo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Objects;

@WebServlet("/search-grupo")
public class SearchGrupoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();


        String letra_grupo = request.getParameter("letra_grupo");
        String nombre_grupo = request.getParameter("nombre_grupo");

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();
            List<Grupo> listaGrupo;

            if (Objects.equals(nombre_grupo, "") || Objects.equals(letra_grupo, "")) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Database.connect();
                listaGrupo =
                        Database.jdbi.withExtension(
                                GrupoDAO.class,
                                dao -> {
                                    return dao.getSearchGrupoOr(nombre_grupo, letra_grupo);
                                });

            } else {

                listaGrupo =
                        Database.jdbi.withExtension(
                                GrupoDAO.class,
                                dao -> {
                                    return dao.getSearchGrupoAnd(nombre_grupo, letra_grupo);
                                });
            }

            out.println("<div class=\"container\">");
            out.println("<h2>Lista de Alumnos</h2>");
            out.println("<table class=\"table\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>ID Alumno</th>");
            out.println("<th>Nombre Alumno</th>");
            out.println("<th>Fecha Nacimiento</th>");
            out.println("<th>Letra Grupo</th>");
            out.println("<th>Dni Tutor Legal</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");

            for (Grupo grupo : listaGrupo) {

                out.println("<tr>");
                out.println("<td>" + grupo.getNombre_grupo() + "</td>");
                out.println("<td>" + grupo.getDni_profesor() + "</td>");
                out.println("<td>" + grupo.getLetra_grupo() + "</td>");
                out.println("<td>");
                out.println(
                        "<a href=\"./edit-grupo.jsp?Letra_grupo="
                                + grupo.getLetra_grupo()
                                + "\" class=\"btn btn-primary btn-sm\">Editar</a>");
                out.println(
                        "<a href=\"./list-delete-grupo.jsp?Letra_grupo="
                                + grupo.getLetra_grupo()
                                + "\" class=\"btn btn-danger btn-sm\">Borrar</a>");
                out.println("</td>");
                out.println("</tr>");
            }

            out.println("</tbody>");
            out.println("</table>");
            out.println("</div>");

        } catch (ClassNotFoundException cnfe) {

            cnfe.printStackTrace();
        }
    }
}