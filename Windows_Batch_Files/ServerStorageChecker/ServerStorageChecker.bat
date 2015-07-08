FOR /F %%A IN (servers.txt) DO (WMIC /Node:%%A LogicalDisk Where DriveType="3" Get DeviceID,FileSystem,FreeSpace,Size /Format:csv | MORE /E +2 >> SRVSPACE.CSV)

pause