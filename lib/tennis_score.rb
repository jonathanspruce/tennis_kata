# frozen_string_literal: true

# abstract class used to manage basic elements of scoring in
# all stages of a tennis match
class TennisScore
  attr_accessor :points, :winner, :players

  def initialize(min_win, win_by, type, players)
    # create score array with scores for both teams
    @points = [0, 0]
    @min_win = min_win # defines the minimum points a player must have to win
    @win_by = win_by # defines the number of points more a player must have than their opposition to win
    @type = type # usually game/set/match
    @players = players # the two player objects for the match
  end

  # converts the score into a the tennis scores
  def score
    "#{@type.capitalize} score:\n#{@points[0]} : #{@points[1]}"
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
    # return the score if just normal play, else return win message
    win? ? win_message : score
  end

  def total_points
    points.reduce(:+)
  end

  private

  def win_message
    format('%s won the %s', @players[which_player_win].name, @type)
  end
end
