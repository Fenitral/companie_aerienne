package com.demo.gestionProjet.model;

import jakarta.persistence.*;
import java.math.BigDecimal;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "prix_billet_classe", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"id_vol", "id_classe"})
})
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PrixBilletClasse {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_vol", nullable = false)
    private Vol vol;

    @ManyToOne
    @JoinColumn(name = "id_classe", nullable = false)
    private Classe classe;

    @Column(nullable = false, precision = 15, scale = 2)
    private BigDecimal prix; // Prix du billet pour cette classe et ce vol
}
