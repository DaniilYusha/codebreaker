# frozen_string_literal: true

RSpec.describe Codebreaker::GuessChecker do
  describe '.validate' do
    it 'raises DigitsCountError when digits count is invalid' do
      expect { described_class.validate('102') }.to raise_error Codebreaker::DigitsCountError
    end

    it 'raises DigitRangeError when any digit is not in the range' do
      expect { described_class.validate('6969') }.to raise_error Codebreaker::DigitRangeError
    end
  end
end
