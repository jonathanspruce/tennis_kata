# frozen_string_literal: true

require 'tennis_game'

describe TennisGame do
  subject(:tennis_game) { TennisGame.new }
  describe '@points' do
    context 'at the start of game' do
      it 'should start with 0 points for both players' do
        expect(tennis_game.points).to eq([0, 0])
      end
    end
  end
  describe '#score' do
    context 'it converts the score into tennis scores' do
      context 'at the start of game' do
        it 'should have a score of "Love" for both players' do
          expect(tennis_game.score).to eq('Love : Love')
        end
      end
      context 'when a team has one point' do
        it 'should output "Fifteen" for that team' do
          tennis_game.add_point(0)
          expect(tennis_game.score).to eq('Fifteen : Love')
        end
      end
    end
  end
  describe '#add_point' do
    it 'should add one point to the specified team' do
      expect { tennis_game.add_point(0) }.to change { tennis_game.points[0] }
        .from(0).to(1)
      expect { tennis_game.add_point(1) }.to change { tennis_game.points[1] }
        .from(0).to(1)
    end
  end
end
