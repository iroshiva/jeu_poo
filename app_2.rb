require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'


# def affich_start

	puts "---------------------------------------------------"
	puts "|     Bienvenue sur 'ILS VEULENT TOUS MA POO' !   |"
	puts "| Le but du jeu est d'être le dernier survivant ! |"
	puts "---------------------------------------------------"

# end
	
# def gamer_init

	puts "Quel est ton super nom de combattant?"
	print "> "
	user_name = gets.chomp
	user = HumanPlayer.new(user_name)

# 

# def ennem_init

	enemies = [player1 = Player.new("Josiane"), player2 = Player.new("José")]

# end

# def big_fight_2(user, players)

	while user.life_points >0 && (enemies[0].life_points > 0 || enemies[1].life_points >0)

		puts "#{user.show_state}"

		puts "Quelle action veux-tu effectuer ?\n\n"
		puts "a - chercher une meilleure arme"
		puts "s - chercher à se soigner\n\n"
		puts "Attaquer un joueur en vue:"
		puts "0 - #{player1.show_state}"
		puts "1 - #{player2.show_state}\n\n"

		puts "Le temps presse.... Balance ton choix!"
		print "> "
		choice = gets.chomp

		case choice 
			when "a"
				user.search_weapon
			when "s"
				user.search_health_pack
			when "0"
				if enemies[0].life_points > 0
					user.attacks(player1)
				end
			when "1"
				if enemies[1].life_points > 0
					user.attacks(player2)
				end
		end

		if enemies[0].life_points > 0 || enemies[1].life_points >0
			puts "Les autres joueurs t'attaquent!!!"
			enemies.each do |enemy|
				if enemy.life_points > 0
					enemy.attacks(user)
					
				end
			end
		end
	end

	if user.life_points >0
		puts"BRAVO! TU AS GAGNE!"
		
		else
			puts "Loser! Tu as perdu!"
	end

# end


# def perform
	# affich_start
	# gamer_init
	# ennem_init
	# big_fight_2(gamer_init, ennem_init)
# end

# perform

# binding.pry
# puts "end of file"