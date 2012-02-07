require 'csv'
puts 'hello, world'
#File.open('csv.txt').each do |person|
#	puts person
#end

# this doesn't seem to work
#CSV.open('csv.txt', 'r') do |person|
#	puts person
#end

people = CSV.parse(File.read('csv.txt'))
puts people[0][0]
puts people[1][0]
puts people[2][0]

puts CSV.read('csv.txt').inspect
