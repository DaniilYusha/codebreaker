# frozen_string_literal: true

RSpec.describe Codebreaker::Difficulty do
  let(:difficulty) { described_class.new 'easy' }
  describe '.initialize' do
    it 'has kind, attempts, hints, current_attempts, current_hints fields' do
      expect(difficulty.instance_variables).to include(:@kind, :@attempts, :@hints, :@current_attempts, :@current_hints)
    end

    it 'raises DifficultyError when entered difficulty is incorrect' do
      expect { described_class.new 'mediumm' }.to raise_error Codebreaker::DifficultyError
    end
  end

  describe 'check Difficulty constants' do
    it 'check content of LIST constant' do
      expect(described_class::LIST).to eq({
                                            easy: { attempts: 15, hints: 2 },
                                            medium: { attempts: 10, hints: 1 },
                                            hell: { attempts: 5, hints: 1 }
                                          })
    end
  end
end
