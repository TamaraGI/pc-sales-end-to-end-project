USE [computer_std];
GO
--5. Load dim_sales_person
CREATE PROCEDURE [dbo].[Load_Dim_Sales_Person]
AS
BEGIN
    INSERT INTO [dbo].[dim_sales_person](Sales_Person_Name,Sales_Person_Department)
    SELECT DISTINCT Sales_Person_Name, Sales_Person_Department 
    FROM [dbo].[pc_data]
    WHERE Sales_Person_Name IS NOT NULL;
END;
GO

