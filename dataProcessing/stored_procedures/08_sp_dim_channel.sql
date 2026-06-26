USE [computer_std];
GO

/* STORED PROCEDURE WITHOUT DUPLICATES */

IF OBJECT_ID(N'[dbo].[Load_Dim_Channel]', N'P') IS NULL
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[Load_Dim_Channel] AS BEGIN SET NOCOUNT ON; END');
END
GO

ALTER PROCEDURE [dbo].[Load_Dim_Channel]
AS
BEGIN

    INSERT INTO [dbo].[dim_channel]
    (
        Channel
    )
    SELECT DISTINCT 
        p.Channel 
    FROM [dbo].[pc_data] p
    WHERE p.Channel IS NOT NULL
      AND NOT EXISTS
    (
        SELECT 1 
        FROM [dbo].[dim_channel] dc
        WHERE dc.Channel = p.Channel
    );

END;
GO