---dim_location--
drop table [computer_std].[dbo].[dim_location]
create table [computer_std].[dbo].[dim_location](
[location_id] INT IDENTITY(1,1) PRIMARY KEY, 
[Continent] [nvarchar](50) NOT NULL,
	[Country_or_State] [nvarchar](50) NOT NULL,
	[Province_or_City] [nvarchar](100) NOT NULL
) 
INSERT INTO [computer_std].[dbo].[dim_location] (Continent, Country_or_State, Province_or_City)
SELECT DISTINCT Continent, Country_or_State, Province_or_City
FROM pc_data

---Checking step: column 
SELECT * FROM [computer_std].[dbo].[dim_location]




