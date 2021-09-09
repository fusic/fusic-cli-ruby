# frozen_string_literal: true

require 'thor'
require 'pry'
require 'launchy'
require 'fusic_cli_ruby'

module FusicCliRuby
  class CLI < Thor
    class_option :help, type: :boolean, aliases: '-h', desc: 'help message.'
    class_option :version, type: :boolean, aliases: '-v', desc: 'print version.'
    class_option :debug, type: :boolean, aliases: '-d', desc: 'debug mode'

    desc 'top', 'Open top page.'
    def top
      WebSite.new(Launchy).top
      exit
    rescue StandardError => e
      output_error_if_debug_mode(e)
      exit(-1)
    end

    map %w[--version -v] => :version
    desc 'version', 'version'
    def version
      puts FusicCliRuby::VERSION
    end

    private

    def output_error_if_debug_mode(exception)
      return unless options[:debug]

      warn(exception.message)
      warn(exception.backtrace)
    end

    class << self
      private

      def exit_on_failure?
        true
      end
    end
  end
end
