# frozen_string_literal: true

module Codebreaker
  # Module FileLoader contains methods for data saving and loading
  module FileLoader
    def store(path, data)
      statistics = File.exist?(path) && !File.zero?(path) ? YAML.load_file(path) : []
      statistics << data
      file = File.open(path, 'w')
      file.write(statistics.to_yaml)
      file.close
    end

    def load(path)
      return unless File.exist? path

      YAML.load_file(path)
    end
  end
end
