CREATE TABLE CLIENTE
(
  ID_CLIENTE INTEGER IDENTITY NOT NULL PRIMARY KEY,
  NOMBRE_CLIENTE VARCHAR(100) NOT NULL,
  DIRECCION VARCHAR (100),
  TELEFONO VARCHAR (20),
  FOTO VARBINARY (MAX)
);

CREATE TABLE CIUDAD
(
  ID_CIUDAD INTEGER NOT NULL PRIMARY KEY,
  NOMBRE_CIUDAD VARCHAR(100) NOT NULL
);

ALTER TABLE CLIENTE ADD ID_CIUDAD INTEGER NULL;

ALTER TABLE CLIENTE ADD CONSTRAINT FK_CLI_CIU FOREIGN KEY (ID_CIUDAD) REFERENCES CIUDAD (ID_CIUDAD);


CREATE TABLE FACTURA_CAB
(
   NUMERO_FACTURA INTEGER NOT NULL PRIMARY KEY,
   FECHA DATE NOT NULL,
   VENCIMIENTO DATE NOT NULL,
   ID_CLIENTE INTEGER NULL,
   NOMBRE_CLIENTE VARCHAR(100),
   TOTAL FLOAT NOT NULL
)

CREATE TABLE FACTURA_DET
(
   NUMERO_FACTURA INTEGER NOT NULL,
   NUMERO_DETALLE INTEGER NOT NULL,
   DESCRIPCION VARCHAR(200) NOT NULL,
   CANTIDAD FLOAT NOT NULL,
   VALOR_UNITARIO FLOAT NOT NULL,
   SUB_TOTAL FLOAT NOT NULL,
   PRIMARY KEY (NUMERO_FACTURA, NUMERO_DETALLE)
)

