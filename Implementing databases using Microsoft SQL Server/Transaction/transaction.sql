/*
There were three statements, there are two update statements. One for deducting the total amount from the card details table and the other update statement was to update the quantity available in the product table. And then there was an insert statement to insert the purchase details.
*/

/*
Now by any chance if the insert statement fails due to any error, then ideally the two update statements should also not be executed because obviously the purchase details are not stored or inserted, then the total amount should not be deducted. Neither the quantity should get updated. But in the current batch that has been demonstrated, even if the insert statement fails, then also the update statements get executed, meaning that the total amount gets deducted, the quantity gets updated even if the purchase is not successful. And hence the database is left in an inconsistent state.
*/

/*
So in this case, either all the operations should be successful or unsuccessful, there cannot be a state where some of the operations were successful. So if any of the operation fails, even all the other successful operations should be under. For example, in the case of the batch for purchasing the product, if the insert statement fails, then the remaining statements that were the update statements should also be undone. This can be done with the help of transactions in SQL server, transaction groups, one or more SQL statements into a single execution unit. 
*/

/*
As you all know, a transaction is used to make sure that if you have a group of statements which are executing together, either all should be executed successfully or none of them should be successful or even if some statements are successful and some are unsuccessful, the successful statements also should be undone. 
*/

BEGIN TRAN
    SELECT @@TRANCOUNT    -- 1 -> global variable -> the number of active transaction present in the given connection
-- So now since I have started one transaction and then I'm selecting at a transaction, the value of transaction should be one.

/*
Now in case of transaction, as you know, either all the statements should be successfully executed else, none of the statements should be successfully executed. 
When all the statements are successfully executed, the changes done in the database should be permanently saved. So for that, we make use of COMMIT statement. 
*/
BEGIN TRAN
    SELECT @@TRANCOUNT
COMMIT TRAN
SELECT @@TRANCOUNT -- 0
-- The COMMIT statement also decreament the value of @@TRANCOUNT by 1.

/*
Now, If you remember I mentioned just before a minute or two minutes that COMMIT is used for permanently saving the changes in the database. 
But that happens only when the transco value is being decremented from 1 to 0.

We'll see a demonstration with nested transactions. That means when you have multiple transactions running. And that is when I'll also explain to you that when does commit actually save the changes in the database.
*/

-- What if we have Nested Transaction
BEGIN TRAN
	BEGIN TRAN
    	SELECT @@TRANCOUNT
	COMMIT TRAN
		SELECT @@TRANCOUNT
COMMIT TRAN
SELECT @@TRANCOUNT
/*
So you have already noticed that commit ran every time decrements, the value of trans count. But I had also said that yes, commit is used for permanently saving the changes in the database. 

But that is applicable only when the TRANCOUNT value is being changed from 1 to 0. Or in other words, commit ran will permanently save the changes in the database only when you are committing the outermost transaction. If you are just committing the inner transactions, in that case, it will just decrement the value of TRANCOUNT. Whereas in case of outermost transaction, when you are committing the outermost transaction, it decrements the value of TRANCOUNT and obviously, the TRANCOUNT value would be decremented to zero because that's the outermost transaction and it also permanently saves the changes in the database.
*/




/*
Inside this begin, I'll actually have insert update, delete statements. Now consider inside some transactions, some statements are successful and some statements, not in that case, I have to also undo the changes done by the statements which are executed successfully. So for undoing changes, we have a statement known as ROLLBACK. 
*/
BEGIN TRAN
	BEGIN TRAN
    	SELECT @@TRANCOUNT		-- 2
	ROLLBACK TRAN
		SELECT @@TRANCOUNT		-- 0 (In case of COMMIT, it would be 1)
/*
Now please do note that as soon as you specify a rollback statement in case of a transaction, it rolls back all the changes done in those transactions. It does not depend on whether you are rolling back an inner transaction or outer transaction. 

Actually in SQL server, as soon as you say, ROLLBACK TRAN, it rolls back all the active transactions. 

And that is why @@TRANCOUNT value reset to 0.
So in SQL Server ROLLBACK Statement will undo all the changes that are done in that transaction and will reset the value of TRANCOUNT to 0.
*/


