package com.demo.gestionProjet.controller;

import com.demo.gestionProjet.repository.VolProgrammeRepository;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/vols")
public class VolController {

    private final VolProgrammeRepository volProgrammeRepository;

    public VolController(VolProgrammeRepository volProgrammeRepository) {
        this.volProgrammeRepository = volProgrammeRepository;
    }

    @GetMapping
    public String listVols(Model model) {
        model.addAttribute("vols", volProgrammeRepository.findAll());
        return "vols"; // correspond à vols.jsp
    }
}
