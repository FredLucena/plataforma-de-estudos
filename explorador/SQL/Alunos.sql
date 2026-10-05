--CREATE TABLE Aluno ( nome VARCHAR(20), 
        --               nota1 FLOAT, 
					   --nota2 FLOAT, 
					   --nota3 FLOAT)
--------------------------------------------------
--INSERT INTO Aluno ( nome, nota1, nota2, nota3 )
--           VALUES ( 'Pedro'   ,  2, 7,  4 ),
--                  ( 'Carlos'  ,  4, 9,  6 ),
--                  ( 'Ana'     ,  6, 1,  8 ),
--                  ( 'Paulo'   ,  8, 3, 10 ),
--                  ( 'Maria'   , 10, 5,  9 ),
--                  ( 'José'    ,  1, 7,  8 ),
--                  ( 'João'    ,  3, 9,  7 ),
--                  ( 'Cristina',  5, 2,  6 );
--------------------------------------------------
--CREATE OR ALTER FUNCTION F_Situacao(@Nota1 FLOAT,@Nota2 FLOAT,@Nota3 FLOAT)
--      RETURNS VARCHAR(11)
--AS
--      BEGIN
--           DECLARE @Media FLOAT = (@Nota1+@Nota2+@Nota3)/3
--           RETURN(IIF(@Media < 5,'Reprovado',IIF(@Media < 7,'Recuperação','Aprovado')))
--      END;

SELECT nome  AS 'ALUNO' ,
       nota1 AS 'NOTA 1',
	   nota2 AS 'NOTA 2',
	   nota3 AS 'NOTA 3',
	   CAST((nota1+nota2+nota3)/3 AS DECIMAL(3,1)) AS 'MÉDIA',
	   dbo.F_Situacao(nota1, nota2, nota3)         AS 'SITUAÇÃO'
FROM Aluno;


