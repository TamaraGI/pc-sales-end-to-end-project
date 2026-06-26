
USE [computer_std];
GO

/* STORED PROCEDURE WITHOUT DUPLICATES */

IF OBJECT_ID(N'[dbo].[Load_Dim_Payment]', N'P') IS NULL
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[Load_Dim_Payment] AS BEGIN SET NOCOUNT ON; END');
END
GO

ALTER PROCEDURE [dbo].[Load_Dim_Payment]
AS
BEGIN

    INSERT INTO [dbo].[dim_payment]
    (
        Payment_Method
    )
    SELECT DISTINCT 
        p.Payment_Method 
    FROM [dbo].[pc_data] p
    WHERE p.Payment_Method IS NOT NULL
      AND NOT EXISTS
    (
        SELECT 1 
        FROM [dbo].[dim_payment] pm
        WHERE pm.Payment_Method = p.Payment_Method
    );

END;
GO