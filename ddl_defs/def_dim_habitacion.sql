CREATE OR REPLACE TABLE HOTEL_MODEL.DIM_HABITACION
(
 ID_HABITACION     INT64 NOT NULL ,
 ID_HOTEL          INT64 NOT NULL ,
 NUMERO_HABITACION INT64 NOT NULL ,
 PLANTA            INT64 NOT NULL ,
 AMENIDADES        ARRAY<STRING>
);