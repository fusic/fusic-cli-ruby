# frozen_string_literal: true

require 'thor'
require 'launchy'
require 'fusic_cli_ruby'

module FusicCliRuby
  class CLI < Thor
    class_option :help, type: :boolean, aliases: '-h', desc: 'help message.'
    class_option :version, type: :boolean, aliases: '-v', desc: 'print version.'
    class_option :debug, type: :boolean, aliases: '-d', desc: 'debug mode'

    desc 'top', 'Open top page.'
    def top
      puts Fusic.new(Launchy).top
      puts ''
      exit
    rescue StandardError => e
      output_error_if_debug_mode(e)
      exit(-1)
    end

    desc 'members', 'Open members page.'
    def members
      puts Fusic.new(Launchy).members
      puts ''
      exit
    rescue StandardError => e
      output_error_if_debug_mode(e)
      exit(-1)
    end

    desc 'outline', 'Open company/outline page.'
    def outline
      puts Fusic.new(Launchy).company_outline
      puts ''
      exit
    rescue StandardError => e
      output_error_if_debug_mode(e)
      exit(-1)
    end

    desc 'techblog', 'Open techblog top page.'
    def techblog
      puts Fusic.new(Launchy).techblog
      puts ''
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
