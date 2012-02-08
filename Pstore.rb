
class Person
	attr_accessor :name, :job, :sex, :age
end

laura = Person.new
laura.name = "Laura Smith"
laura.job = "Cook"
laura.sex = "Female"
laura.age = 23

fred = Person.new
fred.name = "Fred Bloggs"
fred.job = "Manager"
fred.sex = "Male"
fred.age = 45

require 'pstore'

File.exists?("pstorefile") && File.delete("pstorefile")

store_out = PStore.new("pstorefile")
store_out.transaction do
	store_out[:people] ||= []
	store_out[:people] << laura
	store_out[:people] << fred
end

store_in = PStore.new("pstorefile")
people = []
store_in.transaction do
	people = store_in[:people]
end

people.each do |person|
	puts person.name
end
