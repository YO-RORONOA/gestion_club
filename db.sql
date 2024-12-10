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



