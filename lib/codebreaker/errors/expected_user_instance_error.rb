# frozen_string_literal: true

module Codebreaker
  # ExpectedUserInstanceError class called when object is not an instance of User class
  class ExpectedUserInstanceError < StandardError
    def message
      'Object should be an instance of User class'
    end
  end
end
