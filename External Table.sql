CREATE DATABASE SCOPED CREDENTIAL Jana
with 
    IDENTITY = 'Managed identity'
CREATE EXTERNAL DATA SOURCE source_silver_adv
WITH
(
    LOCATION = 'https://adventureworksgen2.dfs.core.windows.net/transformationsilver',
    CREDENTIAL = Jana
)

CREATE EXTERNAL DATA SOURCE source_gold_adv1
WITH
(
    LOCATION = 'https://adventureworksgen2.dfs.core.windows.net/servingdatagold',
    CREDENTIAL = Jana
)

--- create ecternal table extsales
CREATE EXTERNAL TABLE gold.extsales
WITH
(
    LOCATION = 'extsales',
    DATA_SOURCE = source_gold_adv1,
    FILE_FORMAT = format_parquet   
    
)AS 
SELECT * FROM gold.sales

SELECT * from gold.extsales
