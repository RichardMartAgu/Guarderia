package com.sanvalero.dao;

import com.sanvalero.domain.Profesor;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface ProfesorDAO {

    @SqlQuery("SELECT * FROM Profesor")
    @UseRowMapper(ProfesorMapper.class)
    List<Profesor> getProfesores();

    @SqlQuery("SELECT * FROM Profesor WHERE Dni_profesor = ?")
    @UseRowMapper(ProfesorMapper.class)
    Profesor getProfesor(String Dni_profesor);

}