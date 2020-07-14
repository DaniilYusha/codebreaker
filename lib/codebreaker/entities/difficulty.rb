# frozen_string_literal: true

module Codebreaker
  # Difficulty class contains list of game difficulties
  class Difficulty
    include Validator
    attr_reader :kind, :attempts, :hints, :errors
    attr_accessor :current_attempts, :current_hints

    LIST = { easy: { attempts: 15, hints: 2 },
             medium: { attempts: 10, hints: 1 },
             hell: { attempts: 5, hints: 1 } }.freeze

    def initialize(difficulty)
      @kind = difficulty.to_sym
      @attempts = LIST.dig(@kind, :attempts)
      @hints = LIST.dig(@kind, :hints)
      @current_attempts = @attempts.clone
      @current_hints = @hints.clone
      @errors = []
    end

    private

    def validate!
      validate_difficulty
    end

    def validate_difficulty
      @errors << DifficultyError unless LIST.include? @kind
    end
  end
end
