# frozen_string_literal: true

module Codebreaker
  # Module Validator contains methods for data validation
  module Validator
    def compare_classes(class_name, expected_class)
      raise ArgumentError, "Expected class #{expected_class}" unless class_name == expected_class
    end
  end
end
