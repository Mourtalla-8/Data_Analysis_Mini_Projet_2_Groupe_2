-- 1. SELECT :

-- Obtenir tous les clients et leurs informations de contact.
SELECT * FROM Client;

-- Obtenir toutes les réservations avec les détails du client et du personnel.
SELECT 
    r.ID_Reservation, 
    r.Date_Reservation, 
    r.Nombre_Personne_Reservation, 
    r.Statut_Reservation, 
    c.Nom_Client, 
    c.Prenom_Client, 
    p.Nom_Personnel, 
    p.Prenom_Personnel
FROM 
    Reservation r
JOIN 
    Client c ON r.ID_Client = c.ID_Client
JOIN 
    Personnel p ON r.ID_Personnel = p.ID_Personnel;

-- Obtenir tous les clients, leurs réservations et les tables qui leur sont attribuées :
SELECT 
    c.Nom_Client, 
    c.Prenom_Client, 
    r.Date_Reservation, 
    r.Nombre_Personne_Reservation, 
    r.Statut_Reservation, 
    t.Numero_Table_Restaurant
FROM 
    Client c
JOIN 
    Reservation r ON c.ID_Client = r.ID_Client
JOIN 
    Attribuer a ON r.ID_Reservation = a.ID_Reservation
JOIN 
    table_restaurant t ON a.ID_Table_Restaurant = t.ID_Table_Restaurant;

-- Obtenir les notifications envoyées pour chaque réservation d'un client donné :
SELECT 
    c.Nom_Client, 
    c.Prenom_Client, 
    n.Type_Notification, 
    n.Contenu_Notification, 
    n.Statut_Notification, 
    r.Date_Reservation
FROM 
    Notification n
JOIN 
    Client c ON n.ID_Client = c.ID_Client
JOIN 
    Reservation r ON n.ID_Reservation = r.ID_Reservation
WHERE 
    c.ID_Client = 1;

---------------------------------------------------------------------------------------------

-- 2. INSERT INTO :

-- Ajouter un nouveau client.
INSERT INTO Client (Nom_Client, Prenom_Client, Email_Client, Téléphone_Client) 
VALUES ('Toure', 'Fatou', 'fatou.toure@gmail.com', '+221771234567');

-- Ajouter une nouvelle réservation.
INSERT INTO Reservation (Date_Reservation, Nombre_Personne_Reservation, Statut_Reservation, ID_Client, ID_Personnel) 
VALUES ('2024-09-15 19:00:00', 2, 'confirmé', 5, 2);

INSERT INTO Attribuer (ID_Reservation, ID_Table_Restaurant) 
VALUES (5, 1);

INSERT INTO Notification (Type_Notification, Contenu_Notification, Statut_Notification, ID_Client, ID_Personnel, ID_Reservation) 
VALUES ('email', 'Votre réservation du 15 septembre est confirmée.', 'envoyé', 5, 2, 5);


---------------------------------------------------------------------------------------------

-- 3. UPDATE :

-- Modifier le numéro de téléphone d'un client.
UPDATE Client 
SET Téléphone_Client = '+221771111111' 
WHERE ID_Client = 3;

-- Mettre à jour le statut d'une réservation.
UPDATE Reservation 
SET Statut_Reservation = 'annulée' 
WHERE ID_Reservation = 2;

INSERT INTO Notification (Type_Notification, Contenu_Notification, Statut_Notification, ID_Client, ID_Personnel, ID_Reservation) 
VALUES ('SMS', 'Réservation annulée pour le 11 septembre.', 'envoyé', 2, 3, 2);

---------------------------------------------------------------------------------------------

-- 4. DELETE :

-- Supprimer les notifications associées au client
DELETE FROM Notification 
WHERE ID_Client = 2;

-- Supprimer les attributions associées aux réservations du client
DELETE FROM Attribuer 
WHERE ID_Reservation IN (SELECT ID_Reservation FROM Reservation WHERE ID_Client = 2);

-- Supprimer les réservations associées au client
DELETE FROM Reservation 
WHERE ID_Client = 2;

