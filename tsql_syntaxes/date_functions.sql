


/*
SQL Server High Precision Date and Time Functions have a scale of 7 and are:

SYSDATETIME – returns the date and time of the machine the SQL Server is running on
SYSDATETIMEOFFSET – returns the date and time of the machine the SQL Server is running on plus the offset from UTC
SYSUTCDATETIME - returns the date and time of the machine the SQL Server is running on as UTC
*/
SELECT SYSDATETIME()       AS 'DateAndTime';        -- return datetime2(7)  2023-02-01 21:49:42.8179330     
SELECT SYSDATETIMEOFFSET() AS 'DateAndTime+Offset'; -- datetimeoffset(7)	2023-02-01 21:49:42.8179330 +05:30
SELECT SYSUTCDATETIME()    AS 'DateAndTimeInUtc';   -- returns datetime2(7)	2023-02-01 16:19:42.8179330

/*
SQL Server Lesser Precision Data and Time Functions have a scale of 3 and are:

CURRENT_TIMESTAMP - returns the date and time of the machine the SQL Server is running on
GETDATE() - returns the date and time of the machine the SQL Server is running on
GETUTCDATE() - returns the date and time of the machine the SQL Server is running on as UTC
*/
SELECT CURRENT_TIMESTAMP AS 'DateAndTime'; --	2023-02-01 21:49:42.817 
SELECT GETDATE()         AS 'DateAndTime'; --	2023-02-01 21:49:42.817   
SELECT GETUTCDATE()      AS 'DateAndTimeUtc';--	2023-02-01 16:19:42.817 

/*
DATENAME – Returns a ***string*** corresponding to the datepart specified for the given date as shown in the following table
DATEPART – returns an ***integer*** corresponding to the datepart specified
*/
SELECT GETDATE()												-- 2023-02-01 21:57:05.583
SELECT DATENAME(YEAR, GETDATE())        AS 'Year';				-- 2023    
SELECT DATENAME(QUARTER, GETDATE())     AS 'Quarter';			-- 1
SELECT DATENAME(MONTH, GETDATE())       AS 'Month Name';		-- February   
SELECT DATENAME(DAYOFYEAR, GETDATE())   AS 'DayOfYear';			-- 32
SELECT DATENAME(DAY, GETDATE())         AS 'Day';				-- 1
SELECT DATENAME(WEEK, GETDATE())        AS 'Week';				-- 5
SELECT DATENAME(WEEKDAY, GETDATE())     AS 'Day of the Week';	-- Wednesday    
SELECT DATENAME(HOUR, GETDATE())        AS 'Hour';				-- 21
SELECT DATENAME(MINUTE, GETDATE())      AS 'Minute';			-- 57
SELECT DATENAME(SECOND, GETDATE())      AS 'Second';			-- 5
SELECT DATENAME(MILLISECOND, GETDATE()) AS 'MilliSecond';		-- 583
SELECT DATENAME(MICROSECOND, GETDATE()) AS 'MicroSecond';		-- 583333
SELECT DATENAME(NANOSECOND, GETDATE())  AS 'NanoSecond';		-- 583333333
SELECT DATENAME(ISO_WEEK, GETDATE())    AS 'Week';				-- 5

/*
DAY – returns an integer corresponding to the day specified
MONTH– returns an integer corresponding to the month specified
YEAR– returns an integer corresponding to the year specified
*/
SELECT DAY(GETDATE())   AS 'Day';                            
SELECT MONTH(GETDATE()) AS 'Month';                       
SELECT YEAR(GETDATE())  AS 'Year';

/*
DATEDIFF - returns the number of date or time datepart boundaries crossed between specified dates as an int
DATEDIFF_BIG - returns the number of date or time datepart boundaries crossed between specified dates as a bigint

DATEDIFF(datepart, startdate, enddate)

datepart - MICROSECOND, SECOND, MINUTE, HOUR, DAY, WEEK, MONTH, QUARTER, YEAR
*/
SELECT DATEDIFF(DAY, 2019-31-01, 2019-01-01)      AS 'DateDif'    -- returns int	--30
SELECT DATEDIFF_BIG(DAY, 2019-31-01, 2019-01-01)  AS 'DateDifBig' -- returns bigint --30


/*
DATEADD - returns datepart with added interval as a datetime
EOMONTH – returns last day of month of offset as type of start_date
SWITCHOFFSET - returns date and time offset and time zone offset
TODATETIMEOFFSET - returns date and time with time zone offset
*/
SELECT GETDATE()                                                -- 2023-02-01 22:01:18.723
SELECT DATEADD(DAY,1,GETDATE())        AS 'DatePlus1';          -- 2023-02-02 22:01:18.723 
SELECT EOMONTH(GETDATE(),1)            AS 'LastDayOfNextMonth'; -- 2023-03-31
SELECT SWITCHOFFSET(GETDATE(), -6)     AS 'NowMinus6';          -- 2023-02-01 21:55:18.723 -00:06
SELECT TODATETIMEOFFSET(GETDATE(), -2) AS 'Offset';             -- 2023-02-01 22:01:18.723 -00:02

/*
ISDATE – returns int - Returns 1 if a valid datetime type and 0 if not
*/
SELECT ISDATE(GETDATE()) AS 'IsDate'; 
SELECT ISDATE(NULL) AS 'IsDate';

/*
CONVERT – returns int - Returns 1 if a valid datetime type and 0 if not
*/
SELECT CONVERT(date, GETDATE());   --2023-03-20
SELECT CAST(GETDATE() AS DATE);	   --2023-03-20