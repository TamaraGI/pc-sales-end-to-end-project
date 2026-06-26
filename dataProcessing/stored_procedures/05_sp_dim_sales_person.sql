USE [computer_std];
GO

/* STORED PROCEDURE WITHOUT DUPLICATES */

IF OBJECT_ID(N'[dbo].[Load_Dim_Sales_Person]', N'P') IS NULL
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[Load_Dim_Sales_Person] AS BEGIN SET NOCOUNT ON; END');
END
GO

ALTER PROCEDURE [dbo].[Load_Dim_Sales_Person]
AS
BEGIN

    INSERT INTO [dbo].[dim_sales_person]
    (
        Sales_Person_Name, 
        Sales_Person_Department
    )
    SELECT DISTINCT 
        p.Sales_Person_Name, 
        p.Sales_Person_Department 
    FROM [dbo].[pc_data] p
    WHERE p.Sales_Person_Name IS NOT NULL
      AND NOT EXISTS
    (
        SELECT 1 
        FROM [dbo].[dim_sales_person] sp
        WHERE sp.Sales_Person_Name = p.Sales_Person_Name
          AND ISNULL(sp.Sales_Person_Department, '') = ISNULL(p.Sales_Person_Department, '')
    );

END;
GO