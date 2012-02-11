require 'sqlite3'
File.exists?('sqlitedb') && File.delete('sqlitedb')
puts "hello, world"

$db = SQLite3::Database.new("sqlitedb")
$db.results_as_hash = true
#$stdout.sync = true

def disconnect_and_quit
	$db.close
	puts "Bye!"
	exit(0)
end

def create_table
	puts "Creating people table"
	#STDOUT.flush
	$db.execute (%q{
		CREATE TABLE people (
		id integer primary key,
		name varchar(50),
		job varchar(50),
		sex varchar(6),
		age integer)
	})
end

def add_person
	puts "Enter name:"
	name = gets.chomp
	puts "Enter job:"
	job = gets.chomp
	puts "Enter sex:"
	sex = gets.chomp
	puts "Enter age:"
	age = gets.chomp
	#STDOUT.flush
	$db.execute(%q{
		INSERT INTO people (
			name, job, sex, age
		)
		VALUES (
		?, ?, ?, ?
		)
	}, name, job, sex, age)
end

def find_person
	puts "Enter name or ID of person to find:"
	#STDOUT.flush
	id = gets.chomp
	person = $db.execute("SELECT * FROM people WHERE name = ? OR  id = ?", id, id.to_i).first
	
	unless person
		puts "No result found"
		#STDOUT.flush
		return
	end
	
	puts %Q{Name: #{person['name']}
	Job: #{person['job']}
	Sex: #{person['sex']}
	Age: #{person['age']}}
	#STDOUT.flush
end

loop do
	puts %q{Please select an option:
	
		1. Create a table
		2. Add a person
		3. Find a person
		4. Quit
	}
	#STDOUT.flush

	case gets.chomp
		when '1'
			create_table
		when '2'
			add_person
		when '3'
			find_person
		when '4'
			disconnect_and_quit
	end

end

	