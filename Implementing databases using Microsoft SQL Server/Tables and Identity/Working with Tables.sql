create database QuickKart

CREATE TABLE CardDetails(
	-- It is always a good practice to specify coulmn name within square brackets []. That is because there could be some column names which are also keywords in Microsoft SQL Server. So, just to seperate them you should give a square bracket for every column.
	[CardNumber] NUMERIC(16) CONSTRAINT pk_CardNumber PRIMARY KEY,
	-- Since a majority of the columns are actually be mendatory or NOT NULL, it's not necessary to provide names to NOT NULL Constraints. We can provide it but it's not necessary. But for all the other constraints it's always good to give a constraint name.
	[NameOnCard] VARCHAR(40) NOT NULL,
	[CardType] CHAR(6) CONSTRAINT chk_CardType CHECK(CardType IN('V','M','A')) NOT NULL,
	[CVVNumber] NUMERIC(3) NOT NULL,
	-- GETDATE() in SQL Server used to fetch current date and time.
	[ExpiryDate] DATE CONSTRAINT chk_ExpiryDate CHECK([ExpiryDate]>=GETDATE()) NOT NULL,
	[Balance] DECIMAL(10,2) CONSTRAINT chk_Balance CHECK([Balance]>=0)
)
GO
/*
Please note that, In SQL Server you can execute  multiple Transact SQL Statements together.

What is Transact SQL(T-SQL)?
Now this is the syntax that is we mainly use in SQL Server.
Now This is an extension to standard SQL statements to include procedural programming. Beacuse you know that SQL can be used for writting queries like DDL and DML statements. To expand the functionality of sql we have in case of Microsoft SQL Server this Transact SQL Synatax.
So, in case of SQL Server we can execute multiple SQL Statements together.
Now 'GO' isn't a Transact SQL statement but it is actually a command which is recognized by SQL Server and whenever it finds 'GO' command, it understands that this is the end of a batch, and then it sends all the statements from the prvious 'GO' to current 'GO' for execution to SQL Server Instance.
So, in simple words 'GO' signals the end of a batch of transact SQL statements and it sends all the statements at once for execution to the SQL Server Instance.
*/



-- Insert records to the CardDetails Table
INSERT INTO CardDetails(CardNumber,NameOnCard,CardType,CVVNumber,ExpiryDate,Balance) 
VALUES(1146665296881890,'Manuel','M',137,'2025-03-18',7282.00) 

INSERT INTO CardDetails(CardNumber,NameOnCard,CardType,CVVNumber,ExpiryDate,Balance) 
VALUES(1164283045453550,'Renate Messner','V',133,'2028-01-08',14538.00) 

INSERT INTO CardDetails(CardNumber,NameOnCard,CardType,CVVNumber,ExpiryDate,Balance) 
VALUES(1164916976389880,'Rita','M',588,'2025-07-28',18570.00) 

INSERT CardDetails(CardNumber,NameOnCard,CardType,CVVNumber,ExpiryDate,Balance) 
VALUES (1172583365804160,'McKenna','V',777,'2028-04-05',7972.00), 
       (1190676541467400, 'Brown','V',390,'2029-09-10',9049.00), 
       (1201253053391160, 'Patricia','M',501,'2029-06-24',19092.00)


SELECT * FROM CardDetails