class Dungeon
	attr_accessor :player, :rooms
    
	Player = Struct.new(:name, :location)
	
	class Room
		attr_accessor :reference, :name, :description, :connections
		def initialize (reference, name, description, connections)
			@reference = reference
			@name = name
			@description = description
			@connections = connections
		end

		def full_description
			"#{@name}\n\nYou are in #{@description}"
		end
	end

	def initialize(player_name)
		@player = Player.new(player_name)
		@rooms = []
	end

	def start(location)
		@player.location = location
		show_current_description
	end

	def show_current_description
		puts find_room_in_dungeon(@player.location).full_description
	end
	
	def add_room(reference, name, description, connections)
		@rooms << Room.new(reference, name, description, connections)
	end
	
	def find_room_in_dungeon(reference)
		rooms.detect { |room| room.reference == reference }
	end
	
end

d = Dungeon.new("Jeff")
d.add_room(:smallcave, "Small Cave", "a claustriphobic, little cave", { :east => :largecave } )
d.add_room(:largecave, "Large Cave", "a big, cavernous cave", { :west => :smallcave } )

puts "Welcome #{d.player.name}!!!\n\n"
d.start(:smallcave)
