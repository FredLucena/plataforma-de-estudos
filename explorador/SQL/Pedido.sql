USE master;
IF DB_ID('Pedido') IS NOT NULL
   DROP DATABASE Pedido;
GO
CREATE DATABASE Pedido;
GO
USE Pedido;
----------------------------------------------------------------------
CREATE TABLE cliente 
            (Cd_Cliente INT IDENTITY(1001,1) PRIMARY KEY,
             Nome VARCHAR(50) NOT NULL);
----------------------------------------------------------------------
CREATE TABLE pedido 
            (Nr_Pedido  INT  IDENTITY PRIMARY KEY,
             Data  DATE NOT NULL,
             Cd_Cliente INT  NOT NULL REFERENCES cliente(Cd_Cliente));
----------------------------------------------------------------------
CREATE TABLE produto 
            ( Cd_Produto INT IDENTITY PRIMARY KEY,
              Ds_Produto VARCHAR(50)  NOT NULL,
              Preco      DECIMAL(5,2) NOT NULL );
----------------------------------------------------------------------
CREATE TABLE pedido_produto 
            ( Nr_Pedido  INT REFERENCES pedido(Nr_Pedido)   NOT NULL, 
              Cd_Produto INT REFERENCES produto(Cd_Produto) NOT NULL ,
              Quantidade INT,
              Preco      DECIMAL(5,2) NOT NULL,
              PRIMARY KEY (Nr_Pedido,Cd_Produto) );
----------------------------------------------------------------------
INSERT INTO cliente 
            ( Nm_Cliente ) 
VALUES
            ( 'PEDRO'  ),
            ( 'CARLOS' ),
            ( 'MARIA'  );
----------------------------------------------------------------------
INSERT INTO pedido 
            ( Data, Cd_Cliente ) 
VALUES 
            ( '02/11/2010',1001 ),
            ( '05/11/2010',1001 ),
            ( '07/11/2010',1001 ),
            ( '08/11/2010',1002 );
----------------------------------------------------------------------
INSERT INTO produto
            ( Ds_Produto, Preco) 
VALUES
            ( 'MOUSE'  ,180 ),
            ( 'TECLADO',120 ),
            ( 'MONITOR',550 );
----------------------------------------------------------------------
INSERT INTO pedido_produto 
            ( Nr_Pedido, Cd_Produto, Quantidade, Preco ) 
VALUES 
            ( 1, 1, 10, 150 ),
            ( 1, 2, 15, 120 ),
            ( 1, 3, 20, 530 ),
            ( 2, 1, 5 , 140 ),
            ( 2, 2, 8 , 130 ),
            ( 3, 1, 3 , 150 ),
            ( 3, 2, 7 , 130 ),
            ( 3, 3, 11, 570 ),
            ( 4, 1, 13, 145 ),
            ( 4, 2, 17, 135 );