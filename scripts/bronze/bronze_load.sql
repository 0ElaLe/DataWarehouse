
---seleccionando nuestra base de datos
Use DataWarehouse;
GO
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
---Insercion de los datos crm
--Note que las direcciones son /data/archivo.csv
--Pues como trabaje con docker, hice una copia de mis datos en una carpeta llamada data
PRINT '=================================';
PRINT 'LOADING BRONZE LAYER';
PRINT '=================================';
PRINT '---------------------------------';
PRINT 'LOADING CRM TABLES';
PRINT '---------------------------------';
TRUNCATE TABLE bronze.crm_cust_info;
BULK INSERT bronze.crm_cust_info
FROM '/data/cust_info.csv'
WITH(
FIRSTROW =2, 
FIELDTERMINATOR=',',
TABLOCK
);



TRUNCATE TABLE bronze.crm_prd_info;
BULK INSERT bronze.crm_prd_info
FROM '/data/prd_info.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);


TRUNCATE TABLE bronze.crm_sales_details;
BULK INSERT bronze.crm_sales_details
FROM '/data/sales_details.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);
PRINT '---------------------------------';
PRINT 'LOADING ERP TABLES';
PRINT '---------------------------------';

---Insercion de los datos erp
TRUNCATE TABLE bronze.erp_cust_az12;
BULK INSERT bronze.erp_cust_az12
FROM '/data/CUST_AZ12.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);


TRUNCATE TABLE bronze.erp_px_cat_g1v2;
BULK INSERT bronze.erp_px_cat_g1v2
FROM '/data/PX_CAT_G1V2.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);


TRUNCATE TABLE bronze.erp_loc_a101;
BULK INSERT bronze.erp_loc_a101
FROM '/data/LOC_A101.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);


SELECT TOP 10 *
FROM bronze.erp_px_cat_g1v2;
END
