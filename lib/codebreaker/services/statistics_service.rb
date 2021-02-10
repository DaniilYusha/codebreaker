# frozen_string_literal: true

module Codebreaker
  class StatisticsService
    attr_reader :game, :path

    def initialize(path)
      @path = path
    end

    def store(game)
      statistics = File.exist?(path) && !File.zero?(path) ? YAML.load_file(path) : []
      statistics << pack_game_data(game)
      file = File.open(path, 'w')
      file.write(statistics.to_yaml)
      file.close
    end

    def sort_statistics
      load.sort_by { |user| [user[:attempts_total], user[:attempts_used], user[:hints_used]] }
    end

    def load
      return unless File.exist? path

      YAML.load_file path
    end

    private

    def pack_game_data(game)
      {
        name: game.user.name,
        difficulty: game.difficulty.kind.to_s,
        attempts_total: game.difficulty.attempts,
        attempts_used: game.difficulty.attempts - game.difficulty.current_attempts,
        hints_total: game.difficulty.hints,
        hints_used: game.difficulty.hints - game.difficulty.current_hints,
        date: game.date
      }
    end
  end
end
