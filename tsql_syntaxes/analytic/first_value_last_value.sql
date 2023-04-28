/*
FIRST_VALUE ( [scalar_expression ] )  [ IGNORE NULLS | RESPECT NULLS ]
    OVER ( [ partition_by_clause ] order_by_clause [ rows_range_clause ] )

scalar_expression                       The value to be returned. 
                                        Scalar_expression can be a column, subquery, or other arbitrary expression that results in a single value. 
                                        Other analytic functions aren't permitted.

[ IGNORE NULLS | RESPECT NULLS ]		Applies to: SQL Server (starting with SQL Server 2022 (16.x)), Azure SQL Database, Azure SQL Managed Instance, Azure SQL Edge
            IGNORE NULLS                Ignore null values in the dataset when computing the first value over a partition.
            RESPECT NULLS               Respect null values in the dataset when computing first value over a partition.

OVER ( [ partition_by_clause ] order_by_clause [ rows_range_clause ] )
                                        The partition_by_clause divides the result set produced by the FROM clause into partitions to which the function is applied. If not specified, the function treats all rows of the query result set as a single group.
                                        The order_by_clause determines the logical order in which the operation is performed. The order_by_clause is required.
                                        The rows_range_clause further limits the rows within the partition by specifying start and end points.
*/

USE AdventureWorks2012;
GO
SELECT JobTitle, LastName, VacationHours,
       FIRST_VALUE(LastName) OVER (PARTITION BY JobTitle
                                   ORDER BY VacationHours ASC
                                   ROWS UNBOUNDED PRECEDING
                                  ) AS FewestVacationHours
FROM HumanResources.Employee AS e
INNER JOIN Person.Person AS p
    ON e.BusinessEntityID = p.BusinessEntityID
ORDER BY JobTitle;