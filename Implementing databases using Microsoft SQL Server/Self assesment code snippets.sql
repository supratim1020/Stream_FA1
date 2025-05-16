-- Q1
SELECT NTILE(5, BookId), BookName, CopiesSold OVER (ORDER BY CopiesSold Desc) AS GroupNo FROM BookDetails
SELECT BookId, BookName, CopiesSold NTILE(5) OVER (ORDER BY CopiesSold Desc) AS GroupNo FROM BookDetails
SELECT NTILE(5) AS GroupNo, BookId, BookName, CopiesSold FROM BookDetails
SELECT BookId, BookName, CopiesSold NTILE(5) OVER CopiesSold AS GroupNo FROM BookDetails
GO

-- q4
CREATE PROCEDURE usp_ConcatenateWords  
(  
    @WordOne VARCHAR(10) = 'Hello ',  
    @WordTwo VARCHAR(10)  
)  
AS  
BEGIN  
    SELECT @WordOne + @WordTwo  
END

EXEC usp_ConcatenateWords 7, 'stars'

-- q5
CREATE PROCEDURE usp_ConcatenateNum  
(  
    @NumOne INT = 1,  
    @NumTwo INT,  
    @NumThree INT = NULL  
)  
AS  
BEGIN  
    SET CONCAT_NULL_YIELDS_NULL OFF  
    SELECT @NumOne + @NumTwo + @NumThree  
END

EXEC usp_ConcatenateNum 10, 2

-- q7
CREATE TABLE Employee  
(  
    EmployeeNumber INT PRIMARY KEY,  
    EmployeeName VARCHAR(20),  
    Salary SMALLMONEY,  
    Stream VARCHAR(20)  
)  
GO  

BEGIN TRAN  
    INSERT INTO Employee VALUES(1001, 'Sandra', 20000, 'MF')  
    BEGIN TRAN  
        INSERT INTO Employee VALUES(1002, 'Samantha', 20000, 'MS')  
        COMMIT  
ROLLBACK
GO

-- q8
DECLARE @Num1 INT = 4.76  
DECLARE @Num2 FLOAT = 5.03  
SELECT CAST(@Num1 AS FLOAT) + CONVERT(FLOAT, @Num2) AS ResultOne  

DECLARE @Num3 INT = '2.60'  
SELECT CONVERT(FLOAT, @Num2) + CAST(@Num3 AS FLOAT) AS ResultTwo  

-- q9
DECLARE @VariableDate DATE
SELECT @VariableDate = '4-APR-2008'
SELECT @VariableDate = DATEADD(MM, -1, @VariableDate)
SELECT DATEPART(MM, @VariableDate)

-- q10
CREATE TABLE Customers  
(  
    CustomerNumber INT IDENTITY(____, 1),  
    CustomerName VARCHAR(20)  
)  

INSERT INTO Customers VALUES('Tibco')  
SELECT * FROM Customers  

SET IDENTITY_INSERT Customers _____  

INSERT INTO Customers (CustomerNumber, CustomerName)  
VALUES (1005, 'Jack')  
GO

-- q11
CREATE FUNCTION ufn_ConcatenateWords(@WordOne CHAR, @WordTwo CHAR, @WordThree CHAR)  
RETURNS CHAR(3)  
AS  
BEGIN  
    RETURN @WordOne + @WordTwo + @WordThree  
END
GO

DECLARE @Ret VARCHAR(10)
EXEC @Ret = ufn_ConcatenateWords('3', '4', '5')
SELECT @Ret

SELECT dbo.ufn_ConcatenateWords('3', '4', '5')

SELECT dbo.ufn_ConcatenateWords(3, 4, 5)

DECLARE @Ret VARCHAR(10)
EXEC @Ret = ufn_ConcatenateWords '3', '4', '5' 
SELECT @Ret

DECLARE @Ret INT
EXEC @Ret = ufn_ConcatenateWords 3, 4, 5 
SELECT @Ret

DECLARE @Ret INT
EXEC @Ret = ufn_ConcatenateWords(3, 4, 5) 
SELECT @Ret

--q12
SELECT SalesmanId, SalesmanName, TotalSales, RANK() OVER (ORDER BY SalesmanId DESC) AS RANK FROM Salesmen
SELECT RANK(SalesmanId), SalesmanName, TotalSales FROM Salesmen
SELECT SalesmanId, SalesmanName, RANK(TotalSales) OVER (ORDER BY TotalSales) AS RANK FROM Salesmen
SELECT SalesmanId, SalesmanName, TotalSales, RANK() OVER (ORDER BY TotalSales DESC) AS RANK FROM Salesmen


-- q13
CREATE FUNCTION ufn_DeleteStudent(@StudentName VARCHAR(25))  
RETURNS INT  
AS  
BEGIN  
    DELETE FROM Students WHERE StudentName = @StudentName  
    RETURN 1  
