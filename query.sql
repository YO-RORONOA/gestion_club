-- Requêtes de Base

-- Lister les informations de tous les membres (pseudo, e-mail, date dinscription):

SELECT pseaudo, email, date_inscription 
FROM memebre;

-- Afficher la liste des jeux disponibles, avec leur titre, genre, et studio de développement:

SELECT titre, genre, studio_developpement 
FROM jeu;

-- Afficher les détails dun tournoi spécifique à partir de son nom:

SELECT * 
FROM tournoi
WHERE nom_tournoi = 'Adventure'; 

-- Lister les emprunts en cours, incluant le pseudo du membre et le titre du jeu:

SELECT memebre.pseaudo, jeu.titre 
FROM emprunt
JOIN memebre ON emprunt.id_membre = memebre.id_membre
JOIN jeu ON emprunt.id_jeu = jeu.id_jeu
WHERE emprunt.date_retour_reelle IS NULL;

-- Lister les membres ayant participé à un tournoi, avec leur pseudo, le nom du tournoi, et leur rang final:

SELECT memebre.pseaudo, tournoi.nom_tournoi, participation.range_final
FROM participation
JOIN memebre ON participation.id_membre = memebre.id_membre
JOIN tournoi ON participation.id_tournoi = tournoi.id_tournoi;

-- Afficher les détails d'un tournoi spécifique à partir de son nom:
SELECT memebre.pseaudo, abonnement.type_abonnement
FROM abonnement
JOIN memebre ON abonnement.id_membre = memebre.id_membre
WHERE abonnement.type_abonnement = 'standard';


-- Lister les emprunts en cours, incluant le pseudo du membre et le titre du jeu:

SELECT memebre.pseaudo, jeu.titre 
FROM emprunt
JOIN memebre ON emprunt.id_membre = memebre.id_membre
JOIN jeu ON emprunt.id_jeu = jeu.id_jeu
WHERE emprunt.date_retour_reelle IS NULL;

-- Lister les membres ayant participé à un tournoi, avec leur pseudo, le nom du tournoi, et leur rang final:

SELECT memebre.pseaudo, tournoi.nom_tournoi, participation.range_final
FROM participation
JOIN memebre ON participation.id_membre = memebre.id_membre
JOIN tournoi ON participation.id_tournoi = tournoi.id_tournoi;

-- Trouver les membres qui ont souscrit à un abonnement annuel:

SELECT memebre.pseaudo, abonnement.type_abonnement
FROM abonnement
JOIN memebre ON abonnement.id_membre = memebre.id_membre
WHERE abonnement.type_abonnement = 'premium';


-- Trouver les jeux empruntés par un membre spécifique (via son pseudo):

SELECT jeu.titre
FROM emprunt
JOIN memebre ON emprunt.id_membre = memebre.id_membre
JOIN jeu ON emprunt.id_jeu = jeu.id_jeu
WHERE memebre.pseaudo = 'PlayerOne';

-- Lister tous les emprunts, en incluant le pseudo du membre et les informations sur le jeu (titre et studio de développement):

SELECT memebre.pseaudo, jeu.titre, jeu.studio_developpement, emprunt.date_emprunt, emprunt.date_retour_prévu
FROM emprunt
JOIN memebre ON emprunt.id_membre = memebre.id_membre
JOIN jeu ON emprunt.id_jeu = jeu.id_jeu;

-- Afficher la liste des membres et le type d'abonnement auquel ils sont associés:

SELECT memebre.pseaudo, abonnement.type_abonnement
FROM abonnement
JOIN memebre ON abonnement.id_membre = memebre.id_membre;
