# frozen_string_literal: true

module Codebreaker
  class Game
    include Validator
    attr_reader :user, :difficulty, :secret_code, :hints_list, :errors

    MIN_CODE_NUM = 1
    MAX_CODE_NUM = 6
    DIGITS_NUM = 4
    WIN = :win
    LOSE = :lose

    def initialize(user, difficulty)
      @user = user
      @difficulty = difficulty
      @secret_code = generate_secret_code
      @hints_list = secret_code.clone
      @errors = []
    end

    def take_hint
      return nil if difficulty.current_hints.zero?

      difficulty.current_hints -= 1
      index = rand(hints_list.size)
      digit = hints_list[index]
      hints_list.delete_at index
      digit
    end

    def check_attempt(guess)
      return LOSE if lose?

      difficulty.current_attempts -= 1
      return WIN if win? guess

      GuessChecker.new(secret_code.clone, guess).check
    end

    private

    def generate_secret_code
      DIGITS_NUM.times.map { rand(MIN_CODE_NUM..MAX_CODE_NUM) }
    end

    def lose?
      difficulty.current_attempts.zero?
    end

    def win?(user_code)
      user_code == secret_code.join
    end

    def validate!
      validate_user
      validate_difficulty if errors.empty?
    end

    def validate_user
      errors << ExpectedUserInstanceError unless user.class == Codebreaker::User
    end

    def validate_difficulty
      errors << ExpectedDifficultyInstanceError unless difficulty.class == Codebreaker::Difficulty
    end
  end
end
