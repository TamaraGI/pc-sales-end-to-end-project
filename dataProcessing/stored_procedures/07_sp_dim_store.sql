USE [computer_std];
GO
--9. Load dim_store
CREATE PROCEDURE [dbo].[Load_Dim_Store]
AS
BEGIN
    INSERT INTO [dbo].[dim_store] (Shop_Name, Shop_Age)
    SELECT DISTINCT Shop_Name, Shop_Age 
    FROM [dbo].[pc_data]
    WHERE Shop_Name IS NOT NULL;
END;
