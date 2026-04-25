💻 PC Sales Data Engineering Project
Welcome to the PC Sales Data Warehouse repository. This project transforms raw, chaotic computer retail data into a high-performance, automated Star Schema within SQL Server. It’s built for speed, data integrity, and enterprise-grade security.

🏗️ The Architecture
This platform follows a classic two-tier architecture designed for scalability:

Staging Layer : The landing zone. Pure, untouched CSV data ingestion.

Data Warehouse Layer : The engine room. A fully normalized Star Schema optimized for heavy-duty analytics.

🌟 The Data Model (Star Schema)
At the heart of the project is a central Fact Table surrounded by 9 Dimension Tables, enabling lightning-fast queries.

The Fact Table
fact_pc_sales: Tracks 17+ metrics including:

Financials: Sale Price, Cost Price, Finance Amount, and Repair Costs.

Performance: Total Sales per Employee and Discount Impacts.

The Dimensions
📍 Location: Geography from Continent down to City.

💻 Product: Detailed hardware specs (RAM, Storage, Model).

👥 Customer & Sales: Full contact details and department tracking.

💳 Context: Payment methods, sales channels, and shipping dates

⚙️ Automation & ETL
No manual BULK INSERT here. The pipeline is fully automated and Idempotent (safe to run multiple times without breaking things).

Cleanup: Pre-load scripts clear existing data and reset identity seeds.

Dim Load: Parameterized Stored Procedures populate dimensions with DISTINCT records.

Fact Load: A complex multi-join procedure maps raw text to surrogate IDs to build the fact table.

🔐 Security & Governance
We implement Role-Based Access Control (RBAC) to keep data in the right hands:RolePermissionsUse CaseAdminFull ControlManaging schema and ETL.AnalystRead-only (Warehouse)Building dashboards and views.SalespersonRow-Level SecurityCan only see their own customer history.

📈 Analytical Insights
The project includes pre-built views to answer critical business questions:

💰 Store Profitability: Sale Price - Cost - Repairs.

🔥 Hardware Popularity: Which RAM/Storage combos are flying off the shelves?

🚩 Credit Risk: Correlating credit scores with financing and payment methods.

🚀 How to Run
Execute 01_staging_tables.sql to build the structure.

Deploy the stored procedures from 02_stored_procedures.sql.

Run the Master Load Procedure to watch your data transform!