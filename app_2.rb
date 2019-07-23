require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/player'

	puts "---------------------------------------------------"
	puts "|     Bienvenue sur 'ILS VEULENT TOUS MA POO' !   |"
	puts "| Le but du jeu est d'être le dernier survivant ! |"
	puts "---------------------------------------------------"
	# Accueil : Commence par afficher dans le terminal, au lancement de app_2.rb, un petit message de démarrage du jeu

	puts "Quel est ton super nom de combattant?"
	print "> "
	user_name = gets.chomp
	user = HumanPlayer.new(user_name)
	# Initialisation du joueur
	# Ensuite, le jeu va demander à l'utilisateur son prénom et créer un HumanPlayer portant ce prénom.

	enemies = [player1 = Player.new("Josiane"), player2 = Player.new("José")]
	# Initialisation des ennemis : le jeu va maintenant créer nos deux combattants préférés, "Josiane" et "José".

	while user.life_points >0 && (enemies[0].life_points > 0 || enemies[1].life_points >0)
	# Le combat : ouverture d'une boucle while qui ne doit s'arrêter que si le joueur de l'utilisateur (HumanPlayer) meurt ou si les 2 joueurs "bots" (Player) meurent.

		puts "#{user.show_state}"
		# La première chose qu'on va faire à chaque tour de combat, c'est afficher l'état du HumanPlayer

		puts "Quelle action veux-tu effectuer ?\n\n"
		puts "a - chercher une meilleure arme"
		puts "s - chercher à se soigner\n\n"
		puts "Attaquer un joueur en vue:"
		puts "0 - #{player1.show_state}"
		puts "1 - #{player2.show_state}\n\n"
		# Ensuite, on va proposer un menu

		puts "Le temps presse.... Balance ton choix!"
		print "> "
		choice = gets.chomp
		# L'utilisateur tape son choix

		case choice 
		# En fonction de la saisie, on va :
	    
			when "a"
				user.search_weapon
				# si l'utilisateur tape "a", exécuter sur son HumanPlayer la méthode qui le fait partir à la recherche d'une arme ;

			when "s"
				user.search_health_pack
				# si l'utilisateur tape "s", exécuter sur son HumanPlayer la méthode qui le fait partir à la recherche d'un pack de soin ;

			when "0"
				if enemies[0].life_points > 0
				# si Josiane n'est pas morte
					user.attacks(player1)
					# si l'utilisateur tape "0", faire attaquer Josiane par son Human Player ;
				end
			when "1"
				if enemies[1].life_points > 0
				# si José n'est pas mort
					user.attacks(player2)
					# si l'utilisateur tape "1", faire attaquer José par son Human Player ;
				end
		end

		if enemies[0].life_points > 0 || enemies[1].life_points >0
			puts " "
			puts "Les autres joueurs t'attaquent!!!"
			# C'est maintenant au tour des ennemis de riposter ! Tu peux l'indiquer en affichant en console un petit puts "Les autres joueurs t'attaquent !"
			enemies.each do |enemy|
				if enemy.life_points > 0
					enemy.attacks(user)
					
				end
			end
		end
	end

	if user.life_points >0
		puts " "
		puts"CHAMPIIIIOOOOOOOOONNNNNN! TU AS GAGNE!"
		
		else
			puts " "
			puts "BOOOUUUUUHHH! Loser! Tu as perdu!"
	end
	# affichage en sortie de boucle, donc à la fin du fight