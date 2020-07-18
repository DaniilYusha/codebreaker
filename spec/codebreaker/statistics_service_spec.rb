# frozen_string_literal: true

RSpec.describe Codebreaker::StatisticsService do
  let(:game) { Codebreaker::Game.new Codebreaker::User.new('Daniil'), Codebreaker::Difficulty.new('hell') }
  let(:path) { './lib/codebreaker/test.yaml' }
  let(:service) { described_class.new(game, path) }
  describe '#store' do
    after(:each) { File.delete(path) }

    it 'create file' do
      service.store
      expect(File.exist?(path)).to be true
    end
  end

  describe '#load' do
    after(:each) { File.delete(path) }

    it 'returns Array' do
      service.store
      expect(service.load.class).to be Array
    end

    it 'each array element is a Hash' do
      service.store
      expect(service.load.all?(Hash)).to be true
    end
  end
end
