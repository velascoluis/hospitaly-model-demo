V_PROJECT_NAME='velascoluis-test'
#STATS_SEGMENTO
bq query --use_legacy_sql=false --project_id ${V_PROJECT_NAME}  --flagfile='sql_elt/def_n3_stats_segmento.sql'
#RESERVAS HOTEL DIA
bq query --use_legacy_sql=false --project_id ${V_PROJECT_NAME}  --flagfile='sql_elt/def_n3_total_reservas_hotel_dia.sql'