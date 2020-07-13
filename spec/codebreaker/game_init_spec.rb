# frozen_string_literal: true

RSpec.describe Codebreaker::Game do
  let(:user) { Codebreaker::User.new 'Daniil' }
  let(:difficulty) { Codebreaker::Difficulty.new 'hell' }
  let(:game) { described_class.new user, difficulty }
  describe '.init' do
    it 'raises ArgumentError when first argument is not User instance' do
      expect { described_class.new('user', difficulty) }.to raise_error ArgumentError
    end

    it 'raises ArgumentError when second argument is not Difficult instance' do
      expect { described_class.new(user, 'difficulty') }.to raise_error ArgumentError
    end

    it 'saves a secret code' do
      expect(game.instance_variable_get(:@secret_code)).not_to be_empty
    end

    it 'hints list is equal to secret code' do
      expect(game.instance_variable_get(:@secret_code)).to eq game.instance_variable_get(:@hints_list)
    end

    it 'user field class equal to User' do
      expect(game.instance_variable_get(:@user).class).to eq Codebreaker::User
    end

    it 'difficulty field class equal to Difficulty' do
      expect(game.instance_variable_get(:@difficulty).class).to eq Codebreaker::Difficulty
    end
  end
end
