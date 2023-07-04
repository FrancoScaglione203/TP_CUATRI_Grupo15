--DROP DATABASE TP_CUATRIMESTRAL;
CREATE DATABASE TP_CUATRIMESTRAL;
Go
USE TP_CUATRIMESTRAL;
GO

CREATE TABLE PRODUCTOS
(
  Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  Nombre VARCHAR(1000) NOT NULL,
  Precio DECIMAL NOT NULL,
  Color INT,
  Estado BIT NOT NULL DEFAULT (1),
)

INSERT INTO PRODUCTOS
  (Nombre,Precio,Color)
VALUES
  ('Logan', 5449200, 1),
  ('Sandero', 5410900, 1),
  ('Stepway', 6415300, 1)

CREATE TABLE COLORES
(
  Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  Nombre VARCHAR(50) NOT NULL,
  Muestra VARCHAR(2000),
  ImagenUrl VARCHAR(2000),
  IdProducto INT NOT NULL FOREIGN KEY REFERENCES PRODUCTOS(Id)
)

INSERT INTO COLORES
  (Nombre,Muestra,ImagenUrl,IdProducto)
VALUES
  ('Negro Nacré', 'https://3dv.renault.com/ImageFromBookmark?configuration=STANDA%2FL52%2FE0%2FARGE%2FDG%2FSACVIT%2FABS%2FCA01%2FCPE%2FRET01%2FSPROJA%2FRTOL15%2FCEAVRH%2FDRA%2FDRAP39%2FHARM01%2FATAR02%2FNV676%2FKM%2FSSREPL%2FABLAV%2FSOP01B%2FSPRGAZ%2FVLMOUS%2FTRGAS%2FRENTC%2FLVAVEL%2FLVARMA%2FSGSCHA%2FAPL03%2FSSNAV%2FABPA01%2FRD28F%2FBVM5%2FACCTC1%2FRDIF33%2FENPC01%2FSANACF%2FAVER46%2FSAN713%2FBCTC%2FSAN913%2FH4M%2FSSIDCO%2FSSTOST%2FACINT1%2FSSMAP%2FSSCALL%2FSANE22%2FSSITPK&databaseId=ed08251d-2554-456a-9e81-7b194148029d&bookmarkSet=Ext_Color&bookmark=Ext_Color&profile=TEINTE', 'LoganNegro.jpg', 1),
  ('Gris Quarzo', 'https://3dv.renault.com/ImageFromBookmark?configuration=STANDA%2FL52%2FE0%2FARGE%2FDG%2FSACVIT%2FABS%2FCA01%2FCPE%2FRET01%2FSPROJA%2FRTOL15%2FCEAVRH%2FDRA%2FDRAP39%2FHARM01%2FATAR02%2FTEKNH%2FKM%2FSSREPL%2FABLAV%2FSOP01B%2FSPRGAZ%2FVLMOUS%2FTRGAS%2FRENTC%2FLVAVEL%2FLVARMA%2FSGSCHA%2FAPL03%2FSSNAV%2FABPA01%2FRD28F%2FBVM5%2FACCTC1%2FRDIF33%2FENPC01%2FSANACF%2FAVER46%2FSAN713%2FBCTC%2FSAN913%2FH4M%2FSSIDCO%2FSSTOST%2FACINT1%2FSSMAP%2FSSCALL%2FSANE22%2FSSITPK&databaseId=ed08251d-2554-456a-9e81-7b194148029d&bookmarkSet=Ext_Color&bookmark=Ext_Color&profile=TEINTE', 'LoganGris.jpg', 1),
  ('Blanco Glaciar', 'https://3dv.renault.com/ImageFromBookmark?configuration=STANDA%2FL52%2FE0%2FARGE%2FDG%2FSACVIT%2FABS%2FCA01%2FCPE%2FRET01%2FSPROJA%2FRTOL15%2FCEAVRH%2FDRA%2FDRAP39%2FHARM01%2FATAR02%2FOV369%2FKM%2FSSREPL%2FABLAV%2FSOP01B%2FSPRGAZ%2FVLMOUS%2FTRGAS%2FRENTC%2FLVAVEL%2FLVARMA%2FSGSCHA%2FAPL03%2FSSNAV%2FABPA01%2FRD28F%2FBVM5%2FACCTC1%2FRDIF33%2FENPC01%2FSANACF%2FAVER46%2FSAN713%2FBCTC%2FSAN913%2FH4M%2FSSIDCO%2FSSTOST%2FACINT1%2FSSMAP%2FSSCALL%2FSANE22%2FSSITPK&databaseId=ed08251d-2554-456a-9e81-7b194148029d&bookmarkSet=Ext_Color&bookmark=Ext_Color&profile=TEINTE', 'LoganBlanco.jpg', 1),
  ('Azul Cosmos', 'https://3dv.renault.com/ImageFromBookmark?configuration=STANDA%2FB52%2FE0%2F5PL%2FARGE%2FDG%2FSACVIT%2FABS%2FCA01%2FVT%2FELA%2FCPE%2FRET01%2FSPROJA%2FRTOL15%2FCEAVRH%2FSACCAV%2FDRA%2FDRAP39%2FHARM01%2FATAR02%2FTERPR%2FKM%2FSSREPL%2FSSDECA%2FABLAV%2FESPHSA%2FSOP01B%2FSPRGAZ%2FVLMOUS%2FTRGAS%2FRENTC%2FLVAVEL%2FLVARMA%2FSGSCHA%2FAPL03%2FALOUCC%2FABPA01%2FRD28F%2FBVM5%2FACCTC1%2FRDIF33%2FENPC01%2FSANACF%2FTLRP31%2FAVER46%2FSAN713%2FSAN778%2FBCTC%2FSAN822%2FSAN913%2FH4M%2FACINT1%2FFDIU1%2FSSMAP%2FSSCALL%2FSANE22%2FSSITPK&databaseId=608ec44c-a258-47bd-b874-a8b2e5dd6f94&bookmarkSet=Ext_Color&bookmark=Ext_Color&profile=TEINTE', 'SanderoAzul.jpg', 2),
  ('Rojo Fuego', 'https://3dv.renault.com/ImageFromBookmark?configuration=STANDA%2FB52%2FE0%2F5PL%2FARGE%2FDG%2FSACVIT%2FABS%2FCA01%2FVT%2FELA%2FCPE%2FRET01%2FSPROJA%2FRTOL15%2FCEAVRH%2FSACCAV%2FDRA%2FDRAP39%2FHARM01%2FATAR02%2FTEB76%2FKM%2FSSREPL%2FSSDECA%2FABLAV%2FESPHSA%2FSOP01B%2FSPRGAZ%2FVLMOUS%2FTRGAS%2FRENTC%2FLVAVEL%2FLVARMA%2FSGSCHA%2FAPL03%2FALOUCC%2FABPA01%2FRD28F%2FBVM5%2FACCTC1%2FRDIF33%2FENPC01%2FSANACF%2FTLRP31%2FAVER46%2FSAN713%2FSAN778%2FBCTC%2FSAN822%2FSAN913%2FH4M%2FACINT1%2FFDIU1%2FSSMAP%2FSSCALL%2FSANE22%2FSSITPK&databaseId=608ec44c-a258-47bd-b874-a8b2e5dd6f94&bookmarkSet=Ext_Color&bookmark=Ext_Color&profile=TEINTE', 'SanderoRojo.jpg', 2),
  ('Gris Estrella', 'https://3dv.renault.com/ImageFromBookmark?configuration=STANDA%2FB52%2FE0%2F5PL%2FARGE%2FDG%2FSACVIT%2FABS%2FCA01%2FVT%2FELA%2FCPE%2FRET01%2FSPROJA%2FRTOL15%2FCEAVRH%2FSACCAV%2FDRA%2FDRAP39%2FHARM01%2FATAR02%2FTEKNH%2FKM%2FSSREPL%2FSSDECA%2FABLAV%2FESPHSA%2FSOP01B%2FSPRGAZ%2FVLMOUS%2FTRGAS%2FRENTC%2FLVAVEL%2FLVARMA%2FSGSCHA%2FAPL03%2FALOUCC%2FABPA01%2FRD28F%2FBVM5%2FACCTC1%2FRDIF33%2FENPC01%2FSANACF%2FTLRP31%2FAVER46%2FSAN713%2FSAN778%2FBCTC%2FSAN822%2FSAN913%2FH4M%2FACINT1%2FFDIU1%2FSSMAP%2FSSCALL%2FSANE22%2FSSITPK&databaseId=608ec44c-a258-47bd-b874-a8b2e5dd6f94&bookmarkSet=Ext_Color&bookmark=Ext_Color&profile=TEINTE', 'SanderoGris.jpg', 2),
  ('Rojo Cadiz', 'https://3dv.renault.com/ImageFromBookmark?configuration=STANDA%2FB52%2FE2%2F5PL%2FARGE%2FDG%2FRV%2FABS%2FBARLON%2FCA01%2FVT%2FELA%2FCPE%2FRET01%2FPROJAB%2FRALU16%2FCEAVRH%2FSACCAV%2FDRA%2FDRAP38%2FHARM01%2FATAR02%2FFBANAR%2FTEB76%2FKM%2FSSREPL%2FSSDECA%2FABLAV%2FESPHSA%2FSOP01B%2FSPRGAZ%2FVLCUIR%2FTRGAS%2FRETP01%2FLVAVIP%2FLVARMA%2FSGSCHA%2FCOREHA%2FAPL03%2FALOUCC%2FABPA01%2FRD28F%2FBVM5%2FACCTC2%2FRDIF42%2FENPC01%2FSANACF%2FTLRP31%2FLUCOF%2FAVER46%2FVSUVE%2FSAN778%2FBCTC%2FSAN822%2FSAN913%2FH4M%2FEMAR01%2FACINT2%2FFDIU1%2FSSMAP%2FSSCALL%2FSANE22%2FITPK1&databaseId=608ec44c-a258-47bd-b874-a8b2e5dd6f94&bookmarkSet=Ext_Color&bookmark=Ext_Color&profile=TEINTE', 'StepwayRojo.jpg', 3),
  ('Beige Dune', 'https://3dv.renault.com/ImageFromBookmark?configuration=STANDA%2FB52%2FE2%2F5PL%2FARGE%2FDG%2FRV%2FABS%2FBARLON%2FCA01%2FVT%2FELA%2FCPE%2FRET01%2FPROJAB%2FRALU16%2FCEAVRH%2FSACCAV%2FDRA%2FDRAP38%2FHARM01%2FATAR02%2FFBANAR%2FTEHNP%2FKM%2FSSREPL%2FSSDECA%2FABLAV%2FESPHSA%2FSOP01B%2FSPRGAZ%2FVLCUIR%2FTRGAS%2FRETP01%2FLVAVIP%2FLVARMA%2FSGSCHA%2FCOREHA%2FAPL03%2FALOUCC%2FABPA01%2FRD28F%2FBVM5%2FACCTC2%2FRDIF42%2FENPC01%2FSANACF%2FTLRP31%2FLUCOF%2FAVER46%2FVSUVE%2FSAN778%2FBCTC%2FSAN822%2FSAN913%2FH4M%2FEMAR01%2FACINT2%2FFDIU1%2FSSMAP%2FSSCALL%2FSANE22%2FITPK1&databaseId=608ec44c-a258-47bd-b874-a8b2e5dd6f94&bookmarkSet=Ext_Color&bookmark=Ext_Color&profile=TEINTE', 'StepwayBeige.jpg', 3),
  ('Gris Cassiopée  ', 'https://3dv.renault.com/ImageFromBookmark?configuration=STANDA%2FB52%2FE2%2F5PL%2FARGE%2FDG%2FRV%2FABS%2FBARLON%2FCA01%2FVT%2FELA%2FCPE%2FRET01%2FPROJAB%2FRALU16%2FCEAVRH%2FSACCAV%2FDRA%2FDRAP38%2FHARM01%2FATAR02%2FFBANAR%2FTEKNH%2FKM%2FSSREPL%2FSSDECA%2FABLAV%2FESPHSA%2FSOP01B%2FSPRGAZ%2FVLCUIR%2FTRGAS%2FRETP01%2FLVAVIP%2FLVARMA%2FSGSCHA%2FCOREHA%2FAPL03%2FALOUCC%2FABPA01%2FRD28F%2FBVM5%2FACCTC2%2FRDIF42%2FENPC01%2FSANACF%2FTLRP31%2FLUCOF%2FAVER46%2FVSUVE%2FSAN778%2FBCTC%2FSAN822%2FSAN913%2FH4M%2FEMAR01%2FACINT2%2FFDIU1%2FSSMAP%2FSSCALL%2FSANE22%2FITPK1&databaseId=608ec44c-a258-47bd-b874-a8b2e5dd6f94&bookmarkSet=Ext_Color&bookmark=Ext_Color&profile=TEINTE', 'StepwayGris.jpg', 3)

