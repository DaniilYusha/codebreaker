# frozen_string_literal: true

RSpec.describe Codebreaker::Game do
  describe 'check Game constants' do
    it 'check WIN constant' do
      expect(described_class::WIN).to eq :win
    end

    it 'check LOSE constant' do
      expect(described_class::LOSE).to eq :lose
    end
  end
end
