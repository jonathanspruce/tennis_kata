# frozen_string_literal: true

class Player
  attr_accessor :name, :id, :opp_id

  def initialize(name, id)
    @name = name
    @id = id
    @opp_id = id % 1 # gets the opposite of id
  end
end
