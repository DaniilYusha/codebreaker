# frozen_string_literal: true

module Codebreaker
  # ExpectedDifficultyInstanceError class called when object is not an instance of Difficulty class
  class ExpectedDifficultyInstanceError < StandardError
    def message
      'Object should be an instance of Difficulty class'
    end
  end
end
