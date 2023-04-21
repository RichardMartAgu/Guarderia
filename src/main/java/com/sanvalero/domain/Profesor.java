package com.sanvalero.domain;

import lombok.*;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class Profesor {

    private String dni_profesor;
    @NonNull
    private String nombre_profesor;
    @NonNull
    private String direccion;
    @NonNull
    private String email;
    @NonNull
    private int telefono;
    private String imagen;

}
