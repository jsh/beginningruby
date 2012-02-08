require 'csv'
#
## this doesn't seem to work
#CSV.foreach('csvfile.txt') do |person|
#	puts person.inspect
#end

people = CSV.parse(File.read('csvfile.txt'))
puts people[0][0]
puts people[1][0]
puts people[2][0]

puts CSV.read('csvfile.txt').inspect

people = CSV.read('csvfile.txt')
laura = people.find { |person| person[0] =~ /laura/i }
puts laura.inspect

young_people = CSV.read('csvfile.txt').find_all do |p| 
	p[3].to_i.between?(20,40)
end

puts young_people.inspect

people = CSV.read('csvfile.txt')
laura = people.find { |person| person[0] =~ /laura/i }
laura[0] = "Lauren Smith"

CSV.open('csvfile2.txt', 'w') do |csv|
	people.each do |p|
		csv << p
	end
end
