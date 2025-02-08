
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

--- Create external table extcalender

CREATE EXTERNAL TABLE gold.extcalendar
WITH
(
    LOCATION = 'extcalendar',
    DATA_SOURCE = source_gold_adv1,
    FILE_FORMAT = format_parquet   
    
)AS 
SELECT * FROM gold.Calendar

--- Create external table extCustomers
CREATE EXTERNAL TABLE gold.extCustomers
WITH
(
    LOCATION = 'extCustomers',
    DATA_SOURCE = source_gold_adv1,
    FILE_FORMAT = format_parquet   
    
)AS 
SELECT * FROM gold.Customers

--- Create external table extproduCateg
CREATE EXTERNAL TABLE gold.extproduCateg
WITH
(
    LOCATION = 'extproduCateg',
    DATA_SOURCE = source_gold_adv1,
    FILE_FORMAT = format_parquet   
    
)AS 
SELECT * FROM gold.Product_Categories

--- Create external table extsubCateg
CREATE EXTERNAL TABLE gold.extsubCateg
WITH
(
    LOCATION = 'extsubCateg',
    DATA_SOURCE = source_gold_adv1,
    FILE_FORMAT = format_parquet   
    
)AS 
SELECT * FROM gold.SubCatag

---- Create extenal table extProducts

CREATE EXTERNAL TABLE gold.extProducts
WITH
(
    LOCATION = 'extProducts',
    DATA_SOURCE = source_gold_adv1,
    FILE_FORMAT = format_parquet   
    
)AS 
SELECT * FROM gold.Productss

--- Create external table extReturns
CREATE EXTERNAL TABLE gold.extReturns
WITH
(
    LOCATION = 'extReturns',
    DATA_SOURCE = source_gold_adv1,
    FILE_FORMAT = format_parquet   
    
)AS 
SELECT * FROM gold.Returns

--- Create external table extterritores
CREATE EXTERNAL TABLE gold.extterritores
WITH
(
    LOCATION = 'extterritores',
    DATA_SOURCE = source_gold_adv1,
    FILE_FORMAT = format_parquet   
    
)AS 
SELECT * FROM gold.Territories

This is Creater view gold scipt 
--- Calendar
CREATE VIEW gold.Calendar
AS
SELECT 
* 
FROM 
OPENROWSET
               (
                BULK 'https://adventureworksgen2.dfs.core.windows.net/transformationsilver/AdventureWorks_Calendar',
                FORMAT = 'PARQUET'
               ) AS Q1
        
---- Customers
CREATE VIEW gold.Customers
AS
SELECT 
* 
FROM 
OPENROWSET
               (
                BULK 'https://adventureworksgen2.dfs.core.windows.net/transformationsilver/AdventureWorks_Customers',
                FORMAT = 'PARQUET'
               ) AS Q2


---- Product_Categories
CREATE VIEW gold.Product_Categories
AS
SELECT 
* 
FROM 
OPENROWSET
               (
                BULK 'https://adventureworksgen2.dfs.core.windows.net/transformationsilver/AdventureWorks_Product_Categories',
                FORMAT = 'PARQUET'
               ) AS Q3

---- Productss
CREATE VIEW gold.Productss
AS
SELECT 
* 
FROM 
OPENROWSET
               (
                BULK 'https://adventureworksgen2.dfs.core.windows.net/transformationsilver/AdventureWorks_Productss',
                FORMAT = 'PARQUET'
               ) AS Q4



---- Returns
CREATE VIEW gold.Returns
AS
SELECT 
* 
FROM 
OPENROWSET
               (
                BULK 'https://adventureworksgen2.dfs.core.windows.net/transformationsilver/AdventureWorks_Returns',
                FORMAT = 'PARQUET'
               ) AS Q5



---- Sales
CREATE VIEW gold.Sales
AS
SELECT 
* 
FROM 
OPENROWSET
               (
                BULK 'https://adventureworksgen2.dfs.core.windows.net/transformationsilver/AdventureWorks_Sales',
                FORMAT = 'PARQUET'
               ) AS Q6




---- Territories
CREATE VIEW gold.Territories
AS
SELECT 
* 
FROM 
OPENROWSET
               (
                BULK 'https://adventureworksgen2.dfs.core.windows.net/transformationsilver/AdventureWorks_Territories',
                FORMAT = 'PARQUET'
               ) AS Q7

--- Sub categories 
CREATE VIEW gold.SubCatag
AS
SELECT 
* 
FROM 
OPENROWSET
               (
                BULK 'https://adventureworksgen2.dfs.core.windows.net/transformationsilver/AdventureWorks_Product_Subcategories',
                FORMAT = 'PARQUET'
               ) AS Q8
SELECT * from gold.Territories
