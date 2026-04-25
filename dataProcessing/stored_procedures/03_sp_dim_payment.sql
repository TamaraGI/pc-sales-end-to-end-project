USE [computer_std];
GO
--3. Load dim_payment
CREATE PROCEDURE [dbo].[Load_Dim_Payment]
AS
BEGIN
    INSERT INTO [dbo].[dim_payment](Payment_Method)
    SELECT DISTINCT Payment_Method 
    FROM [dbo].[pc_data]
    WHERE Payment_Method IS NOT NULL;
END;
