/*
Let us now consider another useful object called Index and SQL Server. 
Before we look at the index, let's understand the need of index with the help of real time. 
Example. Consider you're reading a book on sequel server and you want to read the topic called Identity. One way to do this is to scan through the books till you get the particular topic. But this is not the right way. It is more time consuming and not efficient way of searching.
But as you all know, in all books, we have index pages at the end. Now the advantage of index pages is that all the topics are sorted in alphabetical order. Now, if you want to read about identity, you can easily look at the alphabet I find out where identity is present and then go to the page where the identity topic is described. thus, Index helps us in easily searching whatever we need.
Hence with indexes, the searching becomes very fast. Indexes ib SQL Server are very similar to this.
*/

/*
		----------------------------
		CategoryId		CategoryName
		----------------------------
			4			Toys
			1			Electronics
			3			Apparels
			2			Fashions

For example, let us consider the category table. Assume you want to find the record where the CategoryId is 2. In this case, you will have to scan through each of the records one by one till you encounter the CategoryId 2. 
Instead, If the table was already in the sorted order based on the category, Id like it was sorted in alphabetical order in the index page. Then the searching would have become very simple. This is where Index and sequel server helps.

*/

/*
Yes, index helps in faster retrieval of data and thereby improves the performance of the queries. We'll be discussing about two types of indexes in sequel Server, one is the Clustered Index. The other one is the Non Clustered index. 

Now Clustered indexes, the one where the data in the table itself gets sorted, Based on the column on which the Clustered Index is created. And in Sequel server, you can have only one clustered index per table, 

Where as in case of non clustered index. The rows in the table are not sorted based on the index. Instead, it will occupy a separate memory where the index is sorted. there can be more than one non clustered index and the maximum number varies from version to version. 

Also, these indexes are represented as a B tree. In case of clustered index. The table data is present at the leaf note, for example, that is considered the pictures shown.(Reffer PNG Image file) 


Here, the clustered Index is created on the category I'd hence, at the leaf note, you can see that the table data is in the sorted order of the category I. D. whereas in case of non clustered index, the leaf note does not contain the actual data, but it contains pointers to the actual data present in the table now in the diagram shown. There is a non clustered index created on the category name column so the leaf note will contain the category names in sorted order, but will contain pointers to the actual data. Now what do I mean by pointers over here? A pointer could be a clustered index if it is already present in the table. If there is no Clustered Index, the pointer could be a reality. Well, let's go ahead and see a demonstration on indexes to understand how to use and how to work with indexes.

*/
