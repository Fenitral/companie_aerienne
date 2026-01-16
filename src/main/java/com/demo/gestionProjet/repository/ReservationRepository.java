package com.demo.gestionProjet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.demo.gestionProjet.model.Reservation;

public interface ReservationRepository extends JpaRepository<Reservation, Long> {
}
