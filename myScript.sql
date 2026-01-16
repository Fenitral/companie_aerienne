
-- Création de la base de données
CREATE DATABASE compagnie_aerienne;
\c compagnie_aerienne;

-- -----------------------------
-- Table AVION
-- -----------------------------
CREATE TABLE avion(
   id SERIAL PRIMARY KEY,
   capacite INTEGER NOT NULL
);

-- -----------------------------
-- Table VILLE
-- -----------------------------
CREATE TABLE ville(
   id SERIAL PRIMARY KEY,
   nom VARCHAR(80) NOT NULL
);

-- -----------------------------
-- Table PRIX_BILLET
-- -----------------------------
CREATE TABLE prix_billet(
   id SERIAL PRIMARY KEY,
   prix_base NUMERIC(15,2) NOT NULL,
   date_debut DATE NOT NULL,
   date_fin DATE
);

-- -----------------------------
-- Table CLIENT
-- -----------------------------
CREATE TABLE client(
   id SERIAL PRIMARY KEY,
   nom VARCHAR(50) NOT NULL,
   date_naissance DATE NOT NULL
);

-- -----------------------------
-- Table CLASSE
-- -----------------------------
CREATE TABLE classe(
   id SERIAL PRIMARY KEY,
   libelle VARCHAR(50) NOT NULL
);

-- -----------------------------
-- Table VOL (catalogue des vols)
-- -----------------------------
CREATE TABLE vol(
   id SERIAL PRIMARY KEY,
   id_prix_billet INTEGER NOT NULL,
   id_ville_depart INTEGER NOT NULL,
   id_ville_arrivee INTEGER NOT NULL,
   FOREIGN KEY(id_prix_billet) REFERENCES prix_billet(id),
   FOREIGN KEY(id_ville_depart) REFERENCES ville(id),
   FOREIGN KEY(id_ville_arrivee) REFERENCES ville(id)
);

-- -----------------------------
-- Table VOL_PROGRAMME (vol concret avec date et avion)
-- -----------------------------
CREATE TABLE vol_programme(
   id SERIAL PRIMARY KEY,
   date_depart DATE NOT NULL,
   heure_depart TIME NOT NULL,
   id_avion INTEGER NOT NULL,
   id_vol INTEGER NOT NULL,
   FOREIGN KEY(id_avion) REFERENCES avion(id),
   FOREIGN KEY(id_vol) REFERENCES vol(id)
);

-- -----------------------------
-- Table RESERVATION
-- -----------------------------
CREATE TABLE reservation(
   id SERIAL PRIMARY KEY,
   nb_places INTEGER NOT NULL,
   numero_billet VARCHAR(50),
   id_vol_programme INTEGER NOT NULL,
   id_classe INTEGER NOT NULL,
   id_client INTEGER NOT NULL,
   FOREIGN KEY(id_vol_programme) REFERENCES vol_programme(id),
   FOREIGN KEY(id_classe) REFERENCES classe(id),
   FOREIGN KEY(id_client) REFERENCES client(id)
);



===========

-- -- =====================
-- -- TABLE : AVION
-- -- =====================
-- CREATE TABLE avion (
--     id_avion SERIAL PRIMARY KEY,
--     immatriculation VARCHAR(20) UNIQUE NOT NULL,
--     modele VARCHAR(50) NOT NULL,
--     capacite INT NOT NULL CHECK (capacite > 0)
-- );

-- -- =====================
-- -- TABLE : AEROPORT
-- -- =====================
-- CREATE TABLE aeroport (
--     id_aeroport SERIAL PRIMARY KEY,
--     code VARCHAR(10) UNIQUE NOT NULL,
--     nom VARCHAR(100) NOT NULL,
--     ville VARCHAR(50) NOT NULL,
--     pays VARCHAR(50) NOT NULL
-- );

-- -- =====================
-- -- TABLE : VOL
-- -- =====================
-- CREATE TABLE vol (
--     id_vol SERIAL PRIMARY KEY,
--     numero_vol VARCHAR(20) NOT NULL,
--     aeroport_depart INT NOT NULL,
--     aeroport_arrivee INT NOT NULL,
--     CONSTRAINT fk_depart FOREIGN KEY (aeroport_depart)
--         REFERENCES aeroport(id_aeroport),
--     CONSTRAINT fk_arrivee FOREIGN KEY (aeroport_arrivee)
--         REFERENCES aeroport(id_aeroport),
--     CONSTRAINT chk_aeroport DIFFERENT CHECK (aeroport_depart <> aeroport_arrivee)
-- );

-- -- =====================
-- -- TABLE : VOL_PROGRAMME
-- -- =====================
-- CREATE TABLE vol_programme (
--     id_vol_programme SERIAL PRIMARY KEY,
--     id_vol INT NOT NULL,
--     id_avion INT NOT NULL,
--     date_depart TIMESTAMP NOT NULL,
--     date_arrivee TIMESTAMP NOT NULL,
--     CONSTRAINT fk_vol FOREIGN KEY (id_vol)
--         REFERENCES vol(id_vol),
--     CONSTRAINT fk_avion FOREIGN KEY (id_avion)
--         REFERENCES avion(id_avion),
--     CONSTRAINT chk_dates CHECK (date_arrivee > date_depart)
-- );

-- -- =====================
-- -- TABLE : PASSAGER
-- -- =====================
-- CREATE TABLE passager (
--     id_passager SERIAL PRIMARY KEY,
--     nom VARCHAR(50) NOT NULL,
--     prenom VARCHAR(50) NOT NULL,
--     date_naissance DATE NOT NULL,
--     numero_passeport VARCHAR(30) UNIQUE NOT NULL
-- );

-- -- =====================
-- -- TABLE : RESERVATION
-- -- =====================
-- CREATE TABLE reservation (
--     id_reservation SERIAL PRIMARY KEY,
--     id_passager INT NOT NULL,
--     id_vol_programme INT NOT NULL,
--     numero_siege VARCHAR(5) NOT NULL,
--     classe VARCHAR(20) NOT NULL
--         CHECK (classe IN ('Economique', 'Business', 'Premiere')),
--     statut VARCHAR(20) NOT NULL
--         CHECK (statut IN ('Confirmée', 'Annulée')),
--     CONSTRAINT fk_passager FOREIGN KEY (id_passager)
--         REFERENCES passager(id_passager),
--     CONSTRAINT fk_vol_programme FOREIGN KEY (id_vol_programme)
--         REFERENCES vol_programme(id_vol_programme),
--     CONSTRAINT uq_siege UNIQUE (id_vol_programme, numero_siege)
-- );
