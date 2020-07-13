# frozen_string_literal: true

module Codebreaker
  # LongNameError class called when user name too long
  class LongNameError < StandardError
    def message
      'Name is too long'
    end
  end
end
