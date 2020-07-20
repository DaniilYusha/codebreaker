# frozen_string_literal: true

RSpec.describe Codebreaker::Game do
  let(:range) { (described_class::MIN_CODE_NUM..described_class::MAX_CODE_NUM - 1).to_a }
  let(:game) { described_class.new Codebreaker::User.new('Daniil'), Codebreaker::Difficulty.new('hell') }
  let(:user_code) { game.secret_code.map { |digit| range.include?(digit) ? digit.next : digit.pred }.join }
  describe '#check_attempt' do
    it 'returns hash' do
      expect(game.check_attempt(user_code).class).to eq Hash
    end

    it 'hash has two keys' do
      expect(game.check_attempt(user_code).size).to eq 2
    end

    it 'each hash value is an Integer' do
      expect(game.check_attempt(user_code).each_value.all?(Integer)).to be true
    end
  end
end
