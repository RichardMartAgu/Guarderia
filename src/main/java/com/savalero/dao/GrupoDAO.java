package com.savalero.dao;

import com.savalero.dao.GrupoMapper;
import com.savalero.domain.Grupo;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface GrupoDAO {

    @SqlQuery("SELECT * FROM Grupo")
    @UseRowMapper(GrupoMapper.class)
    List<Grupo> getGrupo();


    @SqlQuery("SELECT * FROM Grupo WHERE LETRA_GRUPO = ?")
    @UseRowMapper(GrupoMapper.class)
    Grupo getLetraGrupo(String letra_grupo);

    @SqlUpdate("INSERT INTO Grupo (LETRA_GRUPO, NOMBRE_GRUPO, DNI_PROFESOR) VALUES (?, ?, ?)")
    void addGrupo(String letra_grupo, String nombre_grupo, String dni_profesor);

    @SqlUpdate("DELETE FROM Grupo WHERE LETRA_GRUPO = ?")
    void removeGrupo(String letra_grupo);

    @SqlUpdate("UPDATE Grupo SET NOMBRE_ALUMNO = ?, FECHA_NACIMIENTO = ? WHERE LETRA_GRUPO = ?")
    void editGrupo(String nombre_grupo, String dni_profesor,String letra_grupo);
}
