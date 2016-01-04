require_relative 'pokemon'
require 'pry'

pokemons = 0
validtourn = [4, 8, 16, 32, 64]

while validtourn.include?(pokemons) == false
  system "clear"
  puts "Combien de Pokemons doit contenir votre tournoi?(4, 8, 16, 32, 64)"
  pokemons = gets.chomp.to_i
end

tabtournoi = Tournament.new(pokemons).displaytab
system "clear"

puts "Voici les pokemons qui vont s'affronter dans votre tournoi"

tabtournoi.each do |poke|
  p poke.name
end

puts "Lancer le tournoi?"
empty = gets.chomp
vstab = tabtournoi.shuffle.each_slice(2).to_a
winners = []
while vstab.count != 1
  winners = []
  vstab.each do |combat|
    puts "#{combat.first.name} va affronter #{combat.last.name}"
      winners << combat.first.baston(combat.last)
    puts "#{winners.last.name} passe au prochain tour"
    empty = gets.chomp
  end
  if winners.count == 2
    vstab = [winners]
  else
    vstab = winners.shuffle.each_slice(2).to_a
    puts "Le tour suivant commence!!"
  end
end

vstab.each do |combat|
  puts "La final va bientot commencer!"
  puts "#{combat.first.name} va affronter #{combat.last.name}"
  x = combat.first.baston(combat.last)
  puts "#{x.name} remporte ce tournoi!!"
end





