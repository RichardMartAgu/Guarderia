package com.sanvalero.dao;

import com.sanvalero.domain.Grupo;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.Date;
import java.util.List;

public interface GrupoDAO {

    @SqlQuery("SELECT * FROM Grupo")
    @UseRowMapper(GrupoMapper.class)
    List<Grupo> getGrupos();

    @SqlQuery("SELECT * FROM Grupo WHERE LETRA_GRUPO = ?")
    @UseRowMapper(GrupoMapper.class)
    Grupo getGrupo(String letra_grupo);

    @SqlUpdate("INSERT INTO Grupo (LETRA_GRUPO, NOMBRE_GRUPO, DNI_PROFESOR) VALUES (?, ?, ?)")
    void addGrupo(String letra_grupo, String nombre_grupo, String dni_profesor);

}
