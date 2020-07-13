# frozen_string_literal: true

module Codebreaker
  # ShortNameError class called when user name too short
  class ShortNameError < StandardError
    def message
      'Name is too short'
    end
  end
end
