
USE DATABASE DEMO_DB;
-- create integration object that contains the access information
CREATE STORAGE INTEGRATION azure_integration
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = AZURE
  ENABLED = TRUE
  AZURE_TENANT_ID = '8a183d10-0ef5-42c2-8d0a-cf0912a7cc86'
  STORAGE_ALLOWED_LOCATIONS = ('azure://introtoadf53.blob.core.windows.net/csv', 'azure://introtoadf53.blob.core.windows.net/json');

  
-- Describe integration object to provide access
DESC STORAGE integration azure_integration;