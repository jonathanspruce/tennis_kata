# frozen_string_literal: true

require 'tennis_score'
require 'player'

describe TennisScore do
<<<<<<< HEAD
  subject(:tennis_score) { TennisScore.new(5, 2, 'test') }
=======
  let(:p1) { Player.new('p1', 0) }
  let(:p2) { Player.new('p2', 1) }
  subject(:tennis_score) { TennisScore.new(5, 2, 'test', [p1, p2]) }
>>>>>>> player

  describe '#score' do
    subject { tennis_score.score }
    context 'at initialization' do
      it { is_expected.to eq("Test score:\n0 : 0") }
    end

    context 'once points have been scored' do
      before do
        tennis_score.add_point(0)
        tennis_score.add_point(1)
      end
      it { is_expected.to eq("Test score:\n1 : 1") }
    end
  end

  describe '#win?' do
    subject { tennis_score.win? }
    context 'when there is no winner' do
      it { is_expected.to be_falsey }
    end

    context 'when there is a winner' do
      before { tennis_score.points = [5, 0] }
      it { is_expected.to be_truthy }
    end
  end

  describe '#which_player_win' do
    subject { tennis_score.which_player_win }
    context 'when there is no winner' do
      it { is_expected.to be_nil }
    end

    context 'when player 0 wins' do
      before { tennis_score.points = [5, 0] }
      it { is_expected.to eq(0) }
    end

    context 'when player 1 wins' do
      before { tennis_score.points = [0, 5] }
      it { is_expected.to eq(1) }
    end
  end

  describe '#add_point' do
    it 'should add 1 point to the specified player' do
      expect { tennis_score.add_point(0) }.to change { tennis_score.points[0] }
        .from(0).to(1)
      expect { tennis_score.add_point(1) }.to change { tennis_score.points[1] }
        .from(0).to(1)
    end

    context 'when a player has won' do
      it 'returns the win message with which player won included' do
        tennis_score.points = [4, 0]
<<<<<<< HEAD
        expect(tennis_score.add_point(0)).to eq('Player 0 won the test')
        tennis_score.points = [0, 4]
        expect(tennis_score.add_point(1)).to eq('Player 1 won the test')
=======
        expect(tennis_score.add_point(0)).to eq('p1 won the test')
        tennis_score.points = [0, 4]
        expect(tennis_score.add_point(1)).to eq('p2 won the test')
>>>>>>> player
      end
    end
  end
end
