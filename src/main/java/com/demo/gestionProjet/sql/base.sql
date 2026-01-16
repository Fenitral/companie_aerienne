-- \c postgres;
-- drop database gestion_entreprise;
-- create database gestion_entreprise;
-- \c gestion_entreprise;

-- Statuts
INSERT INTO statut (libelle) VALUES 
('en_attente'),
('retenu'),
('admis'),
('contrat_essai'),
('employe'),
('rejete');

-- Villes
INSERT INTO ville (nom) VALUES ('Antananarivo');
INSERT INTO ville (nom) VALUES ('Paris');
INSERT INTO ville (nom) VALUES ('Lyon');

-- Diplômes
INSERT INTO diplome (nom) VALUES ('Licence Informatique');
INSERT INTO diplome (nom) VALUES ('Master Gestion');
INSERT INTO diplome (nom) VALUES ('Doctorat Mathématiques');

-- Langues
INSERT INTO langue (nom) VALUES ('Français');
INSERT INTO langue (nom) VALUES ('Anglais');
INSERT INTO langue (nom) VALUES ('Malagasy');

-- Départements
INSERT INTO departement (nom) VALUES ('Informatique');
INSERT INTO departement (nom) VALUES ('Ressources Humaines');
INSERT INTO departement (nom) VALUES ('Comptabilité');
INSERT INTO departement (nom) VALUES ('Marketing');
INSERT INTO departement (nom) VALUES ('Logistique');

-- Personnes (employés existants, id 1-5)
INSERT INTO personne (nom, prenom, datenaissance, sexe, ville_id, experience, photo, email) VALUES
('Admin', 'Systeme', '1980-01-01', 'M', 1, 15, NULL, 'admin@entreprise.mg'),
('Rakoto', 'Jean', '1985-05-12', 'M', 1, 10, NULL, 'jean.rakoto@entreprise.mg'),
('Randria', 'Fenitra', '1990-07-23', 'F', 1, 7, NULL, 'fenitra.randria@entreprise.mg'),
('Rasoanaivo', 'Tina', '1992-11-04', 'F', 1, 5, NULL, 'tina.rasoanaivo@entreprise.mg'),
('Andrianina', 'Marie', '1988-03-18', 'F', 1, 12, NULL, 'marie.andrianina@entreprise.mg');

-- Postes (id 1-6)
INSERT INTO poste (nom, departement_id, description, datecreation) VALUES
('Developpeur Java', 1, 'Développement applications Java', CURRENT_DATE),
('Administrateur Systèmes', 1, 'Gestion serveurs et réseaux', CURRENT_DATE),
('Chargé de recrutement', 2, 'Gestion des recrutements', CURRENT_DATE),
('Comptable', 3, 'Gestion de la comptabilité', CURRENT_DATE),
('Chef de projet', 1, 'Gestion de projets informatiques', CURRENT_DATE),
('Responsable Marketing', 4, 'Stratégie marketing et communication', CURRENT_DATE),
('Magasinier', 5, 'Gestion des stocks et logistique', CURRENT_DATE);

-- Employés (id 1-5)
INSERT INTO employe (personne_id, date_embauche, poste_id, candidat_id, matricule, cnaps, categorie, salaire_base) VALUES
(1, '2020-01-01', 3, NULL, 'EMP001', '345670000', '5B', 2800000.0),
(2, '2021-02-15', 4, NULL, 'EMP002', '345670001', '4A', 2500000.0),
(3, '2021-03-10', 1, NULL, 'EMP003', '345670002', '5A', 3000000.0),
(4, '2022-06-01', 2, NULL, 'EMP004', '345670003', '3B', 2200000.0),
(5, '2020-09-20', 5, NULL, 'EMP005', '345670004', '4B', 2600000.0);

-- Utilisateurs (id_employe = 1 à 5)
INSERT INTO utilisateur (username, email, password, id_employe, role) VALUES
('Admin', 'admin@entreprise.mg', 'admin123', 1, 'admin'),
('Jean', 'jean.rakoto@entreprise.mg', 'pass123', 2, 'RH'),
('Fenitra', 'fenitra.randria@entreprise.mg', 'pass123', 3, 'Recruteur'),
('Tina', 'tina.rasoanaivo@entreprise.mg', 'pass123', 4, 'Unite'),
('Marie', 'marie.andrianina@entreprise.mg', 'pass123', 5, 'Recruteur');

