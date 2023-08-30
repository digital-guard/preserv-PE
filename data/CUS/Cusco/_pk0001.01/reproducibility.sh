#!/bin/bash

# layer address:
rm -rf /tmp/sandbox/_pk60400000101_001 || true
mkdir -m 777 -p /tmp/sandbox
mkdir -m 777 -p /tmp/sandbox/_pk60400000101_001
mkdir -p /tmp/pg_io
wget -P /var/www/dl.digital-guard.org http://dl.digital-guard.org/9b76c8f77f5e08b9bae2d839540a6d02d640c62bf422efd3a9f629fdd247b97e.zip
sudo chown postgres:www-data /var/www/dl.digital-guard.org/9b76c8f77f5e08b9bae2d839540a6d02d640c62bf422efd3a9f629fdd247b97e.zip && sudo chmod 664 /var/www/dl.digital-guard.org/9b76c8f77f5e08b9bae2d839540a6d02d640c62bf422efd3a9f629fdd247b97e.zip
psql postgres://postgres@localhost/ingest1 -c "DROP FOREIGN TABLE IF EXISTS pk60400000101201_p2_address CASCADE"
cd /tmp/sandbox/_pk60400000101_001; 7z  x -y /var/www/dl.digital-guard.org/9b76c8f77f5e08b9bae2d839540a6d02d640c62bf422efd3a9f629fdd247b97e.zip "*Padron de Direcciones Cusco*" ; chmod -R a+rwx . > /dev/null
psql postgres://postgres@localhost/ingest1 -c "SELECT srid, proj4text FROM spatial_ref_sys where srid=32719"
xlsx2csv -i  "/tmp/sandbox/_pk60400000101_001/Padron de Direcciones Cusco.xlsx" "/tmp/sandbox/_pk60400000101_001/Padron de Direcciones Cusco.csv"
psql postgres://postgres@localhost/ingest1 -c "SELECT ingest.fdw_generate_direct_csv( '/tmp/sandbox/_pk60400000101_001/Padron de Direcciones Cusco.csv', 'pk60400000101201_p2_address' )"

psql postgres://postgres@localhost/ingest1 -c "SELECT ingest.any_load('csv2sql','/tmp/sandbox/_pk60400000101_001/Padron de Direcciones Cusco.xlsx','address_cmpl','pk60400000101201_p2_address','60400000101201','9b76c8f77f5e08b9bae2d839540a6d02d640c62bf422efd3a9f629fdd247b97e.zip',array['\"INSCRINRO\"', '\"PROVINCIA\"', '\"DISTRITO\"', '\"TIPURB\"', '\"URB\"', '\"TIPCAL\"', '\"CALLE\" AS via', '\"PRENRO\" AS hnum'],5,1)"
@echo "Confira os resultados nas tabelas ingest.donated_packcomponent e ingest.cadastral_asis".
psql postgres://postgres@localhost/ingest1 -c "DROP FOREIGN TABLE IF EXISTS pk60400000101201_p2_address CASCADE"
rm -f /tmp/sandbox/_pk60400000101_001/*Padron de Direcciones Cusco.* || true






# layer geoaddress:
rm -rf /tmp/sandbox/_pk60400000101_001 || true
mkdir -m 777 -p /tmp/sandbox
mkdir -m 777 -p /tmp/sandbox/_pk60400000101_001
mkdir -p /tmp/pg_io
wget -P /var/www/dl.digital-guard.org http://dl.digital-guard.org/43484294f9190a3a050e097e0c106f8da16169a3e1dff9d00ea04aae6e9cbe1a.zip
sudo chown postgres:www-data /var/www/dl.digital-guard.org/43484294f9190a3a050e097e0c106f8da16169a3e1dff9d00ea04aae6e9cbe1a.zip && sudo chmod 664 /var/www/dl.digital-guard.org/43484294f9190a3a050e097e0c106f8da16169a3e1dff9d00ea04aae6e9cbe1a.zip
psql postgres://postgres@localhost/ingest1 -c "DROP  TABLE IF EXISTS pk60400000101101_p1_geoaddress CASCADE"
cd /tmp/sandbox/_pk60400000101_001; 7z  x -y /var/www/dl.digital-guard.org/43484294f9190a3a050e097e0c106f8da16169a3e1dff9d00ea04aae6e9cbe1a.zip "*Ubicaciones/Inscripciones*" ; chmod -R a+rwx . > /dev/null
psql postgres://postgres@localhost/ingest1 -c "SELECT srid, proj4text FROM spatial_ref_sys where srid=32719"
cd /tmp/sandbox/_pk60400000101_001; shp2pgsql -D   -s 32719 "Ubicaciones/Inscripciones.shp" pk60400000101101_p1_geoaddress | psql -q postgres://postgres@localhost/ingest1 2> /dev/null

psql postgres://postgres@localhost/ingest1 -c "SELECT ingest.any_load('shp2sql','/tmp/sandbox/_pk60400000101_001/Ubicaciones/Inscripciones.shp','geoaddress_ext','pk60400000101101_p1_geoaddress','60400000101101','43484294f9190a3a050e097e0c106f8da16169a3e1dff9d00ea04aae6e9cbe1a.zip',array['gid', 'usuario', 'geom'],1,1)"
@echo "Confira os resultados nas tabelas ingest.donated_packcomponent e ingest.feature_asis".
psql postgres://postgres@localhost/ingest1 -c "DROP  TABLE IF EXISTS pk60400000101101_p1_geoaddress CASCADE"
rm -f /tmp/sandbox/_pk60400000101_001/*Ubicaciones/Inscripciones.* || true
mkdir -m777 -p /var/gits/_dg/preservCutGeo-PE2021/data/CUS/Cusco/_pk0001.01/geoaddress
rm -rf /var/gits/_dg/preservCutGeo-PE2021/data/CUS/Cusco/_pk0001.01/geoaddress/*.geojson
psql postgres://postgres@localhost/ingest1 -c "SELECT ingest.publicating_geojsons('geoaddress','PE-CUS-Cusco','/var/gits/_dg/preservCutGeo-PE2021/data/CUS/Cusco/_pk0001.01/geoaddress','1',9,3);"
sudo chown -R postgres:www-data /var/gits/_dg/preservCutGeo-PE2021/data/CUS/Cusco/_pk0001.01/geoaddress
sudo find /var/gits/_dg/preservCutGeo-PE2021/data/CUS/Cusco/_pk0001.01/geoaddress -type d -exec chmod 774 {} \;
sudo find /var/gits/_dg/preservCutGeo-PE2021/data/CUS/Cusco/_pk0001.01/geoaddress -type f -exec chmod 664 {} \;






# layer joining

psql postgres://postgres@localhost/ingest1 -c "SELECT ingest.join('geoaddress_ext','usuario','43484294f9190a3a050e097e0c106f8da16169a3e1dff9d00ea04aae6e9cbe1a.zip','address_cmpl','INSCRINRO','9b76c8f77f5e08b9bae2d839540a6d02d640c62bf422efd3a9f629fdd247b97e.zip')"



