package com.demo.gestionProjet.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

import java.time.LocalDate;
import java.time.LocalTime;

@Entity
@Table(name = "vol_programme")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class VolProgramme {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "date_depart", nullable = false)
    private LocalDate dateDepart;

    @Column(name = "heure_depart", nullable = false)
    private LocalTime heureDepart;

    @ManyToOne
    @JoinColumn(name = "id_avion", nullable = false)
    private Avion avion;

    @ManyToOne
    @JoinColumn(name = "id_vol", nullable = false)
    private Vol vol;
}
