# frozen_string_literal: true

RSpec.describe FusicCliRuby::Fusic do
  let(:launcher) { instance_double('launcher') }
  let(:fusic) { described_class.new(launcher) }

  describe '#top' do
    let(:url) { 'https://fusic.co.jp/' }

    it 'open top and return url.' do
      expect(launcher).to receive(:open).with(url, { dry_run: false })
      expect(fusic.top).to eq(url)
    end
  end
end
