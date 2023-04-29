package com.sanvalero.dao;

import com.sanvalero.domain.Profesor;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ProfesorMapper implements RowMapper<Profesor> {

    @Override
    public Profesor map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new Profesor
                (rs.getString("DNI_PROFESOR"),
                        rs.getString("NOMBRE_PROFESOR"),
                        rs.getString("DIRECCION"),
                        rs.getString("EMAIL"),
                        rs.getInt("TELEFONO"),
                        rs.getString("IMAGEN"));

    }
}
