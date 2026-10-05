USE master;
IF DB_ID('Juncao') IS NOT NULL
   DROP DATABASE Juncao;
GO
CREATE DATABASE Juncao;
GO
USE Juncao;
----------------------------------------------------------------------
-------------------------------------------------
CREATE TABLE Cargo 
             ( Cd_Cargo CHAR(3)     PRIMARY KEY,
               Cargo    VARCHAR(50) NOT NULL );
-------------------------------------------------
INSERT INTO Cargo 
            ( Cd_Cargo, Cargo ) 
VALUES 
            ( 'C01', 'Presidente' ),
            ( 'C02', 'Diretor' ),
            ( 'C03', 'Gerente' );
-------------------------------------------------
CREATE TABLE Empregado 
             ( Matricula  CHAR(3)     PRIMARY KEY,
               Nome       VARCHAR(50) NOT NULL,
               Cd_Cargo   CHAR(3)     NOT NULL
               REFERENCES Cargo(Cd_Cargo) );
----------------------------------------------------
INSERT INTO Empregado 
            ( Matricula, Nome, Cd_Cargo )
VALUES 
            ( 'E01', 'Pedro','C01' ),
            ( 'E02', 'Paulo','C02' ); 
CREATE TABLE Empregado2 
             ( Matricula  CHAR(3)     PRIMARY KEY,
               Nome       VARCHAR(50) NOT NULL,
               Cd_Cargo   CHAR(3)     NOT NULL
               REFERENCES Cargo(Cd_Cargo) );
----------------------------------------------------
INSERT INTO Empregado2 
            ( Matricula, Nome, Cd_Cargo ) 
VALUES 
            ( 'E02', 'Paulo'    ,'C02' ),
            ( 'E03', 'Don Diego','C01' ),
            ( 'E04', 'Zorro'    ,'C02' );
