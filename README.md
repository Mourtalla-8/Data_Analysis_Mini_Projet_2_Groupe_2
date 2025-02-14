# Gestion des Réservations d’un Restaurant Gastronomique

## 1. Contexte et Objectifs
Le projet consiste en la création d'une application web pour la gestion des réservations dans un restaurant gastronomique. Le système permettra de gérer les clients, le personnel, les tables du restaurant, les menus, les réservations et les notifications associées.

L’objectif est de fournir une solution efficace pour gérer les informations relatives aux réservations et optimiser l’expérience utilisateur tout en facilitant la gestion interne du restaurant.

## 2. Description des Besoins
Le système devra répondre aux besoins suivants :

### 2.1 Gestion des Clients
- Enregistrer les informations des clients : nom, prénom, numéro de téléphone et email.
- Chaque client pourra faire des réservations en fonction de la disponibilité des tables.
- Les clients devront pouvoir modifier ou annuler leurs réservations et consulter le menu en ligne.

### 2.2 Gestion du Personnel
- Enregistrer les informations du personnel : nom, prénom, poste, numéro de téléphone et email.
- Le personnel pourra être affecté à la gestion des tables et des réservations.
- Les membres du personnel devront pouvoir consulter et gérer les réservations et les tables.

### 2.3 Gestion des Tables
- Enregistrer les informations sur les tables : numéro, capacité, disponibilité, emplacement.
- Suivi en temps réel de la disponibilité des tables.
- Le personnel pourra être associé à certaines tables pour la gestion.

### 2.4 Gestion des Menus
- Enregistrer les informations des menus : nom du menu, description, prix, type (entrée, plat principal, dessert), et date de disponibilité.
- Les menus peuvent être assignés à des tables spécifiques pour des occasions spéciales.

### 2.5 Gestion des Réservations
- Enregistrer les informations sur les réservations : date, statut (confirmée, en attente, annulée), nombre de personnes, table réservée, client et personnel associés.
- Les clients pourront faire des réservations en ligne ou par téléphone.
- Le personnel pourra modifier, confirmer ou annuler les réservations.

### 2.6 Gestion des Notifications
- Gérer les notifications envoyées aux clients et au personnel (par email, SMS ou notification push).
- Les notifications informeront de la confirmation, modification ou annulation des réservations.

## 3. Modélisation des Données
La base de données sera modélisée selon un modèle relationnel, avec les entités suivantes :
- Client
- Personnel
- Table_Restaurant
- Menu
- Réservation
- Notification

Des relations seront établies entre ces entités à l'aide de clés étrangères pour garantir l'intégrité des données et permettre une navigation fluide entre les différentes tables.

## 4. Spécification Fonctionnelle
Le projet comportera les fonctionnalités suivantes :
- **Réservation** : Création, modification, et annulation de réservations.
- **Gestion des tables** : Suivi de la disponibilité des tables.
- **Gestion des menus** : Affichage des menus disponibles selon la date.
- **Notification** : Envoi automatique de notifications liées aux réservations (confirmations, annulations, etc.).

## 5. Conception Technique
Diagrammes à réaliser :
- **Diagramme de cas d'utilisation** : Identification des acteurs (clients, personnel) et des interactions principales avec le système.
- **Diagramme de classes** : Définition des entités (client, personnel, table, menu, réservation, notification) et des relations entre elles.
- **Diagramme des séquences** : Représentation des interactions entre les entités lors des opérations de réservation et de gestion des notifications.

## 6. Création et Exploitation de la Base de Données
1. **Modèle physique des données** : Générer le script SQL pour créer la base de données avec les tables et les relations (clés primaires et étrangères).
2. **Données de test** : Alimenter la base avec des données fictives pour tester les fonctionnalités.
3. **Choix du SGBD** : Le projet utilisera un SGBD comme MySQL.
4. **Requêtes SQL** :
   - **Insertion de données** : `INSERT INTO`
   - **Sélection de données** : `SELECT`
   - **Mise à jour de données** : `UPDATE`
   - **Suppression de données** : `DELETE`
   - **Jointures** : Utilisation des `INNER JOIN`, `LEFT JOIN` pour naviguer entre les différentes tables.

