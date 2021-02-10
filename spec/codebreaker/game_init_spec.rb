# frozen_string_literal: true

RSpec.describe Codebreaker::Game do
  let(:user) { Codebreaker::User.new 'Daniil' }
  let(:difficulty) { Codebreaker::Difficulty.new 'hell' }
  let(:game) { described_class.new user, difficulty }
  describe '.init' do
    it 'secret code is an Array' do
      expect(game.secret_code.class).to eq Array
    end

    it 'secret code size equal to DIGITS_NUM constant' do
      expect(game.secret_code.size).to eq described_class::DIGITS_NUM
    end

    it 'each element of secret code is between MIN_CODE_NUM and MAX_CODE_NUM contstants' do
      game.secret_code.each do |digit|
        expect(digit).to be_between(described_class::MIN_CODE_NUM, described_class::MAX_CODE_NUM).inclusive
      end
    end

    it 'hints list is equal to secret code' do
      expect(game.hints_list).to eq game.secret_code
    end

    it 'user field class equal to User' do
      expect(game.user.class).to eq Codebreaker::User
    end

    it 'difficulty field class equal to Difficulty' do
      expect(game.difficulty.class).to eq Codebreaker::Difficulty
    end
  end
end