CREATE TABLE TAPIZADOS
(
  Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  Nombre VARCHAR(50) NOT NULL,
  Muestra VARCHAR(2000),
  ImagenUrl VARCHAR(2000),
  Precio DECIMAL NOT NULL,
  IdProducto INT NOT NULL FOREIGN KEY REFERENCES PRODUCTOS(Id)
)

INSERT INTO TAPIZADOS
  (Nombre,Muestra,ImagenUrl,Precio,IdProducto)
VALUES
  ('Tela', 'https://3dv.renault.com/ImageFromBookmark?configuration=STANDA%2FL52%2FE0%2FARGE%2FDG%2FSACVIT%2FABS%2FCA01%2FCPE%2FRET01%2FSPROJA%2FRTOL15%2FCEAVRH%2FDRA%2FDRAP39%2FHARM01%2FATAR02%2FNV676%2FKM%2FSSREPL%2FABLAV%2FSOP01B%2FSPRGAZ%2FVLMOUS%2FTRGAS%2FRENTC%2FLVAVEL%2FLVARMA%2FSGSCHA%2FAPL03%2FSSNAV%2FABPA01%2FRD28F%2FBVM5%2FACCTC1%2FRDIF33%2FENPC01%2FSANACF%2FAVER46%2FSAN713%2FBCTC%2FSAN913%2FH4M%2FSSIDCO%2FSSTOST%2FACINT1%2FSSMAP%2FSSCALL%2FSANE22%2FSSITPK&databaseId=ed08251d-2554-456a-9e81-7b194148029d&bookmarkSet=Int_Upholstery_1&bookmark=Int_Upholstery_1&profile=INTER', 'Tela.png', 20000, 1),
  ('Cuero', 'https://3dv.renault.com/ImageFromBookmark?configuration=STANDA%2FHZG%2FEA3%2FESS%2FDG%2FTR4X4%2FRV%2FBARTOI%2FCA03%2FTN%2FHAYMOT%2FVSTLAR%2FCPE%2FRET05%2FSPROJA%2FRALU18%2FEQSPHP%2FCUIR01%2FATAV02%2FSGAV06%2FSGAR06%2FTEKAD%2FSFIRBA%2FABLAVI%2FLEDH4%2FFPASS%2FALEVA%2FPRSTYL%2FSOP03C%2FRETRCR%2FSGACHA%2FAPL03%2FSLAVPH%2FRAD68A%2FCVTX%2FPRIAC3%2FRDIF12%2FEQPEXP%2FSANACF%2FSAN613%2FAIRBDE%2FPSMREC%2FSSPTLP%2FSAN913%2FSSHYB%2F2TR%2FSDLIGM%2FFEUAR2%2FECAMH1%2FSSCALL%2FPROCB1%2FDANGMO%2FITPK7%2FVOLNCH%2FRRCAM&databaseId=9143b3e9-216a-4a51-ae2b-d6e8034f9ec3&bookmarkSet=Int_Upholstery_1&bookmark=Int_Upholstery_1&profile=INTER', 'Cuero.png', 50000, 1),
  ('Tela', 'https://3dv.renault.com/ImageFromBookmark?configuration=STANDA%2FL52%2FE0%2FARGE%2FDG%2FSACVIT%2FABS%2FCA01%2FCPE%2FRET01%2FSPROJA%2FRTOL15%2FCEAVRH%2FDRA%2FDRAP39%2FHARM01%2FATAR02%2FNV676%2FKM%2FSSREPL%2FABLAV%2FSOP01B%2FSPRGAZ%2FVLMOUS%2FTRGAS%2FRENTC%2FLVAVEL%2FLVARMA%2FSGSCHA%2FAPL03%2FSSNAV%2FABPA01%2FRD28F%2FBVM5%2FACCTC1%2FRDIF33%2FENPC01%2FSANACF%2FAVER46%2FSAN713%2FBCTC%2FSAN913%2FH4M%2FSSIDCO%2FSSTOST%2FACINT1%2FSSMAP%2FSSCALL%2FSANE22%2FSSITPK&databaseId=ed08251d-2554-456a-9e81-7b194148029d&bookmarkSet=Int_Upholstery_1&bookmark=Int_Upholstery_1&profile=INTER', 'Tela.png', 20000, 2),
  ('Cuero', 'https://3dv.renault.com/ImageFromBookmark?configuration=STANDA%2FHZG%2FEA3%2FESS%2FDG%2FTR4X4%2FRV%2FBARTOI%2FCA03%2FTN%2FHAYMOT%2FVSTLAR%2FCPE%2FRET05%2FSPROJA%2FRALU18%2FEQSPHP%2FCUIR01%2FATAV02%2FSGAV06%2FSGAR06%2FTEKAD%2FSFIRBA%2FABLAVI%2FLEDH4%2FFPASS%2FALEVA%2FPRSTYL%2FSOP03C%2FRETRCR%2FSGACHA%2FAPL03%2FSLAVPH%2FRAD68A%2FCVTX%2FPRIAC3%2FRDIF12%2FEQPEXP%2FSANACF%2FSAN613%2FAIRBDE%2FPSMREC%2FSSPTLP%2FSAN913%2FSSHYB%2F2TR%2FSDLIGM%2FFEUAR2%2FECAMH1%2FSSCALL%2FPROCB1%2FDANGMO%2FITPK7%2FVOLNCH%2FRRCAM&databaseId=9143b3e9-216a-4a51-ae2b-d6e8034f9ec3&bookmarkSet=Int_Upholstery_1&bookmark=Int_Upholstery_1&profile=INTER', 'Cuero.png', 50000, 2),
  ('Tela', 'https://3dv.renault.com/ImageFromBookmark?configuration=STANDA%2FL52%2FE0%2FARGE%2FDG%2FSACVIT%2FABS%2FCA01%2FCPE%2FRET01%2FSPROJA%2FRTOL15%2FCEAVRH%2FDRA%2FDRAP39%2FHARM01%2FATAR02%2FNV676%2FKM%2FSSREPL%2FABLAV%2FSOP01B%2FSPRGAZ%2FVLMOUS%2FTRGAS%2FRENTC%2FLVAVEL%2FLVARMA%2FSGSCHA%2FAPL03%2FSSNAV%2FABPA01%2FRD28F%2FBVM5%2FACCTC1%2FRDIF33%2FENPC01%2FSANACF%2FAVER46%2FSAN713%2FBCTC%2FSAN913%2FH4M%2FSSIDCO%2FSSTOST%2FACINT1%2FSSMAP%2FSSCALL%2FSANE22%2FSSITPK&databaseId=ed08251d-2554-456a-9e81-7b194148029d&bookmarkSet=Int_Upholstery_1&bookmark=Int_Upholstery_1&profile=INTER', 'Tela.png', 20000, 3),
  ('Cuero', 'https://3dv.renault.com/ImageFromBookmark?configuration=STANDA%2FHZG%2FEA3%2FESS%2FDG%2FTR4X4%2FRV%2FBARTOI%2FCA03%2FTN%2FHAYMOT%2FVSTLAR%2FCPE%2FRET05%2FSPROJA%2FRALU18%2FEQSPHP%2FCUIR01%2FATAV02%2FSGAV06%2FSGAR06%2FTEKAD%2FSFIRBA%2FABLAVI%2FLEDH4%2FFPASS%2FALEVA%2FPRSTYL%2FSOP03C%2FRETRCR%2FSGACHA%2FAPL03%2FSLAVPH%2FRAD68A%2FCVTX%2FPRIAC3%2FRDIF12%2FEQPEXP%2FSANACF%2FSAN613%2FAIRBDE%2FPSMREC%2FSSPTLP%2FSAN913%2FSSHYB%2F2TR%2FSDLIGM%2FFEUAR2%2FECAMH1%2FSSCALL%2FPROCB1%2FDANGMO%2FITPK7%2FVOLNCH%2FRRCAM&databaseId=9143b3e9-216a-4a51-ae2b-d6e8034f9ec3&bookmarkSet=Int_Upholstery_1&bookmark=Int_Upholstery_1&profile=INTER', 'Cuero.png', 50000, 3)


