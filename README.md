# Digital-preservation-PE
[Preservación digital](https://en.wikipedia.org/wiki/Digital_preservation) de las principales fuentes de la **base de datos AddressForAll-Perú**, mantenida por el [Instituto AddressForAll](http://addressforall.org/).

A Perú se le asignó: en el contexto ISO&nbsp;3166&#8209;2 el geocódigo **PE** y el número **604**; en Wikidata el identificador [Q419](http://wikidata.org/entity/Q419); en OpenStreetMap el identificador de [*relación* 288247](http://osm.org/relation/288247).

## Organización territorial
El territorio nacional y sus subdivisiones representam **jurisdiciones**:

* El país está dividido en **24 departamentos y la Provincia Constitucional del Callao** que son administradas por gobernos regionales compuestos por gobernador y consejo elegidos. <br/>Los geocódigos de los departamentos no siguen la convención registrada por [ISO&nbsp;3166&#8209;2:PE](https://en.wikipedia.org/wiki/ISO_3166-2:PE), sino el [Ubigeo](https://es.wikipedia.org/wiki/Ubigeo) (Código de UBIcación GEOgráfica) que es usado por el Instituto Nacional de Estadística e Informática, el Registro Nacional de Identificación y Estado Civil y otros organismos públicos. Los códigos Ubigeo de departamento son 25 códigos, mientras ISO 3166-2:PE son 26. En OpenStreetMap se acuerda que la subdivisión por regiones corresponde al *nivel administrativo 4*.

* Los departamentos son divididos en **196 provincias** que son administradas por municipalidades provinciales compuestas por alcalde y concejo elegidos. <br/>Geocódigos numéricos Ubigeo.

* Las provincias son divididas en **1874 distritos** que son administradas por municipalidades distritales compuestas por alcalde y concejo elegidos. <br/>Geocódigos numéricos Ubigeo.

Los catastros urbanos se encuentran en municipalidades provinciales. Solamente en Lima se encontraron catastros a nivel provincial y distrital (catastro distrital).

La jurisdicción que asigna nombres a las calles y el sistema de numeración urbana es la provincia.

### Notas
* La Provincia Constitucional del Callao es un gobierno regional sin pertenecer a ningún departamento.

* El Departamento de Lima tiene como capital *de iure* la ciudad de Lima, mientras la capital *de facto* se encuentra en la ciudad de Huacho, distrito de Huacho, provincia de Huaura.

* La Provincia de Lima, que forma parte del Departamento de Lima, es administrada por la Municipalidad Metropolitana de Lima, pero ejerce también funciones de gobierno regional. Se subdivide en 43 distritos; distrito de Lima (tambien conocido como Cercado de Lima y Lima Cercado) es el centro de la ciudad de Lima.

* El nombre de la provincia puede diferir de la capital provincial (ciudad), así como el nombre del distrito de la capital de su distrito.

* La capital provincial es una ciudad, mientras que un distrito puede tener suya capital en un centro poblado, ciudad o parte de una ciudad.

* Una ciudad puede estar formada por varios distritos, pero también puede estar restringida dentro de un distrito.


## Organización de este repositorio

En este *git*, solo se guardan los metadatos, es decir, descriptores de entidad, como nombres y códigos geográficos &mdash; mapas y otros datos, almacenados externamente porque son muy grandes. Los metadatos se organizaron de la siguiente manera, en la carpeta [`/data`](./data):

* [`/data/in`](./data/in): datos originales de **entrada**, es decir, metadatos proporcionados para el sistema.
   * `jurisdictionLevel*.csv`:  jurisdicciones (en todos los niveles) y sus geocódigos. La primera subdivisión es [jurisdictionLevel4.csv](./data/in/jurisdictionLevel4.csv).
   * [`cl-donor.csv`](./data/in/cl-donor.csv): donantes de paquetes de datos. Metadatos de las instituciones que brindan datos oficiales. (pendente)
   * [`cl-donatedPack.csv`](./data/in/cl-donatedPack.csv): descriptores de los archivos donados. (pendente)
   * *paquetes* (carpetas `_packXX`): *hash*  y otros descriptores de archivos almacenados externamente, así como `makefile` y otros descriptores de proceso para descomprimir estos archivos y llevarlos a la base de datos (PostregSQL)... 

* [`/data/out`](./data/out): resultados generados por el sistema (**salida**), es decir, metadatos creados a partir de los algoritmos y estadísticas aplicados a los datos de `_pack`.

## Licencia
[Licencia CC0](https://creativecommons.org/publicdomain/zero/1.0/deed.es).

