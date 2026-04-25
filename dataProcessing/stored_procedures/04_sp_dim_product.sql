USE [computer_std];
GO
--4 Load dim_product---
CREATE PROCEDURE [dbo].[Load_Dim_Product]
AS
BEGIN
    INSERT INTO [dbo].[dim_product](PC_Make, PC_Model, Storage_Type, RAM, Storage_Capacity)
    SELECT DISTINCT PC_Make, PC_Model, Storage_Type, RAM, Storage_Capacity 
    FROM [dbo].[raw_pc_data]
    WHERE PC_Make IS NOT NULL;
END;
