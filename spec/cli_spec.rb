# frozen_string_literal: true

require 'spec_helper'
require 'pry'
require 'launchy'

RSpec.describe 'Fusic CLI', type: :aruba do
  before { set_environment_variable 'LAUNCHY_DRY_RUN', '1' }

  context 'with version option' do
    before { run_command('fusic -v') }

    it { expect(last_command_started).to be_successfully_executed }
    it { expect(last_command_started).to have_output(FusicCliRuby::VERSION) }
  end

  context 'with help option' do
    expected = <<~EXPECTED
      Commands:
        fusic help [COMMAND]  # Describe available commands or one specific command
        fusic members         # Open members page.
        fusic outline         # Open company/outline page.
        fusic techblog        # Open techblog top page.
        fusic top             # Open top page.
        fusic version         # version

      Options:
        -h, [--help], [--no-help]        # help message.
        -v, [--version], [--no-version]  # print version.
        -d, [--debug], [--no-debug]      # debug mode
    EXPECTED

    before { run_command('fusic help') }

    it { expect(last_command_started).to be_successfully_executed }
    it { expect(last_command_started).to have_output(expected) }
  end

  context 'when top subcommand' do
    expected = <<~EXPECTED
      /usr/bin/open https://fusic.co.jp/
      https://fusic.co.jp/
    EXPECTED

    before { run_command('fusic top') }

    it { expect(last_command_started).to be_successfully_executed }
    it { expect(last_command_started).to have_output(expected) }
  end

  context 'when members subcommand' do
    expected = <<~EXPECTED
      /usr/bin/open https://fusic.co.jp/members
      https://fusic.co.jp/members
    EXPECTED

    before { run_command('fusic members') }

    it { expect(last_command_started).to be_successfully_executed }
    it { expect(last_command_started).to have_output(expected) }
  end

  context 'when outline subcommand' do
    expected = <<~EXPECTED
      /usr/bin/open https://fusic.co.jp/company/outline
      https://fusic.co.jp/company/outline
    EXPECTED

    before { run_command('fusic outline') }

    it { expect(last_command_started).to be_successfully_executed }
    it { expect(last_command_started).to have_output(expected) }
  end

  context 'when techblog subcommand' do
    expected = <<~EXPECTED
      /usr/bin/open https://tech.fusic.co.jp/
      https://tech.fusic.co.jp/
    EXPECTED

    before { run_command('fusic techblog') }

    it { expect(last_command_started).to be_successfully_executed }
    it { expect(last_command_started).to have_output(expected) }
  end

  context 'when version subcommand' do
    before { run_command('fusic version') }

    it { expect(last_command_started).to be_successfully_executed }
    it { expect(last_command_started).to have_output(FusicCliRuby::VERSION) }
  end
end
