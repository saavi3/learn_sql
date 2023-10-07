SELECT login_name [Login] , host_name, program_name, MAX(login_time) AS [Last Login Time]
FROM sys.dm_exec_sessions
GROUP BY login_name,host_name, program_name;