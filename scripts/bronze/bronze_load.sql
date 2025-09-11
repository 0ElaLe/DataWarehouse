BULK INSERT bronze.crm_cust_info
FROM '/var/opt/mssql/data/customers.csv'
WITH(
FIRSTROW =2, 
FIELDTERMINATOR=',',
TABLOCK
);
GO