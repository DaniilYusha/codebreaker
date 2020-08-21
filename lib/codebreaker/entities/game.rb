# frozen_string_literal: true

module Codebreaker
  class Game
    include Validator
    attr_reader :user, :difficulty, :secret_code, :hints_list, :errors, :date

    MIN_CODE_NUM = 1
    MAX_CODE_NUM = 6
    DIGITS_NUM = 4

    def initialize(user, difficulty)
      @user = user
      @difficulty = difficulty
      @secret_code = generate_secret_code
      @hints_list = secret_code.clone
      @errors = []
      @date = Time.now.strftime('%Y-%m-%d - %H:%M:%S')
    end

    def take_hint
      difficulty.current_hints -= 1
      index = rand(hints_list.size)
      digit = hints_list[index]
      hints_list.delete_at index
      digit
    end

    def check_attempt(guess)
      difficulty.current_attempts -= 1
      GuessChecker.new(secret_code.clone, guess).check
    end

    def new_game
      @secret_code = generate_secret_code
      @hints_list = @secret_code.clone
      @difficulty.current_attempts = @difficulty.attempts.clone
      @difficulty.current_hints = @difficulty.hints.clone
    end

    def lose?
      difficulty.current_attempts.zero?
    end

    def win?(user_code)
      user_code == secret_code.join
    end

    def no_hints?
      difficulty.current_hints.zero?
    end

    private

    def generate_secret_code
      DIGITS_NUM.times.map { rand(MIN_CODE_NUM..MAX_CODE_NUM) }
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
