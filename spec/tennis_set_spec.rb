# frozen_string_literal: true

require 'tennis_set'
require 'player'

describe TennisSet do
  let(:p1) { Player.new('p1', 0) }
  let(:p2) { Player.new('p2', 1) }
  subject(:tennis_set) { TennisSet.new(true, [p1, p2]) }

  describe '#add_point' do
    it 'should add 1 point to the specified player' do
      expect { tennis_set.add_point(0) }.to change { tennis_set.points[0] }
        .from(0).to(1)
    end
    context 'when one player has at least six points' do
      context 'when the score is "5 : 0" and a point is added to player 0' do
        before { tennis_set.points = [5, 0] }
        it 'should return the win message' do
          expect(tennis_set.add_point(0)).to eq('p1 won the set')
        end
      end
      context 'when the score is "5 : 5" and a point is added to player 0' do
        before { tennis_set.points = [5, 5] }
        it 'should not return the win message' do
          expect(tennis_set.add_point(0)).not_to eq('p1 won the set')
        end
      end
      context 'when the score is "5 : 6" and a point is added to player 1' do
        before { tennis_set.points = [5, 6] }
        it 'should return the win message' do
          expect(tennis_set.add_point(1)).to eq('p2 won the set')
        end
      end
    end
  end
end
