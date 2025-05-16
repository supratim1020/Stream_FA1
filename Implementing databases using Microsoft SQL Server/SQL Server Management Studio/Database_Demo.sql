CREATE DATABASE QuickKart

SELECT name,filename FROM sys.sysaltfiles
/*
	.mdf is primary data file. This is the file information for the database.
	And this is the file which actually stores the data.

	.ldf is the Transaction Log File.
	This file holds log information that is used to recover the database.
	And please note that, there must be atleast one log file for each database.

	.ndf is known as Secondary Data File
	They are optional and user-defined files to store the data of the database.

	master			C:\Users\maity\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\master.mdf
	mastlog			C:\Users\maity\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\mastlog.ldf
	tempdev			C:\Users\maity\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\tempdb.mdf
	templog			C:\Users\maity\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\templog.ldf
	modeldev		C:\Users\maity\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\model.mdf
	modellog		C:\Users\maity\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\modellog.ldf
	MSDBData		C:\Users\maity\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\MSDBData.mdf
	MSDBLog			C:\Users\maity\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\MSDBLog.ldf
	QuickKart		C:\Users\maity\QuickKart.mdf
	QuickKart_log	C:\Users\maity\QuickKart_log.ldf
-->	data			C:\Program Files\Microsoft SQL Server\150\LocalDB\Binn\mssqlsystemresource.mdf
-->	log				C:\Program Files\Microsoft SQL Server\150\LocalDB\Binn\mssqlsystemresource.ldf

- Except this last two entries every other database or file of database is stored in the same location.

- Whereas the last two entries are stored in different location which is inside the 'Binn\' folder.

- Now what is so special or what is of these two files?
	Now these two files are of the Resource Database.

- Resource database is a system database that contains system objects that are included with SQL Server.
  Now this database is very helpful when you want to upgrade from one version of SQL Server to another version of SQL Server
  So it is only Resource type of database which stored in different location and also note that this is a read-only database.

- Apart from Resource database there are 4 types of System databases that SQL Server provides.
  master, model, msdb, tempdb
  -- master ::- It records all the system level information for any instance of SQL Server.
  -- model ::- This is a database which is used as a template for creating any user-defined database. That means you want a database to be created with some tables and other database objects already present in it. Now that is when you can make use of the model database because, if you create any object in the model database those objects get created in any user defined database as well.
  -- msdb ::- This is the database which is used for scheduling any job. That means if you want to repeatatively run any task at a given point of time that is when msdb get used.
  -- tempdb ::- which is a workspace for holding any temporary object in SQL Server.

*/

/*
If we go to master > Tables > System Tables
	dbo.MSreplication_options
	dbo.spt_fallback_db
	dbo.spt_fallback_dev
	dbo.spt_fallback_usg
	dbo.spt_monitor
	dbo.trace_xe_action_map
	dbo.trace_xe_event_map

'dbo.MSreplication_options' is actually a table name but before that it has prefix 'dbo'.
Now this 'dbo' stands for 'Database Owner'.
Now here dbo said to be a schema.
A schema actually a logical collection of various database objects.
Here in this case, the schema used is dbo or database owner but you can have schemas with other name also.

*/