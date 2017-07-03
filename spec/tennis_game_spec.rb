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
          it { is_expected.to eq('Advantage Team 0') }
        end

        context 'when the score is "4 : 5"' do
          before { tennis_game.points = [4, 5] }
          it { is_expected.to eq('Advantage Team 1') }
        end
      end

      context 'when a team has won' do
        context 'when the score is "4 : 0"' do
          before { tennis_game.points = [4, 0] }
          it { is_expected.to eq('Team 0 Win!') }
        end

        context 'when the score is "4 : 6"' do
          before { tennis_game.points = [4, 6] }
          it { is_expected.to eq('Team 1 Win!') }
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
