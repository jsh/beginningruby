require 'rubygems'
require 'mysql'

# Connect to a MySQL database 'test' ion the local machine
db = Mysql.connect('localhost', 'root', 'mysql', 'test')

# create the table
#db.query("CREATE TABLE people(
#	id integer primary key,
#	name varchar(50) primary key,
#	age integer
#	)"
#	)

# Perform an arbitrary SQL query
db.query("INSERT INTO people (id, name, age) VALUES(1, 'Jeff', 63)")

# Perform a query that returns data
begin
	query = db.query('SELECT * FROM people')
	puts "There were #{query.num_rows} rows returned"
	
	query.each_hash do |h|
		puts h.inspect
	end
rescue
	puts db.errno
	puts db.error
end

# Close the connection cleanly
db.close