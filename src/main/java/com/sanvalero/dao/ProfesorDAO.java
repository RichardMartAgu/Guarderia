package com.sanvalero.dao;

import com.sanvalero.domain.Profesor;
import com.sanvalero.domain.TutorLegal;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface ProfesorDAO {

    @SqlQuery("SELECT * FROM Profesor")
    @UseRowMapper(ProfesorMapper.class)
    List<Profesor> getProfesores();

    @SqlQuery("SELECT * FROM profesor PF " +
            "LEFT JOIN grupo GR ON PF.dni_profesor = GR.dni_profesor " +
            "WHERE GR.dni_profesor IS NULL")
    @UseRowMapper(ProfesorMapper.class)
    List<Profesor> getProfesoresSinGrupo();

    @SqlQuery("SELECT * FROM profesor PF " +
            "LEFT JOIN grupo GR ON PF.dni_profesor = GR.dni_profesor " +
            "WHERE GR.dni_profesor")
    @UseRowMapper(ProfesorMapper.class)
    List<Profesor> getProfesoresConGrupo();


    @SqlQuery("SELECT * FROM Profesor WHERE Dni_profesor = ?")
    @UseRowMapper(ProfesorMapper.class)
    Profesor getProfesor(String Dni_profesor);

    @SqlUpdate("INSERT INTO Profesor (DNI_PROFESOR, NOMBRE_PROFESOR, DIRECCION, EMAIL, TELEFONO,IMAGEN) VALUES (?, ?, ?, ?, ?,?)")
    void addProfesor(String dni_profesor, String nombre_profesor, String direccion, String email, int telefono, String imagen);

    @SqlUpdate("DELETE FROM Profesor WHERE DNI_PROFESOR = ?")
    void removeProfesor(String dni_profesor);

    @SqlUpdate("DELETE FROM Profesor WHERE letra_grupo = ?")
    void removeProfesorLetraGrupo(String letra_grupo);
}