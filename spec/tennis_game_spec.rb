# frozen_string_literal: true

require 'tennis_game'
require 'player'

describe TennisGame do
  let(:p1) { Player.new('p1', 0) }
  let(:p2) { Player.new('p2', 1) }
  subject(:tennis_game) { TennisGame.new([p1, p2]) }

  describe '@points' do
    context 'at the start of game' do
      it 'should start with 0 points for both players' do
        expect(tennis_game.points).to eq([0, 0])
      end
    end
  end

  describe '#score' do
    context 'it converts the score into tennis scores' do
      subject(:score) { tennis_game.score }

      context 'at the start of game' do
        it { is_expected.to eq('Love : Love') }
      end

      context 'when score is "1 : 0"' do
        before { tennis_game.points = [1, 0] }
        it { is_expected.to eq('Fifteen : Love') }
      end

      context 'when score is "2 : 0"' do
        before { tennis_game.points = [2, 0] }
        it { is_expected.to eq('Thirty : Love') }
      end

      context 'when score is "3 : 0"' do
        before { tennis_game.points = [3, 0] }
        it { is_expected.to eq('Fourty : Love') }
      end

      context 'when deuce' do
        context 'when score is equal at 3 points' do
          before { tennis_game.points = [3, 3] }
          it { is_expected.to eq('Deuce') }
        end

        context 'when score is equal at 10 points' do
          before { tennis_game.points = [10, 10] }
          it { is_expected.to eq('Deuce') }
        end
      end

      context 'when advantage' do
        context 'when the score is "4 : 3"' do
          before { tennis_game.points = [4, 3] }
          it { is_expected.to eq('Advantage : Fourty') }
        end

        context 'when the score is "3 : 4"' do
          before { tennis_game.points = [3, 4] }
          it { is_expected.to eq('Fourty : Advantage') }
        end
      end

      context 'when a player has won' do
        context 'when the score is "4 : 0"' do
          before { tennis_game.points = [4, 0] }
          it { is_expected.to eq('p1 won the game') }
        end

        context 'when the score is "4 : 6"' do
          before { tennis_game.points = [3, 5] }
          it { is_expected.to eq('p2 won the game') }
        end
      end
    end
  end

  describe '#add_point' do
    it 'should add one point to the specified player' do
      expect { tennis_game.add_point(0) }.to change { tennis_game.points[0] }
        .from(0).to(1)
      expect { tennis_game.add_point(1) }.to change { tennis_game.points[1] }
        .from(0).to(1)
    end
    context 'when one player has the advantage and the other wins the point' do
      before { tennis_game.points = [3, 4] }
      it 'should reduce the points for the player at the advantage' do
        expect { tennis_game.add_point(0) }.to change { tennis_game.points[1] }
          .from(4).to(3)
      end
    end
  end
end
