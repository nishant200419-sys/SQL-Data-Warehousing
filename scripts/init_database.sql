/*=====================================================================================================================================================================
                                                                   CREATE DATABASE AND SCHEMAS
=======================================================================================================================================================================

SCRIPT PURPOSE: This script is designed to reset and initialize a Data Warehouse environment. It first checks
if the DataWarehouse database already exists and safely deletes it by removing all active connections.
It then creates a fresh database and sets up a structured schema architecture (Bronze, Silver, Gold) to support organized data processing and analytics.

WARNING: This script permanently deletes the DataWarehouse database, including all its tables and data.
It also forcefully disconnects all active users using WITH ROLLBACK IMMEDIATE, which can terminate running 
queries without saving progress. Use this only in development or testing environments—never on a production database
unless you are absolutely sure and have proper backups.*/
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
USE master;
  --Switches to the main system database in SQL Server (needed before creating a new DB).

CREATE DATABASE DataWarehouse;
  --Creates a new database called DataWarehouse.

IF EXISTS (SELECT 1 FROM sys.databases WHERE NAME= 'DataWarehouse')
  --Checks if a database named DataWarehouse already exists.
  BEGIN
  --Starts the block of code to run if condition is true.
  
ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    /*Forces database into single-user mode
    Only one connection allowed 
    WITH ROLLBACK IMMEDIATE
      -Instantly kicks out all users.
      -Cancels running queries. */ 

DROP DATABASE DataWarehouse;
  --Deletes the database completely.

END;
  --Ends the block
GO
 
USE DataWarehouse;
GO
  /*witches into your new database.
  GO acts as a batch seperator*/

CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
  /*Creates 3 layers:
  bronze → raw data
  silver → cleaned data
  gold → final analytics-ready data*/
