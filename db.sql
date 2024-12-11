-- Create `memebre` table
CREATE TABLE memebre (
    id_membre INT AUTO_INCREMENT PRIMARY KEY,
    pseaudo VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    date_inscription DATE NOT NULL
);

-- `jeu` table
CREATE TABLE jeu (
    id_jeu INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(100) NOT NULL,
    studio_developpement VARCHAR(100) NOT NULL,
    annee_sortie INT NOT NULL,
    genre VARCHAR(50),
    multijoueur INT NOT NULL CHECK (multijoueur IN (0, 1))
);

-- `abonnement` table
CREATE TABLE abonnement (
    id_abonnement INT AUTO_INCREMENT PRIMARY KEY,
    type_abonnement VARCHAR(50) NOT NULL,
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL,
    id_membre INT,
    FOREIGN KEY (id_membre) REFERENCES memebre(id_membre)
);

-- `emprunt` table
CREATE TABLE emprunt (
    id_emprunt INT AUTO_INCREMENT PRIMARY KEY,
    date_emprunt DATE NOT NULL,
    date_retour_prévu DATE NOT NULL,
    date_retour_reelle DATE,
    id_membre INT,
    id_jeu INT,
    FOREIGN KEY (id_membre) REFERENCES memebre(id_membre),
    FOREIGN KEY (id_jeu) REFERENCES jeu(id_jeu)
);

-- `tournoi` table
CREATE TABLE tournoi (
    id_tournoi INT AUTO_INCREMENT PRIMARY KEY,
    nom_tournoi VARCHAR(100) NOT NULL,
    date_tournoi DATE NOT NULL,
    recompenses VARCHAR(100)
);

-- `participation` table
CREATE TABLE participation (
    participation_id INT AUTO_INCREMENT PRIMARY KEY,
    score INT NOT NULL,
    range_final INT NOT NULL,
    id_membre INT,
    id_tournoi INT,
    FOREIGN KEY (id_membre) REFERENCES memebre(id_membre),
    FOREIGN KEY (id_tournoi) REFERENCES tournoi(id_tournoi)
);



-- data 'memebre' table
INSERT INTO memebre (id_membre, pseaudo, email, date_inscription) VALUES
(1, 'PlayerOne', 'player1@example.com', '2023-01-15'),
(2, 'PlayerTwo', 'player2@example.com', '2023-03-22'),
(3, 'PlayerThree', 'player3@example.com', '2023-04-10'),
(4, 'PlayerFour', 'player4@example.com', '2023-05-05'),
(5, 'PlayerFive', 'player5@example.com', '2023-06-19'),
(6, 'PlayerSix', 'player6@example.com', '2023-07-23'),
(7, 'PlayerSeven', 'player7@example.com', '2023-08-01'),
(8, 'PlayerEight', 'player8@example.com', '2023-08-12'),
(9, 'PlayerNine', 'player9@example.com', '2023-09-14'),
(10, 'PlayerTen', 'player10@example.com', '2023-10-01'),
(11, 'PlayerEleven', 'player11@example.com', '2023-10-15'),
(12, 'PlayerTwelve', 'player12@example.com', '2023-11-01'),
(13, 'PlayerThirteen', 'player13@example.com', '2023-11-15'),
(14, 'PlayerFourteen', 'player14@example.com', '2023-12-01'),
(15, 'PlayerFifteen', 'player15@example.com', '2023-12-10'),
(16, 'PlayerSixteen', 'player16@example.com', '2024-01-01'),
(17, 'PlayerSeventeen', 'player17@example.com', '2024-01-10'),
(18, 'PlayerEighteen', 'player18@example.com', '2024-02-15'),
(19, 'PlayerNineteen', 'player19@example.com', '2024-03-01'),
(20, 'PlayerTwenty', 'player20@example.com', '2024-03-20');

-- data'abonnement' table
INSERT INTO abonnement (id_abonnement, type_abonnement, date_debut, date_fin, id_membre) VALUES
(1, 'Premium', '2023-01-01', '2023-12-31', 1),
(2, 'Standard', '2023-02-15', '2023-08-15', 2),
(3, 'Premium', '2023-03-01', '2024-03-01', 3),
(4, 'Standard', '2023-04-10', '2023-10-10', 4),
(5, 'Premium', '2023-05-15', '2024-05-15', 5),
(6, 'Standard', '2023-06-20', '2023-12-20', 6),
(7, 'Premium', '2023-07-10', '2024-07-10', 7),
(8, 'Standard', '2023-08-01', '2024-01-01', 8),
(9, 'Premium', '2023-09-05', '2024-09-05', 9),
(10, 'Standard', '2023-10-10', '2024-04-10', 10),
(11, 'Premium', '2023-11-01', '2024-11-01', 11),
(12, 'Standard', '2023-12-01', '2024-06-01', 12),
(13, 'Premium', '2024-01-01', '2024-12-31', 13),
(14, 'Standard', '2024-02-10', '2024-08-10', 14),
(15, 'Premium', '2024-03-01', '2024-09-01', 15),
(16, 'Standard', '2024-04-01', '2024-10-01', 16),
(17, 'Premium', '2024-05-05', '2024-11-05', 17),
(18, 'Standard', '2024-06-01', '2024-12-01', 18),
(19, 'Premium', '2024-07-01', '2024-07-01', 19),
(20, 'Standard', '2024-08-01', '2024-02-01', 20);

