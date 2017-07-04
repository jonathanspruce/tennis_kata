# frozen_string_literal: true

require_relative 'tennis_game'

tennis_game = TennisGame.new

until tennis_game.win?
  puts 'Which player won the point? (0 or 1)'
  result = gets.to_i
  if [0, 1].include? result
    puts tennis_game.add_point(result)
  else
    puts 'Fault! Second serve... Please only enter 0 or 1.'
  end
end
