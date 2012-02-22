ten_things = "Apples Oranges Crows Telephone Light Sugar"

puts "Wait.  There aren't ten things on that list, let's fix that."

stuff = ten_things.split(' ')

more_stuff = %w(Day Night Song Frisbee Corn Banana Girl Boy) 

while stuff.length < 10
	next_one = more_stuff.pop
	puts "Adding #{next_one}"
	stuff.push(next_one)
	puts "There are #{stuff.length} items now"
end

puts "There we go: "
p stuff

puts "Let's do some things with stuff!"

puts stuff[1]
puts stuff[-1] # fancy
puts stuff.join(' ')
puts stuff.pop
puts stuff.values_at(3,5).join('#')