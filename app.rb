require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'



def big_fight

	player1 = Player.new("Josiane")
	player2 = Player.new("José")
	

	while player1.life_points > 0 && player2.life_points > 0 
		
	puts "Voici l'état de chaque joueur :\n\n"
	puts player1.show_state
	puts player2.show_state
	puts "Passons à la phase d'attaque :\n\n"

	player1.attacks(player2)
		if player2.life_points <= 0
		break	
		end

	player2.attacks(player1)
		if player1.life_points <= 0
		break
		end

	end

end

big_fight
# binding.pry
# puts "end of file"