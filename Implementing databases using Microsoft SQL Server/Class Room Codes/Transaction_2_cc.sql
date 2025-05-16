-- Transaction help us to achieve ACID
-- Atomicity: Each transaction considered as single unit. either none or all

-- Different Isolation levels in SQL Server
SELECT * INTO TempProducts FROM Products
SELECT * from TempProducts

-- Customer 1
BEGIN TRAN
    UPDATE TempProducts SET QuantityAvailable=QuantityAvailable+10 WHERE ProductId='P101'
ROLLBACK TRAN

-- REPEATABLE READ solves two problems DIRTY READ and NON-REPEATABLE READ(during reading data, data shouldn't be modified)
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ

BEGIN TRAN
    SELECT ProductId,QuantityAvailable FROM TempProducts WHERE ProductId='P101'
COMMIT TRAN

-- Phantom Read Problem
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRAN
    SELECT * FROM TempProducts WHERE ProductName LIKE 'B%'
COMMIT TRAN

-- Customer 2
--SELECT * FROM Products WHERE ProductId='P101'
-- Default Isolation level is READ COMMITED
-- Dirty Read: Reading uncommited data. Can be Solved by Setting Isolation level to READ COMMITED
-- SET TRANSACTION ISOLATION LEVEL READ COMMITTED
-- SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT * FROM TempProducts WHERE ProductId='P101'

UPDATE TempProducts SET QuantityAvailable=QuantityAvailable-10 WHERE ProductId='P101'

INSERT INTO TempProducts VALUES('P159','Book2',7,250,100)