--dim_product--
drop table [computer_std].[dbo].[dim_product]
CREATE TABLE [computer_std].[dbo].[dim_product](
[product_id] INT IDENTITY (1,1) PRIMARY KEY,
	[PC_Make] [nvarchar](50) NOT NULL,
	[PC_Model] [nvarchar](50) NOT NULL,
	[Storage_Type] [nvarchar](50) NOT NULL,
	[RAM] [nvarchar](50) NOT NULL,
	[Storage_Capacity] [nvarchar](50) NOT NULL
) 

INSERT INTO [computer_std].[dbo].[dim_product](PC_Make,PC_Model,Storage_Type,Storage_Capacity, RAM)
SELECT DISTINCT PC_Make,PC_Model,Storage_Type,Storage_Capacity,RAM
FROM pc_data

SELECT * FROM [computer_std].[dbo].[dim_product]


