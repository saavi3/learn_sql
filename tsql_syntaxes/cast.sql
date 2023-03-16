/*
CAST(expression AS datatype(length))

expression	Required. The value to convert
start		Required. The datatype to convert expression to. 
			Can be one of the following: bigint, int, smallint, tinyint, 
			bit, decimal, numeric, money, smallmoney, float, real, datetime, 
			smalldatetime, char, varchar, text, nchar, nvarchar, 
			ntext, binary, varbinary, or image
length		Optional. The length of the resulting data type (for char, varchar, nchar, nvarchar, binary and varbinary)
*/

SELECT CAST(25.65 AS INT);

SELECT CAST(12 AS DECIMAL(7,2));

SELECT CAST(25.65 AS VARCHAR);

SELECT CAST('2017-08-25' AS DATETIME);