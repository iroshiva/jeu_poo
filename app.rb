require 'bundler'
Bundler.require

require_relative 'lib/player'
# app.rb est "connecté à player.rb



def big_fight
# methode big_fight
# pas d'entrée
# définit la chronologie du fight

	player1 = Player.new("Josiane")
	#définition d'une 1ère instance == 1er objet Player

	player2 = Player.new("José")
	#définition d'une 1ère instance == 1er objet Player
	

	while player1.life_points > 0 && player2.life_points > 0 
	# création d'une boucle de déroulement du fight
	# tant que la boucle est true, elle recommence
	# si elle est false ==> sortie de boucle
	
		puts " "
		puts "Voici l'état de chaque joueur :"
		puts player1.show_state
		puts player2.show_state
		puts " "
		puts "Passons à la phase d'attaque :"

		player1.attacks(player2)
			if player2.life_points <= 0
			# condition de sortie de boucle
			break	
			end

		player2.attacks(player1)
			if player1.life_points <= 0
			# condition de sortie de boucle
			break
			end

	end

end

big_fight
