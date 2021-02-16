# frozen_string_literal: true

require 'fileutils'

module FileManager
  def config_file
    'config/initializers/cequens.rb'
  end

  def remove_config
    FileUtils.remove_file config_file if File.file?(config_file)
  end
end
