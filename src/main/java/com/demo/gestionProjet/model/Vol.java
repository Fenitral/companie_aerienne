package com.demo.gestionProjet.model;

// filepath: backend/src/main/java/com/demo/gestionProjet/model/Annonce.java
import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import java.time.LocalDate;

@Entity
@Table(name = "vol")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Vol {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_ville_depart", nullable = false)
    private Ville villeDepart;

    @ManyToOne
    @JoinColumn(name = "id_ville_arrivee", nullable = false)
    private Ville villeArrivee;

    @ManyToOne
    @JoinColumn(name = "id_prix_billet", nullable = false)
    private PrixBillet prixBillet;
}

