class Dungeon
	attr_accessor :player, :rooms
    
	Player = Struct.new(:name, :location)
	
	class Room
		attr_accessor :reference, :name, :description, :connections
		
		# create the room and assign values to its attributes
		def initialize (reference, name, description, connections)
			@reference = reference
			@name = name
			@description = description
			@connections = connections
		end

	# print the room's full description
		def full_description
			"#{@name}\n\nYou are in #{@description}"
		end
	end

	# Initialize the dungeon.
	# assign the player a name,
	# create an empty list of rooms
	def initialize(player_name)
		@player = Player.new(player_name)
		@rooms = []
	end

	# put the player into a specific room,
	# and report it.
	def start(location)
		@player.location = location
		show_current_description
	end

	# print the full description of the room
	def show_current_description
		puts find_room_in_dungeon(@player.location).full_description
	end

	# find the room connected in a particular direction
	def find_room_in_direction(direction)
		find_room_in_dungeon(@player.location).connections[direction]
	end

	# add a new room to the list of rooms
	def add_room(reference, name, description, connections)
		@rooms << Room.new(reference, name, description, connections)
	end
	
	# given a reference, find the room
	def find_room_in_dungeon(reference)
		rooms.detect { |room| room.reference == reference }
	end
	
	# move in a particular direction, report the result
	def go(direction)
		puts "You go " + direction.to_s
		@player.location = find_room_in_direction(direction)
		show_current_description
	end
end

d = Dungeon.new("Jeff")
d.add_room(:smallcave, "Small Cave", "a claustriphobic, little cave", { :east => :largecave } )
d.add_room(:largecave, "Large Cave", "a big, cavernous cave", { :west => :smallcave } )

puts "Welcome #{d.player.name}!!!\n\n"
d.start(:smallcave)
d.go(:east)