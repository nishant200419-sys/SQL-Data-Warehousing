/*
======================================================================================================
DDL Script: Create Bronze Tables
======================================================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping mentioned tables if they already exist and
    create/re-create them.
    Run this script to redefine the DDL structure of the bronze tables.
========================================================================================================
*/.

IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL
	DROP TABLE bronze.crm_cust_info;
GO

CREATE TABLE bronze.crm_cust_info( 
	cst_id INT,
	cst_key NVARCHAR (50),
	cst_firtsname NVARCHAR (50),
	cst_lastname NVARCHAR (50),
	cst_material_status NVARCHAR (50),
	cst_gndr NVARCHAR (50),
	cst_create_date DATE
);
--------------------------------------------------------------------

IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
	DROP TABLE bronze.crm_prd_info;
GO

CREATE TABLE bronze.crm_prd_info(
	prd_cost INT,
	prd_id INT,
	prd_key NVARCHAR (50),
	prd_nm NVARCHAR (50),
	prd_line NVARCHAR (50),
	prd_start_dt DATE,
	prd_end_dt DATE
	);
----------------------------------------------------------------------

IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
	DROP TABLE bronze.crm_sales_details;
GO

CREATE TABLE bronze.crm_sales_details (
	sls_ord_num NVARCHAR (50),
	sls_prd_key NVARCHAR (50),
	sls_cust_id INT,
	sls_order_dt INT,
	sls_ship_dt INT,
	sls_due_dt INT,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT
	);
----------------------------------------------------------------------

IF OBJECT_ID('bronze.erp_cust_az12', 'U') IS NOT NULL
	DROP TABLE bronze.erp_cust_az12;
GO

CREATE TABLE bronze.erp_cust_az12 (
	cst_id NVARCHAR (50),
	cst_birthday DATE,
	cst_gndr NVARCHAR (50)
);
----------------------------------------------------------------------

IF OBJECT_ID('bronze.erp_cust_loc', 'U') IS NOT NULL
	DROP TABLE bronze.erp_cust_loc;
GO

CREATE TABLE bronze.erp_cust_loc(
   cst_id NVARCHAR (50),
   cst_country NVARCHAR (50)
);

----------------------------------------------------------------------

IF OBJECT_ID('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
	DROP TABLE bronze.erp_px_cat_g1v2;
GO

CREATE TABLE bronze.erp_px_cat_g1v2 (
  prd_id NVARCHAR (50),
  prd_cat NVARCHAR (50),
  prd_subcat NVARCHAR (50),
  prd_mntnc NVARCHAR (50)
);