-- Ajout d'une nouvelle personne (Paul Rabe, id 6)
INSERT INTO personne (nom, prenom, datenaissance, sexe, ville_id, experience, photo, email) VALUES
('Rabe', 'Paul', '1995-09-15', 'M', 2, 3, NULL, 'paul.rabe@entreprise.mg');

-- Employé Paul Rabe (personne_id = 6, poste_id = 7)
INSERT INTO employe (personne_id, date_embauche, poste_id, candidat_id, matricule, cnaps, categorie, salaire_base) VALUES
(6, '2023-05-10', 7, NULL, 'EMP006', '345670005', '4A', 2400000.0);

-- Utilisateur Paul Rabe (id_employe = 6)
INSERT INTO utilisateur (username, email, password, id_employe, role) VALUES
('Paul', 'paul.rabe@entreprise.mg', 'pass123', 6, 'Logistique');

-- Données de pointage pour Paul Rabe (employe_id = 6)
INSERT INTO pointage (employe_id, date_pointage, heure_entree, heure_debut_pause, heure_fin_pause, heure_sortie, remarque) VALUES
(6, '2024-06-10', '08:00', '12:00', '13:00', '17:00', 'RAS'),
(6, '2024-06-11', '08:05', '12:05', '13:05', '17:10', 'RAS'),
(6, '2024-06-12', '08:10', '12:10', '13:10', '17:15', 'RAS'),
(6, '2024-06-13', '08:00', '12:00', '13:00', '17:00', 'RAS'),
(6, '2024-06-14', '08:00', '12:00', '13:00', '16:50', 'Sortie anticipée');

-- Profils (id 1-5)
INSERT INTO profil (poste_id, nomprofil, datecreation) VALUES
(1, 'Développeur Java Junior', CURRENT_DATE),
(2, 'Administrateur Systèmes Confirmé', CURRENT_DATE),
(3, 'Chargé de Recrutement RH', CURRENT_DATE),
(4, 'Comptable Senior', CURRENT_DATE),
(5, 'Chef de Projet IT', CURRENT_DATE);

-- Critères des profils
INSERT INTO profilcritere (profil_id, ville_id, age, experience) VALUES
(1, 1, 18, 1),
(2, 2, 25, 3),
(3, 2, 22, 2),
(4, 3, 28, 5),
(5, 1, 30, 7);

-- Diplômes requis pour chaque profil
INSERT INTO profil_diplome (profil_id, diplome_id) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 3),
(5, 2);

-- Langues requises pour chaque profil
INSERT INTO profil_langue (profil_id, langue_id) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 1),
(4, 1),
(5, 2);

-- Missions pour chaque profil
INSERT INTO profil_mission (profil_id, description, ordre) VALUES
(1, 'Développer des applications Java', 1),
(1, 'Participer aux réunions techniques', 2),
(2, 'Administrer les serveurs', 1),
(3, 'Gérer le recrutement', 1),
(4, 'Tenir la comptabilité générale', 1),
(5, 'Piloter les projets digitaux', 1);

-- Annonces
INSERT INTO annonce (profil_id, description, datepublication) VALUES
(1, 'Poste pour développeur Java débutant, CDI.', CURRENT_DATE),
(2, 'Administrateur systèmes confirmé, expérience requise.', CURRENT_DATE),
(3, 'Chargé de recrutement RH, CDD.', CURRENT_DATE),
(4, 'Comptable senior, gestion de la comptabilité générale.', CURRENT_DATE),
(5, 'Chef de projet IT, pilotage de projets digitaux.', CURRENT_DATE);

-- Personnes (candidats, id 7-11)
INSERT INTO personne (nom, prenom, datenaissance, sexe, ville_id, experience, photo, email) VALUES
('Dupont', 'Alice', '1995-04-12', 'F', 1, 2, NULL, 'alice.dupont@email.com'),
('Martin', 'Bob', '1990-09-23', 'M', 2, 5, NULL, 'bob.martin@email.com'),
('Durand', 'Chloe', '1998-07-30', 'F', 3, 1, NULL, 'chloe.durand@email.com'),
('Rabe', 'Eric', '1992-02-15', 'M', 1, 4, NULL, 'eric.rabe@email.com'),
('Rakoto', 'Sarah', '1996-11-21', 'F', 2, 3, NULL, 'sarah.rakoto@email.com');

-- Candidats (liés à profils et statuts)
INSERT INTO candidat (personne_id, profil_id, statut_id, datecandidature) VALUES
(7, 1, 1, CURRENT_TIMESTAMP),
(8, 2, 1, CURRENT_TIMESTAMP),
(9, 3, 1, CURRENT_TIMESTAMP),
(10, 4, 4, CURRENT_TIMESTAMP),
(11, 5, 5, CURRENT_TIMESTAMP);

