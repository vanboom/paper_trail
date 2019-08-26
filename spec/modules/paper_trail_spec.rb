require "spec_helper"

RSpec.describe PaperTrail, type: :module, versioning: true do
  describe "#config" do
    it { is_expected.to respond_to(:config) }

    it "allows for config values to be set" do
      expect(subject.config.enabled).to eq(true)
      subject.config.enabled = false
      expect(subject.config.enabled).to eq(false)
    end

    it "accepts blocks and yield the config instance" do
      expect(subject.config.enabled).to eq(true)
      subject.config { |c| c.enabled = false }
      expect(subject.config.enabled).to eq(false)
    end
  end

  describe "#configure" do
    it { is_expected.to respond_to(:configure) }

    it "is an alias for the `config` method" do
      expect(subject.method(:configure)).to eq(subject.method(:config))
    end
  end
end
