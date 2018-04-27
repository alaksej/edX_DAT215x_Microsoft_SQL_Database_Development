SELECT obj.name, phys.* FROM sys.dm_db_index_physical_stats(DB_ID(), NULL, NULL, NULL, 'LIMITED') as phys
JOIN sys.objects as obj on obj.object_id = phys.object_id
ORDER BY avg_fragmentation_in_percent DESC;

SELECT * FROM sys.dm_db_index_physical_stats(DB_ID(), NULL, NULL, NULL, 'SAMPLED') as phys
ORDER BY avg_fragmentation_in_percent DESC;


SELECT * FROM sys.dm_db_index_physical_stats(DB_ID(), NULL, NULL, NULL, 'DETAILED') as phys
ORDER BY avg_fragmentation_in_percent DESC;
