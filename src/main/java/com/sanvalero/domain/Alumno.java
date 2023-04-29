package com.sanvalero.domain;

import lombok.*;

import java.time.LocalDate;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Alumno {

  private int id_alumno;
  @NonNull private String nombre_alumno;
  @NonNull private LocalDate fecha_nacimiento;
  @NonNull private String letra_grupo;
  @NonNull private String dni_tutor_legal;
  @NonNull private String imagen;
}
