package com.savalero.domain;

import lombok.*;

import java.time.LocalDate;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Grupo {

    private String letra_grupo;
    @NonNull
    private String nombre_grupo;
    @NonNull
    private String dni_profesor;


}
