CREATE DATABASE BD_Veterinaria

USE BD_Veterinaria
GO

CREATE TABLE Mascotas
(
	Id int IDENTITY(1,1) PRIMARY KEY,
	NombreMascota VARCHAR(100) NOT NULL,
	NombreDueno VARCHAR(100) NOT NULL,
	Tipo VARCHAR(25) NOT NULL,
	Edad INT NOT NULL,
	Telefono VARCHAR(9) NOT NULL,
	Observaciones VARCHAR(200) NOT NULL
);
GO

--procedimientos almacenados--

CREATE PROCEDURE spListarMascotas
AS
BEGIN
	SELECT * FROM Mascotas;
END;
GO

EXEC spListarMascotas

CREATE PROCEDURE spInsertarMascota
	@NombreMascota VARCHAR(100) ,
	@NombreDueno VARCHAR(100) ,
	@Tipo VARCHAR(25) ,
	@Edad INT ,
	@Telefono VARCHAR(9),
	@Observaciones VARCHAR(200)
AS
BEGIN
	INSERT INTO Mascotas(NombreMascota,NombreDueno,Tipo,Edad,Telefono,Observaciones)
	VALUES (@NombreMascota,@NombreDueno,@Tipo,@Edad,@Telefono,@Observaciones);
END;
GO

EXEC spInsertarMascota
	'Sammy',
	'Massimo',
	'Perro',
	 12,
	 '930395067',
	 'Problema Renal';


		