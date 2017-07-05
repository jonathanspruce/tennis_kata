# frozen_string_literal: true

require_relative 'tennis_game'
require_relative 'tennis_score'

# defines a tennis set, and handles all scoring for the game
class TennisSet < TennisScore
  def initialize
    super(6, 2, 'Player %s won the set')
  end
end
