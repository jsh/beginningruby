#!/usr/bin/ruby

require "str41.rb"

def prompt()
	$stdout.sync = true
	print "> "
end

def death()
	quips = ["You kind of suck at this.",
		"Nice job, you died ... jackass.",
		" Such a luser.",
		"I have a small puppy that's better than this."]
	puts quips[rand(quips.length)]
	Process.exit(1)
end

def central_corridor()
	puts $description[:central_corridor]
	prompt()
	action = gets.chomp()

	if action == "shoot!"
		puts $description[:shoot!]
		return :death
		
	elsif action == "dodge!"
		puts $description[:dodge!]
		return :death

	elsif action == "tell joke"
		puts $description[:"tell joke"]
		return :laser_weapon_armory

	else
		puts $description[nil]
		return :central_corridor
	end
	
end

def laser_weapon_armory()

	puts $description[:laser_weapon_armory]
	code = "%s%s%s" % [ rand(9)+1, rand(9)+1, rand(9)+1 ]
	puts "#{code}"

	guesses = 0
	print "[keypad]> "
	guess = gets.chomp()
	
	while guess != code and guesses < 10
		puts "BUZZZ!"
		guesses = guesses + 1
		print "[keypad]> "
		guess = gets.chomp()
	end

	puts "#{guess}"
	
	if guess == code
		puts $description[:good_guess]
		return :the_bridge
	else
		puts $description[:bad_guess]
		return :death
	end
end

def the_bridge()

	puts $description[:the_bridge]
	prompt()
	action = gets.chomp()
	
	if action == "throw the bomb"
		puts $description[:"throw the bomb"]
		return :death
	elsif action ==  "slowly place the bomb"
		puts $description[:"slowly place the bomb"]
		return :escape_pod
	else
		puts $description[nil]
		return :the_bridge
	end
end

def escape_pod

	puts $description[:escape_pod]
	good_pod = rand(5) + 1
	print "[pod #]> "
	guess = gets.chomp()

	if guess.to_i != good_pod
		puts $description[:bad_pod]
		return :death
	else
		puts $description[:good_pod]
		Process.exit(0)
	end
end

ROOMS = { :death => method(:death),
	:central_corridor => method(:central_corridor),
	:laser_weapon_armory => method(:laser_weapon_armory),
	:the_bridge => method(:the_bridge),
	:escape_pod => method(:escape_pod),
}

def runner(map, start)
	next_one = start
	
	while true
		room = map[next_one]
		puts "\n---------"
		next_one = room.call()
	end
end

runner(ROOMS, central_corridor)

