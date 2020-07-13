# frozen_string_literal: true

RSpec.describe Codebreaker::Core do
  describe 'check Core constants' do
    it 'check MIN_CODE_NUM constant' do
      expect(Codebreaker::Game::MIN_CODE_NUM).to eq 1
    end

    it 'check MAX_CODE_NUM constant' do
      expect(Codebreaker::Game::MAX_CODE_NUM).to eq 6
    end

    it 'check DIGITS_NUM constant' do
      expect(Codebreaker::Game::DIGITS_NUM).to eq 4
    end
  end
end
