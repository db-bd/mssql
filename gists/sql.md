## Port Check
```sql
USE MASTER
GO
xp_readerrorlog 0, 1, N'Server is listening on'
GO
```
