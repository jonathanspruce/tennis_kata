# frozen_string_literal: true

require_relative 'tennis_match'

puts 'Welcome to this tennis match!'
puts 'How many sets do you want to play for this match?'
sets = gets.chomp.to_i
tennis_match = TennisMatch.new(sets)
tennis_match.play
