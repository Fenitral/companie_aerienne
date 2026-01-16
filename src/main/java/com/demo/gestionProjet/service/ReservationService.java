package com.demo.gestionProjet.service;

import com.demo.gestionProjet.model.*;
import com.demo.gestionProjet.repository.*;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class ReservationService {

    private final ReservationRepository reservationRepository;
    private final VolProgrammeRepository volProgrammeRepository;
    private final ClasseRepository classeRepository;
    private final ClientRepository clientRepository;
    private final VolRepository volRepository;

    public ReservationService(
            ReservationRepository reservationRepository,
            VolProgrammeRepository volProgrammeRepository,
            ClasseRepository classeRepository,
            ClientRepository clientRepository,
            VolRepository volRepository) {

        this.reservationRepository = reservationRepository;
        this.volProgrammeRepository = volProgrammeRepository;
        this.classeRepository = classeRepository;
        this.clientRepository = clientRepository;
        this.volRepository = volRepository;
    }

    /* =========================
       SAUVEGARDE
       ========================= */
    public void saveReservation(Long programmeId,
                                Long clientId,
                                Long classeId,
                                int nbPlaces) {

        VolProgramme programme = volProgrammeRepository.findById(programmeId)
                .orElseThrow(() -> new RuntimeException("Programme introuvable"));

        Client client = clientRepository.findById(clientId)
                .orElseThrow(() -> new RuntimeException("Client introuvable"));

        Classe classe = classeRepository.findById(classeId)
                .orElseThrow(() -> new RuntimeException("Classe introuvable"));

        // Create individual reservations for each ticket
        for (int i = 1; i <= nbPlaces; i++) {
            Reservation reservation = new Reservation();
            reservation.setVolProgramme(programme);
            reservation.setClient(client);
            reservation.setClasse(classe);
            reservation.setNbPlaces(1); // Each reservation is for 1 place
            reservation.setNumeroBillet(String.valueOf(i)); // Ticket number starting from 1
            reservationRepository.save(reservation);
        }
    }

    /* =========================
       AUTRES
       ========================= */
    public List<Reservation> findAll() {
        return reservationRepository.findAll();
    }

    public List<Vol> getAllVols() {
        return volRepository.findAll();
    }

    public List<VolProgramme> getProgrammesByVol(Long volId) {
        return volProgrammeRepository.findByVolId(volId);
    }

    public List<LocalDate> getDatesByVol(Long volId) {
        return volProgrammeRepository.findDistinctDatesByVol(volId);
    }

    public List<VolProgramme> getProgrammesByVolAndDate(Long volId, LocalDate date) {
        return volProgrammeRepository.findByVolIdAndDateDepart(volId, date);
    }

}
