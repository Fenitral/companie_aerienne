package com.demo.gestionProjet.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Entity
@Table(name = "reservation")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reservation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private int nbPlaces;

    @Column(nullable = false)
    private String numeroBillet;

    @ManyToOne
    @JoinColumn(name = "id_vol_programme", nullable = false)
    private VolProgramme volProgramme;

    @ManyToOne
    @JoinColumn(name = "id_client", nullable = false)
    private Client client;

    @ManyToOne
    @JoinColumn(name = "id_classe", nullable = false)
    private Classe classe;
}
