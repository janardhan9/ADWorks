<img width="1632" height="834" alt="image" src="https://github.com/user-attachments/assets/56cb8e49-90ea-4ca9-991b-18c218071fb6" />
<img width="1269" height="670" alt="image" src="https://github.com/user-attachments/assets/8089309a-54e5-451e-b384-6eccae139301" />
<img width="1270" height="667" alt="image" src="https://github.com/user-attachments/assets/31b7a5f2-a02a-45eb-95b6-16583aecddb0" />

<img width="1267" height="642" alt="image" src="https://github.com/user-attachments/assets/732b09ab-d42a-4ab4-bd94-1a96d5a0ccdf" />
<img width="1258" height="643" alt="image" src="https://github.com/user-attachments/assets/8dc8d801-9e43-4adc-8592-daa3a62001f3" />
<img width="1266" height="668" alt="image" src="https://github.com/user-attachments/assets/fd92b6f7-b10d-4c25-9038-e074cbc92317" />

<img width="1263" height="660" alt="image" src="https://github.com/user-attachments/assets/df9435de-ded5-4b0a-ad9f-d0e78b6b2dea" />

<img width="806" height="477" alt="Screenshot (1)" src="https://github.com/user-attachments/assets/3a025417-f7bf-4cf2-8f06-8c598000d6b7" />
<img width="1258" height="643" alt="Screenshot 2025-10-08 133322" src="https://github.com/user-attachments/assets/13ac0e4d-287c-48a0-a573-7d482116ea8d" />

<img width="1267" height="642" alt="Screenshot 2025-10-08 133257" src="https://github.com/user-attachments/assets/50056b71-36c4-4e29-8924-7d2105e80e22" />

Azure Data Engineering Project Documentation
Objective
To develop an end-to-end Azure data engineering solution using industry-standard tools such as Azure Data Factory, Azure Databricks, Azure Synapse Analytics, and Power BI. 
The project implements the Medallion Architecture (Bronze, Silver, Gold layers) to prepare for real-world scenarios. The primary goal is to demonstrate a scalable, secure, 
and efficient data pipeline integrating dynamic parameters, API data ingestion, transformation, and analytical insights.

**1. Architecture Overview**


**Medallion Architecture Design**


![image](https://github.com/user-attachments/assets/bd4cea08-efc6-487a-8917-47042e10f9e9)


   Bronze Layer:   Stores raw data ingested from APIs.
   Silver Layer:   Contains transformed data after applying business rules.
   Gold Layer:     Serves curated data optimized for analytics and reporting.

**Tools Used**
1. Azure Data Factory (ADF):Orchestrates data ingestion and pipeline workflows.
2. Azure Databricks: Performs data transformation and enrichment using PySpark.
3. Azure Synapse Analytics: Queries and curates data for analytical use cases.
4. Power BI: Visualizes insights and KPIs from the Gold layer.


**2. Phase 1: Data Ingestion**
Storage Setup:
   1.Created an Azure Data Lake Gen2 storage account with hierarchical namespace enabled.
   2.Containers created: rawdatastorebronze, transformationsilver, servingdatagold.
Pipeline Development:
   1.Linked Services:
   2.HTTP linked service for GitHub API.
    3.Data Lake Gen2 linked service for storage access.
Dynamic Pipeline:
   1. ForEach activity iterates over JSON-configured file metadata.
   2. Lookup activity fetches file paths and configurations.
   3. Copy activity transfers raw CSV files from GitHub to the Bronze layer.

Code Snippet


![image](https://github.com/user-attachments/assets/4af0ad90-17f9-42f8-b2da-79dd79d22203)








**3. Phase 2: Data Transformation**

Cluster Setup: - Configured a single-node Databricks cluster (runtime 14.3 LTS).
Data Loading: - Read data from the Bronze layer using PySpark.
Transformations Applied: 
     - Date Parsing: Extracted year and month from timestamps.
     -  String Operations: Concatenated columns for unified identifiers, split product SKUs.
     - Aggregations: Calculated sales trends by year.


Code Snippet


 from pyspark.sql.functions import col, concat_ws, year  data = spark.read.parquet("abfss://rawdatastorebronze@adventureworksgen2.dfs.core.windows.net") transformed_data = data.withColumn("Year", year(col("SaleDate"))) transformed_data.write.parquet("abfss://transformationsilver@adventureworksgen2.dfs.core.windows.net") 


**4. Phase 3: Data Serving and Analytics**


Synapse Setup: 
   - Created a Synapse workspace.
   - Configured serverless SQL pools for querying Parquet files.
Schema Creation:
   - Created a Gold schema to organize database objects.
   - Views and external tables materialized data from Silver to Gold.

![image](https://github.com/user-attachments/assets/cce8218e-581d-49eb-8658-e22ad8e892f3)


<img width="837" alt="Screenshot 2025-02-06 at 7 12 03 PM" src="https://github.com/user-attachments/assets/1bc6e540-c859-4180-b7a3-f620da139b76" />


     
**5. Power BI Integration**

![Screenshot 2025-02-06 at 7 38 37 PM](https://github.com/user-attachments/assets/bbfa650d-89df-41d9-a122-89b020043855)

     
**Workflow Overview:** 
1. Connected Power BI to Synapse serverless SQL pools.
2. Created dashboards for Total Customers, Sales Trends by Year, and Order Counts.


**6. Security and Access Control**

Data Lake Access: 
- IAM roles assigned for Data Factory and Databricks.
 - Entra ID used for authentication.
  
Synapse Access: 
- Leveraged managed identities for secure connectivity.


**7. Key Takeaways**
This project showcases a comprehensive Azure Data Engineering solution, integrating ADF, Databricks, Synapse, and Power BI to implement a scalable and efficient data pipeline.
It demonstrates best practices for modern data architecture and end-to-end workflows, from data ingestion to analytical visualization.
