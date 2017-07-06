# frozen_string_literal: true

require_relative 'tennis_score'
require_relative 'tennis_set'

# helps score for a full tennis match
class TennisMatch < TennisScore
  def initialize(set_number, players)
    super(set_number, 0, 'match', players)
  end

  def play
    puts 'Do you want to skip all the games in this match? (y/n)'

    @skip_games = (gets.chomp == 'y')

    until win?
      puts "Set #{total_points + 1}:"
      tennis_set = TennisSet.new(@skip_games, players)
      puts add_point(tennis_set.play)
    end
  end
end
