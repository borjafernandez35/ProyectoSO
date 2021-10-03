DROP DATABASE IF EXISTS Tablas;
CREATE DATABASE Tablas;
USE Tablas;


CREATE TABLE Jugador (
idJ INTEGER NOT NULL,
PRIMARY KEY (idJ),
Nombre VARCHAR(20),
Password VARCHAR(9)
)ENGINE=InnoDB;

INSERT INTO Jugador (idJ, Nombre, Password)
VALUES (1,'Javi','20987');
INSERT INTO Jugador (idJ, Nombre, Password)
VALUES (2,'Pedro','20986');
INSERT INTO Jugador (idJ, Nombre, Password)
VALUES (3,'Juan','39875');
INSERT INTO Jugador (idJ, Nombre, Password)
VALUES (4,'Antonio','1654783');

CREATE TABLE Partida (
idP INTEGER NOT NULL,
PRIMARY KEY (idP),
Ganador VARCHAR(20),
Fecha VARCHAR(14),
Duracion VARCHAR(10)
)ENGINE=InnoDB;

INSERT INTO Partida (idP, Ganador, Fecha, Duracion)
VALUES (1,'Pedro','29/04/2014','1h');
INSERT INTO Partida (idP, Ganador, Fecha, Duracion)
VALUES (2,'Javi','10/11/2019','1h');
INSERT INTO Partida (idP, Ganador, Fecha, Duracion)
VALUES (3,'Juan','22/09/2016','1h');
INSERT INTO Partida (idP, Ganador, Fecha, Duracion)
VALUES (4,'Pedro','19/10/2018','1h');
INSERT INTO Partida (idP, Ganador, Fecha, Duracion)
VALUES (5,'Antonio','16/04/2015','1h');

CREATE TABLE Historial (
idJ INTEGER NOT NULL,
FOREIGN KEY (idJ) REFERENCES Jugador (idJ),
idP INTEGER NOT NULL,
FOREIGN KEY (idP) REFERENCES Partida (idP),
Puntuacion INTEGER
)ENGINE=InnoDB;

INSERT INTO Historial (idJ, idP, Puntuacion)
VALUES ('2','1','50');
INSERT INTO Historial (idJ, idP, Puntuacion)
VALUES ('3','4','90');
INSERT INTO Historial (idJ, idP, Puntuacion)
VALUES ('2','3','200');
INSERT INTO Historial (idJ, idP, Puntuacion)
VALUES ('1','5','150');


CREATE TABLE Pruebas (
idPb INTEGER NOT NULL,
PRIMARY KEY (idPb),
Nombre VARCHAR(20),
Puntos INTEGER
)ENGINE=InnoDB;

INSERT INTO Pruebas (idPb, Nombre, Puntos)
VALUES ('1','Pedro','90');
INSERT INTO Pruebas (idPb, Nombre, Puntos)
VALUES ('2','Javi','250');
INSERT INTO Pruebas (idPb, Nombre, Puntos)
VALUES ('3','Juan','80');
INSERT INTO Pruebas (idPb, Nombre, Puntos)
VALUES ('4','Antonio','100');


CREATE TABLE Juegos (
idP INTEGER NOT NULL,
FOREIGN KEY (idP) REFERENCES Partida (idP),
idPb INTEGER NOT NULL,
FOREIGN KEY (idPb) REFERENCES Pruebas (idPb),
Cantidad INTEGER
)ENGINE=InnoDB;

INSERT INTO Juegos (idP, idPb, Cantidad)
VALUES ('5','4','5');
INSERT INTO Juegos (idP, idPb, Cantidad)
VALUES ('3','2','5');
INSERT INTO Juegos (idP, idPb, Cantidad)
VALUES ('1','4','5');
INSERT INTO Juegos (idP, idPb, Cantidad)
VALUES ('3','2','5');

