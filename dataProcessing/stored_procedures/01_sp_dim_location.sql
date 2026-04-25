Use [computer_std];
GO
---1. Load dim_location---
CREATE PROCEDURE [dbo].[Load_Dim_Location] 
AS
BEGIN
     INSERT INTO [dbo].[dim_location] (Continent, Country_or_State, Province_or_City)
SELECT DISTINCT Continent, Country_or_State, Province_or_City 
  FROM [dbo].[pc_data]
  WHERE Continent IS NOT NULL;
END;





