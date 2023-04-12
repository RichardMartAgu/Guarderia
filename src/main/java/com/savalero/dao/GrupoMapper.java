package com.savalero.dao;

import com.savalero.domain.Grupo;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class GrupoMapper implements RowMapper<Grupo> {

    @Override
    public Grupo map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new Grupo
                (rs.getString("LETRA_GRUPO"),
                rs.getString("NOMBRE_GRUPO"),
                rs.getString("DNI_PROFESOR"));

    }
}