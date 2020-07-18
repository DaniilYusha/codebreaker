# frozen_string_literal: true

module Codebreaker
  class Game
    include Validator
    include FileLoader
    include Core
    attr_reader :user, :difficulty, :secret_code, :hints_list, :errors

    WIN = :win
    LOSE = :lose

    def initialize(user, difficulty)
      @user = user
      @difficulty = difficulty
      @secret_code = generate_secret_code
      @hints_list = @secret_code.clone
      @errors = []
    end

    def take_hint
      return nil if @difficulty.current_hints.zero?

      @difficulty.current_hints -= 1
      index = rand(@hints_list.size)
      digit = @hints_list[index]
      @hints_list.delete_at index
      digit
    end

    def check_attempt(guess)
      return LOSE if lose?

      user_code_array = guess.split('').map(&:to_i)
      validate_guess user_code_array
      @difficulty.current_attempts -= 1
      return WIN if win? user_code_array

      @secret_code_copy = @secret_code.clone
      calculate_matches user_code_array
    end

    private

    def validate_guess(guess_array)
      raise DigitsCountError unless guess_array.count == DIGITS_NUM
      raise DigitRangeError unless guess_array.all? { |digit| digit.between? MIN_CODE_NUM, MAX_CODE_NUM }
    end

    def lose?
      @difficulty.current_attempts.zero?
    end

    def win?(user_code_array)
      user_code_array == @secret_code
    end

    def validate!
      validate_user
      validate_difficulty if @errors.empty?
    end

    def validate_user
      @errors << ExpectedUserInstanceError unless @user.class == Codebreaker::User
    end

    def validate_difficulty
      @errors << ExpectedDifficultyInstanceError unless @difficulty.class == Codebreaker::Difficulty
    end
  end
end
