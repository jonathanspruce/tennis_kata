# frozen_string_literal: true

require_relative 'tennis_match'
require_relative 'player'

puts 'Welcome to this tennis match!'

# create empty array which will store players
players = []

%w(first second).each_with_index do |word, i|
  puts "What is the name of the #{word} player?"
  players << Player.new(gets.chomp, i)
end

puts 'How many sets do you want to play for this match?'
sets = gets.chomp.to_i
tennis_match = TennisMatch.new(sets, players)
tennis_match.play
final_points = tennis_match.points.sort
puts "The final score was: \n#{final_points[0]} : #{final_points[1]}\nTo #{players[tennis_match.which_player_win]}"
