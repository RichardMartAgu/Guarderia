package com.sanvalero.domain;

import lombok.*;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class TutorLegal {

    private String dni_tutor_legal;
    @NonNull
    private String nombre_tutor_legal;
    @NonNull
    private String direccion;
    @NonNull
    private String email;
    @NonNull
    private int telefono;
    private String imagen;
}
