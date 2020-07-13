# frozen_string_literal: true

RSpec.describe Codebreaker::FileLoader do
  let(:game) { Codebreaker::Game.new Codebreaker::User.new('Daniil'), Codebreaker::Difficulty.new('hell') }
  let(:path) { './lib/codebreaker/db/test.yaml' }
  describe '#store' do
    after(:each) { File.delete(path) }

    it 'create file' do
      game.store(path, game.pack_game_data)
      expect(File.exist?(path)).to be true
    end
  end

  describe '#load' do
    after(:each) { File.delete(path) }

    it 'returns Array' do
      game.store(path, game.pack_game_data)
      expect(game.load(path).class).to be Array
    end

    it 'each array element is a Hash' do
      game.store(path, game.pack_game_data)
      expect(game.load(path).all?(Hash)).to be true
    end
  end
end
