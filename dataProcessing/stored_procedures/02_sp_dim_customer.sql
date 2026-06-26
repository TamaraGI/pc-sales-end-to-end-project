
USE [computer_std];
GO

/* STORED PROCEDURE WITHOUT DUPLICATES */

IF OBJECT_ID(N'[dbo].[Load_Dim_Customer]', N'P') IS NULL
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[Load_Dim_Customer] AS BEGIN SET NOCOUNT ON; END');
END
GO

ALTER PROCEDURE [dbo].[Load_Dim_Customer]
AS
BEGIN

    INSERT INTO [dbo].[dim_customer]
    (
        Customer_Name, 
        Customer_Surname, 
        Customer_Contact_Number, 
        Customer_Email_Address
    )
    SELECT DISTINCT 
        p.Customer_Name, 
        p.Customer_Surname, 
        p.Customer_Contact_Number, 
        p.Customer_Email_Address 
    FROM [dbo].[pc_data] p
    WHERE p.Customer_Name IS NOT NULL
      AND NOT EXISTS
    (
        SELECT 1 
        FROM [dbo].[dim_customer] c
        WHERE c.Customer_Name = p.Customer_Name
          AND c.Customer_Surname = p.Customer_Surname
    );

END;
GO
