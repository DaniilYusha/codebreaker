# frozen_string_literal: true

module Codebreaker
  class Difficulty
    include Validator
    attr_reader :kind, :attempts, :hints, :errors
    attr_accessor :current_attempts, :current_hints

    DIFFICULTIES_LIST = { easy: { attempts: 15, hints: 2 },
                          medium: { attempts: 10, hints: 1 },
                          hell: { attempts: 5, hints: 1 } }.freeze

    def initialize(difficulty)
      @kind = difficulty.to_sym
      @attempts = DIFFICULTIES_LIST.dig(@kind, :attempts)
      @hints = DIFFICULTIES_LIST.dig(@kind, :hints)
      @current_attempts = @attempts.clone
      @current_hints = @hints.clone
      @errors = []
    end

    private

    def validate!
      validate_difficulty
    end

    def validate_difficulty
      @errors << DifficultyError unless DIFFICULTIES_LIST.include? @kind
    end
  end
end
