# frozen_string_literal: true

RSpec.describe Cequens do
  describe 'version' do
    it 'has a version number' do
      expect(Cequens::VERSION).not_to be nil
    end
  end

  describe 'config' do
    it 'is possible to provide config options' do
      described_class.config do |c|
        expect(c).to eq(described_class)
      end
    end

    let(:fake_class) { class_double('Cequens') }
    it 'is possible to set access_token' do
      expect(fake_class).to receive(:access_token=).with('abc')
      fake_class.access_token = 'abc'
    end
  end
end