CREATE TABLE IMAGENES
(
  Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  ImagenUrl VARCHAR(2000) NOT NULL,
  IdProducto INT NOT NULL FOREIGN KEY REFERENCES PRODUCTOS(Id),
)

INSERT INTO IMAGENES
  (ImagenUrl,IdProducto)
VALUES
  ('Imagenes/Logan.jpg', 1),
  ('Imagenes/LoganDetalle1.jpg', 1),
  ('Imagenes/Sandero.jpg', 2),
  ('Imagenes/SanderoDetalle1.jpg', 2),
  ('Imagenes/Stepway.jpg', 3),
  ('Imagenes/StepwayDetalle1.jpg', 3)

CREATE TABLE DESCRIPCION
(
  Id INT PRIMARY KEY IDENTITY(1,1),
  Titulo VARCHAR(2000),
  Descripcion VARCHAR(2000),
  ImagenUrl VARCHAR(2000),
  IdProducto INT FOREIGN KEY REFERENCES PRODUCTOS(Id),
)

INSERT INTO DESCRIPCION
  (Titulo,Descripcion,ImagenUrl,IdProducto)
VALUES
  ('Disfrutá de un viaje placentero', '¿Buscás confort? ¡Con Renault LOGAN, viajás con la mejor comodidad posible! Un generoso espacio y prácticas áreas de almacenamiento.', 'Imagenes/LoganDetalle2.jpg', 1),
  ('Mantenete conectado', '¡Simplificá tu vida! Renault LOGAN está equipado con tecnología para un mayor confort y comodidad a bordo.', 'Imagenes/LoganDetalle3.jpg', 1),
  ('Tu seguridad garantizada', 'Porque la seguridad a bordo es fundamental, Renault LOGAN ha sido diseñado para ofrecer la máxima tranquilidad al conducir.', 'Imagenes/LoganDetalle4.jpg', 1),
  ('Cámara de estacionamiento trasera', 'Junto con los sensores traseros, las maniobras se realizan con facilidad y tendrás mayor control a la hora de estacionar.', 'Imagenes/SanderoDetalle2.jpg', 2),
  ('Experimentá el confort total', 'Dale la bienvenida a tus pasajeros en tu Renault SANDERO. El más espacioso de la categoría, optimizado con sus nuevos asientos ergonómicos para brindarte más comodidad.', 'Imagenes/SanderoDetalle3.jpg', 2),
  ('ESP y HSA', 'El Control de Estabilidad (ESP) recupera la trayectoria en maniobras bruscas, controlando la tracción y la frenada de cada rueda. Sistema de ayuda en pendiente (HSA) impide que el auto retroceda al momento de arrancar en un terreno inclinado.', 'Imagenes/SanderoDetalle4.jpg', 2),
  ('Nuevo Motor', 'El motor HR16 1.6 L, 16 válvulas con 115 cv y 156 Nm ofrece una respuesta ágil en ciudad con una excelente performance en consumo. Esta nueva motorización se adapta perfectamente ante las exigencias de potencia, tanto en circuitos urbanos como en ruta.', 'Imagenes/StepwayDetalle2.jpg', 3),
  ('Seguridad Pasiva', 'Cuatro Airbags de serie, Alarma Perimétrica. Estructura reforzada. Cinturones de seguridad de 3 puntos y apoyacabezas regulables en altura.', 'Imagenes/StepwayDetalle3.jpg', 3),
  ('Seguridad Activa', 'Control Electrónico de Estabilidad (ESP), que recupera la trayectoria en maniobras bruscas, controlando la tracción y la frenada de cada rueda.', 'Imagenes/StepwayDetalle4.jpg', 3)

