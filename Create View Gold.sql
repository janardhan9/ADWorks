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

SELECT * from gold.Territories






