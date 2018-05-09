SELECT * FROM sys.views
SELECT * FROM sys.tables
SELECT * FROM sys.objects

SELECT * FROM INFORMATION_SCHEMA.TABLES

SELECT * FROM sys.dm_exec_connections
SELECT * FROM sys.dm_exec_sessions
SELECT * FROM sys.dm_exec_requests

SELECT TOP(20) qs.max_logical_reads,
			st.text FROM sys.dm_exec_query_stats AS qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) AS st
ORDER BY max_logical_reads DESC