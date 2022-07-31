# frozen_string_literal: true

describe BasePolicy do
  describe '.respond_to_missing?' do
    subject { described_class.respond_to_missing?(method) }

    context 'when method ends with ?' do
      let(:method) { :something? }

      it { is_expected.to be true }
    end

    context 'when method does not end with ?' do
      let(:method) { :something }

      it { is_expected.to be false }
    end
  end
end
