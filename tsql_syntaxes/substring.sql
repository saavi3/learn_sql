/*
SUBSTRING(string, start, length)

string	Required. The string to extract from
start	Required. The start position. The first position in string is 1
length	Required. The number of characters to extract. Must be a positive number
*/


IF OBJECT_Id('[dbo].[Department]', 'U') IS NOT NULL
DROP TABLE [dbo].[Department];
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Department]
(
    [Id] INT NULL,
    [Department] VARCHAR(50)  NULL
);

INSERT INTO [dbo].[Department]
( -- Columns to insert data into
 [Id], [Department]
)
VALUES
( 
 1, 'Finance-rtl'
),
(
 2, 'HumarResource-rtl'
),
( 
 3, 'Marketing-rtl'
),
( 
 4, 'Sales-rtl'
)

SELECT Id
	,Department
	,SUBSTRING([Department], 1, 7)
FROM [dbo].[Department]
