package com.sanvalero.dao;


import com.sanvalero.domain.Alumno;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.sql.Date;
import java.util.List;

public interface AlumnoDAO {

    @SqlQuery("SELECT * FROM Alumno")
    @UseRowMapper(AlumnoMapper.class)
    List<Alumno> getAlumno();


    @SqlQuery("SELECT * FROM Alumno WHERE ID_ALUMNO = ?")
    @UseRowMapper(AlumnoMapper.class)
    Alumno getAlumno(int id_alumno);

    @SqlUpdate("INSERT INTO Alumno (ID_ALUMNO, NOMBRE_ALUMNO, FECHA_NACIMIENTO, LETRA_GRUPO, DNI_TUTOR_LEGAL) VALUES (?, ?, ?, ?, ?)")
    void addAlumno(int id_alumno, String nombre_alumno, Date fecha_nacimiento, String letra_grupo, String dni_tutor_legal);

    @SqlUpdate("DELETE FROM Alumno WHERE ID_ALUMNO = ?")
    void removeAlumno(int id_alumno);

    @SqlUpdate("UPDATE Alumno SET NOMBRE_ALUMNO = ?, FECHA_NACIMIENTO = ?, LETRA_GRUPO = ?, DNI_TUTOR_LEGAL = ? WHERE ID_ALUMNO = ?")
    void editAlumno(String nombre_alumno, Date fecha_nacimiento, String letra_grupo, String dni_tutor_legal, int id_alumno);
}
