# frozen_string_literal: true

RSpec.describe Codebreaker::Game do
  let(:game) { described_class.new Codebreaker::User.new('Daniil'), Codebreaker::Difficulty.new('hell') }
  let(:reverse_secret_code) { game.secret_code.reverse.join }
  describe '#check_attempt' do
    it 'returns hash' do
      expect(game.check_attempt(reverse_secret_code).class).to eq Hash
    end

    it 'hash has two keys' do
      expect(game.check_attempt(reverse_secret_code).size).to eq 2
    end

    it 'each hash value is an Integer' do
      expect(game.check_attempt(reverse_secret_code).each_value.all?(Integer)).to be true
    end

    context 'when current_attempts equal to zero' do
      it 'returns :lose' do
        game.difficulty.instance_variable_set(:@current_attempts, 0)
        expect(game.check_attempt(reverse_secret_code)).to eq :lose
      end
    end

    context 'when user code equal to secret code' do
      it 'returns :win' do
        expect(game.check_attempt(game.secret_code.join)).to eq :win
      end
    end
  end
end
