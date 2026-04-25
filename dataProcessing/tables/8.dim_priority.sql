---dim_priority--
drop table [computer_std].[dbo].[dim_priority]
CREATE TABLE [computer_std].[dbo].[dim_priority](
[priority_id] INT IDENTITY (1,1) PRIMARY KEY,
	[Priority] [nvarchar](50) NOT NULL
)

---Loading data---
INSERT INTO [computer_std].[dbo].[dim_priority](Priority)
SELECT DISTINCT Priority
FROM pc_data

select * FROM [computer_std].[dbo].[dim_priority]