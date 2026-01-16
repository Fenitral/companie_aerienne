package com.demo.gestionProjet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.demo.gestionProjet.model.Client;

public interface ClientRepository extends JpaRepository<Client, Long> {}

