USE [computer_std];
GO
--6. Load dim_priority
CREATE PROCEDURE [dbo].[Load_Dim_Priority]
AS
BEGIN
    INSERT INTO [dbo].[dim_priority] (Priority)
    SELECT DISTINCT Priority 
    FROM [dbo].[pc_data]
    WHERE Priority IS NOT NULL;
END;
