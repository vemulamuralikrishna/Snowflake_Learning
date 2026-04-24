CREATE OR REPLACE stage JSONSTAGE
     url=  's3://snowflake-assignments-mc/unstructureddata/';

CREATE OR REPLACE file format JSONFORMAT
    TYPE = JSON;

CREATE OR REPLACE table PUBLIC.JSON_RAW (
    raw variant); 

list @JSONSTAGE;

COPY INTO JSON_RAW 
    FROM @JSONSTAGE
    file_format= JSONFORMAT
    files = ('Jobskills.json');

SELECT * FROM JSON_RAW;