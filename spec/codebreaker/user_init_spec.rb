# frozen_string_literal: true

RSpec.describe Codebreaker::User do
  let(:user) { described_class.new 'Daniil' }
  describe '.initialize' do
    it 'has name and errors field field' do
      expect(user.instance_variables).to include(:@name, :@errors)
    end
  end

  describe 'check User constants' do
    it 'check content of NAME_MIN_LENGTH constant' do
      expect(described_class::NAME_MIN_LENGTH).to eq(3)
    end

    it 'check content of NAME_MAX_LENGTH constant' do
      expect(described_class::NAME_MAX_LENGTH).to eq(20)
    end
  end
end
