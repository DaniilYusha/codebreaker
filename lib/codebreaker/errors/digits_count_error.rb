# frozen_string_literal: true

module Codebreaker
  # DigitsCountError class called when a digits count greater than setpoint
  class DigitsCountError < StandardError
    def message
      'Invalid digits count'
    end
  end
end
