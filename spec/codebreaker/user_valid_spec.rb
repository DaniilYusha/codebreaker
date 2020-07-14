# frozen_string_literal: true

RSpec.describe Codebreaker::User do
  let(:short_name_user) { described_class.new 'Mu' }
  let(:long_name_user) { described_class.new 'Mu' * 15 }
  let(:invalid_user) { described_class.new 228 }
  describe '#valid?' do
    context 'when entered name is too short' do
      it 'returns false' do
        expect(short_name_user.valid?).to eq false
      end

      it 'adds ShortNameError to errors' do
        short_name_user.valid?
        expect(short_name_user.errors).to include Codebreaker::ShortNameError
      end
    end

    it 'returns false when entered name is too long' do
      expect(long_name_user.valid?).to eq false
    end

    it 'returns false when entered name is not an instance of String' do
      expect(invalid_user.valid?).to eq false
    end
  end
end
