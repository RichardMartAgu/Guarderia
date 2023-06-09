package com.sanvalero.dao;

import com.sanvalero.domain.Grupo;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface GrupoDAO {

  @SqlQuery("SELECT * FROM Grupo")
  @UseRowMapper(GrupoMapper.class)
  List<Grupo> getGrupos();

  @SqlQuery(
      "SELECT * FROM grupo GR "
          + "LEFT JOIN alumno AL ON GR.letra_grupo = AL.letra_grupo "
          + "WHERE AL.id_alumno IS NULL")
  @UseRowMapper(GrupoMapper.class)
  List<Grupo> getGruposSinAlumno();

  @SqlQuery(
      "SELECT * FROM grupo GR "
          + "LEFT JOIN alumno AL ON GR.letra_grupo = AL.letra_grupo "
          + "WHERE AL.id_alumno ")
  @UseRowMapper(GrupoMapper.class)
  List<Grupo> getGruposConAlumno();

  @SqlQuery("SELECT * FROM Grupo WHERE LETRA_GRUPO = ?")
  @UseRowMapper(GrupoMapper.class)
  Grupo getGrupo(String letra_grupo);

  @SqlQuery("SELECT * FROM Grupo WHERE NOMBRE_GRUPO = ? AND LETRA_GRUPO = ?")
  @UseRowMapper(GrupoMapper.class)
  List<Grupo> getSearchGrupoAnd(String nombre_grupo, String letra_grupo);

  @SqlQuery("SELECT * FROM Grupo WHERE NOMBRE_GRUPO = ? OR LETRA_GRUPO = ?")
  @UseRowMapper(GrupoMapper.class)
  List<Grupo> getSearchGrupoOr(String nombre_grupo, String letra_grupo);

  @SqlUpdate(
      "INSERT INTO Grupo (LETRA_GRUPO, NOMBRE_GRUPO, DNI_PROFESOR,IMAGEN) VALUES (?, ?, ?,?)")
  void addGrupo(String letra_grupo, String nombre_grupo, String dni_profesor, String imagen);

  @SqlUpdate("DELETE FROM grupo WHERE  LETRA_GRUPO = ?")
  void removeGrupo(String letra_grupo);

  @SqlUpdate("UPDATE Grupo SET NOMBRE_GRUPO = ?, DNI_PROFESOR = ? WHERE LETRA_GRUPO = ?")
  void editGrupo(String nombre_grupo, String dni_profesorString, String letra_grupo);

  @SqlUpdate("UPDATE Grupo SET IMAGEN = ? WHERE LETRA_GRUPO = ?")
  void addImage(String imagenint, String id_alumno);
}
