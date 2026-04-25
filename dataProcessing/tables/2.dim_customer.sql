---dim_customer---
drop table [computer_std].[dbo].[dim_customer]
CREATE TABLE [computer_std].[dbo].[dim_customer](
[customer_id] INT IDENTITY (1,1) PRIMARY KEY,
[Customer_Name] [nvarchar](50) NOT NULL,
[Customer_Surname] [nvarchar](50) NOT NULL,
[Customer_Contact_Number] [nvarchar](50) NOT NULL,
[Customer_Email_Address] [nvarchar](50) NOT NULL
)
INSERT INTO [computer_std].[dbo].[dim_customer](Customer_Name,Customer_Surname,Customer_Contact_Number,Customer_Email_Address)
SELECT Customer_Name,Customer_Surname, Customer_Contact_Number,Customer_Email_Address
FROM pc_data


SELECT * FROM [computer_std].[dbo].[dim_customer]