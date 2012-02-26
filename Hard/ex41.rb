
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
	puts "The Gothons of planet Percal #25 have invaded your ship"
	puts "and destroyed your entire crew.  You are the last surviving member"
	puts "and your last mission is to get the Neutron Destruct Bomb"
	puts "from the Armory, put it in the bridge,"
	puts "and blow the ship up, after getting into an escape pod."
	puts "\n"
	puts "You're running down the central corridor to the Weapons Armory,"
	puts "when a Gothon jumps out: red scaly skin, dark grimy teeth, and an evil clown costume"
	puts "flowing around his hate-filled body.  He's blocking the door to the Armory"
	puts "and about to pull a weapon to blast you."
	
	prompt()
	action = gets.chomp()

	if action == "shoot!"
		puts "Quick on the draw, you pull out your blaster and fire it at the Gothon."
		puts "His clown costume is flowing around his body, which throws off your aim."
		puts "Your laser hits his costume but misses him entirely."
		puts "This ruins his brand-new costume his mother bought for him,"
		puts "which makes him fly into an insane rage and blast you in the face"
		puts "repeatedly until you are dead.  Then he eats you."
		return :death
		
	elsif action == "dodge!"
		puts "Like a world-class boxer you weave, dodge, slip and slide right"
		puts "as the Gothon's blaster cranks a laser past your head."
		puts "In the middle of your artful dodge, your foot slips"
		puts "and you bang your head on the metal wall and pass out."
		puts "You wake up shortly after only to die as the Gothon stomps on your head"
		puts "and eats you."
		return :death

	elsif action == "tell joke"
		puts "Lucky for you, they made you learn Gothon insults in the academy."
		puts "You tell the one Gothon joke you know:"
		puts "Lkjfapuiriup jfkljkaf vuornvoi nqrpvyurqnm."
		puts "The Gothon stops, tries not to laugh, then bursts out laughing and can't move."
		puts "While he's laughing, you run up, and shoot him square in the head,"
		puts "putting him down, then jump through the Weapons Armory door."
		return :laser_weapon_armory

	else
		puts "DOES NOT COMPUTE"
		return :central_corridor
	end
	
end

def laser_weapon_armory()
	puts "You do a dive into the Weapon Armory, crouch and scan the room"
	puts "for more Gothons that might be hiding.  It's dead quiet, too quiet."
	puts "You run to the far side of the room and find the neutron bomb in its container."
	puts "There's a keypad lock on the box and you need the code to get the box out."
	puts "If you get the code wrong 10 times then the lock closes forever and you can't get the bomb."
	puts "The code is three digits"
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
		puts "The container clicks open and the seal breaks, letting gas out."
		puts "You grab the neutron bomb and run as fast as you can"
		puts "to the bridge where you must place it in the right spot."
		return :the_bridge
	else
		puts "The lock buzzes one last time and then you hear a sickening melting sound"
		puts "as the mechanism is fused together."
		puts "You decide to sit there, and finally the Gothons blow up the ship"
		puts "from their ship, and you die."
		return :death
	end
end

def the_bridge()
	puts "You burst onto the bridge with the netron destruct bomb under your bomb"
	puts "and surprise 5 Gothons who are trying to take control of the ship."
	puts "Each of them has an even uglier clown suit than the last."
	puts "They haven't pulled their weapons out yet,"
	puts "as they see the active bomb under your arm and don't want to set it off."
	
	prompt()
	action = gets.chomp()
	
	if action == "throw the bomb"
		puts "In a panic you throw the bomb at the Gothons and make a leap for the door."
		puts "Right as you drop it, a Gothon shoots you in the back, killing you."
		puts "As you die, you see another Gothon frantically trying to disarm the bomb."
		puts "You die knowing they will probably blow up when the bomb goes off."
		return :death
	elsif action ==  "slowly place the bomb"
		puts "You point the blaster at the bomb under your arm"
		puts "and the Gothons put up their hands and start to sweat."
		puts "You inch backward to the door, open it and carefully place the bomb on the floor,"
		puts "pointing your blaster at it."
		puts "You then jump back through the door, punch the close button,"
		puts "and blast the lock so the Gothans can't get out."
		puts "Now that the bomb is placed, you run to the escape pod"
		puts "to get off this tin can."
		return :escape_pod
	else
		puts "DOES NOT COMPUTE!"
		return :the_bridge
	end
end

def escape_pod
	puts "You rush through the ship, desperately trying to make it"
	puts "to the escape pod before the ship explodes."
	puts "It seems like hardly any Gothons are on the ship, so your run is clear of interference."
	puts "You get to the chamber with the escape pods, and now need to pick one to take."
	puts "Some of them could be damaged, but you don't have time to look."
	puts "There are five pods.  Which one do you take."
	
	good_pod = rand(5) + 1
	print "[pod #]> "
	guess = gets.chomp()
	
	if guess.to_i != good_pod
		puts "You jump into pod %s and hit the eject button." % guess
		puts "The pod escapes out into the void of space"
		puts "then implodes as the hull ruptures, crushing your body into jelly."
		return :death
	else
		puts "You jump into pod %s and hit the eject button." % guess
		puts "The pod easily slides out into space, headed to the planet below."
		puts "As you fly toward the planet, you look back and see your ship implode"
		puts "like a bright star, taking out the Gothon ship at the same time."
		puts "You won!"
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

