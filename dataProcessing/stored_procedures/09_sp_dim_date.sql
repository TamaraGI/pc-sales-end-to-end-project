USE [computer_std];
GO
--8. Load dim_date
CREATE PROCEDURE [dbo].[Load_Dim_Date]
AS
BEGIN
    INSERT INTO [dbo].[dim_date] (Purchase_Date, Ship_Date)
    SELECT DISTINCT Purchase_Date, Ship_Date 
    FROM [dbo].[pc_data]
    WHERE Purchase_Date IS NOT NULL;
END;
