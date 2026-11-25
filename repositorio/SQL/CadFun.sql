IF DB_ID('Fred') IS NOT NULL
   BEGIN
	USE Master
	DROP DATABASE Fred
   END
-------------------------------------------------------------------------------   
CREATE DATABASE Fred
GO
-------------------------------------------------------------------------------   
USE Fred
-------------------------------------------------------------------------------   
CREATE TABLE cadfun (CODFUN  NUMERIC    ,
                     NOME    VARCHAR(40),
                     DEPTO   VARCHAR(2) ,
                     FUNCAO  VARCHAR(20),
                     SALARIO DECIMAL(10,2));
GO
-------------------------------------------------------------------------------   
INSERT INTO cadfun VALUES (1,  'CARLOS ALBERTO',   '3', 'VENDEDOR'   , 1530.00)
INSERT INTO cadfun VALUES (2,  'MARCOS HENRIQUE',  '2', 'GERENTE'    , 1985.75)   
INSERT INTO cadfun VALUES (3,  'APARECIDA SILVA',  '3', 'SECRETARIO' , 1200.50)   
INSERT INTO cadfun VALUES (4,  'SILVANA PACHECO',  '5', 'SUPERVISOR' , 1599.51)   
INSERT INTO cadfun VALUES (5,  'MARCELO SOUZA',    '3', 'ANALISTA'   , 2250.11)   
INSERT INTO cadfun VALUES (6,  'MARISILVA NEVES',  '2', 'SECRETARIO' , 1200.50)   
INSERT INTO cadfun VALUES (7,  'WILSON DE MACEDO', '3', 'PROGRAMADOR', 1050.00)   
INSERT INTO cadfun VALUES (8,  'AUGUSTO SOUZA',    '3', 'PROGRAMADOR', 1050.00)   
INSERT INTO cadfun VALUES (9,  'CARLOS BASTOS',    '5', 'VENDEDOR'   , 1530.00)
INSERT INTO cadfun VALUES (10, 'SILVA SANTOS',     '3', 'SUPERVISOR' , 1599.51)
INSERT INTO cadfun VALUES (11, 'ANA BASTOS',       '5', 'VENDEDOR'   , 1530.00)   
INSERT INTO cadfun VALUES (12, 'PAULO DA SILVA',   '2', 'VENDEDOR'   , 1530.00)   
   
-------------------------------------------------------------------------------   
SELECT * FROM cadfun;
