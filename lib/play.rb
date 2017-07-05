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
