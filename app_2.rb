require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


player1 = Player.new("Trunks")
player2 = Player.new("Goten")
array_bots = []
array_bots << player1
array_bots << player2

puts "-------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !       |"
puts "|Le but du jeu est d'être le dernier survivant ! |"
puts "-------------------------------------------------"

puts "Quel est ton prénom ?"
print ">"
first_name = gets.chomp
h_player = HumanPlayer.new(first_name)

 while h_player.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
    gets.chomp
    puts "-----------------------------------"
puts "Voici la santé de chaque joueur :"
puts
puts  "#{h_player.show_state}"
puts  "#{player1.show_state}"
puts  "#{player2.show_state}"
gets.chomp
puts "-------------------------------"
puts "FIGHT!!! "
puts "Quelle action veut tu effectuer ?"
puts  "------------------------------"  
puts "a - chercher une meilleure arme"
puts "s - chercher à se soigner "
puts "-------------------------------"
puts "attaquer un joueur en vue :"
puts "0 - Trunks a #{player1.life_points} points de vie"
puts "1 - Goten a #{player2.life_points} points de vie"
choice = gets.chomp
print ">"
if choice == "a"
    h_player.search_weapon
elsif choice == "s"
    h_player.search_health_pack
elsif choice == "0"
    h_player.attacks(player1)
elsif choice == "1"
    h_player.attacks(player2)
else
    puts "Choisis entre a,s,0 ou 1"
end
gets.chomp
puts "Les autres joueurs t'attaquent!"
array_bots.map {|x|x.attacks(h_player) if x.life_points > 0}

end

puts "La partie est terminée"