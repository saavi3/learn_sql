----IF TEMPORARY TABLE IS LOCAL USE # ELSE USE ## INFORNT OF THE TABLE NAMES

DROP TABLE IF EXISTS #SalaryDetail
CREATE TABLE #SalaryDetail
(
            EmpId INT IDENTITY(1,1) NOT NULL,
            Empcode VARCHAR(10),
            Name VARCHAR(50),
            Salary MONEY
)

IF OBJECT_ID(N'tempdb..#SalaryDetail') IS NOT NULL
BEGIN
    DROP TABLE #SalaryDetail
END

IF EXISTS (SELECT NAME FROM SYS.tables WHERE NAME LIKE '#SalaryDetail')
BEGIN
    DROP TABLE #SalaryDetail
END