END


-- q15
CREATE PROCEDURE usp_EmployeeDetails  
(  
    @EmployeeId INT  
)  
AS  
BEGIN  
    DECLARE @RetValue INT  
    BEGIN TRAN  
        BEGIN TRY  
            IF EXISTS (SELECT * FROM Employees WHERE EmployeeId = @EmployeeId)  
            BEGIN  
                DELETE FROM EmployeeSalaryDetails WHERE EmployeeId = @EmployeeId  
                SET @RetValue = 1  
                COMMIT  
            END  
            ELSE  
            BEGIN  
                ROLLBACK  
                SET @RetValue = -1  
            END  
            RETURN @RetValue  
        END TRY  
        BEGIN CATCH  
            ROLLBACK  
            RETURN -99  
        END CATCH  
END


DECLARE @ret INT  
EXEC @ret = usp_EmployeeDetails 1001  
SELECT @ret

-- q16
SELECT CAST(DAY('2016-09-08 15:02:44.870') AS VARCHAR(6)) + ' Planets of the Solar system'

-- q17
CREATE TABLE TableOne  
(  
    ColumnOne DECIMAL(3,1) IDENTITY,  
    ColumnTwo DECIMAL(3,0)  
)

CREATE TABLE TableTwo  
(  
    ColumnOne DECIMAL(3,1),  
    ColumnTwo DECIMAL(3,0) IDENTITY  
)

-- q18
CREATE PROCEDURE usp_UpdateCustomerDetails  
(  
    @CustomerId INT,  
    @BillAmount DECIMAL(15,2)  
)  
AS  
BEGIN  
    BEGIN TRAN  
        BEGIN TRY  
            IF EXISTS (SELECT * FROM Customers WHERE CustomerId = @CustomerId)  
            BEGIN  
                INSERT INTO BillPayment VALUES (@CustomerId, @BillAmount)  
                COMMIT  
            END  
            ELSE  
            BEGIN  
                ROLLBACK  
            END  

            DELETE FROM PendingBillDetails WHERE CustomerId = @CustomerId  
            ROLLBACK  
        END TRY  
        BEGIN CATCH  
            ROLLBACK  
        END CATCH  
END


EXEC usp_UpdateCustomerDetails 1001, 1500

-- Q19
SELECT EmployeeId, DENSE_RANK() OVER (ORDER BY Salary DESC) FROM Employee ORDER BY Salary

-- q21
SELECT TOP * StudentName FROM StudentsMarksDetails ORDER BY MarksScored
SELECT TOP 5 StudentName FROM StudentsMarksDetails ORDER BY MarksScored ASC
SELECT TOP 5 * FROM StudentsMarksDetails ORDER BY MarksScored DESC
SELECT TOP FIVE StudentName FROM StudentsMarksDetails ORDER BY MarksScored
SELECT TOP 5 StudentName FROM StudentsMarksDetails ORDER BY MarksScored DESC


-- q22
CREATE TABLE TableOne  
(  
    ColumnOne INT IDENTITY(100, -1),  
    ColumnTwo INT  
)

SET IDENTITY_INSERT TableOne OFF  
INSERT INTO TableOne VALUES (1)

SET IDENTITY_INSERT TableOne ON  
INSERT INTO TableOne (ColumnOne, ColumnTwo) VALUES (1, 2)


-- q23
CREATE FUNCTION ufn_FunctionOne(@NumOne VARCHAR(10), @NumTwo FLOAT)  
RETURNS INT  
AS  
BEGIN  
    DECLARE @Sum INT  
    SET @Sum = CAST(@NumOne AS INT) - CONVERT(INT, @NumTwo)  
    RETURN @Sum  
END

SELECT dbo.ufn_FunctionOne('100', 10.50)


-- q24
CREATE TABLE Employees  
(  
    EmployeeNumber TINYINT IDENTITY PRIMARY KEY,  
    EmployeeName VARCHAR(20)  
)

INSERT INTO Employees VALUES('Prem'), (NULL), ('John')

SET ANSI_NULLS ON  
SELECT COUNT(*) FROM Employees WHERE EmployeeName IS NULL  
SELECT COUNT(*) FROM Employees WHERE EmployeeName = NULL  
SET ANSI_NULLS OFF  


-- q25
CREATE TABLE Stream  
(  
    StreamId SMALLINT IDENTITY(10, -2),  
    StreamName VARCHAR(20)  
)

INSERT INTO Stream VALUES('MS')

SET IDENTITY_INSERT Stream ON  
INSERT INTO Stream(StreamId, StreamName) VALUES(0, 'MF')

SET IDENTITY_INSERT Stream OFF  
INSERT INTO Stream VALUES('BIM')  
GO
