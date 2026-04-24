SELECT * FROM JSON_RAW;
SELECT
    RAW:first_name::STRING AS firstName,
    RAW:last_name::STRING AS lastName,
    RAW:Skills::STRING as Skill
FROM JSON_RAW;

CREATE OR REPLACE TABLE JSON_tbl
AS
SELECT 
    RAW:first_name::STRING AS firstName,
    RAW:last_name::STRING AS lastName,
    RAW:Skills[0]::STRING as Skill1,
    RAW:Skills[1]::STRING as Skill2
FROM JSON_RAW;

SELECT * FROM JSON_tbl
WHERE FIRSTNAME = 'Florina';