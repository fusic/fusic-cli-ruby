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
      open('https://fusic.co.jp/')
    end

    def members
      open('https://fusic.co.jp/members')
    end

    def company_outline
      open('https://fusic.co.jp/company/outline')
    end

    def techblog
      open('https://tech.fusic.co.jp/')
    end

    def blog
      open('https://fusic.co.jp/doings/')
    end

    private

    def open(url)
      @launcher.open(url, options)
      url
    end

    def options
      { dry_run: ENV['LAUNCHY_DRY_RUN'] == '1' }
    end
  end
end
