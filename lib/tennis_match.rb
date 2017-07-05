# frozen_string_literal: true

# helps score for a full tennis match
class TennisMatch < TennisScore
  def initialize(set_number)
    super(set_number, 0, 'Player %s won the match')
  end
end