-- After this if we trying to COMMIT transaction once again:
COMMIT TRAN
/*
It says:
Msg 3902, Level 16, State 1, Line 74
The COMMIT TRANSACTION request has no corresponding BEGIN TRANSACTION.

Because both of the transaction already been completed. So, there is no transaction which has to be commited.
*/

-- Or even we write ROLLBACK 
ROLLBACK TRAN
/*
Msg 3903, Level 16, State 1, Line 84
The ROLLBACK TRANSACTION request has no corresponding BEGIN TRANSACTION.

Because of this ROLLBACK TRAN, because there is no active transaction now it gives an error message. A similar error message we have recieved when we had done COMMIT TRAN after ROLLBACK TRAN
*/

-- And for this final TRANCOUNT, again the TRANCOUNT value displayed as 0.
SELECT @@TRANCOUNT	-- 0


-- So far we have seen that:
BEGIN TRAN
	BEGIN TRAN
		SELECT @@TRANCOUNT	-- gives 2
	ROLLBACK TRAN
	SELECT @@TRANCOUNT	-- gives 0
ROLLBACK TRAN	-- error (no active transaction)
SELECT @@TRANCOUNT	-- again dispalyed as 0




/*
BEGIN TRAN
	BEGIN TRAN
		SELECT @@TRANCOUNT
	COMMIT TRAN
	SELECT @@TRANCOUNT
COMMIT TRAN <-- all changes are saved
ROLLBACK TRAN

After commiting a transaction, when all changes will be permenantly saved into the database. Because the TRANCOUNT value at this point will change from 1 to 0.

Now, after this I try to ROLLBACK a transaction let's see what happens?
*/
BEGIN TRAN
	BEGIN TRAN
		SELECT @@TRANCOUNT	-- 2
	COMMIT TRAN
	SELECT @@TRANCOUNT	-- 1
COMMIT TRAN
SELECT @@TRANCOUNT	-- 0
ROLLBACK TRAN		--> error message
SELECT @@TRANCOUNT	-- final TRANCOUNT=0
/*
Because of this ROLLBACK TRAN we have got an error message, because there is no active transaction. And the final TRANCOUNT will also be 0.

Msg 3903, Level 16, State 1, Line 128
The ROLLBACK TRANSACTION request has no corresponding BEGIN TRANSACTION.
*/

/*
So please note that, once the changes have been commited to the database, you can't ROLLBACK. 
And once you have ROLLBACK, you can't COMMIT.

But the main difference over here is, whenever you specify COMMIT transaction, the first thing that SQL server would do is it would decreament the value of TRANCOUNT by 1.
Now if SQL server sees that, the TRANCOUNT value has been decreamented from 1 to 0. That is when also save all the changes permenantly in the database.

But in case of ROLLBACK, as soon the ROLLBACK statement is executed, all the changes done to the database will be undone and the TRANCOUNT value will be reset to 0.
*/


-- ********** Savepoint **********
/*
So based on the discussion that we had till now, it means that, in case of SQL server, if we have to undo some operation, I have to undo the operations for all the transactions. When I say all the transaction, it means inner, outer all the transactions.

But what if you have a scenario, where you want to partially undo some transaction. That means you want to undo only some operations. So for that SQl server provides us with Savepoint.
*/

