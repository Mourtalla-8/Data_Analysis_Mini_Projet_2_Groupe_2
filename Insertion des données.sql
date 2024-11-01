-- Insertion des clients
INSERT INTO Client (Nom_Client, Prenom_Client, Email_Client, Téléphone_Client) VALUES
('Diouf', 'Aissatou', 'aissatou.diouf@gmail.com', '+221775555555'),
('Sow', 'Mamadou', 'mamadou.sow@gmail.com', '+221772222222'),
('Fall', 'Mariam', 'mariam.fall@gmail.com', '+221773333333'),
('Ndiaye', 'Lamine', 'lamine.ndiaye@gmail.com', '+221774444444');

-- Insertion du personnel
INSERT INTO Personnel (Nom_Personnel, Prenom_Personnel, Poste_Personnel, Email_Personnel, Téléphone_Personnel) VALUES
('Beye', 'Ndeye Astou', 'Serveuse', 'ndeye.astou.beye@example.com', '+221770123456'),
('Diatta', 'Djio Rose', 'Serveuse', 'djio.rose.diatta@example.com', '+221770234567'),
('Diallo', 'Mouhamadou Diao', 'Serveur', 'mouhamadou.diallo@example.com', '+221770345678'),
('Toure', 'Mourtalla', 'Chef de cuisine', 'mourtalla.toure@example.com', '+221770456789'),
('Ba', 'Khadim', 'Responsable de salle', 'khadim.ba@example.com', '+221770567890');

-- Insertion des tables du restaurant
INSERT INTO Table_Restaurant (Numero_Table_Restaurant, Capacité_Table_Restaurant, Disponibilité_Table_Restaurant, Emplacement_Table_Restaurant, ID_Personnel) VALUES
('T01', 4, TRUE, 'Salle principale', 2),
('T02', 2, TRUE, 'Terrasse', 3),
('T03', 6, TRUE, 'Salle principale', 1),
('T04', 4, TRUE, 'Terrasse', 3);

-- Insertion du menu
INSERT INTO Menu (Nom_Menu, Description_Menu, Prix_Menu, Type_Menu, Date_Disponibilité_Menu, ID_Personnel) VALUES
('Thieboudienne', 'Plat traditionnel sénégalais à base de riz et poisson', 2500.00, 'à la carte', '2024-09-06', 2),
('Yassa Poulet', 'Poulet mariné au citron et oignons', 2000.00, 'à la carte', '2024-09-06', 3),
('Mafé', 'Ragoût de viande dans une sauce d’arachide', 3000.00, 'spécial', '2024-09-06', 1),
('Attiéké', 'Semoule de manioc servie avec viande ou poisson', 2500.00, 'spécial', '2024-09-01', 3);

-- Insertion des réservations
INSERT INTO Reservation (Date_Reservation, Nombre_Personne_Reservation, Statut_Reservation, ID_Client, ID_Personnel) VALUES
('2024-09-10 19:00:00', 4, 'confirmé', 1, 2),
('2024-09-11 20:00:00', 2, 'en attente', 2, 3),
('2024-09-12 18:30:00', 6, 'confirmé', 3, 1),
('2024-09-12 21:30:00', 4, 'annulée', 4, 3);

-- Insertion des notifications
INSERT INTO Notification (Type_Notification, Contenu_Notification, Statut_Notification, ID_Client, ID_Personnel, ID_Reservation) VALUES
('email', 'Confirmation de réservation pour le 10 septembre.', 'envoyé', 1, 2, 1),
('SMS', 'Réservation en attente pour le 11 septembre.', 'en attente', 2, 3, 2),
('email', 'Confirmation de réservation pour le 12 septembre.', 'envoyé', 3, 1, 3),
('SMS', 'Réservation annulée pour le 12 septembre.', 'envoyé', 4, 3, 4);

-- Insertion des attributions
INSERT INTO Attribuer (ID_Reservation, ID_Table_Restaurant) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- Insertion des propositions
INSERT INTO Proposer (ID_Table_Restaurant, ID_Menu) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(3, 1),
(3, 4),
(4, 2),
(4, 3);