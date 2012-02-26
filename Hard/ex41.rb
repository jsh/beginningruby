#!/usr/bin/ruby

require "str41.rb"

def prompt(room)
	#print "[%s]>" % [ $choices[room].join(',') , $prompt_str[room] ]
	choices = $choices[room].join(', ')
	print "[%s]> " % choices.sub($cheatcode[room], $cheatcode[room] + '*')
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

	prompt(:central_corridor)
	action = gets.chomp()

	puts $description[action.to_sym]

	if action == "shoot!"
		return :death
		
	elsif action == "dodge!"
		return :death

	elsif action == "tell joke"
		return :laser_weapon_armory

	else
		return :central_corridor
	end
	
end

def laser_weapon_armory()

	guesses = 0
	code = "%s%s%s" % [ rand(9)+1, rand(9)+1, rand(9)+1 ]

	$choices[:laser_weapon_armory] = [code]

	puts $description[:laser_weapon_armory]
	prompt(:laser_weapon_armory)
	guess = gets.chomp()
	
	while guess != code and guesses < 10
		guesses = guesses + 1

		puts "BUZZZ!"
		prompt(:laser_weapon_armory)
		guess = gets.chomp()
	end

	
	guess_type = (guess == code) ? :good_guess : :bad_guess
	puts $description[guess_type]
	
	if guess_type == :good_guess
		return :the_bridge
	else
		return :death
	end
end

def the_bridge()

	puts $description[:the_bridge]
	prompt(:the_bridge)
	action = gets.chomp()

	puts $description[action.to_sym]
	
	if action == "throw the bomb"
		return :death
	elsif action ==  "slowly place the bomb"
		return :escape_pod
	else
		return :the_bridge
	end
end

def escape_pod

	good_pod = rand(5) + 1

	puts $description[:escape_pod]
	$cheatcode[:escape_pod] = good_pod.to_s
	prompt(:escape_pod)
	guess = gets.chomp()

	guess_type = (guess.to_i == good_pod) ? :good_pod : :bad_pod
	puts $description[guess_type]

	if guess.to_i != good_pod
		return :death
	else
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