CREATE TABLE EQUIPAMIENTO
(
  Id INT PRIMARY KEY IDENTITY(1,1),
  Nombre VARCHAR(1000),
  Precio DECIMAL,
  Climatizador BIT DEFAULT (0),
  SensorEstacionamiento BIT DEFAULT (0),
  Computadora BIT DEFAULT (0),
  ControlCrucero BIT DEFAULT (0),
  Alarma BIT DEFAULT (0),
  IdProducto INT FOREIGN KEY REFERENCES PRODUCTOS(Id),
)

INSERT INTO EQUIPAMIENTO
  (Nombre,Precio,Climatizador,SensorEstacionamiento,Computadora,ControlCrucero,Alarma,IdProducto)
VALUES
  ('Logan Life 1.6', 5449200, 0, 0, 0, 0, 0, 1),
  ('Logan Zen 1.6', 5849200, 1, 0, 0, 0, 1, 1),
  ('Logan Intens 1.6', 6449200, 1, 1, 1, 1, 1, 1),
  ('Sandero Life 1.6', 5449200, 0, 0, 0, 0, 0, 2),
  ('Sandero Zen 1.6', 5849200, 1, 0, 0, 0, 1, 2),
  ('Sandero Intens 1.6', 6449200, 1, 1, 1, 1, 1, 2),
  ('Stepway Life 1.6', 5449200, 0, 0, 0, 0, 0, 3),
  ('Stepway Zen 1.6', 5849200, 1, 0, 0, 0, 1, 3),
  ('Stepway Intens 1.6', 6449200, 1, 1, 1, 1, 1, 3)

