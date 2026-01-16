MODIF
donc, on va modifier la base de donnee, puis, 
creer une table utilisateur rattachee au client

IL FAUDRA ENCORE L'AFFICHAGE ' DE DATE ; 
ET C'EST' APRES QU'ON CHOISIT' L HEURE 
(DANS LA PAGE POUR UNE NOUVELLE RESERVATION)

-- -----------------------------
-- Table AVION
-- -----------------------------
INSERT INTO avion (capacite) VALUES
(150),
(200),
(300);

-- -----------------------------
-- Table VILLE
-- -----------------------------
INSERT INTO ville (nom) VALUES
('Antananarivo'),
('Paris'),
('New York'),
('Johannesburg'),
('Istanbul');

-- -----------------------------
-- Table PRIX_BILLET
-- -----------------------------
INSERT INTO prix_billet (prix_base, date_debut, date_fin) VALUES
(500.00, '2026-01-01', NULL),
(750.00, '2026-01-01', NULL),
(1200.00, '2026-01-01', NULL);

-- -----------------------------
-- Table CLIENT
-- -----------------------------
INSERT INTO client (nom, date_naissance) VALUES
('Alice', '1995-03-15'),
('Bob', '1988-07-22'),
('Charlie', '2000-12-05');

-- -----------------------------
-- Table CLASSE
-- -----------------------------
INSERT INTO classe (libelle) VALUES
('Economique'),
('Affaires'),
('Premiere');

-- -----------------------------
-- Table VOL
-- -----------------------------
INSERT INTO vol (id_prix_billet, id_ville_depart, id_ville_arrivee) VALUES
(1, 1, 2), -- Antananarivo -> Paris
(2, 1, 3), -- Antananarivo -> New York
(3, 2, 5), -- Paris -> Istanbul
(1, 3, 4); -- New York -> Johannesburg

-- -----------------------------
-- Table VOL_PROGRAMME
-- -----------------------------
INSERT INTO vol_programme (date_depart, heure_depart, id_avion, id_vol) VALUES
('2026-01-10', '08:00:00', 1, 1),
('2026-01-12', '15:30:00', 2, 2),
('2026-01-15', '20:45:00', 3, 3),
('2026-01-20', '09:00:00', 1, 4);

-- -----------------------------
-- Table RESERVATION
-- -----------------------------
INSERT INTO reservation (nb_places, id_vol_programme, id_classe, id_client) VALUES
(2, 1, 1, 1), -- Alice, Economique, vol Antananarivo -> Paris
(1, 2, 2, 2), -- Bob, Affaires, vol Antananarivo -> New York
(3, 3, 1, 3); -- Charlie, Economique, vol Paris -> Istanbul

-- SUJET2
INSERT INTO ville (nom) VALUES
('Nosy-Be');

INSERT INTO prix_billet (prix_base, date_debut, date_fin) VALUES
(1200000.00, '2026-01-01', NULL);

-- INSERT INTO vol_programme (date_heure_depart, id_avion, id_vol) VALUES
-- ('2026-01-10 08:00:00', 1, 5),
-- ('2026-01-10 15:30:00', 2, 5),
-- ('2026-01-15 20:45:00', 3, 5),
-- ('2026-01-25 09:00:00', 1, 5);

INSERT INTO vol_programme (date_depart, heure_depart, id_avion, id_vol) VALUES
('2026-01-10', '08:00:00', 1, 5),
('2026-01-10', '15:30:00', 2, 5),
('2026-01-15', '20:45:00', 3, 5),
('2026-01-25', '09:00:00', 1, 5);

