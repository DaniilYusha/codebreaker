# frozen_string_literal: true

module Codebreaker
  # Module Validator contains methods for data validation
  module Validator
    def valid?
      validate!
      @errors.empty?
    end
  end
end
