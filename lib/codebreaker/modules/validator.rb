# frozen_string_literal: true

module Codebreaker
  module Validator
    def valid?
      validate!
      @errors.empty?
    end
  end
end
