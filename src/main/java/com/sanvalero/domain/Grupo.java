package com.sanvalero.domain;

import lombok.*;

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
    private String imagen;

}
