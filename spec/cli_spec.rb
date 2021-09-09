# frozen_string_literal: true

require 'spec_helper'
require 'pry'
require 'launchy'

RSpec.describe 'Fusic CLI', type: :aruba do
  before { set_environment_variable 'LAUNCHY_DRY_RUN', '1' }

  context 'with version option' do
    before { run_command('fusic -v') }

    it { expect(last_command_started).to be_successfully_executed }
    it { expect(last_command_started).to have_output('0.1.2') }
  end

  context 'with help option' do
    expected = <<~EXPECTED
      Commands:
        fusic help [COMMAND]  # Describe available commands or one specific command
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

  context 'when version subcommand' do
    expected = '0.1.2'
    before { run_command('fusic version') }

    it { expect(last_command_started).to be_successfully_executed }
    it { expect(last_command_started).to have_output(expected) }
  end
end
