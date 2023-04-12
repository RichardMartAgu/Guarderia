package com.savalero.dao;

import com.savalero.domain.TutorLegal;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TutorLegalMapper implements RowMapper<TutorLegal> {

    @Override
    public TutorLegal map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new TutorLegal
                (rs.getString("DNI_TUTOR_LEGAL"),
                rs.getString("NOMBRE_TUTOR_LEGAL"),
                rs.getString("DIRECCION"),
                rs.getString("EMAIL"),
                rs.getInt("TELEFONO")
        );
    }
}

