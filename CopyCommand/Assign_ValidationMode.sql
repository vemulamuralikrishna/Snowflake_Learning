CREATE OR REPLACE TABLE employees
(
    customer_id int,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    age int,
    department varchar(50)
);

CREATE OR REPLACE STAGE aws_stage_copy_assignment
url = 's3://snowflake-assignments-mc/copyoptions/example1';

LIST @aws_stage_copy_assignment;

CREATE OR REPLACE FILE FORMAT my_csv_format
TYPE = CSV
FIELD_DELIMITER=','
SKIP_HEADER=1;

COPY INTO employees
FROM @aws_stage_copy_assignment
FILE_FORMAT = (FORMAT_NAME = my_csv_format)
validation_mode=return_errors;

COPY INTO employees
FROM @aws_stage_copy_assignment
FILE_FORMAT = (FORMAT_NAME = my_csv_format)
ON_ERROR = CONTINUE;