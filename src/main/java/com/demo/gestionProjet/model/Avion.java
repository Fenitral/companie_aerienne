package com.demo.gestionProjet.model;

// filepath: backend/src/main/java/com/demo/gestionProjet/model/Annonce.java
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// import lombok.Data;
// import lombok.NoArgsConstructor;
// import lombok.AllArgsConstructor;
import java.time.LocalDate;

@Entity
@Table(name = "avion")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Avion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private int capacite;
}
