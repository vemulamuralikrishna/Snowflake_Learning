USE ROLE ACCOUNTDMIN;
USE DATABASE DEMO_DB;
USE WAREHOUSE COMPUTE_WH;
 
CREATE OR REPLACE TABLE DEMO_DB.PUBLIC.PART
AS
SELECT * FROM "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."PART";
 
SELECT * FROM PART
ORDER BY P_MFGR DESC;

-- Update the TABLE

UPDATE DEMO_DB.PUBLIC.PART
SET P_MFGR='Manufacturer#CompanyX'
WHERE P_MFGR='Manufacturer#5';
 
----> Note down query id here: 01c360ba-0001-9832-000d-d87a000af7c2 120072
 
SELECT * FROM PART WHERE P_MFGR='Manufacturer#5'
ORDER BY P_MFGR DESC;

-- Travel back using the offset until you get the result of before the update
SELECT * FROM PART at (OFFSET => -60*3);

--Travel back using the query id to get the result before the update 

SELECT * FROM PART before (statement => '01c360ba-0001-9832-000d-d87a000af7c2');