CREATE OR REPLACE TABLE HOTEL_MODEL.DIM_METEO
(
 ID_METEO    INT64 NOT NULL ,
 FECHA_METEO DATE NOT NULL ,
 LLUVIA      INT64 NOT NULL ,
 TEMP        INT64 NOT NULL
);