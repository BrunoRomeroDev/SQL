-- View backup history
SELECT 
	bs.media_set_id,
	bs.backup_finish_date,
	bs.type,
	bs.backup_size,
	bs.compressed_backup_size,
	mf.physical_device_name
FROM msdb.dbo.backupset AS bs
INNER JOIN msdb.dbo.backupmediafamily AS mf
ON bs.media_set_id = mf.media_set_id	
WHERE database_name = 'TESTE'
ORDER BY backup_finish_date DESC;
GO