CREATE TABLE FICHATECNICA
(
  Id INT PRIMARY KEY IDENTITY(1,1),
  Plazas INT DEFAULT (5),
  Longitud INT,
  Ancho INT,
  Ejes INT,
  CajaManual BIT DEFAULT (1),
  CajaAutomatica BIT DEFAULT (0),
  Nafta BIT DEFAULT (1),
  IdProducto INT FOREIGN KEY REFERENCES PRODUCTOS(Id),
)

INSERT INTO FICHATECNICA
  (Plazas,Longitud,Ancho,Ejes,CajaManual,CajaAutomatica,Nafta,IdProducto)
VALUES
  (5, 4359, 1761, 2635, 1, 0, 1, 1),
  (6, 4397, 2003, 2808, 1, 1, 0, 2),
  (5, 4559, 1761, 3300, 1, 0, 1, 3)

CREATE table USUARIOS
(
  Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  Clave VARCHAR(1000) NOT NULL,
  TipoUsuario int NOT NULL,
  Nombre VARCHAR(1000) NOT NULL,
  Apellido VARCHAR(1000) NOT NULL,
  Dni VARCHAR(10) NOT NULL,
  Email VARCHAR (1000) NOT NULL,
  Provincia VARCHAR(1000) NOT NULL,
  Localidad VARCHAR(1000) NOT NULL,
  Estado BIT NOT NULL DEFAULT (1),
)
insert into USUARIOS
  (Clave, TipoUsuario, Nombre, Apellido, Dni, Email, Provincia, Localidad)