-- data 'jeu' table
INSERT INTO jeu (id_jeu, titre, studio_developpement, annee_sortie, genre, multijoueur) VALUES
(1, 'GameOne', 'StudioOne', 2020, 'Action', 1),
(2, 'GameTwo', 'StudioTwo', 2021, 'Adventure', 0),
(3, 'GameThree', 'StudioThree', 2019, 'Puzzle', 1),
(4, 'GameFour', 'StudioFour', 2022, 'Strategy', 0),
(5, 'GameFive', 'StudioFive', 2018, 'Shooter', 1),
(6, 'GameSix', 'StudioSix', 2020, 'Action', 0),
(7, 'GameSeven', 'StudioSeven', 2021, 'RPG', 1),
(8, 'GameEight', 'StudioEight', 2022, 'Adventure', 0),
(9, 'GameNine', 'StudioNine', 2023, 'Horror', 1),
(10, 'GameTen', 'StudioTen', 2024, 'Action', 1),
(11, 'GameEleven', 'StudioEleven', 2017, 'Racing', 0),
(12, 'GameTwelve', 'StudioTwelve', 2016, 'Fighting', 1),
(13, 'GameThirteen', 'StudioThirteen', 2025, 'Simulation', 0),
(14, 'GameFourteen', 'StudioFourteen', 2020, 'Shooter', 1),
(15, 'GameFifteen', 'StudioFifteen', 2019, 'Adventure', 0),
(16, 'GameSixteen', 'StudioSixteen', 2022, 'Strategy', 1),
(17, 'GameSeventeen', 'StudioSeventeen', 2024, 'RPG', 0),
(18, 'GameEighteen', 'StudioEighteen', 2021, 'Fighting', 1),
(19, 'GameNineteen', 'StudioNineteen', 2023, 'Racing', 0),
(20, 'GameTwenty', 'StudioTwenty', 2024, 'Simulation', 1);

-- data 'emprunt' table
INSERT INTO emprunt (id_emprunt, date_emprunt, date_retour_prévu, date_retour_reelle, id_membre, id_jeu) VALUES
(1, '2024-12-01', '2024-12-10', NULL, 1, 1),
(2, '2024-12-02', '2024-12-12', NULL, 2, 2),
(3, '2024-12-03', '2024-12-15', NULL, 3, 3),
(4, '2024-12-04', '2024-12-18', NULL, 4, 4),
(5, '2024-12-05', '2024-12-20', NULL, 5, 5),
(6, '2024-12-06', '2024-12-22', NULL, 6, 6),
(7, '2024-12-07', '2024-12-25', NULL, 7, 7),
(8, '2024-12-08', '2024-12-30', NULL, 8, 8),
(9, '2024-12-09', '2024-12-31', NULL, 9, 9),
(10, '2024-12-10', '2024-12-05', NULL, 10, 10),
(11, '2024-12-11', '2024-12-12', NULL, 11, 11),
(12, '2024-12-12', '2024-12-14', NULL, 12, 12),
(13, '2024-12-13', '2024-12-18', NULL, 13, 13),
(14, '2024-12-14', '2024-12-20', NULL, 14, 14),
(15, '2024-12-15', '2024-12-22', NULL, 15, 15),
(16, '2024-12-16', '2024-12-25', NULL, 16, 16),
(17, '2024-12-17', '2024-12-28', NULL, 17, 17),
(18, '2024-12-18', '2024-12-30', NULL, 18, 18),
(19, '2024-12-19', '2024-12-30', NULL, 19, 19),
(20, '2024-12-20', '2024-12-31', NULL, 20, 20);

-- data 'participation' table
INSERT INTO participation (participation_id, score, range_final, id_membre, id_tournoi) VALUES
(1, 95, 1, 1, 1),
(2, 85, 2, 2, 1),
(3, 90, 1, 3, 2),
(4, 75, 3, 4, 3),
(5, 80, 2, 5, 2),
(6, 92, 1, 6, 1),
(7, 88, 2, 7, 2),
(8, 82, 3, 8, 3),
(9, 70, 4, 9, 1),
(10, 95, 1, 10, 2),
(11, 60, 4, 11, 3),
(12, 77, 3, 12, 1),
(13, 83, 2, 13, 2),
(14, 85, 1, 14, 3),
(15, 79, 3, 15, 1),
(16, 72, 4, 16, 2),
(17, 93, 1, 17, 3),
(18, 76, 2, 18, 1),
(19, 89, 1, 19, 2),
(20, 66, 4, 20, 3);
