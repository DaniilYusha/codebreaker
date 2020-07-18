# frozen_string_literal: true

RSpec.describe Codebreaker::Game do
  describe 'check Game constants' do
    it 'check MIN_CODE_NUM constant' do
      expect(described_class::MIN_CODE_NUM).to eq 1
    end

    it 'check MAX_CODE_NUM constant' do
      expect(described_class::MAX_CODE_NUM).to eq 6
    end

    it 'check DIGITS_NUM constant' do
      expect(described_class::DIGITS_NUM).to eq 4
    end
    it 'check WIN constant' do
      expect(described_class::WIN).to eq :win
    end

    it 'check LOSE constant' do
      expect(described_class::LOSE).to eq :lose
    end
  end
end
