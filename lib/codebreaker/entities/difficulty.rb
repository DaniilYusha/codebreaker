# frozen_string_literal: true

module Codebreaker
  # Difficulty class contains list of game difficulties
  class Difficulty
    attr_reader :kind, :attempts, :hints, :errors
    attr_accessor :current_attempts, :current_hints

    LIST = { easy: { attempts: 15, hints: 2 },
             medium: { attempts: 10, hints: 1 },
             hell: { attempts: 5, hints: 1 } }.freeze

    def initialize(difficulty)
      @kind = difficulty.to_sym
      @attempts = LIST[@kind][:attempts]
      @current_attempts = @attempts.clone
      @hints = LIST[@kind][:hints]
      @current_hints = @hints.clone
      @errors = []
    end

    private

    def validate_difficulty
      @errors << DifficultyError unless LIST.include? @kind
    end

    def validate(difficulty)
      validate_difficulty difficulty
    end
  end
end
