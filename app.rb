require 'pry'
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


player1 = Player.new("Trunks")
player2 = Player.new("Goten")
=begin
puts "Voici la santé de chaque joueur :"
puts  "#{player1.show_state}"
puts  "#{player2.show_state}"
puts "FIGHT!!! "

player1.attacks(player2)
player2.attacks(player1)
=end


while player1.life_points > 0 && player2.life_points > 0 do
puts "-----------------------------------"
puts "Voici la santé de chaque joueur :"
puts
puts  "#{player1.show_state}"
puts  "#{player2.show_state}"
puts "-----------------------------------"
puts "FIGHT!!! "
break if player2.life_points <= 0 
player1.attacks(player2) 
player2.attacks(player1) 


end





binding.pry