values
  ('123444', 1, 'Carlos', 'Pinto', '3255455', 'Carlos.Pinto@gmail.com', 'Buenos Aires', 'Mar del plata'),
  ('34767240', 1, 'Clara', 'Visconti', '34767240', 'mclaravisconti@gmail.com', 'Buenos Aires', 'San Isidro'),
  ('34767240', 1, 'Franco', 'Scaglione', '41826520', 'mclaravisconti@gmail.com', 'Buenos Aires', 'Vicente Lopez')

CREATE TABLE CONCESIONARIAS
(
  Id INT NOT NULL PRIMARY KEY IDENTITY,
  Nombre VARCHAR(100) NOT NULL,
  Descripcion VARCHAR(1000) NOT NULL,
  ImagenUrl VARCHAR(2000) NOT NULL,
  MapsUrl VARCHAR(2000),
  SemanaAbre DECIMAL NOT NULL,
  SemanaCierra DECIMAL NOT NULL,
  SabadoAbre DECIMAL NULL,
  SabadoCierra DECIMAL NULL,
  Localidad VARCHAR(1000) NOT NULL,
  Provincia VARCHAR(1000) NOT NULL,
  Estado BIT NOT NULL DEFAULT (1),
)

INSERT INTO CONCESIONARIAS
  (Nombre,Descripcion,ImagenUrl,MapsUrl,SemanaAbre,SemanaCierra,SabadoAbre,SabadoCierra,Localidad,Provincia)
