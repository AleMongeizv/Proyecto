CREATE DATABASE PROYECTO;
GO

USE PROYECTO;
GO


CREATE TABLE PRODUCTO(
	ID_PRODUCTO VARCHAR(5) PRIMARY KEY,
	NOMBRE_PRODUCTO VARCHAR(30),
	LOCALIZACION VARCHAR(50),
	STOCK_MIN INT
)  

CREATE TABLE PRODUCTOS_AUX (
	ID_PRODUCTO_AUX VARCHAR(5) PRIMARY KEY,
	NOMBRE_PRODAUX VARCHAR(25),
	FORMATO_PRODAUX TEXT,
	CANTIDAD INT,
	LOCALIZACION_PRODAUX VARCHAR(50),
	UBICACION_PRODAUX VARCHAR(50),
	STOCK_MINIMO_PRODAUX INT,
    ID_PRODUCTO VARCHAR(5) FOREIGN KEY REFERENCES PRODUCTO(ID_PRODUCTO)
);

CREATE TABLE MATERIAL(
    ID_MATERIAL VARCHAR(5) PRIMARY KEY,
	NOMBRE_MATERIAL VARCHAR(60),
	LOCALIZACION VARCHAR(25),
	UBICACION VARCHAR(40),
	SUBCATEGORIA VARCHAR(20),
	DESCRIPCION TEXT,
	CANTIDAD INT,
	STOCK_MINIMO_MATERIAL INT,
	NUMERO_SERIE VARCHAR(10),
	FECHA_COMPRA DATE,
    ID_PRODUCTO VARCHAR(5) FOREIGN KEY REFERENCES PRODUCTO(ID_PRODUCTO),
	NUM_SERIE VARCHAR(10) FOREIGN KEY REFERENCES NUMERO_SERIE(NUMERO_SERIE)
);


CREATE TABLE REACTIVOS(
    ID_REACTIVO VARCHAR(5) PRIMARY KEY,
    NOMBRE_REACTIVO VARCHAR(60),
	FORMATO_REACTIVO VARCHAR(10),
    CANTIDAD_REACTIVO INT,
	LOCALIZACION_REACTIVO VARCHAR(25) CHECK (LOCALIZACION_REACTIVO = 'Almacén 1/principal'),
	UBICACION_REACTIVO VARCHAR(5),
	RIESGOS VARCHAR(255),
	GRADO_PUREZA VARCHAR(5) CHECK (RIGHT(GRADO_PUREZA, 1) = '%'),
    FECHA_CADUCIDAD VARCHAR(10),
	STOCK_MINIMO_REACTIVOS INT,
	ID_PRODUCTO VARCHAR(5) FOREIGN KEY REFERENCES PRODUCTO(ID_PRODUCTO),
);


CREATE TABLE ALMACEN(
    ID_ALMACEN VARCHAR(5) PRIMARY KEY,
    NOMBRE_ALMACEN VARCHAR(20)
);

CREATE TABLE UBICACION(
    ID_UBICACION VARCHAR(5) PRIMARY KEY,
	ID_ALMACEN VARCHAR(5) FOREIGN KEY REFERENCES ALMACEN(ID_ALMACEN),
	ID_PRODUCTO VARCHAR(5) FOREIGN KEY REFERENCES PRODUCTO(ID_PRODUCTO),
    LOCALIZACION VARCHAR(20)
);


CREATE TABLE FORMATO(
    Cod_Formato VARCHAR(5) PRIMARY KEY,
	ID_PRODUCTO VARCHAR(5) FOREIGN KEY REFERENCES PRODUCTO(ID_PRODUCTO),
    FORMATO VARCHAR(20)
);

CREATE TABLE RIESGOS(
    ID_RIESGO INT PRIMARY KEY IDENTITY,
	ID_REACTIVO VARCHAR(5) FOREIGN KEY REFERENCES REACTIVOS(ID_REACTIVO),
    IMAGEN_RIESGO IMAGE
);

CREATE TABLE NUMERO_SERIE(
    NUMERO_SERIE VARCHAR(10) PRIMARY KEY,
);



--INSERT INTO
INSERT INTO REACTIVOS (ID_REACTIVO, NOMBRE_REACTIVO, FORMATO_REACTIVO, CANTIDAD_REACTIVO, LOCALIZACION_REACTIVO, UBICACION_REACTIVO, RIESGOS, GRADO_PUREZA, FECHA_CADUCIDAD)
VALUES 
(1,'AMONIO NITRATO', '1 Kg', 1, 'Almacén 1/principal', '5N', 'Comburente y irritante', NULL, NULL, NULL);
