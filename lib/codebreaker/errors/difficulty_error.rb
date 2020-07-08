# frozen_string_literal: true

module Codebreaker
  # DifficultyError class called when the difficulty is entered incorrectly
  class DifficultyError < StandardError
    def message
      'No such difficulty'
    end
  end
end
