CREATE OR REPLACE DATABASE SNOWPIPE;

-- create integration object that contains the access information
CREATE OR REPLACE STORAGE INTEGRATION azure_snowpipe_integration
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = AZURE
  ENABLED = TRUE
  AZURE_TENANT_ID =  '8a183d10-0ef5-42c2-8d0a-cf0912a7cc86'
  STORAGE_ALLOWED_LOCATIONS = ('azure://introtoadf53.blob.core.windows.net/csv');

  
  
-- Describe integration object to provide access
DESC STORAGE integration azure_snowpipe_integration;

---- Create file format & stage objects ----

-- create file format

create or replace file format snowpipe.public.fileformat_azure
    TYPE = CSV
    FIELD_DELIMITER = ','
    SKIP_HEADER = 1;

-- create stage object
create or replace stage snowpipe.public.stage_azure
    STORAGE_INTEGRATION = azure_snowpipe_integration
    URL = 'azure://introtoadf53.blob.core.windows.net/csv'
    FILE_FORMAT = fileformat_azure;
    

-- list files
LIST @snowpipe.public.stage_azure;

