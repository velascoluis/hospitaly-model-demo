### NAME / VERSION
###       02_load_data.sh    v.1.00
###
###    DESCRIPTION
###       Data loader into BQ for a hotel indsutry demo
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
V_COMMAND_DATAGEN='python3 src/fake_data_launcher.py'
NUM_CLIENTES=5000
NUM_HOTELES=200
NUM_PRODUCTOS=1000
NUM_EVENTOS=200
NUM_RESERVAS=65000
NUM_VENTAS_HOTEL=5000
NUM_HABITACIONES=300
NUM_DIAS_METEO=365

##DIM_CANAL
V_TABLE_NAME='DIM_CANAL'
V_CSV_FILE_NAME='raw_data/data_dim_canal.csv'
echo "About to load ${V_TABLE_NAME} ..."
bq load --project_id ${V_PROJECT_NAME}  --replace  --source_format=CSV  ${V_DATASET_NAME}.${V_TABLE_NAME} ${V_CSV_FILE_NAME}
if [ $? -eq 0 ]
then
  echo "Load ${V_TABLE_NAME} OK"
else
  echo "Load ${V_TABLE_NAME} failed"
fi

##DIM_SEGMENTO
V_TABLE_NAME='DIM_SEGMENTO'
V_CSV_FILE_NAME='raw_data/data_dim_segmento.csv'
echo "About to load ${V_TABLE_NAME} ..."
bq load --project_id ${V_PROJECT_NAME}  --replace  --source_format=CSV  ${V_DATASET_NAME}.${V_TABLE_NAME} ${V_CSV_FILE_NAME}
if [ $? -eq 0 ]
then
  echo "Load ${V_TABLE_NAME} OK"
else
  echo "Load ${V_TABLE_NAME} failed"
fi

##DIM_CLIENTE
V_TABLE_NAME='DIM_CLIENTE'
V_CSV_FILE_NAME='raw_data/data_dim_cliente.csv'
${V_COMMAND_DATAGEN} --table_name dim_cliente --field_names "ID_CLIENTE,NOMBRE,EMAIL,4" --field_types "ID,NAME,EMAIL,RANGE" --num_rows ${NUM_CLIENTES}
echo "About to load ${V_TABLE_NAME} ..."
bq load --project_id ${V_PROJECT_NAME}  --replace  --source_format=CSV  ${V_DATASET_NAME}.${V_TABLE_NAME} ${V_CSV_FILE_NAME}
if [ $? -eq 0 ]
then
  echo "Load ${V_TABLE_NAME} OK"
else
  echo "Load ${V_TABLE_NAME} failed"
fi

##DIM_HOTEL
V_TABLE_NAME='DIM_HOTEL'
V_CSV_FILE_NAME='raw_data/data_dim_hotel.csv'
${V_COMMAND_DATAGEN} --table_name dim_hotel --field_names "ID_HOTEL,NOMBRE,LOCALIZACION" --field_types "ID,COMPANY,CITY" --num_rows ${NUM_HOTELES}
echo "About to load ${V_TABLE_NAME} ..."
bq load --project_id ${V_PROJECT_NAME}  --replace  --source_format=CSV  ${V_DATASET_NAME}.${V_TABLE_NAME} ${V_CSV_FILE_NAME}
if [ $? -eq 0 ]
then
  echo "Load ${V_TABLE_NAME} OK"
else
  echo "Load ${V_TABLE_NAME} failed"
fi


##DIM_PRODUCTO
V_TABLE_NAME='DIM_PRODUCTO'
V_CSV_FILE_NAME='raw_data/data_dim_producto.csv'
${V_COMMAND_DATAGEN} --table_name dim_producto --field_names "ID_PRODUCT,NOMBRE,PRECIO" --field_types "ID,WORD,PRICE" --num_rows ${NUM_PRODUCTOS}
echo "About to load ${V_TABLE_NAME} ..."
bq load --project_id ${V_PROJECT_NAME}  --replace  --source_format=CSV  ${V_DATASET_NAME}.${V_TABLE_NAME} ${V_CSV_FILE_NAME}
if [ $? -eq 0 ]
then
  echo "Load ${V_TABLE_NAME} OK"
else
  echo "Load ${V_TABLE_NAME} failed"
fi

