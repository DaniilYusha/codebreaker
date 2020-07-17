# frozen_string_literal: true

RSpec.describe Codebreaker::Difficulty do
  let(:difficulty) { described_class.new 'easy' }
  let(:invalid_difficulty) { described_class.new 'mediumm' }
  describe '.initialize' do
    it 'has kind, attempts, hints, current_attempts, current_hints fields' do
      expect(difficulty.instance_variables).to include(:@kind, :@attempts, :@hints, :@current_attempts, :@current_hints)
    end
  end

  describe '#valid?' do
    context 'when entered difficulty is incorrect' do
      it 'returns false' do
        expect(invalid_difficulty.valid?).to eq false
      end

      it 'adds DifficultyError to errors' do
        invalid_difficulty.valid?
        expect(invalid_difficulty.errors).to include Codebreaker::DifficultyError
      end
    end
  end

  describe 'check Difficulty constants' do
    it 'check content of LIST constant' do
      expect(described_class::DIFFICULTIES_LIST).to eq({ easy: { attempts: 15, hints: 2 },
                                                         medium: { attempts: 10, hints: 1 },
                                                         hell: { attempts: 5, hints: 1 } })
    end
  end
end
