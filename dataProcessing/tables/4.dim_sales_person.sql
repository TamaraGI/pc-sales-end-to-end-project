---dim sales--
drop table [computer_std].[dbo].[dim_sales_person]
CREATE TABLE [computer_std].[dbo].[dim_sales_person](
[sales_person_id] INT IDENTITY (1,1) PRIMARY KEY,
	[Sales_Person_Name] [nvarchar](50) NOT NULL,
	[Sales_Person_Department] [nvarchar](50) NOT NULL
) 
--Loading of data--
INSERT INTO [computer_std].[dbo].[dim_sales_person](Sales_Person_Name,Sales_Person_Department)
SELECT DISTINCT Sales_Person_Name,Sales_Person_Department
FROM pc_data

SELECT * FROM [computer_std].[dbo].[dim_sales_person]