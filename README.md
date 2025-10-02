# DataWarehouse
Full pipeline with ETL process to create an Data Warehouse with SQL server 

En la carpeta datasets encontrará los archivos csv que corresponden a las fuentes de datos que alimentan a este datawarehouse.
En la carpeta scripts encontrará los archivos sql de ddl así como de carga y transformación de datos correspondientes a  cada capa.
Por favor tenga en cuenta que seguramente tendrá que cambiar la dirección de los datos. Yo he escrito por ejemplo '/data/sales_details.csv'
porque en mi base de datos SQLserver la tengo en un contenedor de docker y los datos,  en una carpeta llamada data.

Considere también que para el caso de bronze y silver, para la parte de la carga de datos se han programado procedimientos que puede ejecutar simplemente como
"EXEC bronze.load_bronze". 
En la carpeta test, se encuentran algunas pruebas referentes a la calidad de datos.
