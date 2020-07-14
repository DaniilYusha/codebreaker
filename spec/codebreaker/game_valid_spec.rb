# frozen_string_literal: true

RSpec.describe Codebreaker::Game do
  let(:game_with_invalid_user) { described_class.new 228, Codebreaker::Difficulty.new('hell') }
  let(:game_with_invalid_difficulty) { described_class.new Codebreaker::User.new('Daniil'), 'hell' }
  describe '#valid?' do
    context 'when first passed parameter is not an instance of User' do
      it 'returns false' do
        expect(game_with_invalid_user.valid?).to eq false
      end

      it 'adds ExpectedUserInstanceError to errors' do
        game_with_invalid_user.valid?
        expect(game_with_invalid_user.errors).to include Codebreaker::ExpectedUserInstanceError
      end
    end

    context 'when second passed parameter is not an instance of Difficulty' do
      it 'returns false' do
        expect(game_with_invalid_difficulty.valid?).to eq false
      end

      it 'adds ExpectedDifficultyInstanceError to errors' do
        game_with_invalid_difficulty.valid?
        expect(game_with_invalid_difficulty.errors).to include Codebreaker::ExpectedDifficultyInstanceError
      end
    end
  end
end
