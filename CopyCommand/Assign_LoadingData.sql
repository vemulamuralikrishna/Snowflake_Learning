CREATE OR REPLACE TABLE employees 
(
customer_id int,
first_name varchar(50),
last_name varchar(50),
email varchar(50),
age int,
department varchar(50)
);

CREATE OR REPLACE STAGE aws_stage_assignment
url = 's3://snowflake-assignments-mc/copyoptions/example2';

LIST @aws_stage_assignment;

CREATE OR REPLACE FILE FORMAT my_comma
TYPE = CSV
FIELD_DELIMITER=','
SKIP_HEADER=1;

COPY INTO employees
FROM @aws_stage_assignment
file_format = (format_name = my_comma)
RETURN_FAILED_ONLY = TRUE;

COPY INTO employees
FROM @aws_stage_assignment
file_format = (format_name = my_comma)
ON_ERROR = CONTINUE
RETURN_FAILED_ONLY = TRUE
TRUNCATECOLUMNS = true;