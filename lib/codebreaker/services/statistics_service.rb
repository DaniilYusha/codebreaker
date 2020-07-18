# frozen_string_literal: true

module Codebreaker
  class StatisticsService
    attr_reader :game, :path

    def initialize(game, path)
      @game = game
      @path = path
    end

    def store
      statistics = File.exist?(path) && !File.zero?(path) ? YAML.load_file(path) : []
      statistics << pack_game_data
      file = File.open(path, 'w')
      file.write(statistics.to_yaml)
      file.close
    end

    def load
      return unless File.exist? path

      YAML.load_file path
    end

    private

    def pack_game_data
      {
        name: game.user.name,
        difficulty: game.difficulty.kind.to_s,
        attempts_total: game.difficulty.attempts,
        attempts_used: game.difficulty.attempts - game.difficulty.current_attempts,
        hints_total: game.difficulty.hints,
        hints_used: game.difficulty.hints - game.difficulty.current_hints
      }
    end
  end
end
