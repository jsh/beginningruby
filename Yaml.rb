require 'yaml'
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

test_data = [fred, laura]
yaml_out = YAML::dump(test_data)
yaml_out = yaml_out.gsub(/Laura/, "Lauren")
people = YAML::load(yaml_out)
puts people[1].name