SqlCmd -S .\SQLEXPRESS -U username -P password -Q "BACKUP DATABASE [database_name] TO DISK='SqlBackup__%date:~-4,4%_%date:~-10,2%_%date:~-7,2%__%time:~0,2%_%time:~3,2%_%time:~6,2%.bak'"