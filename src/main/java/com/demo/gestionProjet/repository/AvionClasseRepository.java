package com.demo.gestionProjet.repository;

import com.demo.gestionProjet.model.AvionClasse;
import com.demo.gestionProjet.model.Avion;
import com.demo.gestionProjet.model.Classe;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface AvionClasseRepository extends JpaRepository<AvionClasse, Long> {
    List<AvionClasse> findByAvion(Avion avion);
    Optional<AvionClasse> findByAvionAndClasse(Avion avion, Classe classe);
}
