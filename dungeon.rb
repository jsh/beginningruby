class Dungeon
	attr_accessor :player
  
	def initialize(player_name)
		@player = Player.new(player_name)
	end
  
	Player = Struct.new(:name, :location)
end

d = Dungeon.new("Jeff")
puts d.player.name
