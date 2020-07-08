# frozen_string_literal: true

module Codebreaker
  # Difficulty class contains list of game difficulties
  class Difficulty
    attr_reader :difficulty
    attr_accessor :attempts_num, :hints_num

    LIST = { easy: { attempts: 15, hints: 2 },
             medium: { attempts: 10, hints: 1 },
             hell: { attempts: 5, hints: 1 } }.freeze

    def initialize(difficulty)
      validate difficulty
      @difficulty = difficulty.to_sym
      @attempts_num = LIST[@difficulty][:attempts]
      @hints_num = LIST[@difficulty][:hints]
    end

    private

    def validate_difficulty(difficulty)
      raise DifficultyError unless LIST.include? difficulty.to_sym
    end

    def validate(difficulty)
      validate_difficulty difficulty
    end
  end
end
