# frozen_string_literal: true

require 'tennis_set'

describe TennisSet do
  subject(:tennis_set) { TennisSet.new }

  describe '#add_point' do
    it 'should add 1 point to the specified player' do
      expect { tennis_set.add_point(0) }.to change { tennis_set.points[0] }
        .from(0).to(1)
    end
    context 'when one player has at least six points' do
      context 'when the score is "5 : 0" and a point is added to player 0' do
        before { tennis_set.points = [5, 0] }
        it 'should return the win message' do
          expect(tennis_set.add_point(0)).to eq('Player 0 won the set')
        end
      end
      context 'when the score is "5 : 5" and a point is added to player 0' do
        before { tennis_set.points = [5, 5] }
        it 'should not return the win message' do
          expect(tennis_set.add_point(0)).not_to eq('Player 0 won the set')
        end
      end
      context 'when the score is "5 : 6" and a point is added to player 1' do
        before { tennis_set.points = [5, 6] }
        it 'should return the win message' do
          expect(tennis_set.add_point(1)).to eq('Player 1 won the set')
        end
      end
    end
  end
end
