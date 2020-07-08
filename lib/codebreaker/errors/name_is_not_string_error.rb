# frozen_string_literal: true

module Codebreaker
  # NameIsNotStringError class called when user name is not a String
  class NameIsNotStringError < StandardError
    def message
      'Name should be a String'
    end
  end
end
