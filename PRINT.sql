PRINT N'Esta mensagem Foi impressa em: '  
    + RTRIM(CAST(GETDATE() AS NVARCHAR(30)))  
    + N'.';  
GO  
-- This example shows building the message text  
-- in a variable and then passing it to PRINT.  
-- This was required in SQL Server 7.0 or earlier.  
DECLARE @PrintMessage NVARCHAR(50);  
SET @PrintMessage = N'Esta mensagem Foi impressa em: '  
    + RTRIM(CAST(GETDATE() AS NVARCHAR(30)))  
    + N'.';  
PRINT @PrintMessage;  
GO 

