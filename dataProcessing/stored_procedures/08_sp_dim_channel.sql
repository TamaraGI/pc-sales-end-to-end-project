USE [computer_std];
GO
--7. Load dim_channel
CREATE PROCEDURE [dbo].[Load_Dim_Channel]
AS
BEGIN
    INSERT INTO [dbo].[dim_channel] (Channel)
    SELECT DISTINCT Channel 
    FROM [dbo].[pc_data]
    WHERE Channel IS NOT NULL;
END;