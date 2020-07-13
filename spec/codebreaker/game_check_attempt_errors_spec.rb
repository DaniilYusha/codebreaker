# frozen_string_literal: true

RSpec.describe Codebreaker::Game do
  let(:game) { described_class.new Codebreaker::User.new('Daniil'), Codebreaker::Difficulty.new('hell') }
  describe '#check_attempt' do
    it 'raises DigitsCountError when digits count not equal to DIGITS_NUM' do
      incorrect_code = Codebreaker::Game::MAX_CODE_NUM.to_s * (Codebreaker::Game::DIGITS_NUM + 1)
      expect { game.check_attempt(incorrect_code) }.to raise_error Codebreaker::DigitsCountError
    end

    it 'raises DigitRangeError when each digit not into the range MIN_CODE_NUM..MAX_CODE_NUM' do
      incorrect_code = (Codebreaker::Game::MAX_CODE_NUM. + 1).to_s * Codebreaker::Game::DIGITS_NUM
      expect { game.check_attempt(incorrect_code) }.to raise_error Codebreaker::DigitRangeError
    end
  end
end
