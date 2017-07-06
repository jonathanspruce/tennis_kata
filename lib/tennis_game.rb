# frozen_string_literal: true

require_relative 'tennis_score'

# TennisGame: used to manage the scoring in a tennis game
class TennisGame < TennisScore
  TENNIS_POINTS = %w(Love Fifteen Thirty Fourty Advantage).freeze

  attr_accessor :points, :winner

  def initialize(players)
    # create score array with scores for both teams
    super(4, 2, 'game', players)
  end

  # converts the score into a the tennis scores
  def score
    return 'Deuce' if deuce?
    return win_message if win?
    # else just show converted scores
    "#{TENNIS_POINTS[@points[0]]} : #{TENNIS_POINTS[@points[1]]}"
  end

  # checks whether the players are currently at deuce:
  # the players both have at least 3 points and the points are equal
  def deuce?
    @points[0] >= 3 && @points[1] == @points[0]
  end

  # used to add one point to the specified player
  def add_point(player_no)
    # get opposition index number
    opp_no = opposition(player_no)
    # if the opposition has the advantage -1 from their score, else super
    if @points[opp_no] == 4
      @points[opp_no] -= 1
      score
    else
      super
    end
  end

  def play
    until win?
      puts "Which player won the point? \n0: #{players[0].name}\n1: #{players[1].name}"
      result = gets.to_i
      if [0, 1].include? result
        puts add_point(result)
      else
        puts 'Fault! Second serve... Please only enter 0 or 1.'
      end
    end
    which_player_win
  end

  private

  # returns the player index for the opposition player
  def opposition(player_no)
    (player_no == 1) ? 0 : 1
  end
end
