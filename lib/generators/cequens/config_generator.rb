# frozen_string_literal: true

begin
  require 'rails/generators'
rescue LoadError
  # Rails not available, generator won't be loaded
  return
end

module Cequens
  module Generators
    # rails g Cequens:config
    class ConfigGenerator < Rails::Generators::Base # :nodoc:
      source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

      desc <<~DESC
        Description:
            Copies Cequens configuration file to your application's initializer directory.
      DESC

      def copy_config_file
        template 'cequens_config.rb', 'config/initializers/cequens.rb'
      end
    end
  end
end
