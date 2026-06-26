USE [computer_std];
GO

/* STORED PROCEDURE WITHOUT DUPLICATES */

IF OBJECT_ID(N'[dbo].[Load_Dim_Store]', N'P') IS NULL
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[Load_Dim_Store] AS BEGIN SET NOCOUNT ON; END');
END
GO

ALTER PROCEDURE [dbo].[Load_Dim_Store]
AS
BEGIN

    INSERT INTO [dbo].[dim_store]
    (
        Shop_Name, 
        Shop_Age
    )
    SELECT DISTINCT 
        p.Shop_Name, 
        p.Shop_Age 
    FROM [dbo].[pc_data] p
    WHERE p.Shop_Name IS NOT NULL
      AND NOT EXISTS
    (
        SELECT 1 
        FROM [dbo].[dim_store] s
        WHERE s.Shop_Name = p.Shop_Name
          AND ISNULL(s.Shop_Age, -1) = ISNULL(p.Shop_Age, -1)
    );

END;
GO