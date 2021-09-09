# frozen_string_literal: true

require 'bundler/setup'
require 'fusic_cli_ruby'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
$LOAD_PATH.unshift File.expand_path('../exe', __dir__)

::Dir.glob(::File.expand_path('support/*.rb', __dir__)).each { |f| require_relative f }
::Dir.glob(::File.expand_path('support/**/*.rb', __dir__)).each { |f| require_relative f }
