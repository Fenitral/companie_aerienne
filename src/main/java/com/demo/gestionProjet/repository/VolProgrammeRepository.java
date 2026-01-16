package com.demo.gestionProjet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

import com.demo.gestionProjet.model.VolProgramme;

public interface VolProgrammeRepository extends JpaRepository<VolProgramme, Long> {
    List<VolProgramme> findByVolId(Long volId);

    @Query("""
        SELECT DISTINCT vp.dateDepart
        FROM VolProgramme vp
        WHERE vp.vol.id = :volId
        ORDER BY vp.dateDepart
    """)
    List<LocalDate> findDistinctDatesByVol(@Param("volId") Long volId);

    List<VolProgramme> findByVolIdAndDateDepart(Long volId, LocalDate date);


}