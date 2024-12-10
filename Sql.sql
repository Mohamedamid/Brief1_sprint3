-- CREATE DATABASE

CREATE DATABASE streaming_service;

USE streaming_service;

--CREATE TABLE subscription

CREATE TABLE subscription (
    SubscriptionID INT PRIMARY KEY AUTO_INCREMENT,
    SubscriptionType VARCHAR(50) NOT NULL,
    MonthlyFree DECIMAL(10,2)
);

--CREATE TABLE users

CREATE TABLE users (
    userId INT PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    RegistrationDate DATE NOT NULL,
    SubscriptionID INT,
    FOREIGN KEY (SubscriptionID) REFERENCES subscription(SubscriptionID)
);

--CREATE TABLE review

CREATE TABLE review (
    reviewID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES users(UserID),
    MovieID INT,
    Rating INT NOT NULL,
    ReviewText TEXT,
    ReviewDate DATE NOT NULL
);

--CREATE TABLE movie

CREATE TABLE movie (
    MovieID INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    Genre VARCHAR(100) NOT NULL,
    ReleaseYear INT NOT NULL,
    Duration INT,
    rating VARCHAR(10)
);

--CREATE TABLE watchhistory

CREATE TABLE watchhistory (
    WatchHistoryID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES users(UserID),
    MovieID INT,
    FOREIGN KEY (MovieID) REFERENCES movie(MovieID),
    watchDate DATE NOT NULL,
    CompletionPercentage INT NOT NULL
);

--ajouter la constraint MovieID de la table review 

ALTER TABLE review
ADD CONSTRAINT fk_movieID
FOREIGN KEY (MovieID) REFERENCES movie(MovieID);

-- Insérer un film : Ajouter un nouveau film intitulé Data Science Adventures dans le genre "Documentary"

INSERT INTO movie (title ,Genre ,ReleaseYear ,Duration , rating) VALUES ('Data Science Adventures', 'Documentary', 2024, 90, 8.5);

-- Rechercher des films : Lister tous les films du genre "Comedy" sortis après 2020

SELECT * FROM movie WHERE genre = 'Comedy' and ReleaseYear > 2020 ;

-- Mise à jour des abonnements : Passer tous les utilisateurs de "Basic" à "Premium"..

UPDATE users INNER JOIN subscription on users.SubscriptionID = subscription.SubscriptionID 
SET subscription.SubscriptionType = 'Premium' WHERE subscription.SubscriptionType = 'Basic'

-- Afficher les abonnements : Joindre les utilisateurs à leurs types d'abonnements.

SELECT u.firstName ,u.lastName ,u.email ,u.RegistrationDate ,s.SubscriptionType 
FROM users u INNER JOIN subscription s on u.SubscriptionID = s.SubscriptionID;