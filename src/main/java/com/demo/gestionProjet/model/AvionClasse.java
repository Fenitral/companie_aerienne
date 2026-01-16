package com.demo.gestionProjet.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "avion_classe", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"id_avion", "id_classe"})
})
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AvionClasse {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_avion", nullable = false)
    private Avion avion;

    @ManyToOne
    @JoinColumn(name = "id_classe", nullable = false)
    private Classe classe;

    @Column(nullable = false)
    private int nombrePlaces; // Nombre de places pour cette classe dans cet avion
}
