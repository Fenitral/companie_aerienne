package com.demo.gestionProjet.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReservationRequest {
    private Long programmeId;
    private Long clientId;
    private Long classeId;
    private int nbPlaces;
}
