# frozen_string_literal: true

require 'tennis_match'
require 'player'

describe TennisMatch do
  let(:p1) { Player.new('p1', 0) }
  let(:p2) { Player.new('p2', 1) }
  let(:tennis_match_3) { TennisMatch.new(3, [p1, p2]) }
  let(:tennis_match_5) { TennisMatch.new(5, [p1, p2]) }

  describe '#add_point' do
    context 'when one player reaches five points' do
      context 'when player 0 is one point away from winning
          and a point is added to player 0' do
        before { tennis_match_3.points = [2, 0] }
        before { tennis_match_5.points = [4, 0] }
        it 'should return the win message' do
          expect(tennis_match_3.add_point(0)).to eq('p1 won the match')
          expect(tennis_match_5.add_point(0)).to eq('p1 won the match')
        end
      end
      context 'when both players are one point away from winning and
          a point is won' do
        before { tennis_match_3.points = [2, 2] }
        before { tennis_match_5.points = [4, 4] }
        it 'should still return the win message' do
          expect(tennis_match_3.add_point(0)).to eq('p1 won the match')
          expect(tennis_match_5.add_point(1)).to eq('p2 won the match')
        end
      end
    end
  end
end
