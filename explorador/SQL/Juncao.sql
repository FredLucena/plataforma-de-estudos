USE master;
IF DB_ID('Juncao') IS NOT NULL
   DROP DATABASE Juncao;
CREATE DATABASE Juncao;
GO
USE Juncao;
-------------------------------------------
CREATE TABLE marcas ( marca VARCHAR(50),
                      nome  VARCHAR(50) );

INSERT INTO marcas 
            ( marca, nome)
VALUES 
            ( 'VW'     ,'Volkswagem'     ),
            ( 'Ford'   ,'Ford'           ),
            ( 'GM'     ,'General Motors' ),
            ( 'Fiat'   ,'Fiat'           ),
            ( 'Renault','Renault'        ),
            ( 'MB'     ,'Mercedes-Benz'  );
-------------------------------------------
CREATE TABLE carros ( modelo VARCHAR (100),
                      marca  VARCHAR (50),
                      ano    INTEGER,
                      cor    VARCHAR (20));

INSERT INTO carros 
            ( modelo, marca, ano, cor ) 
VALUES
            ( 'Fox'     ,'VW'      ,2005 ,'preto' ),
            ( 'Ecosport','Ford'    ,2009 ,'verde' ),
            ( 'KA'      ,'Ford'    ,2008 ,'prata' ),
            ( 'Punto'   ,'Fiat'    ,2008 ,'branco'),
            ( 'Uno'     ,'Fiat'    ,2007 ,'preto' ),
            ( 'Stilo'   ,'Fiat'    ,2004 ,'prata' ),
            ( 'Uno'     ,'Fiat'    ,2009 ,'branco'),
            ( '207'     ,'Peugeot' ,2010 ,'prata' ),
            ( '300 C'   ,'Chrysler',2008 ,'verde' );
