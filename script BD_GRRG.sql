-- Suppression des tables si elles existent déjà
DROP TABLE IF EXISTS Attribuer;
DROP TABLE IF EXISTS Proposer;
DROP TABLE IF EXISTS Notification;
DROP TABLE IF EXISTS Reservation;
DROP TABLE IF EXISTS Menu;
DROP TABLE IF EXISTS Table_Restaurant;
DROP TABLE IF EXISTS Personnel;
DROP TABLE IF EXISTS Client;

-- Création des tables
CREATE TABLE Client (
    ID_Client INT(5) AUTO_INCREMENT NOT NULL,
    Nom_Client VARCHAR(50),
    Prenom_Client VARCHAR(50),
    Email_Client VARCHAR(100),
    Téléphone_Client VARCHAR(20),
    PRIMARY KEY (ID_Client)
) ENGINE=InnoDB;

CREATE TABLE Personnel (
    ID_Personnel INT(5) AUTO_INCREMENT NOT NULL,
    Nom_Personnel VARCHAR(50),
    Prenom_Personnel VARCHAR(50),
    Poste_Personnel VARCHAR(50),
    Email_Personnel VARCHAR(100),
    Téléphone_Personnel VARCHAR(20),
    PRIMARY KEY (ID_Personnel)
) ENGINE=InnoDB;

CREATE TABLE Table_Restaurant (
    ID_Table_Restaurant INT(5) AUTO_INCREMENT NOT NULL,
    Numero_Table_Restaurant VARCHAR(10),
    Capacité_Table_Restaurant INT(5),
    Disponibilité_Table_Restaurant BOOLEAN,
    Emplacement_Table_Restaurant VARCHAR(50),
    ID_Personnel INT(5),
    PRIMARY KEY (ID_Table_Restaurant)
) ENGINE=InnoDB;

CREATE TABLE Menu (
    ID_Menu INT(5) AUTO_INCREMENT NOT NULL,
    Nom_Menu VARCHAR(100),
    Description_Menu TEXT,
    Prix_Menu DECIMAL(10,2),
    Type_Menu ENUM('spécial', 'à la carte'),
    Date_Disponibilité_Menu DATE,
    ID_Personnel INT(5),
    PRIMARY KEY (ID_Menu)
) ENGINE=InnoDB;

CREATE TABLE Reservation (
    ID_Reservation INT(5) AUTO_INCREMENT NOT NULL,
    Date_Reservation DATETIME,
    Nombre_Personne_Reservation INT(10),
    Statut_Reservation ENUM('confirmé', 'en attente', 'annulée'),
    ID_Client INT(5),
    ID_Personnel INT(5),
    PRIMARY KEY (ID_Reservation)
) ENGINE=InnoDB;

CREATE TABLE Notification (
    ID_Notification INT(5) AUTO_INCREMENT NOT NULL,
    Type_Notification ENUM('email', 'SMS'),
    Contenu_Notification TEXT,
    Statut_Notification ENUM('envoyé', 'en attente'),
    ID_Client INT(5),
    ID_Personnel INT(5),
    ID_Reservation INT(5),
    PRIMARY KEY (ID_Notification)
) ENGINE=InnoDB;

CREATE TABLE Attribuer (
    ID_Reservation INT(5),
    ID_Table_Restaurant INT(5),
    PRIMARY KEY (ID_Reservation, ID_Table_Restaurant)
) ENGINE=InnoDB;

CREATE TABLE Proposer (
    ID_Table_Restaurant INT(5),
    ID_Menu INT(5),
    PRIMARY KEY (ID_Table_Restaurant, ID_Menu)
) ENGINE=InnoDB;

-- Définition des clés étrangères
ALTER TABLE Notification
    ADD CONSTRAINT FK_Notification_ID_Client FOREIGN KEY (ID_Client) REFERENCES Client (ID_Client),
    ADD CONSTRAINT FK_Notification_ID_Personnel FOREIGN KEY (ID_Personnel) REFERENCES Personnel (ID_Personnel),
    ADD CONSTRAINT FK_Notification_ID_Reservation FOREIGN KEY (ID_Reservation) REFERENCES Reservation (ID_Reservation);

ALTER TABLE Reservation
    ADD CONSTRAINT FK_Reservation_ID_Client FOREIGN KEY (ID_Client) REFERENCES Client (ID_Client),
    ADD CONSTRAINT FK_Reservation_ID_Personnel FOREIGN KEY (ID_Personnel) REFERENCES Personnel (ID_Personnel);

ALTER TABLE Table_Restaurant
    ADD CONSTRAINT FK_Table_Restaurant_ID_Personnel FOREIGN KEY (ID_Personnel) REFERENCES Personnel (ID_Personnel);

ALTER TABLE Menu
    ADD CONSTRAINT FK_Menu_ID_Personnel FOREIGN KEY (ID_Personnel) REFERENCES Personnel (ID_Personnel);

ALTER TABLE Attribuer
    ADD CONSTRAINT FK_Attribuer_ID_Reservation FOREIGN KEY (ID_Reservation) REFERENCES Reservation (ID_Reservation),
    ADD CONSTRAINT FK_Attribuer_ID_Table_Restaurant FOREIGN KEY (ID_Table_Restaurant) REFERENCES Table_Restaurant (ID_Table_Restaurant);

ALTER TABLE Proposer
    ADD CONSTRAINT FK_Proposer_ID_Table_Restaurant FOREIGN KEY (ID_Table_Restaurant) REFERENCES Table_Restaurant (ID_Table_Restaurant),
    ADD CONSTRAINT FK_Proposer_ID_Menu FOREIGN KEY (ID_Menu) REFERENCES Menu (ID_Menu);