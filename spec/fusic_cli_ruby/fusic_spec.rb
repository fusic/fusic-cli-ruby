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

  describe '#members' do
    let(:url) { 'https://fusic.co.jp/members' }

    it 'open members and return url.' do
      expect(launcher).to receive(:open).with(url, { dry_run: false })
      expect(fusic.members).to eq(url)
    end
  end

  describe '#company_outline' do
    let(:url) { 'https://fusic.co.jp/company/outline' }

    it 'open company/outline and return url.' do
      expect(launcher).to receive(:open).with(url, { dry_run: false })
      expect(fusic.company_outline).to eq(url)
    end
  end

  describe '#techblog' do
    let(:url) { 'https://tech.fusic.co.jp/' }

    it 'open tech.fusic.co.jp and return url.' do
      expect(launcher).to receive(:open).with(url, { dry_run: false })
      expect(fusic.techblog).to eq(url)
    end
  end

  describe '#blog' do
    let(:url) { 'https://fusic.co.jp/doings/' }

    it 'open doings and return url.' do
      expect(launcher).to receive(:open).with(url, { dry_run: false })
      expect(fusic.blog).to eq(url)
    end
  end
end