-- Diplômes des personnes
INSERT INTO personne_diplome (personne_id, diplome_id) VALUES
(7, 1),
(8, 2),
(9, 1),
(10, 3),
(11, 2);

-- Langues des personnes
INSERT INTO personne_langue (personne_id, langue_id) VALUES
(7, 1),
(7, 2),
(8, 2),
(9, 1),
(10, 3),
(11, 1);

-- Type d'entretien
INSERT INTO type_entretien (nom) VALUES ('Technique');
INSERT INTO type_entretien (nom) VALUES ('RH');
INSERT INTO type_entretien (nom) VALUES ('Manager');

-- Types de contrat
INSERT INTO typecontrat (nom) VALUES 
('Essai'),
('CDD'),
('CDI');

-- QCM PRO - Questions et Réponses

-- Développeur Java Junior (profil_id = 1)
INSERT INTO question (texte, id_profil) VALUES
('Quel est le rôle de la méthode main en Java ?', 1),
('Quelle structure permet de répéter une action plusieurs fois ?', 1);

-- Réponses pour question 1
INSERT INTO reponse (texte, points, id_question) VALUES
('Elle lance l''exécution du programme', 5, 1),
('Elle définit une variable', 0, 1),
('Elle affiche un message', 0, 1),
('Elle crée une classe', 0, 1);

-- Réponses pour question 2
INSERT INTO reponse (texte, points, id_question) VALUES
('La boucle for', 5, 2),
('La condition if', 0, 2),
('La déclaration int', 0, 2),
('L''import', 0, 2);

-- Administrateur Systèmes Confirmé (profil_id = 2)
INSERT INTO question (texte, id_profil) VALUES
('Quel protocole est recommandé pour une connexion sécurisée à un serveur ?', 2),
('Quelle commande Linux affiche l''espace disque utilisé ?', 2);

-- Réponses pour question 3
INSERT INTO reponse (texte, points, id_question) VALUES
('SSH', 5, 3),
('FTP', 0, 3),
('Telnet', 0, 3),
('HTTP', 0, 3);

-- Réponses pour question 4
INSERT INTO reponse (texte, points, id_question) VALUES
('df', 5, 4),
('ls', 0, 4),
('top', 0, 4),
('ps', 0, 4);

-- Chargé de Recrutement RH (profil_id = 3)
INSERT INTO question (texte, id_profil) VALUES
('Quel document est indispensable pour valider une embauche ?', 3),
('Quel outil facilite la gestion des candidatures ?', 3);

-- Réponses pour question 5
INSERT INTO reponse (texte, points, id_question) VALUES
('Le contrat de travail', 5, 5),
('Le badge d''accès', 0, 5),
('Le CV', 0, 5),
('La fiche de paie', 0, 5);

-- Réponses pour question 6
INSERT INTO reponse (texte, points, id_question) VALUES
('Un logiciel ATS', 5, 6),
('Un tableur Excel', 0, 6),
('Un traitement de texte', 0, 6),
('Un agenda papier', 0, 6);

-- Comptable Senior (profil_id = 4)
INSERT INTO question (texte, id_profil) VALUES
('Quel principe fondamental garantit l''équilibre comptable ?', 4),
('Quel logiciel est le plus utilisé en comptabilité en France ?', 4);

-- Réponses pour question 7
INSERT INTO reponse (texte, points, id_question) VALUES
('La partie double', 5, 7),
('La partie simple', 0, 7),
('La balance générale', 0, 7),
('La consolidation', 0, 7);

-- Réponses pour question 8
INSERT INTO reponse (texte, points, id_question) VALUES
('Sage', 5, 8),
('Photoshop', 0, 8),
('Word', 0, 8),
('PowerPoint', 0, 8);

-- Chef de Projet IT (profil_id = 5)
INSERT INTO question (texte, id_profil) VALUES
('Quel outil est le plus utilisé pour le suivi de projet agile ?', 5),
('Quel est le rôle principal du Scrum Master ?', 5);

-- Réponses pour question 9
INSERT INTO reponse (texte, points, id_question) VALUES
('Jira', 5, 9),
('Teams', 0, 9),
('Slack', 0, 9),
('Excel', 0, 9);

-- Réponses pour question 10
INSERT INTO reponse (texte, points, id_question) VALUES
('Faciliter le travail de l''équipe', 5, 10),
('Décider des tâches à faire', 0, 10),
('Développer le produit', 0, 10),
('Valider les livrables', 0, 10);