##TE_EVENTOS
V_TABLE_NAME='TE_EVENTOS'
V_CSV_FILE_NAME='raw_data/data_te_eventos.csv'
${V_COMMAND_DATAGEN} --table_name te_eventos --field_names "ID_EVENTO,NOMBRE,3000,5" --field_types "ID,WORD,RANGE,RANGE" --num_rows ${NUM_EVENTOS}
echo "About to load ${V_TABLE_NAME} ..."
bq load --project_id ${V_PROJECT_NAME}  --replace  --source_format=CSV  ${V_DATASET_NAME}.${V_TABLE_NAME} ${V_CSV_FILE_NAME}
if [ $? -eq 0 ]
then
  echo "Load ${V_TABLE_NAME} OK"
else
  echo "Load ${V_TABLE_NAME} failed"
fi

##DIM_VENTAS_HOTEL
V_TABLE_NAME='DIM_VENTAS_HOTEL'
V_CSV_FILE_NAME='raw_data/data_dim_ventas_hotel.csv'
${V_COMMAND_DATAGEN} --table_name dim_ventas_hotel --field_names "ID_VENTA,${NUM_RESERVAS},${NUM_PRODUCTOS},10" --field_types "ID,RANGE,RANGE,RANGE" --num_rows ${NUM_EVENTOS}
echo "About to load ${V_TABLE_NAME} ..."
bq load --project_id ${V_PROJECT_NAME}  --replace  --source_format=CSV  ${V_DATASET_NAME}.${V_TABLE_NAME} ${V_CSV_FILE_NAME}
if [ $? -eq 0 ]
then
  echo "Load ${V_TABLE_NAME} OK"
else
  echo "Load ${V_TABLE_NAME} failed"
fi

##DIM_HABITACION
V_TABLE_NAME='DIM_HABITACION'
V_CSV_FILE_NAME='raw_data/data_dim_habitacion.csv'
${V_COMMAND_DATAGEN} --table_name dim_habitacion --field_names "ID_HABITACION,${NUM_HOTELES},300,10,AMENIDADES" --field_types "ID,RANGE,RANGE,RANGE,WORD" --num_rows ${NUM_HABITACIONES}
echo "About to load ${V_TABLE_NAME} ..."
bq load --project_id ${V_PROJECT_NAME}  --replace  --source_format=CSV  ${V_DATASET_NAME}.${V_TABLE_NAME} ${V_CSV_FILE_NAME}
if [ $? -eq 0 ]
then
  echo "Load ${V_TABLE_NAME} OK"
else
  echo "Load ${V_TABLE_NAME} failed"
fi


##DIM_METEO
V_TABLE_NAME='DIM_METEO'
V_CSV_FILE_NAME='raw_data/data_dim_meteo.csv'
${V_COMMAND_DATAGEN} --table_name dim_meteo --field_names "ID_METEO,FECHA_METEO,500,30" --field_types "ID,DATE_SEQUENTIAL,RANGE,RANGE" --num_rows ${NUM_DIAS_METEO}
echo "About to load ${V_TABLE_NAME} ..."
bq load --project_id ${V_PROJECT_NAME}  --replace  --source_format=CSV  ${V_DATASET_NAME}.${V_TABLE_NAME} ${V_CSV_FILE_NAME}
if [ $? -eq 0 ]
then
  echo "Load ${V_TABLE_NAME} OK"
else
  echo "Load ${V_TABLE_NAME} failed"
fi

##TH_RESERVAS
V_TABLE_NAME='TH_RESERVAS'
V_CSV_FILE_NAME='raw_data/data_th_reservas.csv'
${V_COMMAND_DATAGEN} --table_name th_reservas --field_names "ID_RESERVA,${NUM_HABITACIONES},6,${NUM_CLIENTES},${NUM_DIAS_METEO},10,TARIFA_NOCHE,FECHA_RESERVA,FECHA_CHECKIN,FECHA_CHECKOUT" --field_types "ID,RANGE,RANGE,RANGE,RANGE,RANGE,PRICE,DATE,EMPTY,EMPTY" --num_rows ${NUM_RESERVAS}
echo "About to load ${V_TABLE_NAME} ..."
bq load --project_id ${V_PROJECT_NAME}  --replace  --source_format=CSV  ${V_DATASET_NAME}.${V_TABLE_NAME} ${V_CSV_FILE_NAME}
if [ $? -eq 0 ]
then
  echo "Load ${V_TABLE_NAME} OK"
else
  echo "Load ${V_TABLE_NAME} failed"
fi


