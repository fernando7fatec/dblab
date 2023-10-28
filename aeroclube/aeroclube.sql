/*******************************************************************************
	Esquema de Relações - Aeroclube
********************************************************************************
ok - Cliente (Cod_Cliente Integer PK NN, Nome VARCHAR, Sexo CHAR)

ok - Hospede (Cod_Hospede Integer PK NN, Nome VARCHAR, Data_Nasc DATE NN, Cod_Client FK,
Parentesco_Cliente VARCHAR NN) 
Cod_Cliente Referencia Cliente

ok - Pessoa (Codigo Integer PK, Nome VARCHAR NN, Sexo CHAR NN)

ok - Cliente (Codigo Integer PFK NN) herda Pessoa

ok - Hospede (Codigo Integer PFK NN, Data_Nasc Date PFK, Parentesco_Cliente VARCHAR)
herda Pessoa
*******************************************************************************/

-- Pessoa (Codigo Integer PK, Nome VARCHAR NN, Sexo CHAR NN)
-- **************************************
-- 		Tabela Pessoa
-- **************************************
DROP TABLE IF EXISTS Pessoa CASCADE;

CREATE TABLE Pessoa ( 
	Codigo_Pessoa INTEGER PRIMARY KEY,
	Nome VARCHAR(100) NOT NULL,
	Sexo CHAR NOT NULL
);

-- Cliente (Codigo Integer PFK NN) herda Pessoa
-- **************************************
-- 		Tabela Cliente
-- **************************************
DROP TABLE IF EXISTS Cliente CASCADE;

CREATE TABLE Cliente ( 
	Cod_Cliente INTEGER PRIMARY KEY
) INHERITS(Pessoa);

-- Popular Tabela Cliente
INSERT INTO Cliente VALUES
	(1,'Jose','M',1),
	(2,'Maria', 'F',2);

-- Selecione Tudo na Tabela Cliente
SELECT * FROM Cliente;

/* 
Hospede (Cod_Hospede Integer PK NN, Nome VARCHAR, Data_Nasc DATE NN, Cod_Client FK,
Parentesco_Cliente VARCHAR NN) 
Cod_Cliente Referencia Cliente e Herda Pessoa
*/
-- **************************************
-- 		Tabela Hospede
-- **************************************
DROP TABLE IF EXISTS Hospede CASCADE;

CREATE TABLE Hospede ( 
	-- Cod_Hospede INTEGER PRIMARY KEY,
	-- Nome VARCHAR(100),
	Data_Nasc DATE NOT NULL,
	Cod_Cliente INTEGER,
	Parentesco_Cliente VARCHAR(100) NOT NULL,
	
	-- FK Cod_Cliente referencia Cliente(Cod_Cliente)
FOREIGN KEY (Cod_Cliente)
	REFERENCES Cliente(Cod_Cliente)) INHERITS (Pessoa);
	
-- Popular Tabela Hospede
INSERT INTO Hospede VALUES
	(1,'Pedro','M','10/10/2000',1,'filho'),
	(2,'Luiz','M','10/01/1995',1,'sobrinho');

-- Selecione Tudo na Tabela Hospede
SELECT * FROM Hospede;