VALUES
  ('Lepic S.A', 'Una de las sedes más grandes de la cadena y de Argentina', 'https://lh5.googleusercontent.com/p/AF1QipMiLdbRc0UbEDXirmvdLx7zizPxMxHJ4itIrBgE=w408-h544-k-no', 'https://goo.gl/maps/rgHHTHpf3vpAksSw9', 8, 20, 9, 13, 'San Isidro', 'Buenos Aires'),
  ('Galante Antonio S.A.', 'Una de las sedes más grandes de la cadena y de Argentina', 'https://lh5.googleusercontent.com/p/AF1QipND4fYyFlwH7qhoMI7ViHFDeQ8ALEitNGnuHqrm=w507-h240-k-no', 'https://goo.gl/maps/uD7Es1rhG9JHnkpWA', 7, 20, 9, 18, 'Recoleta', 'CABA'),
  ('Francisco Osvaldo S.A', 'Una de las sedes más grandes de la cadena y de Argentina.', 'https://lh5.googleusercontent.com/p/AF1QipPLXvVExbnjj4Hd7r-K00Qv0pkGDCaaKyVDuace=w408-h544-k-no', 'https://goo.gl/maps/uD7Es1rhG9JHnkpWA', 8, 20, 9, 13, 'Lomas de Zamora', 'Buenos Aires')

