---dim_payment_method---
drop table [computer_std].[dbo].[dim_payment_method]
CREATE TABLE [computer_std].[dbo].[dim_payment_method](
[payment_method_id] INT IDENTITY (1,1) PRIMARY KEY,
	[Payment_Method] [nvarchar](50) NOT NULL
)
---Loading data---
INSERT INTO [computer_std].[dbo].[dim_payment_method](Payment_Method)
SELECT DISTINCT (Payment_Method)
FROM pc_data

SELECT * FROM [computer_std].[dbo].[dim_payment_method]

