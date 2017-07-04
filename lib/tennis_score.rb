# frozen_string_literal: true

# abstract class used to manage basic elements of scoring in
# all stages of a tennis match
class TennisScore
  attr_accessor :points, :winner

  def initialize(min_win, win_by = 0)
    # create score array with scores for both teams
    @points = [0, 0]
    @min_win = min_win # defines the minimum points a player must have to win
    @win_by = win_by # defines the number of points more a player must have than their opposition to win
  end

  # converts the score into a the tennis scores
  def score
    raise 'This method should be defined by child class'
  end

  def win?
    true unless which_player_win.nil?
  end

  def which_player_win
    @winner = @points.index(@points.max) if (@points[0] >= @min_win ||
        @points[1] >= @min_win) && (@points[0] - @points[1]).abs >= @win_by
  end

  def add_point(player_id)
    @points[player_id] += 1
  end
end
