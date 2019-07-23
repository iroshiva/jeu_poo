# require "pry"

class Player
# création d'une classe générale Player

	attr_accessor :name, :life_points
	# création des variables d'instance
	# chaque instance créée, donc chaque Player.new, auront les variables name et life_points

	def initialize(nom)
	# initie une méthode classe qui va assigner les variables d'instance name et life_points == 10 à chaque instance créée == chaque joueur créé == chaque objet créé
	# prend une entrée (nom) qui aura la valeur définit lors de la création de chaque instance : player1 = Player.new(nom)

		@name = nom
		# le nom sera assigné à la variable d'instance @name

		@life_points = 10
		# la variable d'instance @life_points est fixée à 10
		# comme elle est fixe, pas d'entrée

	end

	def show_state
	# methode spécifique dite d'instance == joue sur l'instance créée
	# pas d'entrée
	# sort l'etat des variables de l'instance

		"#{@name} a #{@life_points} points de vie"
	end

	def gets_damage(level_damage)
	# methode spécifique dite d'instance == joue sur l'instance créée
	# entrée : le niveau des dommages lié au numéro du dé virtuel
	# sort la variable life_points après chaque fight

		@life_points -= level_damage
		# retire les points des dommages lié au numéro du dé virtuel de la vriable life_points

		if @life_points <= 0
			puts "#{@name} a été tué!"
			@life_points = 0
		end
		# permet de terminer le jeu

	end

	def attacks(player)
	# methode spécifique dite d'instance == joue sur l'instance créée
	# entrée : un des deux joueur
	# sort, mais n'affiche pas (pas de puts), le niveau de dommages du joueur en entrée

		puts "#{self.name} attaque #{player.name}"
		# self == le joueur en entrée
		# player.name == l'autre

		level_damage = compute_damage
		# le niveau de dommages est dicté par le dé virtuel

		puts "#{self.name} inflige #{level_damage} points de dommages à #{player.name}!"

		player.gets_damage(level_damage)
	end

	def compute_damage
	# methode spécifique dite d'instance == joue sur l'instance créée
	# pas d'entrée
	# sort, mais n'affiche pas (pas de puts), le niveau de dommages

		return rand(1..6)
		# retourne, au hasard, un chiffre entre 1 et 6 qui dictera le niveau de dommage

	end
	
end

# binding.pry
# puts "end of file"

class HumanPlayer < Player
# la class HumanPlayer va hérité de Player, cad que chaque instance de HumanPlayer aura un nom et un life_points + les méthodes spécifiques

	attr_accessor :weapon_level
	# ajout d'une variable d'instance, valable uniquement pour les objets de la classe HumanPlayer

	def initialize(nom)
	# initie une méthode classe qui va assigner les variables d'instance @weapon_level, @name et @life_points à chaque instance créée == chaque joueur créé == chaque objet créé
	# prend une entrée (nom) qui aura la valeur définit lors de la création de chaque instance : player1 = Player.new(nom)

		@name = nom 
		@life_points = 100
		# cette variable est fixée à 100 == uniquement valable pour les objets de cette classe

		@weapon_level = 1
		# variable d'instance de la classe HumanPlayer initiée à 1

	end

	def show_state
	# idem classe Player, MAIS pour la classe HumanPlayer

		puts " "
		puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
	end

	def compute_damage
	# methode spécifique dite d'instance == joue sur l'instance créée
	# pas d'entrée
	# sort, le niveau de dangerosité de l'arme

    rand(1..6) * @weapon_level
  end

	def search_weapon
	# methode spécifique dite d'instance == joue sur l'instance créée
	# pas d'entrée
	# sort, le niveau de dangerosité de l'arme

		new_weapon_level = rand(1..6)
		# donne un nouveau niveau de l'arme

		puts " "
		puts "Tu as trouvé une arme de niveau #{new_weapon_level}!"

		if new_weapon_level > @weapon_level
		# si le nouveau niveau de l'arme trouvée == niveau de l'arme actuelle

			puts "Youhou ! Elle est meilleure que ton arme actuelle: tu la prends!"
			@weapon_level = new_weapon_level
			puts "Tu as maintenant une arme de niveau #{@weapon_level}!"
		else
		# sinon 

			puts "Pas de bol... elle n'est pas mieux que ton arme actuelle... autant garder la même!"
		end

	end

	def search_health_pack
	# methode spécifique dite d'instance == joue sur l'instance créée
	# pas d'entrée
	# affiche ce que tu fais du pack health trouvée

		health_pack_level = rand(1..6)
		# dé virtuel qui définit la "valeur" de ton pack health

		case health_pack_level
		# au cas
		when 1
		# où
			puts " "
			puts "Tu n'as rien trouvé... " 
			# alors
		when 2..5
		# où
			puts " "
			puts "Bravo, tu as trouvé un pack de +50 points de vie !"
			@life_points += 50
			# alors
		when 6
		# où
			puts " "
			puts "Waow, tu as trouvé un pack de +80 points de vie ! Tu déchires!!!"
			@life_points += 80
			#alors
		end

		life_points_limit
		# à la fin, application de la méthode life_points_limit

	end

	def life_points_limit
	# methode spécifique dite d'instance == joue sur l'instance créée
	# pas d'entrée
	# sort le fait que les life_points ne doivent pas dépsser 100

		if @life_points > 100
			@life_points = 100
			puts "Malheureusement, ton niveau de vie ne peux pas dépasser 100! Faut pas abuser! ;)"
		end	
	end


end

# binding.pry
# puts "end of file"