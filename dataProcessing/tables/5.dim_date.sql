---dim_date--
drop table [computer_std].[dbo].[dim_date]
CREATE TABLE [computer_std].[dbo].[dim_date](
[date_id] INT IDENTITY (1,1) PRIMARY KEY,
	[Purchase_Date] [datetime2](7) NOT NULL,
	[Ship_Date] [nvarchar](50) NOT NULL
 ) 

 ---Loading data--
 INSERT INTO [computer_std].[dbo].[dim_date](Purchase_date, Ship_Date)
 SELECT DISTINCT Purchase_date, Ship_Date
 FROM pc_data

 SELECT * FROM [computer_std].[dbo].[dim_date]