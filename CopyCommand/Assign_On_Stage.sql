CREATE OR REPLACE TABLE customer  (
ID INT,
first_name varchar,
last_name varchar,
email varchar,
age int,
city varchar);

SELECT * FROM CUSTOMER;

-- s3://snowflake-assignments-mc/loadingdata/
-- Create a stage object
CREATE OR REPLACE STAGE aws_stage_assignment
 url='s3://snowflake-assignments-mc/loadingdata/';

-- List the files in the stage
 LIST @aws_stage_assignment;

 CREATE OR REPLACE FILE FORMAT my_semicolon_format
 TYPE = 'CSV'
 FIELD_DELIMITER = ';'
 SKIP_HEADER = 1;


SELECT $1,$2,$3,$4
FROM @aws_stage_assignment/customers2.csv
(file_format = my_semicolon_format);






-- Load the data in the existing customers table using the COPY command
 COPY INTO customer
 FROM @aws_stage_assignment
 file_format = my_semicolon_format;

SELECT * FROM customer;
