---dim_store--
drop table [computer_std].[dbo].[dim_store]
CREATE TABLE [dbo].[dim_store](
[store_id] INT IDENTITY (1,1) PRIMARY KEY,
	[Shop_Name] [nvarchar](50) NOT NULL,
	[Shop_Age] [nvarchar](50) NOT NULL
)
---Loading data--
INSERT INTO [computer_std].[dbo].[dim_store](Shop_Name, Shop_Age)
SELECT Shop_Name, Shop_Age
FROM  pc_data

SELECT * FROM [computer_std].[dbo].[dim_store]
