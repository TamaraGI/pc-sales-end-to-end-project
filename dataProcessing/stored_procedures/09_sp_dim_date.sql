USE [computer_std];
GO

/* STORED PROCEDURE WITHOUT DUPLICATES */

IF OBJECT_ID(N'[dbo].[Load_Dim_Date]', N'P') IS NULL
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[Load_Dim_Date] AS BEGIN SET NOCOUNT ON; END');
END
GO

ALTER PROCEDURE [dbo].[Load_Dim_Date]
AS
BEGIN

    INSERT INTO [dbo].[dim_date]
    (
        Purchase_Date, 
        Ship_Date
    )
    SELECT DISTINCT 
        p.Purchase_Date, 
        p.Ship_Date 
    FROM [dbo].[pc_data] p
    WHERE p.Purchase_Date IS NOT NULL
      AND NOT EXISTS
    (
        SELECT 1 
        FROM [dbo].[dim_date] dd
        WHERE dd.Purchase_Date = p.Purchase_Date
          AND ISNULL(dd.Ship_Date, '1900-01-01') = ISNULL(p.Ship_Date, '1900-01-01')
    );

END;
GO