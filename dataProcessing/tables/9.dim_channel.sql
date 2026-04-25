---dim_channel--
drop table [computer_std].[dbo].[dim_channel]
CREATE TABLE [dbo].[dim_channel](
[channel_id] INT IDENTITY (1,1) PRIMARY KEY,
	[Channel] [nvarchar](50) NOT NULL
)
---Loading data---
INSERT INTO [computer_std].[dbo].[dim_channel](Channel)
SELECT DISTINCT Channel
FROM pc_data

SELECT * FROM [computer_std].[dbo].[dim_channel]