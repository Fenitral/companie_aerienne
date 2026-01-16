package com.demo.gestionProjet.repository;

import com.demo.gestionProjet.model.PrixBilletClasse;
import com.demo.gestionProjet.model.Vol;
import com.demo.gestionProjet.model.Classe;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PrixBilletClasseRepository extends JpaRepository<PrixBilletClasse, Long> {
    PrixBilletClasse findByVolAndClasse(Vol vol, Classe classe);
    List<PrixBilletClasse> findByVol(Vol vol);
}
