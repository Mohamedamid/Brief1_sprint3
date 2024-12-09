-- CREATE DATABASE

CREATE DATABASE stream;

USE stream;

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

