# frozen_string_literal: true

module Codebreaker
  # NameIsNotStringError class called when user name is not a String
  class NameIsNotStringError < StandardError
    def message
      'Name should be an instance of String'
    end
  end
end
