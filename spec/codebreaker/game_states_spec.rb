# frozen_string_literal: true

RSpec.describe Codebreaker::Game do
  let(:range) { (described_class::MIN_CODE_NUM..described_class::MAX_CODE_NUM - 1).to_a }
  let(:game) { described_class.new Codebreaker::User.new('Daniil'), Codebreaker::Difficulty.new('hell') }
  let(:user_code) { game.secret_code.map { |digit| range.include?(digit) ? digit.next : digit.pred }.join }
  describe '.lose?' do
    it 'returns false when attempts are set' do
      expect(game.lose?).to eq false
    end

    it 'returns true when attempts are equal to zero' do
      game.difficulty.instance_variable_set(:@current_attempts, 0)
      expect(game.lose?).to eq true
    end
  end

  describe '.win?' do
    it 'returns false when user code is not equal to secret code' do
      expect(game.win?(user_code)).to eq false
    end

    it 'returns true when user code is equal to secret code' do
      expect(game.win?(game.secret_code.join)).to eq true
    end
  end

  describe '.no_hints?' do
    it 'returns false when hints are set' do
      expect(game.no_hints?).to eq false
    end

    it 'returns true when hints are equal to zero' do
      game.difficulty.instance_variable_set(:@current_hints, 0)
      expect(game.no_hints?).to eq true
    end
  end
end
