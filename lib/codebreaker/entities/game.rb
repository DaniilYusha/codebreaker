# frozen_string_literal: true

module Codebreaker
  # Game class contains game scripts
  class Game
    include Validator
    attr_reader :user, :difficulty, :secret_code, :hints_list

    WIN = :win
    LOSE = :lose

    def initialize(user, difficulty)
      validate user, difficulty

      @user = user
      @difficulty = difficulty
      @secret_code = Core.new.generate_secret_code
      @hints_list = @secret_code.clone
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

      @secret_code_clone = @secret_code.clone
      Core.new.calculate_matches @secret_code_clone, user_code_array
    end

    def pack_game_data
      name = user.name
      difficulty = difficulty.kind
      attempts_total = difficulty.attempts
      attempts_used = attempts_total - difficulty.current_attempts
      hints_total = difficulty.hints
      hints_used = hints_total - difficulty.current_hints
      {
        name: name, difficulty: difficulty,
        attempts_total: attempts_total, attempts_used: attempts_used,
        hints_total: hints_total, hints_used: hints_used
      }
    end

    private

    def validate_guess(guess_array)
      raise DigitsCountError unless guess_array.count == Core::DIGITS_NUM
      raise DigitRangeError unless guess_array.all? { |digit| digit.between? Core::MIN_CODE_NUM, Core::MAX_CODE_NUM }
    end

    def validate(user, difficulty)
      compare_classes user.class, User
      compare_classes difficulty.class, Difficulty
    end

    def lose?
      @difficulty.current_attempts.zero?
    end

    def win?(user_code_array)
      user_code_array == @secret_code
    end
  end
end
