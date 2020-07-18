# frozen_string_literal: true

module Codebreaker
  module Core
    MIN_CODE_NUM = 1
    MAX_CODE_NUM = 6
    DIGITS_NUM = 4

    def generate_secret_code
      DIGITS_NUM.times.map { rand(MIN_CODE_NUM..MAX_CODE_NUM) }
    end

    def calculate_matches(user_code_array)
      @exact_mathes = 0
      @inexact_matches = 0
      @secret_code_copy.zip(user_code_array).each do |secret_digit, user_digit|
        next unless @secret_code_copy.include? user_digit

        next add_digit_match user_digit, true if secret_digit == user_digit

        add_digit_match user_digit
      end
      matches
    end

    def pack_game_data
      {
        name: @user.name,
        difficulty: @difficulty.kind.to_s,
        attempts_total: @difficulty.attempts,
        attempts_used: @difficulty.attempts - @difficulty.current_attempts,
        hints_total: @difficulty.hints,
        hints_used: @difficulty.hints - @difficulty.current_hints
      }
    end

    private

    def add_digit_match(user_digit, exactness = false)
      exactness ? @exact_mathes += 1 : @inexact_matches += 1
      @secret_code_copy.delete_at @secret_code_copy.index user_digit
    end

    def matches
      {
        exact_mathes: @exact_mathes,
        inexact_matches: @inexact_matches
      }
    end
  end
end