CREATE TABLE SERVICIOS
(
  Id INT NOT NULL PRIMARY KEY IDENTITY,
  Nombre VARCHAR(100) NOT NULL,
  IdConcesionaria INT NOT NULL FOREIGN KEY REFERENCES CONCESIONARIAS(Id)
)

INSERT INTO SERVICIOS
  (Nombre,IdConcesionaria)
VALUES
  ('Venta', 1),
  ('Venta', 2),
  ('Venta', 3),
  ('Servicio Técnico', 1),
  ('Servicio Técnico', 2),
  ('Servicio Técnico', 3),
  ('Repuestos', 2),
  ('Test Drive', 1),
  ('Seguros', 3)

CREATE TABLE Financiacion
(
  Id INT NOT NULL PRIMARY KEY IDENTITY,
  cantidadCuotas int not null,
  DsCuotas decimal(6,4) not null,
  GastoEntrega decimal(6,4) not null,
  GastoAdministrativo decimal(6,4) not null,
  Cuotas1A20 decimal(6,4) not null,
  Cuotas21A40 decimal(6,4) not null,
  Cuotas41A60 decimal(6,4) not null,
  Cuotas61A80 decimal(6,4) not null,
  Cuotas81A100 decimal(6,4) not null,
)

go
insert into Financiacion
  (cantidadCuotas,DsCuotas,GastoEntrega,GastoAdministrativo,Cuotas1A20,Cuotas21A40,Cuotas41A60,Cuotas61A80,Cuotas81A100)
VALUES
  (100, 0.002, 0.03, 0.001, 0.0115, 0.012, 0.012, 0.0115, 0.011)

    go

create table venta
(
  IDVenta INT NOT NULL PRIMARY KEY IDENTITY,
  DNIComprador varchar(10) not null,
  ModeloAuto varchar(200) not null,
  VersionAuto varchar(200) not null,
  CantidadCuotas int not null,
  CuotasPagadas int not null,
)

create table cuota
(
  ID INT NOT NULL PRIMARY KEY IDENTITY,
  IDVenta INT not NULL FOREIGN KEY REFERENCES venta(IDVenta),
  Numero int not null,
  monto decimal(10,2) not null,
  FechaVencimiento DATETIME not null,
  Pagada bit not NULL
)

select IDVenta, DNIComprador, ModeloAuto, VersionAuto, CantidadCuotas, CuotasPagadas
from venta

Go
Create procedure insertarNuevo

  @clave varchar(1000),
  @TipoUsuario int,
  @Nombre varchar(1000),
  @Apellido varchar(1000),
  @Dni varchar(1000),
  @Email varchar(1000),
  @Provincia varchar(1000),
  @Localidad varchar(1000)
as
insert into USUARIOS
  (Clave, TipoUsuario, Nombre, Apellido, Dni, Email, Provincia, Localidad, Estado)
output
inserted.Id
values
  (@clave, @TipoUsuario, @Nombre, @Apellido, @Dni, @Email, @Provincia, @Localidad, 1)


exec insertarNuevo '123444', 1, 'Carlos', 'Pinto', '41826520', 'Carlos.Pinto@gmail.com', 'Buenos Aires', 'Mar del plata'

Go
create procedure ModificarPerfil
  @id int,
  @clave varchar(1000),
  @TipoUsuario int,
  @Nombre varchar(1000),
  @Apellido varchar(1000),
  @Email varchar(1000),
  @Provincia varchar(1000),
  @Localidad varchar(1000)
AS
BEGIN
  UPDATE USUARIOS
    SET Nombre = @Nombre,
        Apellido = @Apellido,
		Clave = @clave,
		TipoUsuario = @TipoUsuario,
		Email = @Email,
		Provincia = @Provincia,
		Localidad = @Localidad
    WHERE Id = @Id;
END

Go
create procedure BajaLogica
  @id int
AS
BEGIN
  UPDATE USUARIOS
    SET Estado = 0
    WHERE Id = @Id;
END
