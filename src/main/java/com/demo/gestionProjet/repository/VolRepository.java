package com.demo.gestionProjet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.demo.gestionProjet.model.Vol;

public interface VolRepository extends JpaRepository<Vol, Long> {

}