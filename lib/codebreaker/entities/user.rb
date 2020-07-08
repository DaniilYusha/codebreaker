# frozen_string_literal: true

module Codebreaker
  # User class contains user name field
  class User
    attr_reader :name

    NAME_MIN_LENGTH = 3
    NAME_MAX_LENGTH = 20

    def initialize(name)
      validate name
      @name = name
    end

    private

    def validate_name(name)
      raise NameIsNotStringError unless name.is_a? String
      raise ShortNameError, "Name should be no less than #{NAME_MIN_LENGTH} symbols" if name.length < NAME_MIN_LENGTH
      raise LongNameError, "Name should be no more than #{NAME_MAX_LENGTH} symbols" if name.length > NAME_MAX_LENGTH
    end

    def validate(name)
      validate_name name
    end
  end
end
