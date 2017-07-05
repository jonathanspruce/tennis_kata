# frozen_string_literal: true

require_relative 'tennis_game'
require_relative 'tennis_score'

# defines a tennis set, and handles all scoring for the game
class TennisSet < TennisScore
  def initialize(skip_games, players)
    super(6, 2, 'set', players)
    @skip_games = skip_games
  end

  def play
    unless @skip_games
      puts 'Do you want to skip the games in this set? (y/n)'
      @skip_games = (gets.chomp == 'y')
    end
    puts "Game #{total_points + 1}"
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
    puts "Which player won the game?\n0: #{players[0].name}\n1: #{players[1].name}"
    if [0, 1].include? gets.chomp.to_i
      puts add_point(result)
    else
      puts 'Please only enter 0 or 1.'
    end
  end

  def play_game
    match_players = players
    match_players.each { |player| puts player.name }

    if total_points.even?
      puts "#{players[0].name} to serve."
    else
      puts "#{players[1].name} to serve."
      match_players = match_players.reverse
    end
    tennis_game = TennisGame.new(match_players)
    puts add_point(tennis_game.play)
  end
end
