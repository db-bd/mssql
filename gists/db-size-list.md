### List out MSSQL Databases Size in Descending Order
```sql
with fs
as
(
    select database_id, type, size * 8.0 / 1024 size
    from sys.master_files
)
select 
    name,
    (select sum(size) from fs where type = 0 and fs.database_id = db.database_id) DataFileSizeMB,
    (select sum(size) from fs where type = 1 and fs.database_id = db.database_id) LogFileSizeMB
from sys.databases db order by DataFileSizeMB desc
```

### List out MSSQL Databases Size in MB
```sql
SELECT
    DB_NAME(db.database_id) DatabaseName,
    (CAST(mfrows.RowSize AS FLOAT)*8)/1024 RowSizeMB,
    (CAST(mflog.LogSize AS FLOAT)*8)/1024 LogSizeMB,
    (CAST(mfstream.StreamSize AS FLOAT)*8)/1024 StreamSizeMB,
    (CAST(mftext.TextIndexSize AS FLOAT)*8)/1024 TextIndexSizeMB
FROM sys.databases db
    LEFT JOIN (SELECT database_id, SUM(size) RowSize FROM sys.master_files WHERE type = 0 GROUP BY database_id, type) mfrows ON mfrows.database_id = db.database_id
    LEFT JOIN (SELECT database_id, SUM(size) LogSize FROM sys.master_files WHERE type = 1 GROUP BY database_id, type) mflog ON mflog.database_id = db.database_id
    LEFT JOIN (SELECT database_id, SUM(size) StreamSize FROM sys.master_files WHERE type = 2 GROUP BY database_id, type) mfstream ON mfstream.database_id = db.database_id
    LEFT JOIN (SELECT database_id, SUM(size) TextIndexSize FROM sys.master_files WHERE type = 4 GROUP BY database_id, type) mftext ON mftext.database_id = db.database_id
```

### List out MSSQL Databases File Size
```sql
SELECT
    D.name,
    F.Name AS FileType,
    F.physical_name AS PhysicalFile,
    F.state_desc AS OnlineStatus,
    CAST((F.size*8)/1024 AS VARCHAR(26)) + ' MB' AS FileSize,
    CAST(F.size*8 AS VARCHAR(32)) + ' Bytes' as SizeInBytes
FROM 
    sys.master_files F
    INNER JOIN sys.databases D ON D.database_id = F.database_id
ORDER BY
    D.name
```
