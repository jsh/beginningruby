require 'sqlite3'
database = SQLite3::Database.new( "newsqlite.db" )
 
database.execute( "create table sample_table (id INTEGER PRIMARY KEY, sample_text TEXT, sample_number NUMERIC);" )
 
database.execute( "insert into sample_table (sample_text,sample_number) values ('Sample Text1', 123)")
database.execute( "insert into sample_table (sample_text,sample_number) values ('Sample Text2', 456)")
 
rows = database.execute( "select * from sample_table" )
 
p rows
