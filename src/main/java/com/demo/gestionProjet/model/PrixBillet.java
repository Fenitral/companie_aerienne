package com.demo.gestionProjet.model;

// filepath: backend/src/main/java/com/demo/gestionProjet/model/Annonce.java
import jakarta.persistence.*;
import java.math.BigDecimal;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import java.time.LocalDate;

@Entity
@Table(name = "prix_billet")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PrixBillet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, precision = 15, scale = 2)
    private BigDecimal prixBase;

    @Column(nullable = false)
    private LocalDate dateDebut;

    private LocalDate dateFin;
}
