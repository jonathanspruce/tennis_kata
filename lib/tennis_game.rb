# frozen_string_literal: true

# TennisGame: used to manage the scoring in a tennis game
class TennisGame
  TENNIS_POINTS = %w(Love Fifteen Thirty Fourty).freeze
  attr_accessor :points
  def initialize
    # create score array with scores for both teams
    @points = [0, 0]
  end

  def score
    "#{TENNIS_POINTS[@points[0]]} : #{TENNIS_POINTS[@points[1]]}"
  end

  def add_point(team)
    @points[team] += 1
  end
end
