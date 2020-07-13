# frozen_string_literal: true

RSpec.describe Codebreaker::User do
  let(:user) { described_class.new 'Daniil' }
  describe '.initialize' do
    it 'has name field' do
      expect(user.instance_variables).to include(:@name)
    end

    it 'raises NameIsNotStringError when name is not a String' do
      expect { described_class.new 45 }.to raise_error Codebreaker::NameIsNotStringError
    end

    it 'raises ShortNameError when name is too short' do
      expect { described_class.new 'Po' }.to raise_error Codebreaker::ShortNameError
    end

    it 'raises LongNameError when name is too long' do
      expect { described_class.new 'Romanadveratrelunders' }.to raise_error Codebreaker::LongNameError
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
