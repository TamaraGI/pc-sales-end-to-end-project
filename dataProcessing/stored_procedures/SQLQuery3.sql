SELECT DISTINCT
      [Continent],
      [Country_or_State],
      [Province_or_City]
      INTO dim_location 
      FROM [computer_std].[dbo].[pc_data]

SELECT DISTINCT
       [Customer_Name],
       [Customer_Surname],
       [Customer_Contact_Number],
       [Customer_Email_Address]
       INTO dim_customer
       FROM [computer_std].[dbo].[pc_data]

SELECT DISTINCT
       [PC_Make],
       [PC_Model],
       [Storage_Type],
       [RAM],
       [Storage_Capacity]
       INTO dim_product
       FROM [computer_std].[dbo].[pc_data]

       SELECT DISTINCT
       [Sales_Person_Name],
       [Sales_Person_Department]
       INTO dim_sales_person
       FROM [computer_std].[dbo].[pc_data]

       SELECT DISTINCT
       [Shop_Name],
       [Shop_Age]
       INTO dim_store
       FROM [computer_std].[dbo].[pc_data]

       SELECT DISTINCT
       [Purchase_Date],
       [Ship_Date]
       INTO dim_date
       FROM [computer_std].[dbo].[pc_data]

       SELECT DISTINCT
       [Payment_Method]
       INTO dim_payment_method
       FROM [computer_std].[dbo].[pc_data]

       SELECT DISTINCT
       [Channel]
       INTO dim_channel
       FROM [computer_std].[dbo].[pc_data]

       SELECT
       [Priority]
       INTO dim_priority
       FROM [computer_std].[dbo].[pc_data]






