# frozen_string_literal: true

RSpec.describe Codebreaker::Core do
  let(:game) { Class.new { extend Codebreaker::Core } }
  describe '#generate_secret_code' do
    it 'returns Array' do
      expect(game.generate_secret_code.class).to eq Array
    end

    it 'array size equal to DIGITS_NUM constant' do
      expect(game.generate_secret_code.size).to eq Codebreaker::Game::DIGITS_NUM
    end

    it 'each element is between MIN_CODE_NUM and MAX_CODE_NUM contstants' do
      game.generate_secret_code.each do |digit|
        expect(digit).to be_between(Codebreaker::Game::MIN_CODE_NUM, Codebreaker::Game::MAX_CODE_NUM).inclusive
      end
    end

    context 'when we call generate_secret_code several times' do
      let(:first_secret_code) { game.generate_secret_code }
      let(:second_secret_code) { game.generate_secret_code }
      it 'returns different arrays' do
        expect(first_secret_code).not_to eq second_secret_code
      end
    end
  end
end
