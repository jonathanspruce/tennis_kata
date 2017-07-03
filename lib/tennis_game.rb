# frozen_string_literal: true

# TennisGame: used to manage the scoring in a tennis game
class TennisGame
  TENNIS_POINTS = %w(Love Fifteen Thirty Fourty).freeze
  attr_accessor :points
  def initialize
    # create score array with scores for both teams
    @points = [0, 0]
  end

  # converts the score into a the tennis scores
  def score
    if deuce?
      'Deuce'
    # if both teams have at least 3 points but are not equal
    elsif advantage?
      "Advantage Team #{which_team_advantage}"
    elsif win?
      "Team #{which_team_win} Win!"
    else
      # just show converted scores
      "#{TENNIS_POINTS[@points[0]]} : #{TENNIS_POINTS[@points[1]]}"
    end
  end

  # checks whether the teams are currently at deuce:
  # the teams both have at least 3 points and the points are equal
  def deuce?
    @points[0] >= 3 && @points[1] == @points[0]
  end

  # returns true or false depending on whether any team has the advantage
  def advantage?
    true unless which_team_advantage.nil?
  end

  # checks whether a team has an advantage, and passes the index of the
  # team with the advantage
  def which_team_advantage
    # return the index of the team with the advantage,
    # if there is only one point difference
    @points.index(@points.max) if (@points[0] >= 3 && @points[1] >= 3) &&
        (@points[0] - @points[1]).abs == 1
  end

  def win?
    true unless which_team_win.nil?
  end

  def which_team_win
    @points.index(@points.max) if (@points[0] >= 4 || @points[1] >= 4) &&
        (@points[0] - @points[1]).abs >= 2
  end

  # used to add one point to the specified team
  def add_point(team)
    @points[team] += 1
  end
end
