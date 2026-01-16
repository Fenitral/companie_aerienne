package com.demo.gestionProjet.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import com.demo.gestionProjet.model.Classe;

public interface ClasseRepository extends JpaRepository<Classe, Long> {}
