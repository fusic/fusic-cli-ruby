# frozen_string_literal: true

require 'thor'
require 'pry'
require 'launchy'
require 'fusic_cli_ruby'

module FusicCliRuby
  class WebSite
    def initialize(launcher)
      @launcher = launcher
    end

    def top(options = {})
      url = 'https://fusic.co.jp/'
      @launcher.open(url, options)
      puts url
    end
  end
end
