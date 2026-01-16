package com.demo.gestionProjet.controller;

import com.demo.gestionProjet.model.VolProgramme;
import com.demo.gestionProjet.repository.ClientRepository;
import com.demo.gestionProjet.repository.ClasseRepository;
import com.demo.gestionProjet.service.ReservationService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/reservations")
public class ReservationController {

    private final ReservationService reservationService;
    private final ClientRepository clientRepository;
    private final ClasseRepository classeRepository;

    public ReservationController(ReservationService reservationService,
                                 ClientRepository clientRepository,
                                 ClasseRepository classeRepository) {
        this.reservationService = reservationService;
        this.clientRepository = clientRepository;
        this.classeRepository = classeRepository;
    }

    /* ======================
       FORMULAIRE
       ====================== */
    @GetMapping("/new")
    public String newReservation(Model model) {
        model.addAttribute("vols", reservationService.getAllVols());
        model.addAttribute("clients", clientRepository.findAll());
        model.addAttribute("classes", classeRepository.findAll());
        return "reservation/new-reservation";
    }

    /* ======================
       AJAX PROGRAMMES
       ====================== */
    @GetMapping("/programmes/{volId}")
    @ResponseBody
    public List<VolProgramme> getProgrammes(@PathVariable Long volId) {
        return reservationService.getProgrammesByVol(volId);
    }

    /* ======================
       SAUVEGARDE
       ====================== */
    @PostMapping("/save")
    public String saveReservation(
            @RequestParam Long programmeId,
            @RequestParam Long clientId,
            @RequestParam Long classeId,
            @RequestParam int nbPlaces) {

        reservationService.saveReservation(
                programmeId,
                clientId,
                classeId,
                nbPlaces
        );

        return "redirect:/reservations/liste";
    }

    /* ======================
       LISTE
       ====================== */
    @GetMapping("/liste")
    public String listReservations(Model model) {
        model.addAttribute("reservations", reservationService.findAll());
        return "reservation/list";
    }
}
