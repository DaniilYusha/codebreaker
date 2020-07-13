# frozen_string_literal: true

RSpec.describe Codebreaker::Game do
  let(:game) { described_class.new Codebreaker::User.new('Daniil'), Codebreaker::Difficulty.new('hell') }
  describe '#pack_game_data' do
    it 'returns hash' do
      expect(game.pack_game_data.class).to eq Hash
    end

    it 'hash has 6 keys' do
      expect(game.pack_game_data.size).to eq 6
    end
  end
end
