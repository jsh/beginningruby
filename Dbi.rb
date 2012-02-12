require 'rubygems'
require 'dbi'

# Connect to a database
db = DBI.connect('DBI:Mysql:test', 'root', 'mysql')

db.do("INSERT INTO people (id, name, age) VALUES (?, ?, ?)", 2, 'Kristina', 51)

# pull data directly from the database in a single sweep
db.select_all('SELECT * FROM people') do |row|
	puts row.inspect
end

db.disconnect