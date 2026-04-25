USE [computer_std];
GO
CREATE PROCEDURE [dbo].[Load_Fact_PC_Sales]
AS
BEGIN
    INSERT INTO [computer_std].[dbo].[fact_pc_sales](
    [location_id], 
    [store_id], 
    [product_id], 
    [customer_id], 
    [sales_person_id], 
    [payment_method_id], 
    [channel_id], 
    [priority_id], 
    [date_id],
    [Cost_Price], 
    [Sale_Price], 
    [Discount_Amount], 
    [Finance_Amount], 
    [Credit_Score], 
    [Cost_of_Repairs], 
    [Total_Sales_per_Employee], 
    [PC_Market_Price]
)
SELECT 
    loc.location_id,
    st.store_id,
    pc.product_id,
    cus.customer_id,
    sp.sales_person_id,
    pay.payment_method_id,
    ch.channel_id,
    pr.priority_id,
    d.date_id,
    raw.[Cost_Price], 
    raw.[Sale_Price], 
    raw.[Discount_Amount], 
    raw.[Finance_Amount], 
    raw.[Credit_Score], 
    raw.[Cost_of_Repairs], 
    raw.[Total_Sales_per_Employee], 
    raw.[PC_Market_Price]
FROM [computer_std].[dbo].[pc_data] raw
-- You must join every dimension to match the raw text to the new ID
LEFT JOIN [computer_std].[dbo].[dim_location] loc 
    ON raw.Continent = loc.Continent 
    AND raw.Country_or_State = loc.Country_or_State 
    AND raw.Province_or_City = loc.Province_or_City
LEFT JOIN [computer_std].[dbo].[dim_store] st 
    ON raw.Shop_Name = st.Shop_Name 
    AND raw.Shop_Age = st.Shop_Age
LEFT JOIN [computer_std].[dbo].[dim_product] pc 
    ON raw.PC_Make = pc.PC_Make 
    AND raw.PC_Model = pc.PC_Model 
    AND raw.Storage_Type = pc.Storage_Type 
    AND raw.RAM = pc.RAM 
    AND raw.Storage_Capacity = pc.Storage_Capacity
LEFT JOIN [computer_std].[dbo].[dim_customer] cus 
    ON raw.Customer_Name = cus.Customer_Name 
    AND raw.Customer_Surname = cus.Customer_Surname 
    AND raw.Customer_Contact_Number = cus.Customer_Contact_Number 
    AND raw.Customer_Email_Address = cus.Customer_Email_Address
LEFT JOIN [computer_std].[dbo].[dim_sales_person] sp 
    ON raw.Sales_Person_Name = sp.Sales_Person_Name 
    AND raw.Sales_Person_Department = sp.Sales_Person_Department
LEFT JOIN [computer_std].[dbo].[dim_payment_method] pay 
    ON raw.Payment_Method = pay.Payment_Method
LEFT JOIN [computer_std].[dbo].[dim_channel] ch 
    ON raw.Channel = ch.Channel
LEFT JOIN [computer_std].[dbo].[dim_priority] pr 
    ON raw.Priority = pr.Priority
LEFT JOIN [computer_std].[dbo].[dim_date] d 
    ON raw.Purchase_Date = d.Purchase_Date 
    AND raw.Ship_Date = d.Ship_Date
END;
