# frozen_string_literal: true

require 'thor'
require 'launchy'
require 'fusic_cli_ruby'

module FusicCliRuby
  class Fusic
    def initialize(launcher)
      @launcher = launcher
    end

    def top
      url = 'https://fusic.co.jp/'
      @launcher.open(url, options)
      url
    end

    private

    def options
      { dry_run: ENV['LAUNCHY_DRY_RUN'] == '1' }
    end
  end
end
