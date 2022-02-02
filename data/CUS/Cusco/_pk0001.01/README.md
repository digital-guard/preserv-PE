Dados cedidos por Sedacusco, empresa de água de Cusco. Os pontos são relativos a medidores, não às portas.

# Tareas

## 1. 

## 2. 


# Extracción
A continuación se muestran los pasos para la extracción por tipo de datos relevantes.






## Outros
Para outros projetos, há também dados sobre:
* ``:
  *
* ``:
  *

(!!! Havendo outros projetos, esta seção será detalhada !!!)

# Evidências de teste
Teste no QGIS:
![](qgis.png)

# Make
Para generar todas las capas descritas aquí, `make all_layers`. Todos los datos del "original filtrado" se escribirán en las tablas `ingest.layer_file` e` ingest.feature_asis`.

Para la generación de una sola capa o la descarga de datos de otra fuente, o el uso de una base que no sea `ingest1`, use demasiados parámetros. Ejemplo: `make pg_db=ingest2 orig=/tmp/sandOrig nsvia_full`.
