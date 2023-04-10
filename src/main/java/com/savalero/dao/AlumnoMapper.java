package com.savalero.dao;

import com.savalero.util.DateUtils;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AlumnoMapper implements RowMapper<Alumno> {

    @Override
    public Alumno map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new Alumno(rs.getInt("ID_ALUMNO"),
                rs.getString("NOMBRE_ALUMNO"),
                DateUtils.getLocalDate(rs.getDate("FECHA_NACIMIENTO")),
                rs.getString("LETRA_GRUPO"),
                rs.getInt("DNI_TUTOR_LEGAL"));

    }
}
