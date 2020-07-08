# frozen_string_literal: true

module Codebreaker
  # DigitRangeError class called when the digit is not in a correct range
  class DigitRangeError < StandardError
    def message
      'Digit is not in a range'
    end
  end
end
