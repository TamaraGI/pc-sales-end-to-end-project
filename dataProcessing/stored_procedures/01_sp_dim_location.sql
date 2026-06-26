USE [computer_std];
GO

/* STORED PROCEDURE WITHOUT DUPLICATES */

IF OBJECT_ID(N'[dbo].[Load_Dim_Location]', N'P') IS NULL
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[Load_Dim_Location] AS BEGIN SET NOCOUNT ON; END');
END
GO

ALTER PROCEDURE [dbo].[Load_Dim_Location]
AS
BEGIN

    INSERT INTO [dbo].[dim_location]
    (
        Continent, 
        Country_or_State, 
        Province_or_City
    )
    SELECT DISTINCT 
        p.Continent, 
        p.Country_or_State, 
        p.Province_or_City 
    FROM [dbo].[pc_data] p
    WHERE p.Continent IS NOT NULL
      AND NOT EXISTS
    (
        SELECT 1 
        FROM [dbo].[dim_location] d
        WHERE d.Continent = p.Continent
          AND d.Country_or_State = p.Country_or_State
          AND d.Province_or_City = p.Province_or_City
    );

END;
GO




