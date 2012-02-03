class Dungeon
	attr_accessor :player, :rooms
  
	def initialize(player_name)
		@player = Player.new(player_name)
		@rooms = []
	end
  
	Player = Struct.new(:name, :location)
	
	class Room
		attr_accessor :reference, :name, :description, :connections
		def initialize (reference, name, description, connections)
			@reference = reference
			@name = name
			@description = description
			@connections = connections
		end
	end
	
	def start(location)
		@player.location = location
		show_current_description
	end
	
	def show_current_description
		puts find_room_in_dungeon(@player.location).full_description
	end
	
	def add_room(reference, name, description, connections)
		rooms << Room.new(reference, name, description, connections)
	end
	
	def find_room_in_dungeon(reference)
		rooms.detect { |room| room.reference == reference }
	end
	
	class Room
		def full_description
			@name + " with full description " + @description
		end
	end
	
end

d = Dungeon.new("Jeff")
puts d.player.name
d.add_room(:smallcave, "Small Cave", "A claustriphobic, little cave", { :east => :largecave } )
d.add_room(:largecave, "Large Cave", "A big, cavernous cave", { :west => :smallcave } )
d.start(:smallcave)
