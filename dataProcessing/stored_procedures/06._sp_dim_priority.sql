USE [computer_std];
GO

/* STORED PROCEDURE WITHOUT DUPLICATES */

IF OBJECT_ID(N'[dbo].[Load_Dim_Priority]', N'P') IS NULL
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[Load_Dim_Priority] AS BEGIN SET NOCOUNT ON; END');
END
GO

ALTER PROCEDURE [dbo].[Load_Dim_Priority]
AS
BEGIN

    INSERT INTO [dbo].[dim_priority]
    (
        Priority
    )
    SELECT DISTINCT 
        p.Priority 
    FROM [dbo].[pc_data] p
    WHERE p.Priority IS NOT NULL
      AND NOT EXISTS
    (
        SELECT 1 
        FROM [dbo].[dim_priority] dp
        WHERE dp.Priority = p.Priority
    );

END;
GO