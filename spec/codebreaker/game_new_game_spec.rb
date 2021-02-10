# frozen_string_literal: true

RSpec.describe Codebreaker::Game do
  let(:game) { described_class.new Codebreaker::User.new('Daniil'), Codebreaker::Difficulty.new('hell') }
  let(:previous_current_attempts) { game.difficulty.current_attempts }
  let(:previous_current_hints) { game.difficulty.current_hints }
  describe '.new_game' do
    it 'set secret code Array to secret_code' do
      game.new_game
      expect(game.secret_code.class).to eq Array
    end

    it 'set secret code to hints_list' do
      game.new_game
      expect(game.hints_list).to eq game.secret_code
    end

    it 'current_attempts are equal to previous game current_attempts' do
      game.new_game
      expect(game.difficulty.current_attempts).to eq previous_current_attempts
    end

    it 'current_hints are equal to previous game current_hints' do
      game.new_game
      expect(game.difficulty.current_hints).to eq previous_current_hints
    end
  end
end
