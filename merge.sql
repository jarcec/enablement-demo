MERGE INTO STREAMSETS_TRANSFORMER_TEAM.JARCEC_ANALYTICS_SCHEMA.JIRA_ISSUES AS dest
    USING STREAMSETS_TRANSFORMER_TEAM.JARCEC_STAGING_SCHEMA.JIRA_ISSUES AS source
    ON source.key = dest.key
    WHEN MATCHED THEN 
        UPDATE SET 
          dest.project = source.project,
          dest.status = source.status,
          dest.priority = source.priority
    WHEN NOT MATCHED THEN
        INSERT(key, project, status, priority)
        VALUES(source.key, source.project, source.status, source. priority)
        
