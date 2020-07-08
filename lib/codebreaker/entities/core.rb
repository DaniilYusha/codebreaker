# frozen_string_literal: true

module Codebreaker
  # Core class performs data calculations and generation
  class Core
    MIN_CODE_NUM = 1
    MAX_CODE_NUM = 6
    DIGITS_NUM = 4

    def generate_secret_code
      DIGITS_NUM.times.map { rand(MIN_CODE_NUM..MAX_CODE_NUM) }
    end

    def calculate_matches(secret_code, user_code_array)
      @exact_mathes = 0
      @inexact_matches = 0
      secret_code.zip(user_code_array).each do |secret_digit, user_digit|
        next unless secret_code.include? user_digit

        next add_digit_match secret_code, user_digit, true if secret_digit == user_digit

        add_digit_match secret_code, user_digit
      end
      { exact_mathes: @exact_mathes, inexact_matches: @inexact_matches }
    end

    private

    def add_digit_match(secret_code, user_digit, exactness = false)
      exactness ? @exact_mathes += 1 : @inexact_matches += 1
      secret_code.delete_at secret_code.index user_digit
    end
  end
end
