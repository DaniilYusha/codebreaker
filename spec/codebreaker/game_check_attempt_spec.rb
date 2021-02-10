# frozen_string_literal: true

RSpec.describe Codebreaker::Game do
  let(:range) { (described_class::MIN_CODE_NUM..described_class::MAX_CODE_NUM - 1).to_a }
  let(:game) { described_class.new Codebreaker::User.new('Daniil'), Codebreaker::Difficulty.new('hell') }
  describe '#check_attempt' do
    it 'returns hash' do
      expect(game.check_attempt('2456').class).to eq Hash
    end

    it 'hash has three keys' do
      expect(game.check_attempt('6163').size).to eq 3
    end

    it 'each hash value is an Integer' do
      expect(game.check_attempt('4531').each_value.all?(Integer)).to be true
    end
  end
end
