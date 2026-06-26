USE [computer_std];
GO

/* STORED PROCEDURE WITHOUT DUPLICATES */

IF OBJECT_ID(N'[dbo].[Load_Dim_Product]', N'P') IS NULL
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[Load_Dim_Product] AS BEGIN SET NOCOUNT ON; END');
END
GO

ALTER PROCEDURE [dbo].[Load_Dim_Product]
AS
BEGIN

    INSERT INTO [dbo].[dim_product]
    (
        PC_Make, 
        PC_Model, 
        Storage_Type, 
        RAM, 
        Storage_Capacity
    )
    SELECT DISTINCT 
        p.PC_Make, 
        p.PC_Model, 
        p.Storage_Type, 
        p.RAM, 
        p.Storage_Capacity 
    FROM [dbo].[raw_pc_data] p
    WHERE p.PC_Make IS NOT NULL
      AND NOT EXISTS
    (
        SELECT 1 
        FROM [dbo].[dim_product] dp
        WHERE dp.PC_Make = p.PC_Make
          AND dp.PC_Model = p.PC_Model
          AND dp.Storage_Type = p.Storage_Type
          AND ISNULL(dp.RAM, '') = ISNULL(p.RAM, '')
          AND ISNULL(dp.Storage_Capacity, '') = ISNULL(p.Storage_Capacity, '')
    );

END;
GO