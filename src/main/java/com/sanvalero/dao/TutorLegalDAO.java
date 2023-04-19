package com.sanvalero.dao;


import com.sanvalero.domain.Profesor;
import com.sanvalero.domain.TutorLegal;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface TutorLegalDAO {

    @SqlQuery("SELECT * FROM Tutor_legal")
    @UseRowMapper(TutorLegalMapper.class)
    List<TutorLegal> getTutoreslegales();

    @SqlQuery("SELECT * FROM tutor_legal TL " +
            "LEFT JOIN alumno AL ON TL.dni_tutor_legal = AL.dni_tutor_legal " +
            "WHERE AL.dni_tutor_legal IS NULL")
    @UseRowMapper(TutorLegalMapper.class)
    List<TutorLegal> getTutoreslegalesSinAlumnos();

    @SqlQuery("SELECT * FROM Tutor_legal WHERE DNI_TUTOR_LEGAL = ?")
    @UseRowMapper(TutorLegalMapper.class)
    TutorLegal getTutorLegal(String Dni_tutor_legal);


    @SqlUpdate("INSERT INTO Tutor_legal (DNI_TUTOR_LEGAL, NOMBRE_TUTOR_LEGAL, DIRECCION, EMAIL, TELEFONO) VALUES (?, ?, ?, ?, ?)")
    void addTutorLegal(String dni_tutor_legal, String nombre_tutor_legal, String direccion, String email, int telefono);
}


