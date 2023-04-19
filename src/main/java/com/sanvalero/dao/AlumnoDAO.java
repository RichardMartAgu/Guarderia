package com.sanvalero.dao;


import com.sanvalero.domain.Alumno;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

public interface AlumnoDAO {

    @SqlQuery("SELECT * FROM Alumno")
    @UseRowMapper(AlumnoMapper.class)
    List<Alumno> getAlumnos();


    @SqlQuery("SELECT * FROM Alumno WHERE ID_ALUMNO = ?")
    @UseRowMapper(AlumnoMapper.class)
    Alumno getAlumno(int id_alumno);

    @SqlUpdate("INSERT INTO Alumno (NOMBRE_ALUMNO, FECHA_NACIMIENTO, LETRA_GRUPO, DNI_TUTOR_LEGAL) VALUES ( ?,?, ?, ?)")
    void addAlumno(String nombre_alumno, Date fecha_nacimiento, String letra_grupo, String dni_tutor_legal);

    @SqlUpdate("DELETE FROM Alumno WHERE ID_ALUMNO = ?")
    void removeAlumno(int id);


}
