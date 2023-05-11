package com.sanvalero.dao;

import com.sanvalero.domain.Alumno;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;
import java.util.Date;
import java.util.List;

public interface AlumnoDAO {

  @SqlQuery("SELECT * FROM Alumno")
  @UseRowMapper(AlumnoMapper.class)
  List<Alumno> getAlumnos();

  @SqlQuery("SELECT * FROM Alumno WHERE ID_ALUMNO = ?")
  @UseRowMapper(AlumnoMapper.class)
  Alumno getAlumno(int id_alumno);

  @SqlQuery("SELECT * FROM Alumno WHERE letra_grupo = ?")
  @UseRowMapper(AlumnoMapper.class)
  List<Alumno> getAlumnoLetraGrupo(String letra_grupo);

  @SqlQuery("SELECT * FROM Alumno WHERE ID_ALUMNO = ? AND LETRA_GRUPO = ?")
  @UseRowMapper(AlumnoMapper.class)
  List<Alumno> getSearchAlumnoAnd(String id_alumno, String letra_grupo);

  @SqlQuery("SELECT * FROM Alumno WHERE ID_ALUMNO = ? OR LETRA_GRUPO = ?")
  @UseRowMapper(AlumnoMapper.class)
  List<Alumno> getSearchAlumnoOr(String id_alumno, String letra_grupo);

  @SqlUpdate(
      "INSERT INTO Alumno (NOMBRE_ALUMNO, FECHA_NACIMIENTO, LETRA_GRUPO, DNI_TUTOR_LEGAL,IMAGEN) VALUES ( ?,?, ?, ?,?)")
  void addAlumno(
      String nombre_alumno,
      Date fecha_nacimiento,
      String letra_grupo,
      String dni_tutor_legal,
      String imagen);

  @SqlUpdate("DELETE FROM Alumno WHERE ID_ALUMNO = ?")
  void removeAlumno(int id);

  @SqlUpdate("DELETE FROM Alumno WHERE DNI_TUTOR_LEGAL = ?")
  void removeAlumnoDniTutorLegal(String dni_tutor_legal);

  @SqlUpdate(
      "UPDATE Alumno SET NOMBRE_ALUMNO = ?, FECHA_NACIMIENTO = ?, LETRA_GRUPO = ?, DNI_TUTOR_LEGAL = ? WHERE ID_ALUMNO = ?")
  void editAlumno(
      String nombre_alumno,
      Date fecha_nacimiento,
      String letra_grupo,
      String dni_tutor_legal,
      int id_alumno);
  @SqlUpdate(
          "UPDATE Alumno SET IMAGEN = ? WHERE ID_ALUMNO = ?")
  void addImage(
          String imagenint,int id_alumno);
}

