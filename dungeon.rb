class Dungeon
	attr_accessor :player
  
	def initialize(player_name)
		@player = Player.new(player_name)
	end
  
	def playername
		@player.name
	end
  
	class Player
		attr_accessor :name
		def initialize(player_name)
			@name = player_name
		end
			end
end

d = Dungeon.new("Jeff")
puts d.player.name