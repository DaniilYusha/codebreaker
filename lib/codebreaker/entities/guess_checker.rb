# frozen_string_literal: true

module Codebreaker
  class GuessChecker
    attr_reader :secret_code, :user_code

    def initialize(secret_code, user_code)
      @secret_code = secret_code
      @user_code = user_code
      @exact_matches = 0
      @inexact_matches = 0
    end

    def check
      calculate_matches
      matches
    end

    def self.validate(guess)
      raise DigitsCountError unless guess.size == Game::DIGITS_NUM
      raise DigitRangeError unless guess.chars.all? { |num| num.to_i.between? Game::MIN_CODE_NUM, Game::MAX_CODE_NUM }
    end

    private

    def add_digit_match!(user_digit, exactness = false)
      exactness ? @exact_matches += 1 : @inexact_matches += 1
      secret_code.delete_at secret_code.index user_digit
    end

    def calculate_matches
      secret_code.zip(user_code_to_arr).each do |secret_digit, user_digit|
        next unless secret_code.include? user_digit

        next add_digit_match! user_digit, true if secret_digit == user_digit

        add_digit_match! user_digit
      end
    end

    def matches
      {
        exact_mathes: @exact_matches,
        inexact_matches: @inexact_matches
      }
    end

    def user_code_to_arr
      user_code.split('').map(&:to_i)
    end
  end
end
