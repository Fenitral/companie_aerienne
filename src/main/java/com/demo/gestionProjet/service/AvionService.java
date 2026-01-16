package com.demo.gestionProjet.service;

import com.demo.gestionProjet.model.*;
import com.demo.gestionProjet.repository.*;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
@AllArgsConstructor
public class AvionService {

    private AvionClasseRepository avionClasseRepository;
    private PrixBilletClasseRepository prixBilletClasseRepository;
    private VolProgrammeRepository volProgrammeRepository;

    /**
     * Calcule le revenu maximal qu'un avion peut générer pour un vol donné
     * Revenu maximal = somme (nombre de places par classe × prix du billet de cette classe)
     */
    public BigDecimal calculerRevenuMaximalPourVol(Avion avion, Vol vol) {
        List<AvionClasse> avionClasses = avionClasseRepository.findByAvion(avion);
        BigDecimal revenuTotal = BigDecimal.ZERO;

        for (AvionClasse avionClasse : avionClasses) {
            PrixBilletClasse prixBilletClasse = prixBilletClasseRepository
                .findByVolAndClasse(vol, avionClasse.getClasse());

            if (prixBilletClasse != null) {
                BigDecimal revenuClasse = prixBilletClasse.getPrix()
                    .multiply(new BigDecimal(avionClasse.getNombrePlaces()));
                revenuTotal = revenuTotal.add(revenuClasse);
            }
        }

        return revenuTotal;
    }

    /**
     * Obtient le nombre de places disponibles pour une classe donnée dans un avion
     */
    public int getNombrePlacesParClasse(Avion avion, Classe classe) {
        return avionClasseRepository.findByAvionAndClasse(avion, classe)
            .map(AvionClasse::getNombrePlaces)
            .orElse(0);
    }

    /**
     * Ajoute des places pour une classe dans un avion
     */
    public AvionClasse ajouterPlacesClasse(Avion avion, Classe classe, int nombrePlaces) {
        AvionClasse avionClasse = new AvionClasse();
        avionClasse.setAvion(avion);
        avionClasse.setClasse(classe);
        avionClasse.setNombrePlaces(nombrePlaces);
        return avionClasseRepository.save(avionClasse);
    }
}
