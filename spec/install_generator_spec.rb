# frozen_string_literal: true

# Skip generator tests on Ruby 4+ as Rails is not yet compatible
if RUBY_VERSION < '4.0'
  require 'generators/cequens/config_generator'

  RSpec.describe Cequens::Generators::ConfigGenerator do
    before :all do
      remove_config
    end
    after :all do
      remove_config
    end
    it 'installs config file properly' do
      described_class.start
      expect(File.file?(config_file)).to be true
    end
  end
end