-- Supprimer le client
DELETE FROM Client 
WHERE ID_Client = 2;

---------------------------------------------------------------------------------------------

-- 5. DROP TABLE :

DROP TABLE IF EXISTS Notification;

---------------------------------------------------------------------------------------------

-- 6. Jointures :

-- a. INNER JOIN :
-- Obtenir tous les plats proposés pour chaque table dans le restaurant :
SELECT 
    t.Numero_Table_Restaurant, 
    m.Nom_Menu, 
    m.Prix_Menu
FROM 
    Table_Restaurant t
INNER JOIN 
    Proposer p ON t.ID_Table_Restaurant = p.ID_Table_Restaurant
INNER JOIN 
    Menu m ON p.ID_Menu = m.ID_Menu;

-- Obtenir toutes les réservations et les détails des notifications associées :
SELECT 
    r.ID_Reservation, 
    r.Date_Reservation, 
    r.Nombre_Personne_Reservation, 
    n.Type_Notification, 
    n.Contenu_Notification, 
    n.Statut_Notification
FROM 
    Reservation r
INNER JOIN 
    Notification n ON r.ID_Reservation = n.ID_Reservation;
    
-- Obtenir les détails de chaque réservation avec le client, le personnel et les plats commandés :
SELECT 
    r.ID_Reservation, 
    c.Nom_Client, 
    c.Prenom_Client, 
    p.Nom_Personnel, 
    p.Prenom_Personnel, 
    m.Nom_Menu
FROM 
    Reservation r
INNER JOIN 
    Client c ON r.ID_Client = c.ID_Client
INNER JOIN 
    Personnel p ON r.ID_Personnel = p.ID_Personnel
INNER JOIN 
    Proposer pr ON r.ID_Reservation = pr.ID_Table_Restaurant
INNER JOIN 
    Menu m ON pr.ID_Menu = m.ID_Menu;


-- b. LEFT JOIN
-- Obtenir la liste des réservations et, s'il y en a, les notifications associées (affiche même s'il n'y a pas de notification) :
SELECT 
    r.ID_Reservation, 
    r.Date_Reservation, 
    r.Nombre_Personne_Reservation, 
    n.Type_Notification, 
    n.Contenu_Notification
FROM 
    Reservation r
LEFT JOIN 
    Notification n ON r.ID_Reservation = n.ID_Reservation;

-- Obtenir toutes les tables avec les réservations qui leur sont attribuées (affiche même s'il n'y a pas de réservation pour la table) :
SELECT 
    t.Numero_Table_Restaurant, 
    r.ID_Reservation, 
    r.Date_Reservation, 
    r.Nombre_Personne_Reservation
FROM 
    Table_Restaurant t
LEFT JOIN 
    Attribuer a ON t.ID_Table_Restaurant = a.ID_Table_Restaurant
LEFT JOIN 
    Reservation r ON a.ID_Reservation = r.ID_Reservation;


-- c. UPDATE avec JOIN
-- Mettre à jour le nombre de personnes dans une réservation en fonction du client :
UPDATE 
    Reservation r
INNER JOIN 
    Client c ON r.ID_Client = c.ID_Client
SET 
    r.Nombre_Personne_Reservation = 5
WHERE 
    c.Nom_Client = 'Toure' AND c.Prenom_Client = 'Fatou';


-- d. DELETE avec JOIN
-- Supprimer les réservations et les notifications associées à un client spécifique :

-- 1. Supprimer les entrées de la table Attribuer qui sont liées aux réservations :
DELETE FROM Attribuer 
WHERE ID_Reservation IN (SELECT ID_Reservation FROM Reservation WHERE ID_Client = 5);

-- 2. Supprimer les notifications liées à la réservation :
DELETE FROM Notification 
WHERE ID_Reservation IN (SELECT ID_Reservation FROM Reservation WHERE ID_Client = 5);

-- 3. Ensuite, tu pourras supprimer les réservations :
DELETE FROM Reservation 
WHERE ID_Client = 5;

-- 4. Enfin, tu peux supprimer le client lui-même :
DELETE FROM Client 
WHERE ID_Client = 5;

