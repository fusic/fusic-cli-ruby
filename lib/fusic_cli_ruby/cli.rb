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
      execute { puts Fusic.new(Launchy).top }
    end

    desc 'members', 'Open members page.'
    def members
      execute { puts Fusic.new(Launchy).members }
    end

    desc 'outline', 'Open company/outline page.'
    def outline
      execute { puts Fusic.new(Launchy).company_outline }
    end

    desc 'techblog', 'Open techblog top page.'
    def techblog
      execute { puts Fusic.new(Launchy).techblog }
    end

    desc 'blog', 'Open blog top page.'
    def blog
      execute { puts Fusic.new(Launchy).blog }
    end

    desc 'news', 'Open news top page.'
    def news
      execute { puts Fusic.new(Launchy).news }
    end

    map %w[--version -v] => :version
    desc 'version', 'version'
    def version
      puts FusicCliRuby::VERSION
    end

    private

    def execute
      yield
      puts ''
      exit
    rescue StandardError => e
      output_error_if_debug_mode(e)
      exit(-1)
    end

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
