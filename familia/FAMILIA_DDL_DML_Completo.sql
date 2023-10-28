/*******************************************************************************
	Esquema de Relações - Familia
********************************************************************************

ok - Parente (ID_Parente PK, Nome_Parente NN, Dat_Nasc NN)
ok - Filho (ID_Filho PK, Nome_Filho NN, ID_Parente FK NN, Dat_Nasc NN)

*******************************************************************************/

-- **************************************
-- Def. formato de Data dd/mm/yy
-- **************************************
SET DATESTYLE TO POSTGRES, DMY ;

-- **************************************
-- 		Tabela Parente
-- **************************************
DROP TABLE IF EXISTS Parente CASCADE;

CREATE TABLE Parente ( 
	ID_Parente INTEGER PRIMARY KEY,
	Nome_Parente VARCHAR(100)  NOT NULL,
	Data_Nasc DATE  NOT NULL
);
-- Popular Tabela Parente
INSERT INTO Parente VALUES
	(1,'Joao','10/10/1945'),
	(2,'Maria', '10/01/1946' );

-- Selecione Tudo na Tabela Parente
SELECT * FROM Parente;


-- **************************************
-- 		Tabela Filho
-- **************************************
DROP TABLE IF EXISTS Filho CASCADE;

CREATE TABLE Filho ( 
	
	ID_Filho INTEGER PRIMARY KEY, 
	Nome_Filho VARCHAR(100)  NOT NULL, 
	Data_Nasc DATE  NOT NULL,
	ID_Parente INTEGER,
	
	-- FK ID_Parente referencia Parente(ID_Parente)
FOREIGN KEY (ID_Parente)
	REFERENCES Parente(ID_Parente) 

);

-- Popular Tabela Filho
INSERT INTO Filho VALUES
	(1,'Joazinho','10/10/2000',1),
	(2,'Mariazinha', '10/08/1995',1);

-- Selecione Tudo na Tabela Filho
SELECT * FROM Filho;