/*
SQL server provide us with savepoint which are used to ROLLBACK transactions to a specific point instead of the entire transaction.
*/
BEGIN TRAN
	BEGIN TRAN
		SAVE TRAN S1 --> This means I'm creating a savepoint with the name S1
		SELECT @@TRANCOUNT	-- value is still 2
		/* 
		That means SAVE TRAN hasn't affected the value of TRANCOUNT.

		Creating a savepoint doesn't affect the value of TRANCOUNT.
		*/

	-- let me suppose give a COMMIT statement.
	COMMIT TRAN
	SELECT @@TRANCOUNT	-- 1 (because COMMIT statement has decreamented the value of TRANCOUNT by 1)
	-- In 1st step, execute till here ------->
	
	-- Now, instead of rolling back the entire transaction, let me ROLLBACK till the safe point
	ROLLBACK TRAN S1
	SELECT @@TRANCOUNT		-- 1
	-- In 2nd step, execute till here ------->
	/*
	Now if we execute these two statements, the value of TRANCOUNT is still 1 and it hasn't changed. 
	Now if remember previously, as soon as you execute ROLLBACK TRAN statement the TRANCOUNT value reset to 0. But in this case, it is the same TRANCOUNT value. It hasn't been changed.
		
	So please do note, whenever you rollback to a savepoint, the TRANCOUNT value doesn't get affected. So, while creating a savepoint also the TRANCOUNT value doesn't get affected. Also When you ROLLBACK to a savepoint the TRANCOUNT value doesn't get affected.

	But what does this 'ROLLBACK TRAN S1' do?
	This actually rolls back all the statements present after the savepoint(SAVE TRAN S1) till the ROLLBACK statement(ROLLBACK TRAN S1).
	So that means all the statement written after this savepoint(SAVE TRAN S1) till this ROLLBACK point(ROLLBACK TRAN S1) gets ROLLBACK but doesn't affect the TRANCOUNT value.
	And that is how we can partially undo some operations in case of SQL server transactions.
	*/

-- After this if we execute ROLLBACK TRAN and fetch the value of TRANCOUNT
ROLLBACK TRAN
SELECT @@TRANCOUNT	-- 0
-- You can see that the value of TRANCOUNT value is zero. Because, as soon as say ROLLBACK TRAN, this will undo all the operations or to put it better, this will rollback all the active transactions.




-- ********** Name a Transaction **********
/*
One more thing, you can name a transaction
*/
BEGIN TRAN T1
	BEGIN TRAN T2
		SAVE TRAN S1
		SELECT @@TRANCOUNT	-- 2
	COMMIT TRAN T2
	-- If we execute till this point, it works absolutely fine

	SELECT @@TRANCOUNT	-- displays 1

	-- excute from here
	ROLLBACK TRAN S1
	SELECT @@TRANCOUNT	-- over here TRANCOUNT value is still 1.
ROLLBACK TRAN T2	-- error
SELECT @@TRANCOUNT
	--	to here
/*
Now because 1 transaction was already commited(that is why TRANCOUNT value was 1). Over next SELECT statement TRANCOUNT value is still 1 and after 'ROLLBACK TRAN T2' it is still showing TRANCOUNT value as 1. 

But if you see an error message showing:
Msg 6401, Level 16, State 1, Line 213
Cannot roll back T2. No transaction or savepoint of that name was found.

'Cannot roll back T2. No transaction or savepoint of that name was found.'
Whereas you know that, there is a transaction with the name T2
*/

-- But What if we ROLLBACK TRAN T1 ? and then execute these two statements?
ROLLBACK TRAN T1	-- No error
SELECT @@TRANCOUNT	-- 0
/*
In that case, it executes successfully. 
The TRANCOUNT value gets reset to 0.
*/

/*
So one important point to be noted over here is, if you are having names associated with transactions, while rolling back, you can say either savepoint name ('ROLLBACK TRAN savepoint_name') or the name of outer most transaction only ('ROLLBACK TRAN outermost_transaction_name').
You can't specify the name of any inner transaction, that's because, as you know in case of SQL server transactions, when you are rolling back it rolls back the outermost transaction and it will undo all the operations
*/
BEGIN TRAN T1
	BEGIN TRAN T2
		SAVE TRAN S1
		SELECT @@TRANCOUNT
	COMMIT TRAN T2
	SELECT @@TRANCOUNT
	ROLLBACK TRAN S1
	SELECT @@TRANCOUNT
ROLLBACK TRAN T1 -- <savepoint_name> or <outermost_transaction_name>
SELECT @@TRANCOUNT
		
