# frozen_string_literal: true

RSpec.describe Codebreaker::Game do
  let(:user) { Codebreaker::User.new 'Daniil' }
  let(:difficulty) { Codebreaker::Difficulty.new 'hell' }
  let(:game) { described_class.new user, difficulty }

  describe '#take_hint' do
    it 'returns Integer' do
      expect(game.take_hint.class).to eq Integer
    end

    it 'returns number from secret code' do
      expect(game.secret_code).to include game.take_hint
    end

    it 'returns only one number' do
      expect(game.take_hint.to_s.size).to eq 1
    end

    it 'changes current_hints counter by 1' do
      expect { game.take_hint }.to change { difficulty.instance_variable_get(:@current_hints) }.by(-1)
    end

    it 'removes one element from hints list' do
      expect { game.take_hint }.to change { game.instance_variable_get(:@hints_list).size }.by(-1)
    end
  end
end
