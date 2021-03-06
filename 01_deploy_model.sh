### NAME / VERSION
###       02_deploy_model.sh    v.1.00
###
###    DESCRIPTION
###       Deploys a DDL model in BQ for hotel industry
###    PARAMETERS
###
###     NONE
###
###    RETUNRS
###
###
###
###    NOTES
###
###
###    MODIFIED BY :      DATE:            COMMENTS:
###    ---------------    ----------    -------------------------------------
###      velascoluis@       24/04/2020    Initial version



V_PROJECT_NAME='velascoluis-test'
V_DATASET_NAME='HOTEL_MODEL'
# Generate the dataset
bq show ${V_DATASET_NAME} || bq mk ${V_DATASET_NAME}
# Generate tables DDL

##DIM_CLIENTE
V_TABLE_NAME='DIM_CLIENTE'
V_SCHEMA='ID_CLIENTE:INT64,NOMBRE:STRING,EMAIL:STRING,ID_SEGMENTO:INT64'
bq rm --table -f ${V_PROJECT_NAME}:${V_DATASET_NAME}.${V_TABLE_NAME}
bq mk --table  --table ${V_PROJECT_NAME}:${V_DATASET_NAME}.${V_TABLE_NAME} ${V_SCHEMA}

##DIM_SEGMENTO
V_TABLE_NAME='DIM_SEGMENTO'
V_SCHEMA='ID_SEGMENTO:INT64,NOMBRE_SEGMENTO:STRING'
bq rm --table -f ${V_PROJECT_NAME}:${V_DATASET_NAME}.${V_TABLE_NAME}
bq mk --table  --table ${V_PROJECT_NAME}:${V_DATASET_NAME}.${V_TABLE_NAME} ${V_SCHEMA}

##DIM_CANAL
V_TABLE_NAME='DIM_CANAL'
V_SCHEMA='ID_CANAL:INT64,NOMBRE_CANAL:STRING'
bq rm --table -f ${V_PROJECT_NAME}:${V_DATASET_NAME}.${V_TABLE_NAME}
bq mk --table  --table ${V_PROJECT_NAME}:${V_DATASET_NAME}.${V_TABLE_NAME} ${V_SCHEMA}

##DIM_HOTEL
V_TABLE_NAME='DIM_HOTEL'
V_SCHEMA='ID_HOTEL:INT64,NOMBRE_HOTEL:STRING,LOCALIZACION:STRING'
bq rm --table -f ${V_PROJECT_NAME}:${V_DATASET_NAME}.${V_TABLE_NAME}
bq mk --table  --table ${V_PROJECT_NAME}:${V_DATASET_NAME}.${V_TABLE_NAME} ${V_SCHEMA}

##DIM_PRODUCTO
V_TABLE_NAME='DIM_PRODUCTO'
V_SCHEMA='ID_PRODUCTO:INT64,NOMBRE_PRODUCTO:STRING,PRECIO_PRODUCTO:INT64'
bq rm --table -f ${V_PROJECT_NAME}:${V_DATASET_NAME}.${V_TABLE_NAME}
bq mk --table  --table ${V_PROJECT_NAME}:${V_DATASET_NAME}.${V_TABLE_NAME} ${V_SCHEMA}

##TE_EVENTOS
V_TABLE_NAME='TE_EVENTOS'
V_SCHEMA='ID_EVENTO:INT64,NOMBRE:STRING,ASISTENTES:INT64,TIPO_EVENTO:STRING'


bq rm --table -f ${V_PROJECT_NAME}:${V_DATASET_NAME}.${V_TABLE_NAME}
bq mk --table --table ${V_PROJECT_NAME}:${V_DATASET_NAME}.${V_TABLE_NAME} ${V_SCHEMA}

##DIM_VENTAS_HOTEL
V_TABLE_NAME='DIM_VENTAS_HOTEL'
V_SCHEMA='ID_VENTA:INT64,ID_RESERVA:INT64,ID_PRODUCTO:INT64,CANTIDAD:INT64'
bq rm --table -f ${V_PROJECT_NAME}:${V_DATASET_NAME}.${V_TABLE_NAME}
bq mk --table  --table ${V_PROJECT_NAME}:${V_DATASET_NAME}.${V_TABLE_NAME} ${V_SCHEMA}

##DIM_HABITACION_ARRAY
V_TABLE_NAME='DIM_HABITACION_ARRAY'
V_SCHEMA_FILE='ddl_defs/def_dim_habitacion.json'
bq rm --table -f ${V_PROJECT_NAME}:${V_DATASET_NAME}.${V_TABLE_NAME}
bq mk --table  --table ${V_PROJECT_NAME}:${V_DATASET_NAME}.${V_TABLE_NAME} ${V_SCHEMA_FILE}

##DIM_HABITACION
V_TABLE_NAME='DIM_HABITACION'
V_SCHEMA='ID_HABITACION:INT64,ID_HOTEL:INT64,NUMERO_HABITACION:INT64,PLANTA:INT64,AMENIDADES:STRING'
bq rm --table -f ${V_PROJECT_NAME}:${V_DATASET_NAME}.${V_TABLE_NAME}
bq mk --table  --table ${V_PROJECT_NAME}:${V_DATASET_NAME}.${V_TABLE_NAME} ${V_SCHEMA}


##DIM_METEO
V_TABLE_NAME='DIM_METEO'
V_SCHEMA='ID_METEO:INT64,FECHA_METEO:DATE,LLUVIA:INT64,TEMP:INT64'
bq rm --table -f ${V_PROJECT_NAME}:${V_DATASET_NAME}.${V_TABLE_NAME}
bq mk --table --table ${V_PROJECT_NAME}:${V_DATASET_NAME}.${V_TABLE_NAME} ${V_SCHEMA}

##TH_RESERVAS
V_TABLE_NAME='TH_RESERVAS'
V_SCHEMA='ID_RESERVA:INT64,ID_HABITACION:INT64,ID_CANAL:INT64,ID_CLIENTE:INT64,ID_METEO:INT64,TOTAL_DIAS:INT64,TARIFA_NOCHE:INT64,FECHA_RESERVA:DATE,FECHA_CHECKIN:DATE,FECHA_CHECKOUT:DATE'
bq rm --table -f ${V_PROJECT_NAME}:${V_DATASET_NAME}.${V_TABLE_NAME}
bq mk --table  --table ${V_PROJECT_NAME}:${V_DATASET_NAME}.${V_TABLE_NAME} ${V_SCHEMA}



