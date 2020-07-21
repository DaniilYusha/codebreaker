# frozen_string_literal: true

module Codebreaker
  class GuessChecker
    attr_reader :secret_code, :user_code

    def initialize(secret_code, user_code)
      @secret_code = secret_code
      @user_code = user_code
      @comparison = secret_code.zip user_code_to_arr
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

    def calculate_matches
      check_exact
      check_inexact
    end

    def check_exact
      @exact_matches = secret_code.size - @comparison.reject! { |digits_pair| digits_pair[0] == digits_pair[1] }.size
    end

    def check_inexact
      secret_code = @comparison.collect { |digits_pair| digits_pair[0] }
      user_code = @comparison.collect { |digits_pair| digits_pair[1] }
      selected_matches = user_code.collect do |user_digit|
        secret_code.find_all { |secret_digit| secret_digit == user_digit }
      end
      @inexact_matches = selected_matches.flatten.uniq.size
    end

    def matches
      {
        exact_matches: @exact_matches,
        inexact_matches: @inexact_matches
      }
    end

    def user_code_to_arr
      user_code.split('').map(&:to_i)
    end
  end
end
