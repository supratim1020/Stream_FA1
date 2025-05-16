/*
Let us consider,
that the QuickKart team is planning to expand their business across the globe.
And the warehouse team is looking for a feature to maintain the purchase details country wise in separate tables. 
The purchase idea needs to be continuous and unique across all the tables. 

For example, consider two tables. Purchase_India and Purchase_UK. If the first purchase is made in India the PurchaseId 1 should be inserted in the Purchase_India table. And if the next purchase is made in UK, the PurchaseId 2 should be inserted in Purchase_UK Table. 
*/

/*
Do you think we can use identity for this? 
No, because identity is table specific in nature. But here we are in need of some value that can be used across tables. 
So that is where in SQL server we have sequence. 
Now sequence is similar to identity because it also helps in auto generating values. But unlike identity, it is not table specific, and it is independent of tables.
*/

-- Basic syntax of a sequence
CREATE SEQUENCE Purchase_Sequence

-- To view various properties of a sequence
SELECT * from  sys.sequences WHERE name='Purchase_Sequence'
/*
name				object_id	principal_id	schema_id	parent_object_id	type	type_desc			create_date					modify_date					is_ms_shipped	is_published	is_schema_published		start_value				increment	minimum_value			maximum_value			is_cycling	is_cached	cache_size	system_type_id	user_type_id	precision	scale	current_value			is_exhausted	last_used_value
Purchase_Sequence	1205579333	NULL			1			0					SO		SEQUENCE_OBJECT		2025-03-23 20:37:07.747		2025-03-23 20:37:07.747		0				0				0						-9223372036854775808	1			-9223372036854775808	9223372036854775807		0			1			NULL		127				127				19			0		-9223372036854775808	0				NULL
*/


/*
minimum_value = -9223372036854775808
The default datatype for a sequence is BIGINT
And values for start_value, minimum_value and current_value is same.
*/

-- Now trying to fetch next value from the sequence.
/*
In case of Identity, we had to explicitly insert a value into a table or we just inserted a record into the table which auto incremented the identity. In case of sequence, we'll have to use next value for the name of the sequence, which is purchase sequence. 
*/
SELECT NEXT VALUE FOR Purchase_Sequence AS Next_Value
/* It's same as the start value -9223372036854775808 
So initially, the value of next value will be same as the start value column of the sequence.

Execute the same query once again value is decreamented by 1. ( -9223372036854775807)
Why did this happen?
Since we didn't specify any of the default values and you have already seen that the increament is given was 1. Hence -...808 it becomes -...807.
*/

-- Observe other value
SELECT name,start_value,increment,minimum_value,current_value FROM sys.sequence WHERE name='Purchase_Sequence';
-- AT -8:38