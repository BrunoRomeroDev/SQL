SELECT getdate(), @@servername,  db_name(db_id()), object_name(B.Object_id), B.Name,  avg_fragmentation_in_percent,page_Count,fill_factor
FROM sys.dm_db_index_physical_stats(db_id(),null,null,null,null) A
join sys.indexes B on A.object_id = B.Object_id and A.index_id = B.index_id
ORDER BY object_name(B.Object_id), B.index_id