# frozen_string_literal: true

require_relative 'tennis_game'
require_relative 'tennis_score'

# defines a tennis set, and handles all scoring for the game
class TennisSet < TennisScore
  def initialize(skip_games)
    super(6, 2, 'set')
    @skip_games = skip_games
  end

  def play
    unless @skip_games
      puts 'Do you want to skip the games in this set? (y/n)'
      @skip_games = (gets.chomp == 'y')
    end
    if @skip_games
      skip_game until win?
    else
      play_game until win?
    end
    # returns which player won the set
    which_player_win
  end

  private

  # if the user wants to skip the individual games then the
  def skip_game
    puts "Game #{total_points + 1}:/nWhich player won the game? (0 or 1)"
    result = gets.to_i
    if [0, 1].include? result
      puts add_point(result)
    else
      puts 'Please only enter 0 or 1.'
    end
  end

  def play_game
    tennis_game = TennisGame.new
    puts add_point(tennis_game.play)
  end
end
