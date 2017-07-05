# frozen_string_literal: true

require 'player'

describe Player do
  let(:name) { 'Rodger Federer' }
  let(:id) { 0 }
  let(:opp_id) { 1 }
  it 'should return all instance variables' do
    player = Player.new(name, id)
    expect(player.name).to eq(name)
    expect(player.id).to eq(id)
    expect(player.opp_id).to eq(opp_id)
  end
end
