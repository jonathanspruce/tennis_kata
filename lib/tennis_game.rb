# frozen_string_literal: true

# TennisGame: used to manage the scoring in a tennis game
class TennisGame
  TENNIS_POINTS = %w(Love Fifteen Thirty Fourty Advantage).freeze

  attr_accessor :points, :winner

  def initialize
    # create score array with scores for both teams
    @points = [0, 0]
  end

  # converts the score into a the tennis scores
  def score
    return 'Deuce' if deuce?
    if win?
      @winner = which_player_win
      return "Player #{which_player_win} Win!"
    end
    # else just show converted scores
    "#{TENNIS_POINTS[@points[0]]} : #{TENNIS_POINTS[@points[1]]}"
  end

  # checks whether the players are currently at deuce:
  # the players both have at least 3 points and the points are equal
  def deuce?
    @points[0] >= 3 && @points[1] == @points[0]
  end

  def win?
    true unless which_player_win.nil?
  end

  def which_player_win
    @points.index(@points.max) if (@points[0] >= 4 ||
        @points[1] >= 4) && (@points[0] - @points[1]).abs >= 2
  end

  # used to add one point to the specified player
  def add_point(player_no)
    # get opposition index number
    opp_no = opposition(player_no)
    # if the opposition has the advantage -1 from their score,
    # else add to the player that won the point
    (@points[opp_no] == 4) ? @points[opp_no] -= 1 : @points[player_no] += 1
  end

  private

  # returns the player index for the opposition player
  def opposition(player_no)
    (player_no == 1) ? 0 : 1
  end
end
